Return-Path: <SRS0=vPCn=US=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB58C31E49
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 09:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58CF62084A
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 09:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bQOMYAqQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFSJkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jun 2019 05:40:04 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:58185 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfFSJkD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jun 2019 05:40:03 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190619094001epoutp0425fe8f5d964e2e53722a2ae9fe605e1c~pkB0_Ve-q0491104911epoutp04j;
        Wed, 19 Jun 2019 09:40:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190619094001epoutp0425fe8f5d964e2e53722a2ae9fe605e1c~pkB0_Ve-q0491104911epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560937201;
        bh=W9bQ728cpO/H9vXkzkisz2dKYSz5Av9MwD+IvykvPQU=;
        h=From:To:Cc:Subject:Date:In-reply-to:References:From;
        b=bQOMYAqQgdkJTQ/yz9Z0mxjnds1x/2YRLOJeti3E1RauMPD05GkAccb2W3uqhq1aH
         zlOz6UqoOXyXxXeph7TtGP0dJ9SoKEPy48S2ZZ8Gmfor6oZczcdUn7jbphJezpDLzw
         ngM79fXVlS9qpoy2rpUu0V48GlEtvMzRIDYfsNZ8=
Received: from epsmges1p1.samsung.com (unknown [182.195.42.53]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190619094000epcas1p101d9104971d4f6d4d99eacb65ac34e62~pkB0rVY652009020090epcas1p1t;
        Wed, 19 Jun 2019 09:40:00 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        59.4C.04139.0F20A0D5; Wed, 19 Jun 2019 18:40:00 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20190619094000epcas1p364fdcb03f801ec0ea3a533ead5ac2441~pkB0Rzjqs0438504385epcas1p3e;
        Wed, 19 Jun 2019 09:40:00 +0000 (GMT)
X-AuditID: b6c32a35-973ff7000000102b-91-5d0a02f0a203
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p1new.samsung.com
        (Symantec Messaging Gateway) with SMTP id 11.1B.03598.0F20A0D5; Wed, 19 Jun
        2019 18:40:00 +0900 (KST)
Received: from AMDC3061.DIGITAL.local ([106.120.51.75]) by mmp2.samsung.com
        (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
        2014)) with ESMTPA id <0PTC00A4NAU0QYA0@mmp2.samsung.com>; Wed, 19 Jun 2019
        18:40:00 +0900 (KST)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] clk: Add devm_clk_bulk_get_optional() function
Date:   Wed, 19 Jun 2019 11:39:26 +0200
Message-id: <20190619093926.21719-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-reply-to: <20190619093926.21719-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCmru4HJq5Yg2VXDSw2zljPanH+/AZ2
        i48991gt1h65y25x8ZSrxeE37awW/65tZHFg93h/o5XdY9OqTjaPvi2rGD0+b5ILYInisklJ
        zcksSy3St0vgyrjwUaXgolzFg3XzWRoY+yW7GDk5JARMJHbOm80EYgsJ7GCUuPUjoIuRC8j+
        zigxY905VpiizWu+sUMkNjBK9B//xAzh/GSUWLPmMgtIFZuAoUTv0T5GEFtEQFbi1rGfbCBF
        zAKLGSUuTDwPViQs4Cxxbf1/MJtFQFXi3OTLzCA2r4C1xO62G0wQ6+QlVm84ABbnFLCRmD33
        PCPIIAmBRjaJlb0LoG5ykTh+czVQEQeQLS1x6agtRE0zo0TP7tvsEM4ERon7xxcwQjRYSxw+
        fhGsmVmAT+Ld1x5WiGZeiY42IYgSD4kprfsZIV7rZ5TY9v8BE9CIBYwMqxjFUguKc9NTiw0L
        DPWKE3OLS/PS9ZLzczcxgmNLy3QH45RzPocYBTgYlXh4M75yxAqxJpYVV+YeYpTgYFYS4eVu
        5owV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzhvPfTNGSCA9sSQ1OzW1ILUIJsvEwSnVwLhagZtR
        3nLL0xbGVTudVnSZqPov3fzzwX4V83k1FR438g99zNL7Z/LzsNXhVMbSg/sWFX3Mi2rjjV1t
        LP/H55D7Rr76dq1J8/9vcGbgF5d9bv4+anbT3bKYGGGmaRIat3V8HxvN41OVeWqfZaCllLpJ
        3vmRrV/F6gmMbQk1TczGe5adE1MrUmIpzkg01GIuKk4EANZFri+pAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjluLIzCtJLcpLzFFi42I5/e+xoO4HJq5Yg7aVIhYbZ6xntTh/fgO7
        xceee6wWa4/cZbe4eMrV4vCbdlaLf9c2sjiwe7y/0crusWlVJ5tH35ZVjB6fN8kFsERx2aSk
        5mSWpRbp2yVwZVz4qFJwUa7iwbr5LA2M/ZJdjJwcEgImEpvXfGPvYuTiEBJYxygxffN/KOcn
        o8SZ10vYQarYBAwleo/2MYLYIgKyEreO/WQDKWIWWMwo8f/JfbAiYQFniWvr/7OA2CwCqhLn
        Jl9mBrF5BawldrfdYIJYJy+xesMBsDingI3E7LnnwYYKAdW8erqTcQIjzwJGhlWMkqkFxbnp
        ucVGBYZ5qeV6xYm5xaV56XrJ+bmbGIGhs+2wVt8OxvtL4g8xCnAwKvHwCnzmiBViTSwrrsw9
        xCjBwawkwsvdzBkrxJuSWFmVWpQfX1Sak1p8iFGag0VJnPd23rFIIYH0xJLU7NTUgtQimCwT
        B6dUA+OiB/xdaR4ss66Zr80JVnoXL/5SPz7ERzHw+vz8yY3nXp86t0KpQkHXZzOr5zyvLS9L
        tgStZ93I4iVlaqpqneBm/PQ0f96vhIvy/fUGIl/vTpo44XvsriknXn495Ff+bs1sP+V0c+ZN
        Ygskdgoder6MaWuSVaHnSuvuZSLnWvSERRlOf/xaelyJpTgj0VCLuag4EQBnosCQGQIAAA==
