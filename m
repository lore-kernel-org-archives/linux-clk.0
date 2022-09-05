Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C5ECAAA1
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 07:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236000AbiIEHA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 03:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbiIEHAW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 03:00:22 -0400
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE51822B14;
        Mon,  5 Sep 2022 00:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G9PRu
        m1izor0nngmVMOFcOHtkmJgD11qKZ6kZyikhek=; b=FgfKLRQ8WjPqaOqWnvYPu
        M7NLW0gX4jvMiAvSsSV+G9hVBY//eZF+k771vG5tbV8/wDa+B1O81BS9zdEmi6di
        Aq5zR9F0+uFJdGCTnul0DnogisFYFiDLivQ7lPYHBIaFHQ6Q4BXecAZFkmMm8wKC
        B0aK2QCivBL+fsWpdlt760=
Received: from localhost.localdomain (unknown [116.128.244.169])
        by smtp5 (Coremail) with SMTP id HdxpCgAnRDk7nhVjrtvGZw--.51372S2;
        Mon, 05 Sep 2022 14:59:08 +0800 (CST)
From:   Jiangshan Yi <13667453960@163.com>
To:     david@lechnology.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     nsekhar@ti.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] clk: davinci: pll: fix spelling typo in comment
Date:   Mon,  5 Sep 2022 14:58:33 +0800
Message-Id: <20220905065833.1831473-1-13667453960@163.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgAnRDk7nhVjrtvGZw--.51372S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5Gr4ruF1Utrb_yoW3KFc_WF
        W8W34DW398KFsav3Wjq3yFqFyFyFs5uF97W3WYva1fJ3y5Z39rG3yvqw1Iv342krWUWF9F
        y3Wayr15Crn8ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbuOJ7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbizRxz+1c7OAtEywAAsJ
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/clk/davinci/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 0d750433eb42..c53dd4ff8530 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -98,7 +98,7 @@
  * @hw: clk_hw for the pll
  * @base: Base memory address
  * @pllm_min: The minimum allowable PLLM[PLLM] value
- * @pllm_max: The maxiumum allowable PLLM[PLLM] value
+ * @pllm_max: The maximum allowable PLLM[PLLM] value
  * @pllm_mask: Bitmask for PLLM[PLLM] value
  */
 struct davinci_pll_clk {
-- 
2.27.0


No virus found
		Checked by Hillstone Network AntiVirus

