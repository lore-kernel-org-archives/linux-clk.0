Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14AFC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 24 Apr 2022 22:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239671AbiDXWd3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 Apr 2022 18:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239595AbiDXWd2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Apr 2022 18:33:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE1424BF1
        for <linux-clk@vger.kernel.org>; Sun, 24 Apr 2022 15:30:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 122B1B80139
        for <linux-clk@vger.kernel.org>; Sun, 24 Apr 2022 22:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771E0C385A7;
        Sun, 24 Apr 2022 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650839422;
        bh=hYFLXl6wWtoTzWaTkcL5ZGI7jII5VVhw0xu5nDplZN8=;
        h=Date:From:To:Cc:Subject:From;
        b=XtlLlS+EcTSwRF2UkB7iNNOJQjLZOrq+wzM4pnPCudfsdmjLuM5Mq0bH1sXyRXHCT
         FWmVOzEqrZLMrHnCkturZ8r9izhrv1y8m62Gx/9EYG18AsKWbrgb/RPBbuvP3dS3A/
         +OPRdl/FRwAWxk10z9ZduJfcKOnI7RjDYlSNcnHt6fkeWuP06D/7F4WLzWbKMc4Y0Z
         Gza+UfMFm6XrhrbeGVVjuWkelmkuX/SdAwauNUciAXbWhIw1b8K2Xd1kUDz4pS+Qmw
         z9z/bq9igxUc7ZoigywSCjWZIq2N5DvtrZXfN8HW1PIk6qN3353mUQqZ0PZhif1doC
         lRQI6yPRXYKLg==
Date:   Mon, 25 Apr 2022 00:30:18 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 4.18
Message-ID: <YmXPemmFqfcj4p/p@kista.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following changes for current release.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-5.18-1

for you to fetch changes up to b4f3d5f06e29b7020f19cc788b2c2de750e888a1:

  clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical (2022-04-24 23:22:46 +0200)

----------------------------------------------------------------
Two clock fixes:
- missing sentinel in device id array
- missing critical flag for rtc-32k clock

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical

Wan Jiabing (1):
      clk: sunxi-ng: fix not NULL terminated coccicheck error

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
 1 file changed, 2 insertions(+)
