Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F31C43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 10:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiFXKQP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 06:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbiFXKQP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 06:16:15 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A7127B343
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=k7iQq
        MdTRg1dwycEVbJfqHglc2NqqnxJVA5VXCqItf4=; b=SqgmMjp+6ON42yp6gwEyk
        TJ9rdLxExyR9AkRRXhh7yNhvdnDNknvRvZpRwURvk1+AroBrOikGsJwykW9L0enU
        Vgk9kfpfgr8qJDX8uK1Ck/kGmVUVHKARM7Fs9dFmi2pgVH2YebF75k39IHUAkayP
        s/Z5EkLtZvlwXYYv5PMxis=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgCH1WndjrVixyYOFQ--.60394S2;
        Fri, 24 Jun 2022 18:15:59 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH] clk/qoriq: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:15:56 +0800
Message-Id: <20220624101556.4164258-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgCH1WndjrVixyYOFQ--.60394S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary5uryDZry8ZrWxtr48tFb_yoW8Xr4Dpr
        WDGrW5AFWUJr4DWr1IyryxZr9xWa4vkFWIqF93WayfZ3ZxJa42q3WUG345ur9xAFWruayF
        qry8ta4vkF4UZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi4SotUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2h8qF1uwMRqT3gAAs1
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
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig


 drivers/clk/clk-qoriq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 88898b97a443..416991231915 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1063,8 +1063,13 @@ static void __init _clockgen_init(struct device_node *np, bool legacy);
  */
 static void __init legacy_init_clockgen(struct device_node *np)
 {
-	if (!clockgen.node)
-		_clockgen_init(of_get_parent(np), true);
+	if (!clockgen.node) {
+		struct device_node *tp;
+
+		tp = of_get_parent(np);
+		_clockgen_init(tp, true);
+		of_node_put(tp);
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

