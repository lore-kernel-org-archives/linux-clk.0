Return-Path: <SRS0=vPCn=US=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F00DC31E49
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 09:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 232BE2084A
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 09:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pwiK5BFX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFSJjx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jun 2019 05:39:53 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:36416 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfFSJjx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jun 2019 05:39:53 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190619093951epoutp03603e3a22e013bfabe056ff68a8967819~pkBsLI7LR1020010200epoutp03g;
        Wed, 19 Jun 2019 09:39:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190619093951epoutp03603e3a22e013bfabe056ff68a8967819~pkBsLI7LR1020010200epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560937191;
        bh=w8ToiajD+xwFaA3WYkpktFcDTg2yYN2g78Kb1gX01BU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pwiK5BFXjw0jCE8N9+etp7EfXqoxR7yCJy2Wkd9EaRLVjCY1hk4vg7VkOMb4ljRnk
         pelhOVt8IDYBgfVtYT7sRUYf7BNemmHBuSKUmEZPyWAA/hKnI3ScJ0cWefGh2ifYmD
         BbMbOdHAnrBewg6wcQuqpKGJ1eWRFcMX1Z4UBLcY=
Received: from epsmges2p4.samsung.com (unknown [182.195.42.72]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20190619093950epcas2p21ca35cb46123037c21f8c1e639aaff7a~pkBrTzxpM1790717907epcas2p28;
        Wed, 19 Jun 2019 09:39:50 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.8E.04207.6E20A0D5; Wed, 19 Jun 2019 18:39:50 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20190619093950epcas2p3d6f7c26564844432f8153ee9b6a6007c~pkBrCq3e13026130261epcas2p3q;
        Wed, 19 Jun 2019 09:39:50 +0000 (GMT)
X-AuditID: b6c32a48-6a1ff7000000106f-b4-5d0a02e644c8
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p2new.samsung.com
        (Symantec Messaging Gateway) with SMTP id E3.F8.03620.6E20A0D5; Wed, 19 Jun
        2019 18:39:50 +0900 (KST)
Received: from AMDC3061.DIGITAL.local ([106.120.51.75]) by mmp2.samsung.com
        (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
        2014)) with ESMTPA id <0PTC00A4NAU0QYA0@mmp2.samsung.com>; Wed, 19 Jun 2019
        18:39:50 +0900 (KST)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] clk: Add clk_bulk_get_optional() function
Date:   Wed, 19 Jun 2019 11:39:25 +0200
Message-id: <20190619093926.21719-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdljTQvcZE1eswYX5WhYbZ6xntTh/fgO7
        xceee6wWa4/cZbe4eMrV4vCbdlaLf9c2sjiwe7y/0crusWlVJ5tH35ZVjB6fN8kFsERx2aSk
        5mSWpRbp2yVwZUxoP8tc8F+64vyJ7awNjGfEuhg5OSQETCQ6z99iArGFBHYwSkw7ItLFyAVk
        f2eUOL19JSNM0Z+FrWwQiQ2MEjO+72SBcH4ySnzd+4kNpIpNwFCi92gfWIeIgKzErWM/wTqY
        BRYzSlyYeJ4FJCEsYCex6dMjsAYWAVWJCwc7wHbzClhLbHwwiwlinbzE6g0HmEGaJQReskrs
        vt3NBpFwkZj78zSULS3xbNVGRoiiZkaJnt232SGcCYwS948vgLrcWuLw8YusIDazAJ9Ex+G/
        QEUcQHFeiY42IYgSD4n/X+YwQ0IgVmLCtfssExjFFzAyrGIUSy0ozk1PLTYqMNErTswtLs1L
        10vOz93ECI4iLY8djAfO+RxiFOBgVOLh3fCSI1aINbGsuDL3EKMEB7OSCC93M2esEG9KYmVV
        alF+fFFpTmrxIUZpDhYlcd5N3DdjhATSE0tSs1NTC1KLYLJMHJxSDYy2rKqbNX7PiSp48br2
        3BuevCyFi5pVjRsvB3b6/LVmDVRbbfEwoOj6UqNFUU6Hs/Ynib29ntnXKns6tI/rgevUrGUm
        k+JT1yq9XhYlmR+Zs3nigqWGqbOFFKf0OquKCJvtFXkh4G3+Xc1Q+r7BLkuxc38Ks8+Erp/4
        09sw9An7uQjW5nmbGpVYijMSDbWYi4oTAV41KL6eAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPJMWRmVeSWpSXmKPExsVy+t9jQd1nTFyxBvf/iltsnLGe1eL8+Q3s
        Fh977rFarD1yl93i4ilXi8Nv2lkt/l3byOLA7vH+Riu7x6ZVnWwefVtWMXp83iQXwBLFZZOS
        mpNZllqkb5fAlTGh/SxzwX/pivMntrM2MJ4R62Lk5JAQMJH4s7CVrYuRi0NIYB2jxPneP8wQ
        zk9Gic+dLewgVWwChhK9R/sYQWwRAVmJW8d+gnUwCyxmlPj/5D5YkbCAncSmT4/YQGwWAVWJ
        Cwc7mEBsXgFriY0PZjFBrJOXWL3hAPMERq4FjAyrGCVTC4pz03OLjQqM8lLL9YoTc4tL89L1
        kvNzNzECg2HbYa3+HYyPl8QfYhTgYFTi4d3xgSNWiDWxrLgy9xCjBAezkggvdzNnrBBvSmJl
        VWpRfnxRaU5q8SFGaQ4WJXFe/vxjkUIC6YklqdmpqQWpRTBZJg5OqQZGpz0WhxepxZ9y1GvQ
        6opL0DdeH/3N94ixctzmIPGpHzc2JPF6zw456vfq3L6ESRY/Z3ootpt/SijS3Xgl7mLLmc/v
        THb+e8rBeP771ImHKm5WxshquvW/bc70Kv8skR+z7tTUwEPX9Sr8ey7cv8swe1mKY9x6/ZkJ
        7g2/UiODFN9fOBa1WblRiaU4I9FQi7moOBEA3OkK+AICAAA=
