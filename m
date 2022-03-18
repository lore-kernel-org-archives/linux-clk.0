Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B04C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Mar 2022 15:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbiCRPR1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Mar 2022 11:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbiCRPR0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Mar 2022 11:17:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85F689CD6
        for <linux-clk@vger.kernel.org>; Fri, 18 Mar 2022 08:16:07 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id EDF1732008FA;
        Fri, 18 Mar 2022 11:16:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 18 Mar 2022 11:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=SBGFSuSSrHZ+x8ZCLWLHt5bXvozWV/q0FE/iQc
        oa4e0=; b=E7HKovW5RzmJDQS3Oeja/zf55o2uQ+ItAxQy20+SXJtlshcho1q/gB
        l0EVobLj8ydFS+AH3SjCjk/DPnkpyTs1XqwAT04AUs+0kFEsGeQbYM+8y6b1Ub/Y
        EaCbxgw/qDxd68ET1vtHqq60l/8D685B/SDJso1S4CTEUV9uNR7w3/nWSHVDiHz1
        nn3SUHDZIgMR99Ay4KwtsRhBJotFYMFRNclwKVX8WSbavf98F7/JX2K7SXao8VVP
        T3LoJe56u/EHl6utqXuTe3pylYQ9RxnmcUfLruj3qcw4Y6+kZlpQIeazPMiFIU5t
        4e+PZ9sfHXmpuov1CmmdM7o+1FAtOdPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SBGFSuSSrHZ+x8ZCL
        WLHt5bXvozWV/q0FE/iQcoa4e0=; b=HmSkGSHwr/3xqyh/fsQTHU+OAIzAgY+Aa
        QOPCciexyymQ7BpBA0GRyDbchvlLYSqKw1n1P0hMpZWtqTkpFTE16LRPvsXUy5B4
        NWOsmTva8Ts01fRMXQ5aO6g8iaZDtMHUPFXy2CgeAi5SySRpdXXiEaWDx/RgIPMN
        g552vo6BFzfY0X43nHxWlk7C9YjtdQVu9aZe5xBlLxFeEHKKuYCwHExdTYgqGSwd
        fLgbybe+NtJNXU7TuvwFscwp22gqGEvjH26grDrn/XscKDQB4STXF2kBJjBe5AV6
        r4wWOyfcWGSt3zwv7r7q3wvRkaVcusKla5fHZZTW74LL/x76TS3Ag==
X-ME-Sender: <xms:NqI0Yk1S9JNI9ZTRrHk79mRm_56feFUu0ss2eFCMqNZrU8qkInEqYw>
    <xme:NqI0YvFU6m3981Qc7ECDz9GLRavH-IbVy8UpdkCKNKLeN5MVzj77p5CP4oIom_sN3
    NYKC8J2WP7Vw0Zypuw>
X-ME-Received: <xmr:NqI0Ys4Io5jJy9WIHV0U4Jyius3DwHpUheebEM6m4YGlSzklLY7IOsPtWIGPqVB3OZSxa_5wcFm2CyMZfpao7K-gj5viembIVxBS9q8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
    rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevveefffduveeitdegtefhhfetue
    ffteefffdvheevvdehteethedvleffgfejvdenucffohhmrghinhepkhgvrhhnvghlrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NqI0Yt0_H3693GuFmB_2gB-DMy0pQ0cBnnuHAbJy8eweVdpRibKYUA>
    <xmx:NqI0YnGDrogC60Z_FnWS0VSy4hjpf8yRmU1xidIQk7MHkDtxLj42jg>
    <xmx:NqI0Ym8ZeKf2JPQjCkTstqQIUd0R-4UGm68CVhXzWQTZZBZZYlXu-g>
    <xmx:NqI0Yrh-boMvk-COyO2XlHB5ZdilA1_9rSOOKgZ3IXniTBgYnmP7SA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 11:16:05 -0400 (EDT)
