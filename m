Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A49C43334
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jul 2022 16:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238639AbiGHQdM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jul 2022 12:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238493AbiGHQdL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jul 2022 12:33:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20053263D
        for <linux-clk@vger.kernel.org>; Fri,  8 Jul 2022 09:33:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C6676B828A6
        for <linux-clk@vger.kernel.org>; Fri,  8 Jul 2022 16:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40439C341C6;
        Fri,  8 Jul 2022 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657297988;
        bh=1oEZlcnp3FMLW0227xkippi8k2jCBW7pDFmB127l5Ls=;
        h=Date:From:To:Cc:Subject:From;
        b=XRfDSStCcX7Cxh0cX8wZ/KjxxR2F3Ri/engYYRDjo26trkgb1WV4BcN1bzPhGwyDl
         9ZOCJZdtaAxbPww7rytO4aF+W3OXw1U8WT85ZE8e7uAOwrV4JaCAXYpTS7dQ3wajQE
         belXewCN33luh7dLm0GVlrvjgAVRDeKrRgX1JUp1dIMBVlixRIX1Sc02DUqGF+9iYQ
         n86EDIIop3KOQ74PTy/ofTSn/axggnq0HfUKdZK+va4gQRL7OntUBalL/XT5uuNYm8
         v2nvYU6/BvvPphkxksagHUI+4Vq1vHWtlcUz/CvLRXXpBH2ycjwRHPg4Hc/wt+Ei9c
         QYKlbBJ3AEP9A==
Date:   Fri, 8 Jul 2022 18:33:04 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 5.20
Message-ID: <YshcQP6rsWJHgfYO@kista.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following clock changes for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.20-1

for you to fetch changes up to 4167ac8a657e4f0860419adf24d4b91a26580488:

  clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS (2022-07-08 18:13:50 +0200)

----------------------------------------------------------------
- deduplicate ccu_clks arrays
- H6 GPU DFS support
- adjust Kconfig

----------------------------------------------------------------
Roman Stratiienko (1):
      clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS

Samuel Holland (3):
      clk: sunxi-ng: Deduplicate ccu_clks arrays
      clk: sunxi: Limit legacy clocks to 32-bit ARM
      clk: sunxi: Do not select the PRCM MFD

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c |  16 +----
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c   |  16 ++++-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c   |  79 ++++++-----------------
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c    | 113 +--------------------------------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c     |  40 +++---------
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  84 ++----------------------
 drivers/clk/sunxi/Kconfig              |   4 +-
 7 files changed, 54 insertions(+), 298 deletions(-)
