Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0080AC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:42:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE4E5218A4
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545158523;
	bh=Qwp3sC1y5c7gwI34LVa17FDHJQHAQC/1J1sRC92eF+I=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=KKwyssXVB31ztPSJDfWNVYvt6hbDozLFyl9gktElfkfcYHfa8Zlh6kPPc2v7V5vLn
	 UJbZINd7S/AA/ltFR5p7nA1mN8TSUh+CMrss/ZZxzrAm6HqOm742Gd0Zg9/7T4FpCc
	 5Yl4RfWjQgTWZjKzJC7hvONCTVyGFmUjXD7Avi5g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbeLRSmD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:42:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:32858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbeLRSmD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:42:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C246121841;
        Tue, 18 Dec 2018 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545158522;
        bh=Qwp3sC1y5c7gwI34LVa17FDHJQHAQC/1J1sRC92eF+I=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=W9onnpKNE87UmNsOaN2dEU6NZ2bAoolcp23ApFPrY+/til53QB+7EADG0wXfkB0NN
         xHt7NFS6yMmC3SQ1jCF5WFWAn1h3fK42030BSeMsbOlmYON0vv9sx3P/gP+9sb+qTl
         yep0OSZtVJbGV3DgsZsEdCaEoeYCJ4+gEdQ4nD34=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-10-josephl@nvidia.com>
Message-ID: <154515852208.238328.769742330440710710@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-10-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 09/20] clk: tegra: dfll: add CVB tables for Tegra210
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:42:02 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:21)
> Add CVB tables with different chip characterization, so that we can
> generate the customize OPP table that suitable for different chips with
> different SKUs.
>=20
> The parameter 'tune_high_min_millivolts' is first time introduced in
> this patch, which didn't use in the DFLL driver for clock and voltage
> tuning before. It will be used later when DFLL in high voltage range.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

