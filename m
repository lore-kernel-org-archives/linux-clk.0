Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C65C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 10:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03BA220861
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 10:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfAWKc3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:32:29 -0500
Received: from mail.bootlin.com ([62.4.15.54]:33657 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbfAWKc3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 05:32:29 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 499D720717; Wed, 23 Jan 2019 11:32:27 +0100 (CET)
Received: from localhost (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr [90.88.29.206])
        by mail.bootlin.com (Postfix) with ESMTPSA id 1808120397;
        Wed, 23 Jan 2019 11:32:27 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:32:27 +0100
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-clk@vger.kernel.org, Jagan Teki <jagan@openedev.com>
Subject: Re: [PATCH] clk: sunxi: A31: Fix wrong AHB gate number
Message-ID: <20190123103227.pejyujxred2x2h6x@flea>
References: <20190123005911.27913-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vmq2rj2joai4snm7"
Content-Disposition: inline
In-Reply-To: <20190123005911.27913-1-andre.przywara@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--vmq2rj2joai4snm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 12:59:11AM +0000, Andre Przywara wrote:
> According to the manual the gate clock for MMC3 is at bit 11, and NAND1
> is controlled by bit 12.
>=20
> Fix the gate bit definitions in the clock driver.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Added the fixes tag and applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vmq2rj2joai4snm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEhCqwAKCRDj7w1vZxhR
xYgIAP9mP7mzs528x6r/0APYY5PgzMvb7E4eoefz0Mc3VP1MNgEA5lP5abkQdjSe
Xy81X4JsgaycZbN3UgS4MoFpJplu9gA=
=DQSH
-----END PGP SIGNATURE-----

--vmq2rj2joai4snm7--
