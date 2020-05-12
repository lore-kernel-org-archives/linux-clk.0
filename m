Return-Path: <SRS0=sCEi=62=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8C0C2D0F8
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 23:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EEA620731
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589325984;
	bh=K5eScU3dvPbg5KMiDBQL58A97C/7mpiTrwg7N5mEg3M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Mh4UFDgQBNiLhGxtG3eVsaGZ55zz9dpItkYtesaVQKc66mWh5Y//SrpzLu/iDuDE+
	 /qDoh2S3dM/drsqAQrAHGm9SoHICZgj8/L0NMUBIlp3npAcAwN4orc9zhEuf3fhwgc
	 PYk3YqtFVHoRo0/b4+QbirOg922omA7RjTlGCkUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbgELX0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 19:26:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELX0W (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 19:26:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0540620753;
        Tue, 12 May 2020 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589325982;
        bh=K5eScU3dvPbg5KMiDBQL58A97C/7mpiTrwg7N5mEg3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f3t2JJ1dw5ydoDzgDIyW9PpjKMTPofJf2lh82U5A2KiOp1NWNrT5h6hHwfg7pkfKT
         Mx3xYTW0I25q78CkfcSk97it36AcMVs8oLbX4TbRykTJaI+174EPUmNwIXa/xvibac
         DseAwCIK2ETJ8XmgySYTPbp3bLRAQ5oMNc+ixQqU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200505071655.644773-1-thierry.reding@gmail.com>
References: <20200505071655.644773-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v5.7] clk: tegra: Fix initial rate for pll_a on Tegra124
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 12 May 2020 16:26:21 -0700
Message-ID: <158932598121.215346.2534633370744131523@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-05-05 00:16:55)
> From: Thierry Reding <treding@nvidia.com>
>=20
> pll_a_out0 and the I2S clocks are already configured to default to rates
> corresponding to a 44.1 kHz sampling rate, but the pll_a configuration
> was set to a default that is not listed in the frequency table, which
> caused the PLL code to compute an invalid configuration. As a result of
> this invalid configuration, Jetson TK1 fails to resume from suspend.
>=20
> This used to get papered over because the ASoC driver would force audio
> clocks to a 44.1 kHz configuration on boot. However, that's not really
> necessary and was hence removed in commit ff5d18cb04f4 ("ASoC: tegra:
> Enable audio mclk during tegra_asoc_utils_init()").
>=20
> Fix the initial rate for pll_a so that it matches the 44.1 kHz entry in
> the pll_a frequency table.
>=20
> Fixes: ff5d18cb04f4 ("ASoC: tegra: Enable audio mclk during tegra_asoc_ut=
ils_init()")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-fixes
