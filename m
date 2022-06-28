Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985ABC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 14:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346638AbiF1OjI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346441AbiF1OjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 10:39:07 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88BD329C9A
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5UjtA
        MQOcxmB46yxA+Rw2P1WnPEt8t19yuN8RGobL+c=; b=IE640MLcP82M5/XS81co4
        bh1OYQRAAHaBrqfj87MC++79uwHVVIiuX2cnYCUgj5NXuDS36u02Qrv7Oo41CSvu
        d2piB/9HRS6yiuw2iVgTZuC8k3IZujwzaGx0kOtpKYNSri/W6+xsY+eFM3Fr3sEy
        fOfoM2bOnb3ToYcZz2VN1U=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowABHhvV7Ertic5RxEA--.34003S2;
        Tue, 28 Jun 2022 22:38:51 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] clk: qoriq: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 22:38:51 +0800
Message-Id: <20220628143851.171299-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABHhvV7Ertic5RxEA--.34003S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary5uryDZry8ZrWxtr48tFb_yoW8WF4fpr
        WUCrW5Zr4Utr4DCrWIyry7Zr9Yqa1kGFWIqF97Wa4rZ3Z3GF10q3W8G345Ar9xAFWruayF
        qr4Ut3W0yF1UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0hFsUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhUuF1-HZZgbHgABsX
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In legacy_init_clockgen(), we need to hold the reference returned
by of_get_parent() and use it to call of_node_put() for refcount
balance.

Beside, in create_sysclk(), we need to call of_node_put() on 'sysclk'
also for refcount balance.

Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into driver")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: change 'tp' with 'parent_np', change title format to xx:yy:zz
 v1: hold reference returned by of_get_parent() and |PUT| 'sysclk'
 
 v1-link: https://lore.kernel.org/all/20220624101556.4164258-1-windhl@126.com/

 Patched file has been compiled test in 5.19rc2.


 drivers/clk/clk-qoriq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 88898b97a443..5eddb9f0d6bd 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1063,8 +1063,13 @@ static void __init _clockgen_init(struct device_node *np, bool legacy);
  */
 static void __init legacy_init_clockgen(struct device_node *np)
 {
-	if (!clockgen.node)
-		_clockgen_init(of_get_parent(np), true);
+	if (!clockgen.node) {
+		struct device_node *parent_np;
+
+		parent_np = of_get_parent(np);
+		_clockgen_init(parent_np, true);
+		of_node_put(parent_np);
+	}
 }
 
 /* Legacy node */
@@ -1159,6 +1164,7 @@ static struct clk * __init create_sysclk(const char *name)
 	sysclk = of_get_child_by_name(clockgen.node, "sysclk");
 	if (sysclk) {
 		clk = sysclk_from_fixed(sysclk, name);
+		of_node_put(sysclk);
 		if (!IS_ERR(clk))
 			return clk;
 	}
-- 
2.25.1

