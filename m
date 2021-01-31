Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182DCC433E6
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 20:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF27264E0E
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 20:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhAaUYq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Jan 2021 15:24:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:55148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232091AbhAaUWN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 31 Jan 2021 15:22:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A72D64E40;
        Sun, 31 Jan 2021 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612115524;
        bh=/HotTFvdnUz+Z0S/FOZkcqFfLR2JcRPVZVctWcGfzLY=;
        h=Date:From:To:Cc:Subject:From;
        b=PwH+yucifp+3Sugy2gojGpm4INMiBMGrIini3aGoWea5B0pHFNdPTpLrWfpAv05Z8
         hwmhYucxGbcwiTVJJiiP9Z2hQi2dUh+0RZrQNi8ff0g4532H5fCA8sR4sDvMXj8a77
         wd0SXzkFzRY/fuV3BmChx6qfEBEfmo0Z66Bv8DEvmG7rPx5t2bNoNWynvMIkQJKA8P
         hu5hVUvf1idjuuOmteDqI8bj9TC1G0nVOPuZu4JiAM7KRBi7wMfnIV3/WljPIsDbuV
         EV5ie7UEvPf+wWA1vCGA6cRh4A7PMZJJP72X+k6t34h0jyFVjxcupDoRmlwEJqqeso
         8ZlryFHqQoFmg==
Date:   Sun, 31 Jan 2021 18:52:02 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Changes for 5.12
Message-ID: <83279f56-18ac-4abb-82e0-30f1fb8ffda7.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.12

for you to fetch changes up to 88dde5e23da1a16fe9a417171e6c941736b8d3a6:

  clk: sunxi-ng: Add support for the Allwinner H616 CCU (2021-01-28 11:14:35 +0100)

----------------------------------------------------------------
Our usual PR for the Allwinner SoCs, this time adding support for the
Allwinner H616 SoC, and a few H6 fixes.

----------------------------------------------------------------
Andre Przywara (5):
      clk: sunxi-ng: h6: Fix CEC clock
      clk: sunxi-ng: h6: Fix clock divider range on some clocks
      dt-bindings: clk: sunxi-ccu: Add compatible string for Allwinner H616
      clk: sunxi-ng: Add support for the Allwinner H616 R-CCU
      clk: sunxi-ng: Add support for the Allwinner H616 CCU

Lee Jones (3):
      clk: sunxi: clk-sunxi: Demote a bunch of non-conformant kernel-doc headers
      clk: sunxi: clk-a10-ve: Demote obvious kernel-doc abuse
      clk: sunxi: clk-mod0: Demote non-conformant kernel-doc header

Samuel Holland (1):
      clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset


 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml |    4 +-
 drivers/clk/sunxi-ng/Kconfig                                         |    7 +-
 drivers/clk/sunxi-ng/Makefile                                        |    1 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c                               |   53 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h                               |    2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c                                 |   10 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c                               | 1150 +++++++-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h                               |   56 +-
 drivers/clk/sunxi/clk-a10-ve.c                                       |    2 +-
 drivers/clk/sunxi/clk-mod0.c                                         |    2 +-
 drivers/clk/sunxi/clk-sunxi.c                                        |   32 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h                          |    2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h                          |  115 +-
 include/dt-bindings/reset/sun50i-h6-r-ccu.h                          |    1 +-
 include/dt-bindings/reset/sun50i-h616-ccu.h                          |   70 +-
 15 files changed, 1482 insertions(+), 25 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h616.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h616.h
 create mode 100644 include/dt-bindings/clock/sun50i-h616-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-h616-ccu.h



--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBbuQgAKCRDj7w1vZxhR
xSqSAPwKcSyjWfE8TNvvsfdETpgqlv+wJHKpDsLCeaGCbc8WAwEA0Y01NUsqDrAv
O9r43nEj1NaIK44VrfcqPztbfSGw4gU=
=98rV
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
