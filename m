Return-Path: <SRS0=4isi=QP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7794BC169C4
	for <linux-clk@archiver.kernel.org>; Fri,  8 Feb 2019 10:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E90721919
	for <linux-clk@archiver.kernel.org>; Fri,  8 Feb 2019 10:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfBHKpX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Feb 2019 05:45:23 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:54365 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfBHKpW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Feb 2019 05:45:22 -0500
X-Originating-IP: 90.88.22.177
Received: from localhost (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr [90.88.22.177])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 743F4E0007;
        Fri,  8 Feb 2019 10:45:20 +0000 (UTC)
Date:   Fri, 8 Feb 2019 11:45:19 +0100
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 5.0
Message-ID: <20190208104519.2ix2ujxrpmhqrwlf@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="julhqle2jly444cf"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--julhqle2jly444cf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull the following PR for the current release.

Thanks!
Maxime

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-fixes-for-5.0

for you to fetch changes up to ee0b27a3a4da0b0ed2318aa092f8856896e9450b:

  clk: sunxi: A31: Fix wrong AHB gate number (2019-01-28 09:26:32 +0100)

----------------------------------------------------------------
Allwinner clock fixes for 5.0

Two fixes for clock indices, one for the A31 and one for the V3s.

----------------------------------------------------------------
Andre Przywara (1):
      clk: sunxi: A31: Fix wrong AHB gate number

Paul Kocialkowski (1):
      clk: sunxi-ng: v3s: Fix TCON reset de-assert bit

 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 4 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--julhqle2jly444cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXF1dvwAKCRDj7w1vZxhR
xf16AQDglGUIK+zcZuYFIH4hLeUtnt+Y2wI/DWWnAtbFWQzsawD/Uct9NbHVu2w1
ck+Snf71+i6WKJHw4lkADHSOoCxOGw4=
=68jY
-----END PGP SIGNATURE-----

--julhqle2jly444cf--
