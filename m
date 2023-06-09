Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F42C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 21:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjFIVGR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 17:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjFIVGP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 17:06:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020C13A80
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 14:06:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89C7161961
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 21:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F043C433EF;
        Fri,  9 Jun 2023 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686344770;
        bh=23X8I5L5LsqUbKZd+Ceg+SafHsI+Vl84xDTIjY5kSR0=;
        h=Date:From:To:Cc:Subject:From;
        b=OjED6qX97k3chdHJBfxlinpepEz3ndt45yviGg3eULTxXTMWSCiX39IlzwyX6f6Xg
         5g6gbDDGQyMQbRsY/AvaS1qkgrL7dSIfO9rvTtW+HZjOfjQGLs2jwb7Rk9B0qM4hv+
         OauoKtUvqiYWvslMXCL/mdqvhLGf8GE4K833Z8NSu7KupcpezMd8rLZsal1lWmLJuX
         YbDROFp7YsCfrJ4KI5J/fGXb9kQG6HRg0y7bndGKyCtG0e0ZoMQWq3OPA/LesFz3vn
         c4U/KsyUA775ofXzzKPbcf8Qsckzij7jZewoI2Jm3c9nrUqkARIw+7r5oYqz3gBZax
         PIHrfxUY2w5rg==
Date:   Fri, 9 Jun 2023 23:06:05 +0200
From:   Jernej Skrabec <jernej@kernel.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.5
Message-ID: <20230609210605.GA17740@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi!

Please pull following clock changes for 6.5.

Best regards,
Jernej

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.5-1

for you to fetch changes up to ca1170b69968233b34d26432245eddf7d265186b:

  clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux (2023-05-18 23:07:09 +0200)

----------------------------------------------------------------
- Preselect PLL MIPI as TCON0 parent for A64 SoC

----------------------------------------------------------------
Roman Beranek (1):
      clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)
