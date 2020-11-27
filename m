Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B517C2D0E4
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 09:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 432542224A
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 09:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgK0JGI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Nov 2020 04:06:08 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60690 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726034AbgK0JGH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Nov 2020 04:06:07 -0500
Received: from localhost.localdomain (unknown [124.16.141.242])
        by APP-05 (Coremail) with SMTP id zQCowADnx+BxwcBf200QAA--.93S2;
        Fri, 27 Nov 2020 17:05:54 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: Remove redundant null check before clk_prepare_enable
Date:   Fri, 27 Nov 2020 09:05:51 +0000
Message-Id: <20201127090551.50254-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowADnx+BxwcBf200QAA--.93S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFy8AFW5Ww4rWFykZrb_yoW3WFgEka
        1Ygr4agr1IqrWayFWUJaykZ39093Z2vr1v93WIvF43Ja47Wr1fuFs2qw4rAa47JFW2kFyS
        yryUuw47Cr13AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4fMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jwL0nUUUUU=
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCgkNA1z4jLOBIgAAs1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Because clk_prepare_enable() already checked NULL clock parameter,
so the additional check is unnecessary, just remove it.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/clk/rockchip/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index b443169dd408..336481bc6cc7 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -603,8 +603,7 @@ void rockchip_clk_protect_critical(const char *const clocks[],
 	for (i = 0; i < nclocks; i++) {
 		struct clk *clk = __clk_lookup(clocks[i]);
 
-		if (clk)
-			clk_prepare_enable(clk);
+		clk_prepare_enable(clk);
 	}
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_protect_critical);
-- 
2.17.1

