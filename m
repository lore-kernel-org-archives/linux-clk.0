Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F8126ED58;
	Sat, 20 Dec 2025 01:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766194842; cv=none; b=bZ+Awd6dy0StT5ONFH8fenacUmxFlMp7f1b1oInaCPK85HfGtbYcWFVY2VwuksXP3kxjQeBJXnTJ9qm2ySb+74Ld/kAp5bgsPTAA/Hhu2dT2ZvkuEywnFsI1zykRinwJXA5/rjQ4k1hIwvSpcSJ3O+ozrjCY41GCLbNKNtIQ1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766194842; c=relaxed/simple;
	bh=ipL2B/NzInRqtMt2AU3bNhpY6GimKKXFXudISgvQy5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jsBcX/58M5eOXdQdlEfDv+tKiTq5OjQw/9nfUXX4MT/TzpTTIt1bbmr1LudbpeNG8qL1v+LLCm0nXidJ8LqTru2+WSTdKg8UEQRexpsU5O7ktfrgIP1RREHVEoLK5yMiVDtCuUWKwsDrmlIkNfX8Fznfso7hkgpm2UHbXd3/v8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5399C3419A8;
	Sat, 20 Dec 2025 01:40:35 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 09:39:56 +0800
Subject: [PATCH RFC v2 2/4] clk: spacemit: ccu_mix: add inverted enable
 gate clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-k3-clk-v2-2-1297b46a7340@gentoo.org>
References: <20251220-k3-clk-v2-0-1297b46a7340@gentoo.org>
In-Reply-To: <20251220-k3-clk-v2-0-1297b46a7340@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ipL2B/NzInRqtMt2AU3bNhpY6GimKKXFXudISgvQy5c=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRf5/GaxKzr2++c/Xw9yU65+KHcNF5FAspa8x8
 D7R0PlvNpCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX+fxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0J2Q//XM9fSPwwDAWo7He4d2ze7nE+4ccd++OsoWDriRGrcKcrIRHbk9Aa1
 Pyh8gNpxxYX981ll0FesBlkHEod1ljLw9fd44RkzDBOn6PmH7uTMCDvGWAGoHsN5VZ6K1jOhazj
 AXVZSiKMOkdeo3oZdUIM0jSaTl3FbAq0Mjnm3mAtFbKIAx9SRWij60VVIltwp7WMffNJJuRDtH6
 sSPRueQPHj21RUcOunChXBgXRWerIeHxAH9jVMtV0W2ExmkQuJ5T7s7XdSzFURoXIMIbXYBwOih
 SDBhwuBGKTeoyCgEb+bHE+kUUNslE7YqcOaWAoKeV+uicJL4mTXn4gPmATWvaG0VR1U6K6drM7S
 E/R5rbAc2UbToWbqsxN2dZi/DTVbkcrad/bfFOSvMsGrGrT+8oWkt3gtGV2IK3DQNTJ728IhgCR
 g2HC46gSEn3TYsWUk5mKNpjyquSShkCwruRZvrV94RNjy0MlvnmWdqyVuo+TjOhBoW07t+8SV51
 bfG4v2z7w1RaYHDSvtN6mKewrVO1I5/EqTnN8CkIs9OUoXTbhp379s83v3XMnPUeexLynR8VBI5
 xLDhT2BMk3fZuYDQiCylDKk6txtMyBQFCRhribhG+m4oNtLajFGf3/ucVLrsII/gTg/kCME8Vmo
 iSXzSC0ySksUF081micFiW5o7dCAHE=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

K3 SoC has the clock IP which support to write value 0 for enabling the
clock, while write 1 for disabling it, thus the enable BIT is inverted.
So, introduce a flag to support the inverted gate clock.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu_mix.c | 12 ++++++++----
 drivers/clk/spacemit/ccu_mix.h | 12 ++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 67f8b12b4f5b..9578366e9746 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -16,17 +16,19 @@
 static void ccu_gate_disable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
+	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? gate->mask : 0;
 
-	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 }
 
 static int ccu_gate_enable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
-
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 	return 0;
 }
 
@@ -34,8 +36,10 @@ static int ccu_gate_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 tmp = ccu_read(&mix->common, ctrl) & gate->mask;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	return (ccu_read(&mix->common, ctrl) & gate->mask) == gate->mask;
+	return !!(tmp == val);
 }
 
 static unsigned long ccu_factor_recalc_rate(struct clk_hw *hw,
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index c406508e3504..dbba9bf49b3b 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -16,9 +16,11 @@
  *
  * @mask:	Mask to enable the gate. Some clocks may have more than one bit
  *		set in this field.
+ * @inverted:	Enable bit is inverted, 1 - disable clock, 0 - enable clock
  */
 struct ccu_gate_config {
 	u32 mask;
+	bool inverted;
 };
 
 struct ccu_factor_config {
@@ -48,6 +50,7 @@ struct ccu_mix {
 #define CCU_FACTOR_INIT(_div, _mul)	{ .div = _div, .mul = _mul }
 #define CCU_MUX_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
 #define CCU_DIV_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
+#define CCU_GATE_FLAGS_INIT(_mask, _inverted)	{ .mask = _mask, .inverted = _inverted }
 
 #define CCU_PARENT_HW(_parent)		{ .hw = &_parent.common.hw }
 #define CCU_PARENT_NAME(_name)		{ .fw_name = #_name }
@@ -101,6 +104,15 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _inverted, _flags)		\
+static struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_FLAGS_INIT(_mask_gate, _inverted),			\
+	.common	= {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_gate_ops, _flags),	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul, _flags)					\
 static struct ccu_mix _name = {							\

-- 
2.52.0

