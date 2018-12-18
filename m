Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA9BC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E47021873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545156144;
	bh=PMJ1kItpQPYXyUoDhSL6QeyRAQQmvCMJfhZqYuvFCBw=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=CaKAFvRdvPO/9mxh8P3S2JOl0H3H/ShvEh3f52XXSTeTlX0In1XhqdsQaag6Geoas
	 IKXaRrsdCwP7dRLO/YKhP1PZVAbjwgRhvo8cyUC7CPxQ8ZTDpiAhp9cps8rpVJ+3EO
	 3NmRRvHJcuhaLjPpneGUipwXYG/3yzq75JjZqsUI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbeLRSCY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:02:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:59368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbeLRSCY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:02:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 904F821871;
        Tue, 18 Dec 2018 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545156143;
        bh=PMJ1kItpQPYXyUoDhSL6QeyRAQQmvCMJfhZqYuvFCBw=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=WVs7qpqUP8OyYEsDBNG7N47bCaa7jjqi542FtfJdqXsSan/9atjxvCeMXFGaiNj2q
         w4Qu7NOrsZ0bJlzW6GutWAooCuEZY40Pw7lrvjTMKZokqb6nQqXAqactEqYCqJKKgJ
         McTdgtMMJ54ev3O9C7wfXKyI4gCCtkbppmVtnK0Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-6-josephl@nvidia.com>
Message-ID: <154515614289.238328.1681794053474275785@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-6-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 05/20] clk: tegra: dfll: registration for multiple SoCs
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:02:22 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:17)
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>=20
> In a future patch, support for the DFLL in Tegra210 will be introduced.
> This requires support for more than 1 set of CVB and CPU max frequency
> tables.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

