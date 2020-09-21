Return-Path: <SRS0=TK4h=C6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5324CC43466
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 15:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0245F23119
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600703546;
	bh=NSBoUn3JJ8eudKnVSvvvn5CxvA18TlSBXYi+3ngEPPY=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=DCRMvLqibA9w/qyftRa3pO5hsQ2Rv24apk4h8Gh5GeF4V6fRSpO937Fw3Disdlu/e
	 9SDHKGyMATAKoLLVzTpgmbPcn5Ao4kIfADxPD9ugBAeN9ZSX36SG5xDOpnN0rBwSes
	 JzHt9MrzN1QJCX1oVuKmcfx5NJz0jvZDG1uDASUU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgIUPwZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Sep 2020 11:52:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:60428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgIUPwZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Sep 2020 11:52:25 -0400
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EB4B2226A;
        Mon, 21 Sep 2020 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600703544;
        bh=NSBoUn3JJ8eudKnVSvvvn5CxvA18TlSBXYi+3ngEPPY=;
        h=Date:From:To:Cc:Subject:From;
        b=rMqR5xnguhYTbOPpa8GXfHx3CbcOxjgS4BwIooce8SbFwGSRqooo14PoO85WItL96
         LM/YEtHIteOAQdxE1FjGMWuIk3WUF1az+AkRFpLI7oruzGiyoGP0JsptfPOoXWtmu1
         raTON9JTHD/Y7gW+XQhcxjjJN9efd2pok/fhksLc=
Date:   Mon, 21 Sep 2020 17:52:22 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.10
Message-ID: <81c9baac-823c-498a-9131-d71349379cf2.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.10-1

for you to fetch changes up to a3ba99a24b36bc4eee5413a820e2c4f3d81593fa:

  clk: sunxi-ng: sun8i: r40: Use sigma delta modulation for audio PLL (2020-08-25 16:42:55 +0200)

----------------------------------------------------------------
Our usual PR for the Allwinner SoCs, this time adding support for the
Allwinner A100 SoC, and adding support for the sigma-delta modulation on
the audio PLL for the R40.
-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2jMHwAKCRDj7w1vZxhR
xRFUAQDnGPaCxG4aQL5C9OuEM95xS5mvqh1nHqXEpzTL27YrMgEA56BkffQDTs7T
+opPbuCVil5UIlZodc8CpJFpUkG3QQ4=
=DF1k
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Jernej Skrabec (1):
      clk: sunxi-ng: sun8i: r40: Use sigma delta modulation for audio PLL

Yangtao Li (2):
      dt-bindings: clk: sunxi-ccu: add compatible string for A100 CCU and R-CCU
      clk: sunxi-ng: add support for the Allwinner A100 CCU


 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml |    7 +-
 drivers/clk/sunxi-ng/Kconfig                                         |   10 +-
 drivers/clk/sunxi-ng/Makefile                                        |    2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c                             |  214 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h                             |   21 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c                               | 1276 +++++++-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.h                               |   56 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c                                 |   37 +-
 include/dt-bindings/clock/sun50i-a100-ccu.h                          |  116 +-
 include/dt-bindings/clock/sun50i-a100-r-ccu.h                        |   23 +-
 include/dt-bindings/reset/sun50i-a100-ccu.h                          |   68 +-
 include/dt-bindings/reset/sun50i-a100-r-ccu.h                        |   18 +-
 12 files changed, 1834 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.h
 create mode 100644 include/dt-bindings/clock/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/clock/sun50i-a100-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a100-r-ccu.h



--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2jMNgAKCRDj7w1vZxhR
xVKdAPdFks6X5IfYmRonV3SompKoymvr+LY+Xw6jQQuCfZPOAP9MnsevS5ynBEir
rn4vrZFAmENgeJK8seLga+kCHW/RCA==
=iIDT
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