Date:   Fri, 18 Mar 2022 16:16:03 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     logic_wei@163.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, nsaenz@kernel.org,
        f.fainelli@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: bcm: rpi: Fix slab-out-of-bounds during
 raspberrypi_discover_clocks.
Message-ID: <20220318151603.d2ru63w4iydprjjv@houat>
References: <20220312154244.557841-1-logic_wei@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5j3qixet3bewhzwu"
Content-Disposition: inline
In-Reply-To: <20220312154244.557841-1-logic_wei@163.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--5j3qixet3bewhzwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 12, 2022 at 11:42:44PM +0800, logic_wei@163.com wrote:
> From: Peng Wei <logic_wei@163.com>
>=20
> There's no way to break the loop until any error is returned. It causes
> overflow bug when accessing the clks.
>=20
> The KASAN warning:
>=20
> BUG: KASAN: slab-out-of-bounds in raspberrypi_clk_probe+0x1d8/0x2f8
>=20
> Read of size 4 at addr ffffff8040bd8704 by task swapper/0/1
>=20
> Call trace:
>  ...
>  __asan_load4+0x94/0xd0
>  raspberrypi_clk_probe+0x1d8/0x2f8
>  platform_probe+0x94/0x110
>  ...
>=20
> v2:
>  - Improve the comments
>  - Change to for loop
>  - Add fixes tag
>  - Remove the modification about enum rpi_firmware_clk_id
>=20
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> Signed-off-by: Peng Wei <logic_wei@163.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index dd3b71eafabf..5f963254d4eb 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -250,6 +250,7 @@ static int raspberrypi_discover_clocks(struct raspber=
rypi_clk *rpi,
>  {
>  	struct rpi_firmware_get_clocks_response *clks;
>  	int ret;
> +	int i;
> =20
>  	clks =3D devm_kcalloc(rpi->dev,
>  			    sizeof(*clks), RPI_FIRMWARE_NUM_CLK_ID,
> @@ -263,26 +264,25 @@ static int raspberrypi_discover_clocks(struct raspb=
errypi_clk *rpi,
>  	if (ret)
>  		return ret;
> =20
> -	while (clks->id) {
> +	for (i =3D 0; i < RPI_FIRMWARE_NUM_CLK_ID; i++) {
>  		struct clk_hw *hw;
> =20
> -		switch (clks->id) {
> +		switch (clks[i].id) {
>  		case RPI_FIRMWARE_ARM_CLK_ID:
>  		case RPI_FIRMWARE_CORE_CLK_ID:
>  		case RPI_FIRMWARE_M2MC_CLK_ID:
>  		case RPI_FIRMWARE_V3D_CLK_ID:
>  		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
> -			hw =3D raspberrypi_clk_register(rpi, clks->parent,
> -						      clks->id);
> +			hw =3D raspberrypi_clk_register(rpi, clks[i].parent,
> +						      clks[i].id);
>  			if (IS_ERR(hw))
>  				return PTR_ERR(hw);
> =20
> -			data->hws[clks->id] =3D hw;
> -			data->num =3D clks->id + 1;
> +			data->hws[clks[i].id] =3D hw;
> +			data->num =3D clks[i].id + 1;
>  			fallthrough;

This will conflict with:
https://lore.kernel.org/linux-clk/20220316083741.5hvuli2cvxlqr2ji@houat/T/#=
m3fc26816f7de420d74e4aa853eb92017b0b28fff

which should also fix the out-of-bound access?

maxime

--5j3qixet3bewhzwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjSiMwAKCRDj7w1vZxhR
xdPtAQDjGZ0/WQF6gnJ9KeN1JnXA9HFJ+43nI4nxsrD8uiUZ+QEAj4Qd6iHmkTSU
NAzrO9wgGWBXUVsylUAEskkbNWzbpgo=
=OdYB
-----END PGP SIGNATURE-----

--5j3qixet3bewhzwu--