X-CMS-MailID: 20190619093950epcas2p3d6f7c26564844432f8153ee9b6a6007c
CMS-TYPE: 102P
X-CMS-RootMailID: 20190619093950epcas2p3d6f7c26564844432f8153ee9b6a6007c
References: <CGME20190619093950epcas2p3d6f7c26564844432f8153ee9b6a6007c@epcas2p3.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_bulk_get_optional() allows to get a group of clocks where one
or more is optional.  For a not available clock, e.g. not specifed
in the clock consumer node in DT, its respective struct clk pointer
will be NULL.  This allows for operating on a group of returned
clocks (struct clk_bulk_data array) with existing clk_bulk* APIs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/clk-bulk.c | 23 ++++++++++++++++++++---
 include/linux/clk.h    | 19 +++++++++++++++++++
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index 06499568cf076..524bf9a530985 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -75,8 +75,8 @@ void clk_bulk_put(int num_clks, struct clk_bulk_data *clks)
 }
 EXPORT_SYMBOL_GPL(clk_bulk_put);
 
-int __must_check clk_bulk_get(struct device *dev, int num_clks,
-			      struct clk_bulk_data *clks)
+static int __clk_bulk_get(struct device *dev, int num_clks,
+			  struct clk_bulk_data *clks, bool optional)
 {
 	int ret;
 	int i;
@@ -88,10 +88,14 @@ int __must_check clk_bulk_get(struct device *dev, int num_clks,
 		clks[i].clk = clk_get(dev, clks[i].id);
 		if (IS_ERR(clks[i].clk)) {
 			ret = PTR_ERR(clks[i].clk);
+			clks[i].clk = NULL;
+
+			if (ret == -ENOENT && optional)
+				continue;
+
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clk '%s': %d\n",
 					clks[i].id, ret);
-			clks[i].clk = NULL;
 			goto err;
 		}
 	}
@@ -103,8 +107,21 @@ int __must_check clk_bulk_get(struct device *dev, int num_clks,
 
 	return ret;
 }
+
+int __must_check clk_bulk_get(struct device *dev, int num_clks,
+			      struct clk_bulk_data *clks)
+{
+	return __clk_bulk_get(dev, num_clks, clks, false);
+}
 EXPORT_SYMBOL(clk_bulk_get);
 
+int __must_check clk_bulk_get_optional(struct device *dev, int num_clks,
+				       struct clk_bulk_data *clks)
+{
+	return __clk_bulk_get(dev, num_clks, clks, true);
+}
+EXPORT_SYMBOL_GPL(clk_bulk_get_optional);
+
 void clk_bulk_put_all(int num_clks, struct clk_bulk_data *clks)
 {
 	if (IS_ERR_OR_NULL(clks))
diff --git a/include/linux/clk.h b/include/linux/clk.h
index f689fc58d7be3..98ea3e29f34b1 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -332,6 +332,19 @@ int __must_check clk_bulk_get(struct device *dev, int num_clks,
  */
 int __must_check clk_bulk_get_all(struct device *dev,
 				  struct clk_bulk_data **clks);
+
+/**
+ * clk_bulk_get_optional - lookup and obtain a number of references to clock producer.
+ * @dev: device for clock "consumer"
+ * @num_clks: the number of clk_bulk_data
+ * @clks: the clk_bulk_data table of consumer
+ *
+ * Behaves the same as clk_bulk_get() except where there is no clock producer.
+ * In this case, instead of returning -ENOENT, the function returns 0 and
+ * NULL for a clk for which a clock producer could not be determined.
+ */
+int __must_check clk_bulk_get_optional(struct device *dev, int num_clks,
+				       struct clk_bulk_data *clks);
 /**
  * devm_clk_bulk_get - managed get multiple clk consumers
  * @dev: device for clock "consumer"
@@ -718,6 +731,12 @@ static inline int __must_check clk_bulk_get(struct device *dev, int num_clks,
 	return 0;
 }
 
+static inline int __must_check clk_bulk_get_optional(struct device *dev,
+				int num_clks, struct clk_bulk_data *clks)
+{
+	return 0;
+}
+
 static inline int __must_check clk_bulk_get_all(struct device *dev,
 					 struct clk_bulk_data **clks)
 {
-- 
2.17.1

