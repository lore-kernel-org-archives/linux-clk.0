Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971E4C88CB2
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 18:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237550AbjFLSXh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237551AbjFLSXg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:23:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156E5E0;
        Mon, 12 Jun 2023 11:23:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B86862CC9;
        Mon, 12 Jun 2023 18:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B7CC433D2;
        Mon, 12 Jun 2023 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686594214;
        bh=0ia4DOXRQlpxbsvixuJZP92w3Mu5z3zc9q4s1AOUnDc=;
        h=From:To:Cc:Subject:Date:From;
        b=iQqK/iw2pw+Igfn7d9j8xQ8+HbK07/0/uCJLT6erT9jqHOqpdOn9NLk+g8CuYNCIp
         zRILIyb9jt7Um7NA0jf1/018qJ4cHKP1K1XrZ0Bkgo/LsXFh9e0Uvq+r19R+DXvCup
         Dlcnn1YvVWcA2gELwVl+8UOR4Ha3nbFT1G5z2KMXTcqYdypN1w06bu4jkz/HXT+8bh
         UbUnn6HR8NBceZEsdxxBIOr06jf6DxbTAUE8ggsN3wHzYYBRY8mvHuHSLYB1DjqtDf
         9qxjQrPiAmiq+t55MDSRr7UVJm2Yew0Zu7NhzEaNSwwz5YDeWt5UcMFZZNcKZCMIIH
         5lpIh0hQ4acuA==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Jian Hu <jian.hu@amlogic.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson: a1: Staticize rtc clk
Date:   Mon, 12 Jun 2023 11:23:32 -0700
Message-ID: <20230612182332.371003-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sparse rightly complains that this symbol is supposed to be static.

Cc: Jian Hu <jian.hu@amlogic.com>
Cc: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock controller driver")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/meson/a1-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index b320134fefeb..75dfae210fe5 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -218,7 +218,7 @@ static struct clk_regmap rtc_32k_sel = {
 	},
 };
 
-struct clk_regmap rtc = {
+static struct clk_regmap rtc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = RTC_BY_OSCIN_CTRL0,
 		.bit_idx = 30,
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

