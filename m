Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FA1C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB684208E7
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB684208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbeLGPCT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 10:02:19 -0500
Received: from mail.bootlin.com ([62.4.15.54]:35542 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbeLGPCT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Dec 2018 10:02:19 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 4A5F620726; Fri,  7 Dec 2018 16:02:17 +0100 (CET)
Received: from localhost (aaubervilliers-681-1-79-44.w90-88.abo.wanadoo.fr [90.88.21.44])
        by mail.bootlin.com (Postfix) with ESMTPSA id C567020CEB;
        Fri,  7 Dec 2018 16:01:57 +0100 (CET)
Date:   Fri, 7 Dec 2018 16:01:58 +0100
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.21
Message-ID: <20181207150158.vvfpjcxjikjjyj5m@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5fu2k6fydhjsv3c3"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--5fu2k6fydhjsv3c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Please pull our usual changes for the next merge window.

Thanks!
Maxime

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.21

for you to fetch changes up to 6e6da2039c82271dd873b9ad2b902a692a7dd554:

  clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for all audio module clocks (=
2018-12-05 12:08:20 +0100)

----------------------------------------------------------------
Allwinner clock changes for 4.21

Our usual clock driver changes for 4.21. The major patches in that pull
request are:
  - Sigma Delta modulation for the A33 audio clocks
  - Support for the F1c100s SoC
  - Rework of the oscillator tree
  - H6 display engine clocks

----------------------------------------------------------------
Chen-Yu Tsai (5):
      clk: sunxi-ng: sun50i: a64: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: r40: Force LOSC parent to RTC LOSC output
      clk: sunxi-ng: h3/h5: Fix CSI_MCLK parent
      clk: sunxi-ng: a33: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for all audio module cloc=
ks

Icenowy Zheng (1):
      clk: sunxi-ng: enable so-said LDOs for A64 SoC's pll-mipi clock

Jagan Teki (3):
      clk: sunxi-ng: sun50i: h6: Fix MMC clock mux width
      clk: sunxi-ng: Enable DE2_CCU for SUN8I and SUN50I
      clk: sunxi-ng: a64: Fix gate bit of DSI DPHY

Jernej Skrabec (6):
      clk: sunxi-ng: Adjust MP clock parent rate when allowed
      clk: sunxi-ng: Use u64 for calculation of NM rate
      clk: sunxi-ng: h6: Set video PLLs limits
      dt-bindings: clock: sun8i-de2: Add H6 DE3 clock description
      clk: sunxi-ng: Add support for H6 DE3 clocks
      clk: sunxi-ng: h3: Allow parent change for ve clock

Mesih Kilinc (2):
      dt-bindings: clock: Add Allwinner suniv F1C100s CCU
      clk: sunxi-ng: add support for suniv F1C100s SoC

 .../devicetree/bindings/clock/sun8i-de2.txt        |   5 +-
 .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
 drivers/clk/sunxi-ng/Kconfig                       |   6 +
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |  46 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c               |  10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  43 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |  71 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.h               |   4 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   4 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               |  11 +
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c           | 541 +++++++++++++++++=
++++
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h           |  34 ++
 drivers/clk/sunxi-ng/ccu_mp.c                      |  64 ++-
 drivers/clk/sunxi-ng/ccu_nm.c                      |  18 +-
 include/dt-bindings/clock/sun8i-de2.h              |   3 +
 include/dt-bindings/clock/suniv-ccu-f1c100s.h      |  70 +++
 include/dt-bindings/reset/sun8i-de2.h              |   1 +
 include/dt-bindings/reset/suniv-ccu-f1c100s.h      |  38 ++
 19 files changed, 924 insertions(+), 47 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
 create mode 100644 include/dt-bindings/clock/suniv-ccu-f1c100s.h
 create mode 100644 include/dt-bindings/reset/suniv-ccu-f1c100s.h

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5fu2k6fydhjsv3c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAqLZgAKCRDj7w1vZxhR
xYJLAP9vIhvPeRtBwlTxb58mjhoL5E45DESEsVq6lQ1QJHUjOwEAve8KdIJgrRLd
4UM8+PrRfEofxA4Zi5fAfl6Q3hjDGwk=
=+1Qh
-----END PGP SIGNATURE-----

--5fu2k6fydhjsv3c3--
