Return-Path: <SRS0=vkhW=CR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8323C433E2
	for <linux-clk@archiver.kernel.org>; Tue,  8 Sep 2020 19:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A08EB20658
	for <linux-clk@archiver.kernel.org>; Tue,  8 Sep 2020 19:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbgIHTlW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Sep 2020 15:41:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:47742 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730921AbgIHPxl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 8 Sep 2020 11:53:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 16E07B6A8;
        Tue,  8 Sep 2020 14:42:38 +0000 (UTC)
Message-ID: <aaa5053e14d8dfd0aa818d9cd4230548eb374306.camel@suse.de>
Subject: Re: [PATCH] clk: bcm: dvp: Select the reset framework
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>
Date:   Tue, 08 Sep 2020 16:42:35 +0200
In-Reply-To: <20200903082636.3844629-1-maxime@cerno.tech>
References: <20200903082636.3844629-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-DQWfpvPHOzPAvyI/v7yy"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--=-DQWfpvPHOzPAvyI/v7yy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-03 at 10:26 +0200, Maxime Ripard wrote:
> The DVP driver depends both on the RESET_SIMPLE driver but also on the
> reset framework itself. Let's make sure we have it enabled.
>=20
> Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 784f12c72365..ec738f74a026 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -5,6 +5,7 @@ config CLK_BCM2711_DVP
>  	depends on ARCH_BCM2835 ||COMPILE_TEST
>  	depends on COMMON_CLK
>  	default ARCH_BCM2835
> +	select RESET_CONTROLLER
>  	select RESET_SIMPLE
>  	help
>  	  Enable common clock framework support for the Broadcom BCM2711

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

I guess this should go through the clk tree right?

Thanks!
Nicolas


--=-DQWfpvPHOzPAvyI/v7yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9XmFsACgkQlfZmHno8
x/7IPQf+IvNcI5/8rN2HDc54c91eHfLGW5+D4Cry68G5oXQ8h2t4ALTM2NeQw0a9
u+dcu93OO13KGrtb9HPUXi/RUR0pGnjLY+8oyQ1TeWBYybjdcleYF5bOKWFVnEYo
6iiKpvKvw8xAkONJk/q7oVAaTxNamzjpbVovYTWKKq0yrR9iofrtG0K897vOg3HR
C0LqGoYQeqaeBKUW4i9RNnQyE0nIFUUTinZwkyb2PiMvKhZtHdR8Wqk4a+Bt0Jph
d4tTsznESYohF9MgZ2Zk/tam/pgdoMYNBDviZRzpN6kFK6B+uezYfuq9JMGguKjw
e1+IyGPsWHevJC28sFxnr7YmnsFaJA==
=k3/E
-----END PGP SIGNATURE-----

--=-DQWfpvPHOzPAvyI/v7yy--

