Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4675FC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  9 Mar 2022 18:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiCISzT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 13:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiCISzS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 13:55:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0544C785
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 10:54:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78F9FB8234F
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 18:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21630C340E8;
        Wed,  9 Mar 2022 18:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646852056;
        bh=+je8750rmcLyhQrtk46blBGYfajbghJIoeMGvqtr9/4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iAGeGS4UzJDIIGi7D2c9zHeubxfwJ1T0vIZ2OLIlPtdq3aIaGTktJbnWOOJxBpbfX
         1YlkOfesbPSLSy0oFGnytGaLhDeL0uSTzp3X6FCxOIDmKzCU+asxz3EU/6FKQaUfju
         RDHZG6se0xaITTfqoNrq0X9rdpi/iCX6R8GuiA1ZtNiDKcFzhi7wB22Sc6RXV3Q1yl
         HUsr/VzEMFcDw7JuyOWagz3qs0A20+GQcYbm69+ve24zrq+QPCdGw/2Lq7C1810VDX
         qQfez87Xw/J+Y7X0B5J2oioMGwDRrBF6CqlRJ02XvOi6SdM21mY0/NZ6Qc7oGYEOj6
         BkgdymXjpcoLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220225171453.1241132-1-logic_wei@163.com>
References: <20220225171453.1241132-1-logic_wei@163.com>
Subject: Re: [PATCH] clk: bcm: rpi: Fix slab-out-of-bounds during raspberrypi_discover_clocks.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     popcornmix@gmail.com, dave.stevenson@raspberrypi.com,
        nsaenz@kernel.org, linux-clk@vger.kernel.org,
        Peng Wei <logic_wei@163.com>
To:     logic_wei@163.com, mturquette@baylibre.com
Date:   Wed, 09 Mar 2022 10:54:14 -0800
User-Agent: alot/0.10
Message-Id: <20220309185416.21630C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting logic_wei@163.com (2022-02-25 09:14:53)
> From: Peng Wei <logic_wei@163.com>
>=20
> There're two potential bugs here:
> 1) RPI_FIRMWARE_EMMC_CLK_ID the first element of enum rpi_firmware_clk_id
>    is set to be 1.So RPI_FIRMWARE_NUM_CLK_ID will be bigger than the total

s/1\.So/1 so/

>    number of the enum rpi_firmware_clk_id.It maybe cause overflow bug when

s/clk_id\.It/clk_id. It/

>    accessing the array of clks.Besides it will cost more memory when alloc

You get the idea.

>    memory for clks.
> 2) When iterating the clks,there's no way to break the loop until any err=
or
>    is returned.
> So change the RPI_FIRMWARE_EMMC_CLK_ID from 1 to 0.And then tell the loop

s/0\.And/0 and/

> the way to break.
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
> Signed-off-by: Peng Wei <logic_wei@163.com>

Please add a Fixes tag.

> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 99cc4c856de1..726b3f45c137 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -19,7 +19,7 @@
>  #include <soc/bcm2835/raspberrypi-firmware.h>
> =20
>  enum rpi_firmware_clk_id {
> -       RPI_FIRMWARE_EMMC_CLK_ID =3D 1,
> +       RPI_FIRMWARE_EMMC_CLK_ID =3D 0,
>         RPI_FIRMWARE_UART_CLK_ID,
>         RPI_FIRMWARE_ARM_CLK_ID,
>         RPI_FIRMWARE_CORE_CLK_ID,
> @@ -252,6 +252,7 @@ static int raspberrypi_discover_clocks(struct raspber=
rypi_clk *rpi,
>  {
>         struct rpi_firmware_get_clocks_response *clks;
>         int ret;
> +       int count =3D 0;
> =20
>         clks =3D devm_kcalloc(rpi->dev,
>                             sizeof(*clks), RPI_FIRMWARE_NUM_CLK_ID,
> @@ -265,7 +266,7 @@ static int raspberrypi_discover_clocks(struct raspber=
rypi_clk *rpi,
>         if (ret)
>                 return ret;
> =20
> -       while (clks->id) {
> +       while (count++ < RPI_FIRMWARE_NUM_CLK_ID && clks->id) {

Use a for loop please.

>                 struct clk_hw *hw;
> =20
>                 switch (clks->id) {
> --=20
> 2.25.1
>
