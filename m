Return-Path: <SRS0=4isi=QP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0337C282CB
	for <linux-clk@archiver.kernel.org>; Fri,  8 Feb 2019 10:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C94D32080A
	for <linux-clk@archiver.kernel.org>; Fri,  8 Feb 2019 10:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfBHKme (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Feb 2019 05:42:34 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35385 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfBHKmd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Feb 2019 05:42:33 -0500
X-Originating-IP: 90.88.22.177
Received: from localhost (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr [90.88.22.177])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 459C51C0005;
        Fri,  8 Feb 2019 10:42:31 +0000 (UTC)
Date:   Fri, 8 Feb 2019 11:42:30 +0100
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 5.1
Message-ID: <20190208104230.zn4sn7z4idge4gmh@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dv2ngskktc2vmjjw"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--dv2ngskktc2vmjjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following PR for the next merge window.

Thanks!
Maxime

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-5.1

for you to fetch changes up to 108a459ef4cd17a28711d81092044e597b5c7618:

  clk: sunxi-ng: sun8i-a23: Enable PLL-MIPI LDOs when ungating it (2019-01-=
25 10:43:44 +0100)

----------------------------------------------------------------
Allwinner clock changes for 5.1

Just a single non-urgent fix for the PLL-MIPI on the A23

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun8i-a23: Enable PLL-MIPI LDOs when ungating it

 drivers/clk/sunxi-ng/ccu-sun8i-a23.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dv2ngskktc2vmjjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXF1dFgAKCRDj7w1vZxhR
xfpbAP9DdAXaWLQCLTfkMGp2dHyai/7FuujXYlvI8WCFP4/5IwD/cb7o3/NhPuAA
93XNfMxt7iz5IlvxMy7ZTFrpEVd3nwM=
=AYcw
-----END PGP SIGNATURE-----

--dv2ngskktc2vmjjw--
