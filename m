Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB650C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 09:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhLQJXX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 04:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbhLQJXX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 04:23:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D79C061574
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 01:23:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7347862086
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 09:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA26C36AE5;
        Fri, 17 Dec 2021 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639733001;
        bh=AvRt0DMIoh9fgqBQ3OwSZEq5js55F2MDHQa7OduvRnU=;
        h=Date:From:To:Cc:Subject:From;
        b=pAI1PllpGWl9ZF78d8aKGUNtFu6XIRthQJN2jAd8D2EcQdoGOOm7V87svIroQXVvG
         8aChg6AguLJTiKrmJ1cSSItOk49+4bkmsc9fgJIHBLnzrx+lOZKSShmmyXC+hISFTd
         EvolqzaJdROPVP4tB20Fo3qxai83sF/lm1TyHaZWXeUdaJD8b1S4+ZW5O0sFZWzO1c
         sQZVJXP9ZbLqHfPEcUd84LhWxZUwvW9U+4s/rhRp4EBxqDmGLvd8iMT0m7Mw3+7tyM
         zZtR9Q+kfReLVNSixqV+G8zzRv+tPZ9f7+fMw4sosnaTeVm7f124CpUr0el1qP3AcK
         BqBcd/AH52vhg==
Date:   Fri, 17 Dec 2021 10:23:19 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Changes for 5.17
Message-ID: <3c4863eb-9bad-43e4-81bd-3b659616e59c.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BWhZCh2u7Mlx/RXt"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--BWhZCh2u7Mlx/RXt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.17-1

for you to fetch changes up to 35b97bb941110a20fea1f3125837a98fdf8de054:

  clk: sunxi-ng: Add support for the D1 SoC clocks (2021-11-23 10:29:05 +0100)

----------------------------------------------------------------
Our usual PR for the Allwinner SoCs, this time enabling our
sub-framework to be built as a module, converting most drivers to
platform drivers and allow them to be built as modules, and support for
the Allwinner D1

----------------------------------------------------------------
Samuel Holland (10):
      clk: sunxi-ng: Export symbols used by CCU drivers
      clk: sunxi-ng: Allow drivers to be built as modules
      clk: sunxi-ng: Convert early providers to platform drivers
      clk: sunxi-ng: Allow the CCU core to be built as a module
      dt-bindings: clk: Add compatibles for D1 CCUs
      clk: sunxi-ng: div: Add macros using clk_parent_data and clk_hw
      clk: sunxi-ng: mp: Add macros using clk_parent_data and clk_hw
      clk: sunxi-ng: mux: Add macros using clk_parent_data and clk_hw
      clk: sunxi-ng: gate: Add macros for gates with fixed dividers
      clk: sunxi-ng: Add support for the D1 SoC clocks


 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml |    4 +-
 drivers/clk/Makefile                                                 |    2 +-
 drivers/clk/sunxi-ng/Kconfig                                         |   49 +-
 drivers/clk/sunxi-ng/Makefile                                        |  101 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c                               |  140 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h                               |   17 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c                                 | 1390 +++++++-
 drivers/clk/sunxi-ng/ccu-sun20i-d1.h                                 |   15 +-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c                                 |   58 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c                             |    4 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c                               |    4 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                                |    7 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c                               |   56 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c                                 |    7 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c                               |   33 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                                 |   40 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c                                 |   35 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c                                 |   40 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c                                |    7 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c                                 |    9 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                                  |   62 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                                   |   65 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c                                 |    6 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                                 |   57 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c                              |    7 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c                             |    7 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c                                 |    7 +-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c                             |   40 +-
 drivers/clk/sunxi-ng/ccu_common.c                                    |    6 +-
 drivers/clk/sunxi-ng/ccu_div.c                                       |    1 +-
 drivers/clk/sunxi-ng/ccu_div.h                                       |   78 +-
 drivers/clk/sunxi-ng/ccu_frac.c                                      |    6 +-
 drivers/clk/sunxi-ng/ccu_gate.c                                      |    4 +-
 drivers/clk/sunxi-ng/ccu_gate.h                                      |   32 +-
 drivers/clk/sunxi-ng/ccu_mp.c                                        |    2 +-
 drivers/clk/sunxi-ng/ccu_mp.h                                        |   49 +-
 drivers/clk/sunxi-ng/ccu_mult.c                                      |    1 +-
 drivers/clk/sunxi-ng/ccu_mux.c                                       |    6 +-
 drivers/clk/sunxi-ng/ccu_mux.h                                       |   33 +-
 drivers/clk/sunxi-ng/ccu_nk.c                                        |    1 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                                       |    1 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                                      |    1 +-
 drivers/clk/sunxi-ng/ccu_nm.c                                        |    1 +-
 drivers/clk/sunxi-ng/ccu_phase.c                                     |    1 +-
 drivers/clk/sunxi-ng/ccu_reset.c                                     |    1 +-
 drivers/clk/sunxi-ng/ccu_sdm.c                                       |    6 +-
 drivers/mmc/host/Kconfig                                             |    1 +-
 include/dt-bindings/clock/sun20i-d1-ccu.h                            |  156 +-
 include/dt-bindings/clock/sun20i-d1-r-ccu.h                          |   19 +-
 include/dt-bindings/reset/sun20i-d1-ccu.h                            |   77 +-
 include/dt-bindings/reset/sun20i-d1-r-ccu.h                          |   16 +-
 include/linux/clk/sunxi-ng.h                                         |   15 +-
 52 files changed, 2530 insertions(+), 253 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun20i-d1.h
 create mode 100644 include/dt-bindings/clock/sun20i-d1-ccu.h
 create mode 100644 include/dt-bindings/clock/sun20i-d1-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun20i-d1-ccu.h
 create mode 100644 include/dt-bindings/reset/sun20i-d1-r-ccu.h



--BWhZCh2u7Mlx/RXt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbxXBgAKCRDj7w1vZxhR
xaGQAQCL2Y87Y1PxcFjr6hzUCaQLIxTZtg5dZleJHtSLdvci6QEAiZXYGjDgIZoW
MHSpvZlNz8oKecXmnwusVXKXZgT+Dgc=
=Gtxv
-----END PGP SIGNATURE-----

--BWhZCh2u7Mlx/RXt--
