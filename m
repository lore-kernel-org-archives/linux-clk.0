Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B7C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  6 May 2022 16:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443711AbiEFQ0P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 May 2022 12:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443709AbiEFQ0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2022 12:26:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDC46D195
        for <linux-clk@vger.kernel.org>; Fri,  6 May 2022 09:22:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0198B83735
        for <linux-clk@vger.kernel.org>; Fri,  6 May 2022 16:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20370C385A9;
        Fri,  6 May 2022 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651854134;
        bh=lDBvKOsjsCRt9+HE0fhz2hNqvsVyv3Vo9Qt1qtLhhj8=;
        h=Date:From:To:Cc:Subject:From;
        b=vHlCwNbvyVVmY5CmImsJ122WuBtyFeIiSG/UBjQed7DRufHndYC9jpD3h4vDSRc80
         I+3KW8ZDOEgSvMGz76CQReO5woWFd7FpxXZpnxRq5mzYh+hCQiVXy6pLcduJg9uUzD
         oUoeF83aztc3jplBZidwzvPT/mIXcNpaaiNwVdO8UNiQG8+/I0jpSbpcpmpn67aPSt
         NElYZFIe4PtKFV0o3WYd02i8VPCtLAEVwH7tq1hr6HUqDz6hS0sCncfetCSANYrteR
         SMi8E/OrO0RSlcNR/JKCSqrl0l5os2gCU8qi3D344UBayhD57n/mBL/cQg4ANGmBpQ
         T6COwAYg2TmZg==
Date:   Fri, 6 May 2022 18:22:10 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 5.19
Message-ID: <YnVLMm7t/NbwnDad@kista.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following clock changes for 5.19.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.19-1

for you to fetch changes up to 31ab5169803ebc009e01d1ee4501ca9faf347161:

  clk: sunxi-ng: h616: Add PLL derived 32KHz clock (2022-05-06 18:03:52 +0200)

----------------------------------------------------------------
Added H6 RTC clock and H616 32 kHz clock

----------------------------------------------------------------
Andre Przywara (2):
      clk: sunxi-ng: h6-r: Add RTC gate clock
      clk: sunxi-ng: h616: Add PLL derived 32KHz clock

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 8 ++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 6 files changed, 17 insertions(+), 2 deletions(-)
