Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588232;
	b=2aH4hyMAtG/w3rTUMlthqeAjqi7mkY2qwsM2L5O3yiYnyuc1oNK6Ce7UjI7UBJz3sVSZ
	 FxKjCEILrOxXeFq4KFbTv5NdX3CMxBVGdEql7V09U5XF1nGOM0jD+JjwNcx4KxqM0Gc2M
	 bDylgL8skBDLY/nYFgZ+FWG1KVcScA+jWXuYJfsns6YNT47C1k0JzdnbB2zn0x6d7I9F2
	 iVN1bSd7yXEfUHjBWLSzV9J7ZrTgjlUHmbe7huIR/Uvn/U9K9HTb3nfLqKsa66v1EHAni
	 qIYqV5ILdJC8PjNsoA/FTWIfoFTkKISjHHa4VU+12DRlxa65xogLroaRmA/CCMFBn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588232;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Mpk35UQzSCThcQ2HIscEzzLYQpXL9G1v7IFBsf5dB+0=;
	b=m1kV+Uuu4KbKdhhPC89DoDf8oOozL94e3wQ4grJAnLbjysQ+BemVzhDoNujABakTV9uE
	 pLs1pSLGZ30C22XxhmjYE9HM8rhNv1HmH2LBPL+MZf083SMrVPDaJ+wJHUWzeDlHAr+pv
	 zBn6DZejj5wgs0Hd+zWiiT1ojOCw//ddCpVoxBaNaba6hZScdffooZz1BRLcTSBqkewpt
	 GbnMH7HP9XogJItiW5oz1pqkfWJPCNG5/w00KaC400hDDgCIdMk4XMtoLNUQy1MSKgX68
	 5nDBacl94YEk7znWuGSAYCOLZtLOdA1wKXFJKYCPsGwGXShLMcnv5vwR86m30VrHHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrmTiNem;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A3606A334;
	Wed, 21 Oct 2026 13:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30A3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrmTiNem
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 049FC1A12AD;
	Wed, 21 Oct 2026 13:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5896606E3;
	Wed, 21 Oct 2026 13:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C56D10328D6E;
	Wed, 21 Oct 2026 15:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mpk35UQzSCThcQ2HIscEzzLYQpXL9G1v7IFBsf5dB+0=;
	b=SrmTiNem7VT+cyyb/vOhxaf3McTOepM2b7mDBy9twYYzYAey65fHKV8Ibm6Qlnu2gCU+mO
	BuU5CaxD+VjJfWdpI20oVH7TS3wa441D8CGHbhZt0muR9SwD27xKtC2sPO5peUZ2axKOTR
	OLGQ6cVd8OZJXF3RYkEitiAhN1cQSSgfYDav3ZCJdObfZgrOMehXTQMPCj9ZQzC1NhsStT
	v60ODVO2WUTkrQkJkA9xGIvMKf9YfkFnTAV/gqAY8Oj3smkPl5joeA/K+mslxFcICtC6NI
	+Xy6uuYcChopsGY5wmpFoDgUKZQKQR24HCXUaPKV6+MUeys7249cXfMUyxVXIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:09:57 +0200
Subject: [PATCH 1/5] clk: composite: Initialize inner hw clocks during
 registration
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-1-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The mux, rate and gate clk_hws of a composite are not registered as
clocks on their own. Only the ->clk pointer was set to the composite
clk, but their ->core remained unassigned.

Provider ops may call into clk_hw_* helpers, such as clk_hw_get_flags()
or clk_hw_get_rate() for instance. In these cases, hw->core will be
dereferenced.

The composite callbacks kind of papered with this situation by (almost)
always calling __clk_hw_set_clk() before
use. clk_composite_determine_rate() never did it, but it probably did
not fail because the core likely called callbacks like get_parent() or
recalc_rate() before.

Add a clk_composite_init() callback that sets up the inner core pointers
once for all just after the core clock registration, and before any
other callback call from the core. Thanks to this, each per-callback
assignement can be dropped.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk-composite.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 11842bce5918..332b38a326fa 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -8,14 +8,26 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+static int clk_composite_init(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+
+	if (composite->mux_hw)
+		__clk_hw_set_clk(composite->mux_hw, hw);
+	if (composite->rate_hw)
+		__clk_hw_set_clk(composite->rate_hw, hw);
+	if (composite->gate_hw)
+		__clk_hw_set_clk(composite->gate_hw, hw);
+
+	return 0;
+}
+
 static u8 clk_composite_get_parent(struct clk_hw *hw)
 {
 	struct clk_composite *composite = to_clk_composite(hw);
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	__clk_hw_set_clk(mux_hw, hw);
-
 	return mux_ops->get_parent(mux_hw);
 }
 
@@ -25,8 +37,6 @@ static int clk_composite_set_parent(struct clk_hw *hw, u8 index)
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	__clk_hw_set_clk(mux_hw, hw);
-
 	return mux_ops->set_parent(mux_hw, index);
 }
 
@@ -37,8 +47,6 @@ static unsigned long clk_composite_recalc_rate(struct clk_hw *hw,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	__clk_hw_set_clk(rate_hw, hw);
-
 	return rate_ops->recalc_rate(rate_hw, parent_rate);
 }
 
@@ -126,10 +134,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		req->rate = best_rate;
 		return 0;
 	} else if (rate_hw && rate_ops && rate_ops->determine_rate) {
-		__clk_hw_set_clk(rate_hw, hw);
 		return rate_ops->determine_rate(rate_hw, req);
 	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
-		__clk_hw_set_clk(mux_hw, hw);
 		return mux_ops->determine_rate(mux_hw, req);
 	} else {
 		pr_err("clk: clk_composite_determine_rate function called, but no mux or rate callback set!\n");
@@ -144,8 +150,6 @@ static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	__clk_hw_set_clk(rate_hw, hw);
-
 	return rate_ops->set_rate(rate_hw, rate, parent_rate);
 }
 
@@ -161,9 +165,6 @@ static int clk_composite_set_rate_and_parent(struct clk_hw *hw,
 	struct clk_hw *mux_hw = composite->mux_hw;
 	unsigned long temp_rate;
 
-	__clk_hw_set_clk(rate_hw, hw);
-	__clk_hw_set_clk(mux_hw, hw);
-
 	temp_rate = rate_ops->recalc_rate(rate_hw, parent_rate);
 	if (temp_rate > rate) {
 		rate_ops->set_rate(rate_hw, rate, parent_rate);
@@ -182,8 +183,6 @@ static int clk_composite_is_enabled(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	return gate_ops->is_enabled(gate_hw);
 }
 
@@ -193,8 +192,6 @@ static int clk_composite_enable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	return gate_ops->enable(gate_hw);
 }
 
@@ -204,8 +201,6 @@ static void clk_composite_disable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	gate_ops->disable(gate_hw);
 }
 
@@ -237,6 +232,7 @@ static struct clk_hw *__clk_hw_register_composite(struct device *dev,
 	hw = &composite->hw;
 
 	clk_composite_ops = &composite->ops;
+	clk_composite_ops->init = clk_composite_init;
 
 	if (mux_hw && mux_ops) {
 		if (!mux_ops->get_parent) {

-- 
2.56.0

