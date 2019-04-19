Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D54C282E2
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:21:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0277720821
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfDSUVF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:21:05 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:42156 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfDSUVF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 16:21:05 -0400
X-Greylist: delayed 4808 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Apr 2019 16:21:05 EDT
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id E7D3F3A6DB0
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 11:25:20 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 85BC2E0002;
        Fri, 19 Apr 2019 11:25:19 +0000 (UTC)
Date:   Fri, 19 Apr 2019 13:25:18 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 5.2
Message-ID: <20190419112518.5zwaeqg7egfimts7@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="klf2zoka6pajchlv"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--klf2zoka6pajchlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Please pull the following changes for the next merge window.

Thanks!
Maxime

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.2

for you to fetch changes up to c77cebac96a9edf1f3a508b475110f5d44196901:

  clk: sunxi-ng: sun5i: Export the MBUS clock (2019-04-10 16:33:01 +0200)

----------------------------------------------------------------
Allwinner clock changes for 5.2

Our usual bunch of changes, this time, it's mainly:

  - Export a new clock for the MBUS controller on the A13
  - H6 fixes to support a finer clocking of the video and VPU engines
  - Add some Kconfig options
  - Some bit offset fixes

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: a83t: Add pll-video0 as parent of csi-mclk

Icenowy Zheng (1):
      clk: sunxi-ng: f1c100s: fix USB PHY gate bit offset

Jernej Skrabec (3):
      clk: sunxi-ng: Allow DE clock to set parent rate
      clk: sunxi-ng: h6: Preset hdmi-cec clock parent
      clk: sunxi-ng: h6: Allow video & vpu clocks to change parent rate

Maxime Ripard (2):
      clk: sunxi: Add Kconfig options
      clk: sunxi-ng: sun5i: Export the MBUS clock

 drivers/clk/Kconfig                      |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    |  3 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     | 19 ++++++++++---
 drivers/clk/sunxi-ng/ccu-sun5i.h         |  4 ---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    |  5 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  3 +-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  2 +-
 drivers/clk/sunxi/Kconfig                | 43 ++++++++++++++++++++++++++++
 drivers/clk/sunxi/Makefile               | 49 ++++++++++++++++++--------------
 include/dt-bindings/clock/sun5i-ccu.h    |  2 +-
 10 files changed, 95 insertions(+), 36 deletions(-)
 create mode 100644 drivers/clk/sunxi/Kconfig

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--klf2zoka6pajchlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLmwHgAKCRDj7w1vZxhR
xaoZAP4xvAsW57DxiKGQos5qTeUdGrCaWsUGrkhQ1Vr/OfoRSQD/fHDA69uw4V45
2kKQ0hs+BA4EtiPeY3qLeEJPkXqm7g4=
=K/fC
-----END PGP SIGNATURE-----

--klf2zoka6pajchlv--