X-CMS-MailID: 20190619094000epcas1p364fdcb03f801ec0ea3a533ead5ac2441
CMS-TYPE: 101P
X-CMS-RootMailID: 20190619094000epcas1p364fdcb03f801ec0ea3a533ead5ac2441
References: <20190619093926.21719-1-s.nawrocki@samsung.com>
        <CGME20190619094000epcas1p364fdcb03f801ec0ea3a533ead5ac2441@epcas1p3.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add managed version of the clk_bulk_get_optional() helper function.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/clk-devres.c | 22 +++++++++++++++++++---
 include/linux/clk.h      | 28 ++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index daa1fc8fba537..f5f310ef001ac 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -52,8 +52,8 @@ static void devm_clk_bulk_release(struct device *dev, void *res)
 	clk_bulk_put(devres->num_clks, devres->clks);
 }
 
-int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
-		      struct clk_bulk_data *clks)
+int __devm_clk_bulk_get(struct device *dev, int num_clks,
+			struct clk_bulk_data *clks, bool optional)
 {
 	struct clk_bulk_devres *devres;
 	int ret;
@@ -63,7 +63,10 @@ int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
 	if (!devres)
 		return -ENOMEM;
 
-	ret = clk_bulk_get(dev, num_clks, clks);
+	if (optional)
+		ret = clk_bulk_get_optional(dev, num_clks, clks);
+	else
+		ret = clk_bulk_get(dev, num_clks, clks);
 	if (!ret) {
 		devres->clks = clks;
 		devres->num_clks = num_clks;
@@ -74,8 +77,21 @@ int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
 
 	return ret;
 }
+
+int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
+		      struct clk_bulk_data *clks)
+{
+	return __devm_clk_bulk_get(dev, num_clks, clks, false);
+}
 EXPORT_SYMBOL_GPL(devm_clk_bulk_get);
 
+int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
+		      struct clk_bulk_data *clks)
+{
+	return __devm_clk_bulk_get(dev, num_clks, clks, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_bulk_get_optional);
+
 int __must_check devm_clk_bulk_get_all(struct device *dev,
 				       struct clk_bulk_data **clks)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 98ea3e29f34b1..d943ee204d68b 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -359,6 +359,28 @@ int __must_check clk_bulk_get_optional(struct device *dev, int num_clks,
  */
 int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
 				   struct clk_bulk_data *clks);
+/**
+ * devm_clk_bulk_get_optional - managed get multiple optional consumer clocks
+ * @dev: device for clock "consumer"
+ * @clks: pointer to the clk_bulk_data table of consumer
+ *
+ * Behaves the same as devm_clk_bulk_get() except where there is no clock
+ * producer.  In this case, instead of returning -ENOENT, the function returns
+ * NULL for given clk. It is assumed all clocks in clk_bulk_data are optional.
+ *
+ * Returns 0 if all clocks specified in clk_bulk_data table are obtained
+ * successfully or for any clk there was no clk provider available, otherwise
+ * returns valid IS_ERR() condition containing errno.
+ * The implementation uses @dev and @clk_bulk_data.id to determine the
+ * clock consumer, and thereby the clock producer.
+ * The clock returned is stored in each @clk_bulk_data.clk field.
+ *
+ * Drivers must assume that the clock source is not enabled.
+ *
+ * clk_bulk_get should not be called from within interrupt context.
+ */
+int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
+					    struct clk_bulk_data *clks);
 /**
  * devm_clk_bulk_get_all - managed get multiple clk consumers
  * @dev: device for clock "consumer"
@@ -760,6 +782,12 @@ static inline int __must_check devm_clk_bulk_get(struct device *dev, int num_clk
 	return 0;
 }
 
+static inline int __must_check devm_clk_bulk_get_optional(struct device *dev,
+				int num_clks, struct clk_bulk_data *clks)
+{
+	return 0;
+}
+
 static inline int __must_check devm_clk_bulk_get_all(struct device *dev,
 						     struct clk_bulk_data **clks)
 {
-- 
2.17.1

