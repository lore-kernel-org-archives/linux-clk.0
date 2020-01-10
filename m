Return-Path: <SRS0=Bq/F=27=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F09C282DD
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D1572072E
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578676364;
	bh=kKeXIrCjLnzo0TiSj4u3FOjbFcwFK2qdWHisOUcq/BE=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=eis0+P5a6IMorGdajr/fxDCiFsJclffdTnVZBM57ypAzbDLa4f6qx/bsB23ZPgdw5
	 pRjZIgSL6V1LOYm03gwWxGY2cmRNnnonXXVrAScL+iLcdAlJAv/nuuVdIYt8kY/Tqu
	 Qm0B5cgTcb9+7gcLRJk11glnCpj1NE9L+D1a9c1U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgAJRMn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jan 2020 12:12:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbgAJRMn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jan 2020 12:12:43 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A47D720838;
        Fri, 10 Jan 2020 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578676363;
        bh=kKeXIrCjLnzo0TiSj4u3FOjbFcwFK2qdWHisOUcq/BE=;
        h=Date:From:To:Cc:Subject:From;
        b=f6ssEJjmpAaawy/bbJuUA36jMLkQTvz8EbBcuQ5ZUUHwH3SyAw9VjRef7ksv91pu2
         4XtIMU4B04XX6JzI4WC0Tw6OkAVkZZpfe5vb68DPM3IIlDFMsMmXvZXQhLFL8hy6yD
         HbgfO/wHIvRe7gq7IyD6FAtAMAdATkA8dwvtB3v8=
Date:   Fri, 10 Jan 2020 18:12:40 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Fixes for 5.5
Message-ID: <918a4585-19f8-4753-abb1-b71702877ddf.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Happy New Year!

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-fixes-for-5.5

for you to fetch changes up to 0c545240aebc2ccb8f661dc54283a14d64659804:

  clk: sunxi-ng: h6-r: Fix AR100/R_APB2 parent order (2020-01-02 10:28:47 +0100)

----------------------------------------------------------------
Our usual set of fixes for Allwinner, to fix the number of reported
clocks on the v3s, fixing the external clock on the R40, and some
fixes for the AR100 co-processor clocks.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: r40: Allow setting parent rate for external clock outputs

Samuel Holland (3):
      clk: sunxi-ng: sun8i-r: Fix divider on APB0 clock
      clk: sunxi-ng: h6-r: Simplify R_APB1 clock definition
      clk: sunxi-ng: h6-r: Fix AR100/R_APB2 parent order

Yunhao Tian (1):
      clk: sunxi-ng: v3s: Fix incorrect number of hw_clks.


 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c | 16 +++-------------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c     | 21 +++------------------
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c   |  6 ++++--
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  4 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h   |  2 --
 5 files changed, 12 insertions(+), 37 deletions(-)

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhiwiAAKCRDj7w1vZxhR
xRGHAPwONcRU+W+ushufBb6rKGNFg8z9oS++5EPoXnBPlbFWQQEAoD7G69YPfgx4
rEV8huRRK/hYaOBV2Za9FF5JLM5AawE=
=96f2
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
