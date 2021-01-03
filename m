Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1156BC433E6
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6AED20C56
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbhACNzr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 3 Jan 2021 08:55:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:34812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbhACNzr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 3 Jan 2021 08:55:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A00A208C7;
        Sun,  3 Jan 2021 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682106;
        bh=XZX/b5YVkD4N7USwkCblU5HNc7owjYjpZHcjsELExUo=;
        h=From:To:Cc:Subject:Date:From;
        b=mSuFmRYqXphkUuNhO/x6H9mlDsIi0L0l9K7Ore9pESPCvFozDPaUWVE1e4Ji9l8QM
         FhBIP/1ZLbHFcLY8pReipjYUmf/K1d3KCl5Afx4oyVB0LBNEnG7TKnFI/5X1zyflCv
         Ilh1SQAldy8loy7UeS/b0sizKSRARpeT4JlBB461XbP2RiBtg/HCoWEYUU/ctaqTPp
         W9NvXV2GaMiT/PwLmM+R9irZRMyBKXkwUgwyYoRey/mrUsaiUVABthIlWMCRI2awFn
         7ZcUp7zqD0yNfKyYEoTbqPNKkAi7q4ktAgUsmZqzDFkgPcCvWs24MRxTcTlWcKwvLw
         jl/6dgpK3kOTA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mmp2: fix build without CONFIG_PM
Date:   Sun,  3 Jan 2021 14:54:53 +0100
Message-Id: <20210103135503.3668784-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

pm_clk_suspend()/pm_clk_resume() are defined as NULL pointers rather than
empty inline stubs without CONFIG_PM:

drivers/clk/mmp/clk-audio.c:402:16: error: called object type 'void *' is not a function or function pointer
        pm_clk_suspend(dev);
drivers/clk/mmp/clk-audio.c:411:15: error: called object type 'void *' is not a function or function pointer
        pm_clk_resume(dev);

I tried redefining the helper functions, but that caused additional
problems. This is the simple solution of replacing the __maybe_unused
trick with an #ifdef.

Fixes: 725262d29139 ("clk: mmp2: Add audio clock controller driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/mmp/clk-audio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-audio.c b/drivers/clk/mmp/clk-audio.c
index eea69d498bd2..7aa7f4a9564f 100644
--- a/drivers/clk/mmp/clk-audio.c
+++ b/drivers/clk/mmp/clk-audio.c
@@ -392,7 +392,8 @@ static int mmp2_audio_clk_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mmp2_audio_clk_suspend(struct device *dev)
+#ifdef CONFIG_PM
+static int mmp2_audio_clk_suspend(struct device *dev)
 {
 	struct mmp2_audio_clk *priv = dev_get_drvdata(dev);
 
@@ -404,7 +405,7 @@ static int __maybe_unused mmp2_audio_clk_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mmp2_audio_clk_resume(struct device *dev)
+static int mmp2_audio_clk_resume(struct device *dev)
 {
 	struct mmp2_audio_clk *priv = dev_get_drvdata(dev);
 
@@ -415,6 +416,7 @@ static int __maybe_unused mmp2_audio_clk_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static const struct dev_pm_ops mmp2_audio_clk_pm_ops = {
 	SET_RUNTIME_PM_OPS(mmp2_audio_clk_suspend, mmp2_audio_clk_resume, NULL)
-- 
2.29.2

