Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9AF3164D3;
	Fri,  5 Dec 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944935; cv=none; b=bDL7nyYk0uk0aaI2XSh2CWIxJlSVm7B2CEcED0Jz0aPdkwEWgqlXOEukMfmx6nCfKz8FXmCy6tSLyFVt02GdqjwPPlYyT5yNBumIa1g8BoCuUMgi01WwUlssM4Qjv3AZdzf+i0yyfNEDuGuw4nL3mLV2FQSMpBNgVDzoQIdKuZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944935; c=relaxed/simple;
	bh=F3YtVf3pOi4RdE9w1TMJXbJOzcGyJA2R5r+mFJZSWTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kT2J5ctNDw7lhjNdrNiaWDRkLWdAYNXbYxRGjVwpqcJf3uLaB/CAjmo7B4NI9+oCj/9iPqD+0EaEw8wXj7SgF7JTYmy9W7Jhk+DTRfP0MntivA8Kt9q36rfZIyv5dRwOjAvKApplTgDkc8DRfb++My8z9JE5lJYxVxM20C58mBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PsRbK6k/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PsRbK6k/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF7411A1F9A;
	Fri,  5 Dec 2025 14:28:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77408606AC;
	Fri,  5 Dec 2025 14:28:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8CF3102F06E6;
	Fri,  5 Dec 2025 15:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7DAAKQlxLzd/buQQptF4TY/Q9Mm/9b4F6XHyYj/DlaE=;
	b=PsRbK6k/fVNkTg7mcO9/qxWp9Th2OSXPs2dSOCiogB2+X0yqHHLI5calBSgpfuBInKfJX1
	NjCg/7VF3/NNnGba/4ch5ZuFgDFnB5TvsKzkYclOGLg/uyKvsaR7YcHQ7YRP2d8hK9TyPF
	5z17aNGDZc0NgbK53I5OeLp6YiumMQMRZG1xlvIJq21hGKmS1u7dW/DpRbqTr+m8Q/oskO
	TVxXM++k5uuQj2NrcEM8RPcKn1dJcMDI1+2cAR2o6uYI9H+TBCsAGaPkcTssOKgBFjglpg
	c+kfS9mNydCZSQsd47/2a7LYWVlS8pWMZuE2EgRbmlUgmAldYnCQgkdCE6L11w==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Fri, 05 Dec 2025 15:28:25 +0100
Subject: [PATCH v3 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-3-d06963974ad4@bootlin.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
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
X-Rspamd-Fuzzy: 41a41182b59d79f583916f68cda4ce24371bbb78bb5201448cdda28aa13f7e12f6862ad9c69aaabad6cacf50bd7bcdc4e70062e7913d09bed0cb7f9b3ddaf05c

Implement the restore_context() operation to restore the clock rate and the
clock parent state. The clock rate is saved in sci_clk struct during
set_rate() operation. The parent index is saved in sci_clk struct during
set_parent() operation. During clock registration, the core retrieves each
clock’s parent using get_parent() operation to ensure the internal clock
tree reflects the actual hardware state, including any configurations made
by the bootloader. So we also save the parent index in get_parent().

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4cb..428050a05de31 100644
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
+	u8 parent_id;
+	unsigned long rate;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
+
+	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
+					   clk->clk_id, rate / 10 * 9, rate,
+					   rate / 10 * 11);
 
-	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
-					    clk->clk_id, rate / 10 * 9, rate,
-					    rate / 10 * 11);
+	if (!ret)
+		clk->rate = rate;
+
+	return ret;
 }
 
 /**
@@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
 
-	return (u8)parent_id;
+	return clk->parent_id;
 }
 
 /**
@@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
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
+
+	if (clk->rate)
+		sci_clk_set_rate(hw, clk->rate, 0);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.51.0

