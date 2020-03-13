Return-Path: <SRS0=LKfv=46=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF60C10DCE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 04:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B5A420737
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 04:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584072280;
	bh=osQjjWCTdMAe4EgsSg9BFF7PtYzlq/w6MvL4nNnI9vg=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=RaraOD2+v4hALpQJbJ1Z4rD85RknAkgjHIkaRB9+G1N+JDqZUryT/VyYd0nrFSrVB
	 IDDCWuL82uB7No5HFcViVHD1so21W9hNY9a3cyaHVsAzo0fJluJ8yWCdXtx/XZEPA2
	 Jz4XqOkpkVPD2CfdWI0nRbzSry+hitt1YcVChg/Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgCMEEj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Mar 2020 00:04:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:38408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgCMEEj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Mar 2020 00:04:39 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32E8C206FA;
        Fri, 13 Mar 2020 04:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584072279;
        bh=osQjjWCTdMAe4EgsSg9BFF7PtYzlq/w6MvL4nNnI9vg=;
        h=Date:From:To:Cc:Subject:From;
        b=gq/8c3bDtO8gPJrUMwK2tzozSJ8EP9LT127F48GgYipyKQ+erXbyvzMpXD85BYZzS
         IfUpQGFchhgmGlavgmZeZf+bMLxMMS8fMMYcPNyUevtBwmKBfkxU31DzHNqrFs+mYD
         IBBzUdfBgYpOAkTbfUDdjlAFI6/KBXOer9F6Mths=
Received: by wens.tw (Postfix, from userid 1000)
        id 2D8335FCA3; Fri, 13 Mar 2020 12:04:37 +0800 (CST)
Date:   Fri, 13 Mar 2020 12:04:37 +0800
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.7
Message-ID: <20200313040437.GA8483@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.7

for you to fetch changes up to b998b75f8603c37c8a43a3d849cd2c4929adf402:

  clk: sunxi-ng: sun8i-de2: Sort structures (2020-02-12 19:01:16 +0100)

----------------------------------------------------------------
Allwinner Clock Changes for 5.7

Changes consist mainly of cleanups for the display engine clock driver,
correcting clocks that don't exist. Also, the MBUS clock on the A64 is
exported for the device tree to consume.

----------------------------------------------------------------
Jernej Skrabec (8):
      clk: sunxi-ng: a64: Export MBUS clock
      clk: sunxi-ng: sun8i-de2: Split out H5 definitions
      clk: sunxi-ng: sun8i-de2: Add rotation core clocks and reset for A64
      clk: sunxi-ng: sun8i-de2: H6 doesn't have rotate core
      clk: sunxi-ng: sun8i-de2: Don't reuse A83T resets
      clk: sunxi-ng: sun8i-de2: Add rotation core clocks and reset for A83T
      clk: sunxi-ng: sun8i-de2: Add R40 specific quirks
      clk: sunxi-ng: sun8i-de2: Sort structures

 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      |   4 -
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c       | 115 +++++++++++++++++++----------
 include/dt-bindings/clock/sun50i-a64-ccu.h |   2 +-
 3 files changed, 75 insertions(+), 46 deletions(-)

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAl5rBlQACgkQOJpUIZwP
JDC3uA//WP7kM2xOFSsTSSJkt9HnV50JWjgUbHc98D4BQqH2RXrJS0lQhEYsTWs2
uHFYZSIL2Rh7g+N3486SejipuJQK0oPJIvxMsAKPzcvTpjQKMU/BVO79p8Y3Vobb
abgPmmEbv4lK2VGTV8Y5v7jTt5p+IK1KLJdQTrchbwngS8KVKC0vkBtFTfx2umRV
GtQitSzrc607ZpSzeOAmOAAU3KhfQqaMzmMMIfAnTn7lxjU8Veu5nFiMrTyEHQ61
lSWqxFiE7fbk7UulNPuZKMp5UMuzT/PaXuYsztTA0e4/iUzYW/97/MrH66QLE1sB
qQehRO2lX/BT2wQui7eoRtU2xkfj0u0W3YLwsmyQVt7TTu7FbCaMba3JavrM3BIX
xYF2BklPReDMU+Q1CyPzaG/vImo2OX8/HW4LDguYjk/jzsHGJM0b3DwjkwWRwXyy
wFQS8I7bW0Yjfknlfiu0m0at25jGVZiGPctWAKSU7JL+nbtGQCmzr8+uk88KTqXA
AKgly9S7H/fNqoqXfYuDmveNni/behKFBWlaXqfHX/ZSSjBZCLFaGHCMhIWlhLiN
bQtqmVi9bGjZCfxJeIf5zouD0JKYtldpztI/PCpc9yVCr9UBdl2QcamhYvz5EZt0
B1vw6w3cjqd+4mw6zsiAZKPNbfl/btIa+mJhx6x+WCAD3WYohH4=
=MiDJ
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
