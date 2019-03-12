Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD4AC43381
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 16:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2230A214AE
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552409364;
	bh=/fh07EKFxybUJeqB9oylMV6QhOEsOeqS7kNOOyTZFOM=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=PLq+VqHkwAExp5hRHncrPSYWWObLgf88qw01xDh8a3h58beDwsJ52hEoAUw50b9pf
	 pypw0nE9sh+h5IuP9SjgqPIIrZUorjv0dVMLg6enF71m5VRJNBEElgG0dM7QrAdFGj
	 qgHMOFYyzzkqqG39fRZfrPBvkLQJkagm9Af3Wz9g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfCLQtX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 12:49:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfCLQtX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Mar 2019 12:49:23 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D14EE2087C;
        Tue, 12 Mar 2019 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552409362;
        bh=/fh07EKFxybUJeqB9oylMV6QhOEsOeqS7kNOOyTZFOM=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=PqQ/+I/mJn5/QBAdjg8l7LC/xDxMHKMD1EVIOU8rC2wiMeL1enSqoQTCdS1eDNqrA
         Z3p0/E4/G9kZTP+Y5mKotbFwt01m799DNwwFFLJh+uxtZck6MOaM/Vcug4L65uqPaD
         S1qzpMUuVvgEjElSYbu1goljodC7PMa0nEttlBAw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190312110016.29174-2-m.tretter@pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de> <20190312110016.29174-2-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 12 Mar 2019 09:49:21 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-12 04:00:12)
> CLK_FRAC is not set in the divider->flags, but in the hw->flags.
>=20
> The firmware sets CLK_FRAC for fractional clocks in the clkflag field.
> When registering the devider, these clkflags are copied to hw->flags.
>=20
> Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(13). So
> this check would never work.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/clk/zynqmp/divider.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
> index a371c66e72ef..fc70950c1e24 100644
> --- a/drivers/clk/zynqmp/divider.c
> +++ b/drivers/clk/zynqmp/divider.c
> @@ -117,7 +117,7 @@ static long zynqmp_clk_divider_round_rate(struct clk_=
hw *hw,
>         bestdiv =3D zynqmp_divider_get_val(*prate, rate);
> =20
>         if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
> -           (divider->flags & CLK_FRAC))
> +           (clk_hw_get_flags(hw) & CLK_FRAC))

CLK_FRAC shouldn't be set in the struct clk_hw::core::flags field. It's
not a clk framework flag so it shouldn't go there. Please fix the user
of this flag to place the CLK_FRAC flag somewhere else. Even adding it
into divider::flags is not a good idea because that numberspace is for
dividers, and this flag seems to be zynqmp driver specific, so maybe
just add a bool to the zynqmp_clk_divider?

