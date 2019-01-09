Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301E3C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01DBA214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547059169;
	bh=VrH//XlMJm8zf4cEdUsxKdKXXd1j0P1uCJjI7t/nZdg=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=x34xO5k2WrRTaEd4lP8BAg25o+CTZ5J+oMs4v+976U9gccjsQLRdGSRX7DMsi6ViH
	 hhdQ44eNTT+6ReGsHlmLRIEyqUNUxlgLaXO1Gh00N1fc3sclBAx5q0/RghrO7IQ5Kr
	 smjKZV8IUGxq/JhJMaYjQhyGEc2VqcsW4bwXTpuo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfAISj2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:39:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:43452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfAISj2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:39:28 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9A4D20657;
        Wed,  9 Jan 2019 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547059167;
        bh=VrH//XlMJm8zf4cEdUsxKdKXXd1j0P1uCJjI7t/nZdg=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=KeTyiLcPUS/vkj0DieVFRd7UHbTgmSMcgPhE8vs+lcj3oavDNQVHp4Nb6Wz/yo3hU
         88xrMfrKSDcxhYY11gImwy/riO+cBEjlNxmCwLVg75vR1oGyVxMbnRjVmIlG7A6Mf3
         r1zuRuL7LU5i880pPkKFAKOknoU+TwPXpsE/6kcI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V4 10/20] clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20190104030702.8684-11-josephl@nvidia.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20190104030702.8684-1-josephl@nvidia.com> <20190104030702.8684-11-josephl@nvidia.com>
Message-ID: <154705916710.15366.6261013325488194200@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:39:27 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2019-01-03 19:06:52)
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>=20
> Tegra210 has a DFLL as well and can share the majority of the code with
> the Tegra124 implementation. So build the same code for both platforms.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

