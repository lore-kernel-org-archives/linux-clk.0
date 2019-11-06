Return-Path: <SRS0=SbWe=Y6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51DEC5DF62
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 12:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F8122187F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573042842;
	bh=WXTIEv2erK0lUnVb8P4eCMD0RvWaScVXQl+HC7HKaag=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=yg9TVDenblxqXbvQ6Q/TZwu5EhKOH3aQmLBLlQAJFYmcFrEjSmxnoQ1yeSOCHI/E9
	 W5m6e5K0v1Cse6gzMl8RzouZdyCBVPr9c8ePll1jiPmqLyiLwLcGNNuttlHLLyR9gn
	 C9Vu5vXErmWRTFtZc6rG+PA8SBM8hkkXxpsDiTaE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfKFMUl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Nov 2019 07:20:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:53098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfKFMUl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Nov 2019 07:20:41 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DB5B20869;
        Wed,  6 Nov 2019 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573042840;
        bh=WXTIEv2erK0lUnVb8P4eCMD0RvWaScVXQl+HC7HKaag=;
        h=Date:From:To:Cc:Subject:From;
        b=py5PXamdOM1RBsWpDJZCv4rMYyO2h/dALF3xAZI9QQ2HEABSJdHTdP0AwKluFDT6T
         C9pxU781l2EzTWfRnlnpmJWiN0/90AhpDpCQ5Dg+u8HExXdoxTw4JOIn5wTEyr5uyu
         s4/zsZGytMzCKj0TKzvBXSeWjxzivXcYQaTWJb7M=
Date:   Wed, 6 Nov 2019 13:20:37 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.5
Message-ID: <b7e68c7f-50d9-4d35-bb8b-649b6a8269f7.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.5-1

for you to fetch changes up to 4441b57ec27e35a86337b3197c62b3d6be9695b2:

  clk: sunxi-ng: h3: Export MBUS clock (2019-11-05 11:34:41 +0100)

----------------------------------------------------------------
A few clock patches for sunxi, mostly to export new clocks to the DT,
and fix some issues with the clock tree on the H6.

----------------------------------------------------------------
Jernej Skrabec (3):
      clk: sunxi-ng: h6: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: h6: Allow GPU to change parent rate
      clk: sunxi-ng: h3: Export MBUS clock


 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     | 23 ++++++++++++++++-------
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h      |  4 ----
 include/dt-bindings/clock/sun8i-h3-ccu.h |  2 +-
 3 files changed, 17 insertions(+), 12 deletions(-)



--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcK6lQAKCRDj7w1vZxhR
xYUDAQCzT+PFepFmosGavAeB6GuZ9yYE30e0GJ6CgflZNGXsSwD4mTHZe65MCYOE
Y8I36Qhyf5AwaLp38FFGZU5ybSn9Dw==
=DpBo
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
