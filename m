Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C8C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 18:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244197AbiDYSFb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 14:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241982AbiDYSFb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 14:05:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73714667B
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 11:02:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B52461604
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 18:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72054C385A7;
        Mon, 25 Apr 2022 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650909745;
        bh=wB6QZNYJ+oigdgmtL/ndlegdP8U81yYisNMbo36102Y=;
        h=Date:From:To:Cc:Subject:From;
        b=iaINlQhOetMw4ZQcRcyRzKjDu6PnAjZVThe3WnxFpHshtLNbYkOs31HD3B7trPAY7
         4IPu4ID9sYoEjVwM6u14Hcat0R38AUTYQbRkd+oMa3u0Tq1z4pPtnkKYQOiC+T4NTw
         OGwGvL2uifMo1RGkMepLv+oYs6XQf5jXkKn+UZ2VBLa1mb3WXoVWNh2VJhzYnVJwrE
         MB6I/cGDF5nRuiqqNZ0RfCSvkyzf8+8PIK+FmaNtKa9UWQhBbAX7kV+qRPgxunUDxF
         WNFCZ8BoUqLqoUwKOuJxQr+1F4+JcPbPKq8/lb3YbL9FFIP5SL+RjDKbOE/Ywh3ulA
         vfz1fvegGAkoA==
Date:   Mon, 25 Apr 2022 20:02:21 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 4.18, take 2
Message-ID: <YmbiLbQmqIUec0fM@kista.localdomain>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-5.18-2

for you to fetch changes up to f58ca215cda1975f77b2b762903684a3c101bec9:

  clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource() (2022-04-25 19:50:53 +0200)

----------------------------------------------------------------
Add missing sentinel, check return value and mark rtc-32k as critical

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical

Wan Jiabing (1):
      clk: sunxi-ng: fix not NULL terminated coccicheck error

Yang Yingliang (1):
      clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource()

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
 drivers/clk/sunxi/clk-sun9i-mmc.c    | 2 ++
 2 files changed, 4 insertions(+)
