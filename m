Return-Path: <SRS0=TK4h=C6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5ACC43464
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 03:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96FA3207DE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Sep 2020 03:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIUDwj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Sep 2020 23:52:39 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:38106 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726011AbgIUDwj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Sep 2020 23:52:39 -0400
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 23:52:38 EDT
Received: from localhost (unknown [159.226.5.99])
        by APP-01 (Coremail) with SMTP id qwCowAAHHfDZIWhfsjqpAA--.52882S2;
        Mon, 21 Sep 2020 11:45:30 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mturquette@baylibre.com, sboyd@kernel.org, baohua@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Xu Wang <vulab@iscas.ac.cn>
Subject: [PATCH] clk: clk-prima2: fix return value check in prima2_clk_init()
Date:   Mon, 21 Sep 2020 03:45:22 +0000
Message-Id: <20200921034522.9077-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAAHHfDZIWhfsjqpAA--.52882S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrW7Kw45KF1kXr1UtFWDJwb_yoWfWwc_K3
        WFgrn7Zrs5Cr4av3y3Ar45ZryFvF95urWxAFy0g3Waqa93WF95CrWYvasrC3s3KrW8JryD
        Jwn7Gr1fCr13CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkOzsUUU
        UU=
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAwEA18J9pxW3AACs3
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In case of error, the function clk_register() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/clk/sirf/clk-prima2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sirf/clk-prima2.c b/drivers/clk/sirf/clk-prima2.c
index 45dcbc9e0302..d17b345f4d2d 100644
--- a/drivers/clk/sirf/clk-prima2.c
+++ b/drivers/clk/sirf/clk-prima2.c
@@ -134,7 +134,7 @@ static void __init prima2_clk_init(struct device_node *np)
 
 	for (i = pll1; i < maxclk; i++) {
 		prima2_clks[i] = clk_register(NULL, prima2_clk_hw_array[i]);
-		BUG_ON(!prima2_clks[i]);
+		BUG_ON(IS_ERR(prima2_clks[i]));
 	}
 	clk_register_clkdev(prima2_clks[cpu], NULL, "cpu");
 	clk_register_clkdev(prima2_clks[io],  NULL, "io");
-- 
2.17.1

