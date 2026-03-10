Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7F3D891C
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146194; cv=none; b=BmaLXADz9quLtoQoby2eHuV/mmks9AG3RpMVCtfvC1qCDVKJeUDEvuw2p8dLcu2J1dy4cB0hIuxN2wptSzonSkYBAVr9iGuQ8eWwwnRVeopW1kFQEoAtHbh6ii778OlVMwxO5NYoy/+0P7F4g4q8ox7H76rYbXT3jUnHAr7srUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146194; c=relaxed/simple;
	bh=wF+IAHcaaboaQD3CTg54AEU14AF+WpcAtiZ8qeLXhKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eh7ZJ0CmytcBrAvTaAPOnPcXkWPlx7Y6XWtFkr16JR81QqiQjKGyH6nb8NRYOzXfH5kKjw3nuUCzEr9VPQYs7LlrTOCQMVYBVVXO0UmXYNpzS0hfxfdKzlAyLd2fDzTTAvUL8u3xKYPlpbIxQPBfVmwZSqoziopM2fHFmweBCLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=NaN+ur9Z; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="NaN+ur9Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=IU8oWwwvjxEc+ee+Sw/7Fv1DFEugv27jyfna2MxitOo=; b=NaN+ur9ZCceLTp
	bMFKuyyOxhDvOqyiTk+pNrPJoRtIx4qBxz2xjDvWEBCMcblLgO93klik3wtkqqeYShVqfxONVkZLh
	/4pIG0LC6oCz1QywgnhL59vXRTmpH+CDNeXo8zw1B8shUDKKUKjj0Q+n8xD8EqgJfUCgU5g6C0ZZm
	CZrYosjNCev1+MRrA7y0sFoM3vMInLYf8InbMaKHHbeVVFR7DKtV6Yzkl1I+yLHKSTbg4Z5ohHkyc
	ZkmA/GLBS8aSiU64bv5hfUFKv6MT999TukfMhFFOi4rNvMRRU1mPMYo/khhKxGfKHWz+d1CbVmH8y
	DCW5pVWDjR14ezyocPZg==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzwK3-006p9w-CY; Tue, 10 Mar 2026 12:36:27 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzwK2-00000000gct-2Y8k;
	Tue, 10 Mar 2026 12:36:26 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-clk@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.co,
	andrew@lunn.c
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init
Date: Tue, 10 Mar 2026 12:36:25 +0000
Message-Id: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

There are a number of casts to "void __iomem *" in the initialsation
of the driver's clk information. Fix this by adding a helper macro
for the cast.

Silences a number of sparse warnings:

drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg1
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg2
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] __iomem *reg
drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
...

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index bd0bc8e7b1e7..3123771b9c99 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -126,9 +126,11 @@ static const struct clk_div_table clk_table2[] = {
 static const struct clk_ops clk_double_div_ops;
 static const struct clk_ops clk_pm_cpu_ops;
 
+#define __reg(__x) ((void __iomem __force *)(__x))
+
 #define PERIPH_GATE(_name, _bit)		\
 struct clk_gate gate_##_name = {		\
-	.reg = (void *)CLK_DIS,			\
+	.reg = __reg(CLK_DIS),			\
 	.bit_idx = _bit,			\
 	.hw.init = &(struct clk_init_data){	\
 		.ops =  &clk_gate_ops,		\
@@ -137,7 +139,7 @@ struct clk_gate gate_##_name = {		\
 
 #define PERIPH_MUX(_name, _shift)		\
 struct clk_mux mux_##_name = {			\
-	.reg = (void *)TBG_SEL,			\
+	.reg = __reg(TBG_SEL),			\
 	.shift = _shift,			\
 	.mask = 3,				\
 	.hw.init = &(struct clk_init_data){	\
@@ -147,8 +149,8 @@ struct clk_mux mux_##_name = {			\
 
 #define PERIPH_DOUBLEDIV(_name, _reg1, _reg2, _shift1, _shift2)	\
 struct clk_double_div rate_##_name = {		\
-	.reg1 = (void *)_reg1,			\
-	.reg2 = (void *)_reg2,			\
+	.reg1 = __reg(_reg1),			\
+	.reg2 = __reg(_reg2),			\
 	.shift1 = _shift1,			\
 	.shift2 = _shift2,			\
 	.hw.init = &(struct clk_init_data){	\
@@ -158,7 +160,7 @@ struct clk_double_div rate_##_name = {		\
 
 #define PERIPH_DIV(_name, _reg, _shift, _table)	\
 struct clk_divider rate_##_name = {		\
-	.reg = (void *)_reg,			\
+	.reg = __reg(_reg),			\
 	.table = _table,			\
 	.shift = _shift,			\
 	.hw.init = &(struct clk_init_data){	\
@@ -168,10 +170,10 @@ struct clk_divider rate_##_name = {		\
 
 #define PERIPH_PM_CPU(_name, _shift1, _reg, _shift2)	\
 struct clk_pm_cpu muxrate_##_name = {		\
-	.reg_mux = (void *)TBG_SEL,		\
+	.reg_mux = __reg(TBG_SEL),		\
 	.mask_mux = 3,				\
 	.shift_mux = _shift1,			\
-	.reg_div = (void *)_reg,		\
+	.reg_div = __reg(_reg),			\
 	.shift_div = _shift2,			\
 	.hw.init = &(struct clk_init_data){	\
 		.ops =  &clk_pm_cpu_ops,	\
-- 
2.37.2.352.g3c44437643

