Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA2AC433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 13:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4434C6108F
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 13:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhDBNxJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 09:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229932AbhDBNxJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Apr 2021 09:53:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9679361056;
        Fri,  2 Apr 2021 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617371588;
        bh=6DUXjdC2LDJWoB/N6b03ulbFl0q1hvxXcsPF9fd0yQQ=;
        h=Date:From:To:Cc:Subject:From;
        b=mDQ5Gd2tAybAM06H/MeZFuWBRAv+WygpDCYc0eD7G0X55HDGSlYxNnoaOsLop6mgq
         G0CX/2PQMBtOS9aO+Qeto4YpTMFM1mwqxWO+K2I6GsSdSkO68AQwGS186cvS+F9Chb
         xBReQky+xDop2tLLFazqMKagyz9xF11RELcQEUsBN58V5kHAO/lziIMbo+UtgIhzAK
         rxl39e0DoMs1qZ4Jfsk8an7gRTLr+ZNNzGc5jasbNcZIrnkCzUH2fOuNyJKziu8lau
         Qbm6+zJWYb35dpwPjVGBdNgq3Iy2zL7gZ6Lkyiw1XvIdIqd+Yaz+phiDWubgHkr2C+
         0M3SM2b0oyr/g==
Date:   Fri, 2 Apr 2021 15:53:05 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Changes for 5.13
Message-ID: <5b35c96d-af03-4ff9-aa1b-b486e55e44b9.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xu3PjnHdd+CqTw1q"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--xu3PjnHdd+CqTw1q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.13-1

for you to fetch changes up to dcc354572d094b9dcf7c532c7263ab55dd376587:

  clk: sunxi: Demote non-conformant kernel-doc headers (2021-03-08 16:47:55 +0100)

----------------------------------------------------------------
Our usual PR for the Allwinner SoCs, this time adding support for sigma-delta
modulation on the V3s Audio PLL, and fixing a kernel doc header

----------------------------------------------------------------
Lee Jones (1):
      clk: sunxi: Demote non-conformant kernel-doc headers

Tobias Schramm (1):
      clk: sunxi-ng: v3s: use sigma-delta modulation for audio-pll


 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 33 ++++++++++++++++++++++-----------
 drivers/clk/sunxi/clk-sun6i-ar100.c  |  2 +-
 drivers/clk/sunxi/clk-sun9i-core.c   |  8 ++++----
 drivers/clk/sunxi/clk-usb.c          |  2 +-
 4 files changed, 28 insertions(+), 17 deletions(-)



--xu3PjnHdd+CqTw1q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGchwQAKCRDj7w1vZxhR
xSAkAP9zTGXnfHGQfaRVweC34wZ9zGDV0wqjjnvq9zN13ZVJoQEAsDe82tbhMDQi
V1dGSnLXKXaEouGt+A1hQ7buk8yFwQE=
=E/Ue
-----END PGP SIGNATURE-----

--xu3PjnHdd+CqTw1q--
