Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4338757A;
	Wed, 13 May 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676405; cv=none; b=BOxkqc+GNCWHyyHHx5z4DbV9HIZc57FfJ+c/T+fPypXEwVmJCh0TOCVubMqY8MlncPU7ezrYN/T3UO/rxkIsY0t1XDGdbA5hbqx2sy/4eDj1yasedTa8i1BwuOKJ8cliy58FgAy0ZTLOxpUgC9JeeRhdXIV2n7MVjVB7S35QRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676405; c=relaxed/simple;
	bh=75OabSMy9rm4fz+3RACQ1LcvfhejM0h73O8+xfVf9LA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GyNf9bqzNgmJ2CIrUqjohUkDb1DmDGPqznrEb38QVJ/i27CvdfAtOb9uwFWmRq+bpqlFVUvhmc6ZXkm4/G2m9KOySHddl0PJL0tq3JMNeEe2ZQfawBV3lcKNYD3eWze0GWQacxC/BcEOZQ0hlDDXlK9awxYzSGRQDL0Di2NujjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YwQ6HwQA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YwQ6HwQA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 169F64E42C8F;
	Wed, 13 May 2026 12:46:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFC455FE21;
	Wed, 13 May 2026 12:46:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A31C111AF8AA4;
	Wed, 13 May 2026 14:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EwRPiIEo/L1VPqk9XuGNzrdJYTYEE9HEJYJMUXG5Nd4=;
	b=YwQ6HwQAZnfJBcMbDOTFobT25Gfkqf7jOxUDGQGqQOngyoQjMAEiwoolBKaQjxT1eCVTQG
	/H/pi+mxVAhonXu0UOXbTWL5Caq2Oe1bCy5gA1pbErbB1mJJR74koDkRyttl0lfgeU33VE
	ZuYE9wMkU4ZZFBKnx3/6ij5OU5A42fiNQDLs7Ivu7dCKFlGeJf4i67cJLZIzqiYoZYaiSh
	fle+zxIXriR9saaQqpZ8xUEtGKZ7b9LRmmqULFlkfcQoC4eln45d6BgHmFL3P72u1qW13P
	nmpNXocCFV1dHIYQ94iv1oQd1/VWggvpIcApx5+Z9WsCAFjQCZrxy1NjGVDXUA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 13 May 2026 14:46:25 +0200
Subject: [PATCH v8 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-3-195b27f91519@bootlin.com>
References: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
In-Reply-To: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Implement the restore_context() operation to restore the clock rate and the
clock parent state. The clock rate is saved in sci_clk struct during
set_rate() and recalc_rate() operations. The parent index is saved in
sci_clk struct during set_parent() operation. During clock registration,
the core retrieves each clock’s parent using get_parent() operation to
ensure the internal clock tree reflects the actual hardware state,
including any configurations made by the bootloader. So we also save the
parent index in get_parent().

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 45 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..7c0f7b3e89e0 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -47,6 +47,8 @@ struct sci_clk_provider {
  * @node:	 Link for handling clocks probed via DT
  * @cached_req:	 Cached requested freq for determine rate calls
  * @cached_res:	 Cached result freq for determine rate calls
+ * @parent_id:	 Parent index for this clock
+ * @rate:	 Clock rate
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -58,6 +60,8 @@ struct sci_clk {
 	struct list_head node;
 	unsigned long cached_req;
 	unsigned long cached_res;
+	int parent_id;
+	unsigned long rate;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -150,6 +154,8 @@ static unsigned long sci_clk_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
+	clk->rate = freq;
+
 	return freq;
 }
 
@@ -210,10 +216,15 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
 
-	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
-					    clk->clk_id, rate / 10 * 9, rate,
-					    rate / 10 * 11);
+	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
+					   clk->clk_id, rate / 10 * 9, rate,
+					   rate / 10 * 11);
+	if (!ret)
+		clk->rate = rate;
+
+	return ret;
 }
 
 /**
@@ -234,12 +245,13 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		dev_err(clk->provider->dev,
 			"get-parent failed for dev=%d, clk=%d, ret=%d\n",
 			clk->dev_id, clk->clk_id, ret);
+		clk->parent_id = ret;
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = parent_id - clk->clk_id - 1;
 
-	return (u8)parent_id;
+	return (u8)clk->parent_id;
 }
 
 /**
@@ -252,12 +264,28 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
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
+	if (clk->num_parents > 1 && clk->parent_id >= 0)
+		sci_clk_set_parent(hw, (u8)clk->parent_id);
+
+	if (clk->rate)
+		sci_clk_set_rate(hw, clk->rate, 0);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +297,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.53.0

