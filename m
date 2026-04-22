Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A253E95AB;
	Wed, 22 Apr 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862401; cv=none; b=ppT67neh8fy0XEQD9rdgnDJx3nURng+jQ2RfLHkflaXlGtfA8vL7kFLt011H7f489RhsHP+8EIWkgcoRPGqDMDZUCI5QPlIpchzQ2L+Ks9fOO2an8VOSgTPZhqHaqzGpzrRf9GKNf6XiSJSdCBVsIAsgTBcrGZMtn/GbOC0vAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862401; c=relaxed/simple;
	bh=1ugIlH5+EAQf5IUqC5Kc+pAVszm03VaSU/rhvcccM7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1B+/U3kRkDrUVJcWvXfxEZd/oPzSJvryz1RwCgc5qqpVKRskjaXfEI3dwgFFVitCKYOYMWpXCbZt9UEPZEAebVfTB9b7tEDV5W0l8kC2XC0N3Km0av2TL7sQJOibE7dpxzsyAJIUQCpzm+Tm+PmXIfTGQL3d1iUdNlZAmelsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=M7+NskQu; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="M7+NskQu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=hzUd+FkF2+Ny314O1nkP+JzfQoyPHCENHNg4gj97HYA=; b=M7+NskQuqecATOv8OdoXbKKzf+
	EhAYs8ynp852LvKHk6OKor9neS4cYOaFDQj79/dZ9VenECoMe9ajVBB0rhmRK8CydC0du28h0ioWh
	R+fmt+9p//KtSYAkEMdgWxvBewJ12GaspIx5jweRzCmMfd8aHV4TRN5NJHgu5qtUKUbWIE2Oqa6ij
	Tk7DUpRFj9xlEakA5hVtoizoD75Y0QEdQ9Hy7pzX8C0bUBrg0UbOZE3vvF+z6uKHq+9z2aVCj5bYO
	3Uxh4nIAgLjJx3poQPRE2CzO3Iwue/bhmbl6nY2tkIgp8wEf1y9vaDo4MpObFfp+jq6vqriCpsZRF
	b+ZTc8UQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFX4v-000PnA-0m;
	Wed, 22 Apr 2026 14:53:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFX4N-000CAT-2L;
	Wed, 22 Apr 2026 14:53:16 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: bulk: Use dev_err_probe() helper in of_clk_bulk_get()
Date: Wed, 22 Apr 2026 14:53:12 +0200
Message-ID: <20260422125313.141808-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27979/Wed Apr 22 08:26:01 2026)

pr_err() can be replace with dev_err_probe() which will check if error
code is -EPROBE_DEFER. For that the dev pointer has to be passed along.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This silences several error messages while probing PCIe on my i.MX95
based platform:
/soc/pcie@4c380000: Failed to get clk index: 4 ret: -517
/soc/pcie@4c300000: Failed to get clk index: 4 ret: -517
/soc/pcie@4c380000: Failed to get clk index: 4 ret: -517

 drivers/clk/clk-bulk.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index d85dae4bdf895..acd9dff300722 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -12,7 +12,8 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
+static int __must_check of_clk_bulk_get(struct device *dev,
+					struct device_node *np, int num_clks,
 					struct clk_bulk_data *clks)
 {
 	int ret;
@@ -28,8 +29,8 @@ static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
 		clks[i].clk = of_clk_get(np, i);
 		if (IS_ERR(clks[i].clk)) {
 			ret = PTR_ERR(clks[i].clk);
-			pr_err("%pOF: Failed to get clk index: %d ret: %d\n",
-			       np, i, ret);
+			dev_err_probe(dev, ret, "%pOF: Failed to get clk index: %d (%s)\n",
+				      np, i, clks[i].id);
 			clks[i].clk = NULL;
 			goto err;
 		}
@@ -43,7 +44,8 @@ static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
 	return ret;
 }
 
-static int __must_check of_clk_bulk_get_all(struct device_node *np,
+static int __must_check of_clk_bulk_get_all(struct device *dev,
+					    struct device_node *np,
 					    struct clk_bulk_data **clks)
 {
 	struct clk_bulk_data *clk_bulk;
@@ -58,7 +60,7 @@ static int __must_check of_clk_bulk_get_all(struct device_node *np,
 	if (!clk_bulk)
 		return -ENOMEM;
 
-	ret = of_clk_bulk_get(np, num_clks, clk_bulk);
+	ret = of_clk_bulk_get(dev, np, num_clks, clk_bulk);
 	if (ret) {
 		kfree(clk_bulk);
 		return ret;
@@ -144,7 +146,7 @@ int __must_check clk_bulk_get_all(struct device *dev,
 	if (!np)
 		return 0;
 
-	return of_clk_bulk_get_all(np, clks);
+	return of_clk_bulk_get_all(dev, np, clks);
 }
 EXPORT_SYMBOL(clk_bulk_get_all);
 
-- 
2.43.0

