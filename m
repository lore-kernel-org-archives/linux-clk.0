Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5543242CC
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232763; cv=none; b=PvK51wu/VsqGKmwgdvde8zxQ08jKurOFXjAs6QgD091xVAZkooYYSjpbWZUvQ6lfZwoBDAMqHfeCalaj1PRIYaf+JWomRlgk98228wtOwL8+ZaxLRMXnek/M5ASioafqRyTvXt3VLT1yy7uc+vRDjE4Bc0Wki6aGhfxnp7QRpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232763; c=relaxed/simple;
	bh=aProAx5VL9C8t/GV0kAIP1skLnL0Hs664rC2YSLwxNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be/7Q1CVwKocXldD1i/2ou+AfLWptxGk/GVrUHBRU9fO94eVoFi6CqJ5QIZGiMf1QWzmfsLKdoG0wp9GdqYvpqnD6gBSYZoLryUA4+gLwXJDJ+60y3tSk8TFTK0OKqVvxdN0t196/oQLEiYCx4kJctFCyiPQnmfOcTVxko+JymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GDSY87Dh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GDSY87Dh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 859231A1DBE;
	Thu, 27 Nov 2025 08:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AF106068C;
	Thu, 27 Nov 2025 08:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77E1D102F2751;
	Thu, 27 Nov 2025 09:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XxlcfNeRaRWZTwXU0NT8kH+GHpvE/vl/i3zb2pJZvTQ=;
	b=GDSY87DhyMjqWSjbdiANf57fcC8hDx8BNRcoDp9crZ/ex1R+DePu29R+7pG0nEAKRHwkiA
	+sPsEeSscmiQz5QvJhccnAp4lnceRs5FXiZHFneHOQWognVetSNohaHUHcHyAXsQPJ0WrC
	+Jj1O0rHW0rEe2tTefEidFjAR4BQHowsUOkdsFsmKlfzoF+yEx0Xu+Y5s8VPULt21eOeS0
	Er6ZgUAkGB1+6rl/0An0eaq3XvG/Qg5MKtKe+Ipxe4i7cc2Yz8YJXTrNqU14vkJlwbEyBZ
	nXdEFk4Pe4Rr1q4kpiYXsuWMnP/EavHqeQ8FAdcqAkXFUTT5QFX/tPdBfAa/EQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:57 +0100
Subject: [PATCH RFC v2 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-3-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Implement the restore_context() operation to restore the clock parent
state. The parent index is saved in sci_clk struct during set_parent().
During clock registration, the core retrieves each clock’s parent using
get_parent() operation to ensure the internal clock tree reflects the
actual hardware state, including any configurations made by the
bootloader. So we also save the parent index in get_parent().

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index a4b42811de55d..1e5dd01484d1c 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -47,6 +47,7 @@ struct sci_clk_provider {
  * @node:	 Link for handling clocks probed via DT
  * @cached_req:	 Cached requested freq for determine rate calls
  * @cached_res:	 Cached result freq for determine rate calls
+ * @parent_id:	 Parent index for this clock
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -58,6 +59,7 @@ struct sci_clk {
 	struct list_head node;
 	unsigned long cached_req;
 	unsigned long cached_res;
+	u8 parent_id;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -237,9 +239,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
 
-	return (u8)parent_id;
+	return clk->parent_id;
 }
 
 /**
@@ -252,12 +254,24 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
 
 	clk->cached_req = 0;
 
-	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
-					      clk->clk_id,
-					      index + 1 + clk->clk_id);
+	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
+					     clk->clk_id,
+					     index + 1 + clk->clk_id);
+	if (!ret)
+		clk->parent_id = index;
+
+	return ret;
+}
+
+static void sci_clk_restore_context(struct clk_hw *hw)
+{
+	struct sci_clk *clk = to_sci_clk(hw);
+
+	sci_clk_set_parent(hw, clk->parent_id);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +283,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.51.0

