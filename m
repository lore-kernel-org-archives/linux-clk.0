Return-Path: <SRS0=Bq/F=27=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88699C282DD
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 17:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BA2F2080D
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jan 2020 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578676306;
	bh=bWxh+tbHCeX172gqnL4h7j7sF5CxwqQygqdECt3fif8=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=nZoTC6fVuv/qT/DbgCmHihJX0D80gxGIhYD6IQPb5hHG4Q9Dg+t0qEv254gErNrzx
	 OA2DIao6mSuG8aKMi8Y+60IkkFZhCOSofPBk5MR/n2R9iIBPoTa3j6rMXjaEdG/s+z
	 M/34AkP2bQA6PnpM9IDW6/nS6HRPJdAmPkOcNJJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgAJRLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jan 2020 12:11:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:53174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgAJRLp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jan 2020 12:11:45 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5EFB2072E;
        Fri, 10 Jan 2020 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578676305;
        bh=bWxh+tbHCeX172gqnL4h7j7sF5CxwqQygqdECt3fif8=;
        h=Date:From:To:Cc:Subject:From;
        b=kEgvNxvnEDem0uUvP/+Z3DPzYzrqThiJCDH1aD69GtGkCHazkiLVpowsFi+H6f+No
         k+w5YQJOve8T27K0IxQxfqXjyi9RO/VLnD0XbjV0ViVhe/91mFirDxCh5/Wbew3SOM
         GnavM6NYyyEDn0pV75V3nGEUqedPh8IYuYLQh5fY=
Date:   Fri, 10 Jan 2020 18:11:42 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.6
Message-ID: <cf293816-3ef7-4b67-bd9e-be2e88bfa950.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.6

for you to fetch changes up to 9c232d324bfa1bb6204f6c2c5e1bea12c51cc6bd:

  clk: sunxi: a23/a33: Export the MIPI PLL (2020-01-04 09:45:19 +0100)

----------------------------------------------------------------
Our usual set of patches for sunxi, with a bunch of them required to
enable the MBUS controller, and two patches to enable cpufreq on the
A64.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: r40: Export MBUS clock

Corentin Labbe (1):
      clk: sunxi: use of_device_get_match_data

Icenowy Zheng (1):
      clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock

Maxime Ripard (2):
      clk: sunxi: a31: Export the MIPI PLL
      clk: sunxi: a23/a33: Export the MIPI PLL

Vasily Khoruzhick (1):
      clk: sunxi-ng: a64: export CLK_CPUX clock for DVFS


 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 28 +++++++++++++++++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |  1 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h          |  4 +++-
 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h      |  4 +++-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h          |  4 +----
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c      |  6 ++----
 include/dt-bindings/clock/sun50i-a64-ccu.h    |  1 +-
 include/dt-bindings/clock/sun6i-a31-ccu.h     |  2 ++-
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h |  2 ++-
 include/dt-bindings/clock/sun8i-r40-ccu.h     |  2 +-
 10 files changed, 41 insertions(+), 13 deletions(-)

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhiwTgAKCRDj7w1vZxhR
xVI+AQCJE82xhiEUOCLJgLFIWdnMWvG7Bo4gVoYNjpPFrX9QowEA1AaQVlogJFWQ
iRRSGmrkpl+ZWtmVJ+v4mqkNdKiwOQE=
=Nese
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
