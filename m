Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FCCC6FA82
	for <linux-clk@archiver.kernel.org>; Sun, 18 Sep 2022 21:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIRVhs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Sep 2022 17:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiIRVhr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Sep 2022 17:37:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148BD13FA8
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 14:37:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82551B80ECC
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 21:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC13C433C1;
        Sun, 18 Sep 2022 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663537064;
        bh=rja6G+0RmPSgPPDhqtvayPqKNclrfFrvjGzolAM2qUk=;
        h=Date:From:To:Cc:Subject:From;
        b=aKyGnys0hw9AC99jBlYDoO9TzvMjDsW4jqx+vODfhe6EkHkBGDcK4X0kFA1k631eu
         BfInAUInBKLD+CThy8QX1gMLniZiZ/NqjZMDY2SRvL5/NX1ARYxopFl3mebODp9xgB
         m/BwreByk5iC4jNqskMnX3pVppZRx7toi6wD4sRY8vXQED95MWfjQxguY83DOLbKmr
         dGdqXOheL92gUtWEVhy3IouztMu9Ja1lJVSiDRJoHgsUFOGzc9nEFFFEFGQI3HMDqi
         YZzUf8SRBWJ2YJHBD8LV7rNrLVuB5ONUo1t6osPc18SlrkSc/xVJRF65lUf9GLxnIv
         mW/0slrv1QQSg==
Date:   Sun, 18 Sep 2022 23:37:40 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.1
Message-ID: <YyePpKhg42LfjGQn@kista.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following clock changes for 6.1.

Best regards,
Jernej

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.1-1

for you to fetch changes up to 6a6434482fc6184e8fc73092aea755253205ec5b:

  clk: sunxi-ng: ccu-sun9i-a80-usb: Use dev_err_probe() helper (2022-09-08 21:59:01 +0200)

----------------------------------------------------------------
Refactor A80 DE & USB and DE2 code to use dev_err_probe() helper

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: d1: Limit PLL rates to stable ranges

Yang Yingliang (3):
      clk: sunxi-ng: sun8i-de2: Use dev_err_probe() helper
      clk: sunxi-ng: ccu-sun9i-a80-de: Use dev_err_probe() helper
      clk: sunxi-ng: ccu-sun9i-a80-usb: Use dev_err_probe() helper

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c     |  8 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c     | 28 +++++++++-------------------
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  | 19 ++++++-------------
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  9 +++------
 4 files changed, 26 insertions(+), 38 deletions(-)
