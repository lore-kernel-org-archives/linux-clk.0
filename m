Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0472BDC17;
	Fri, 26 Dec 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766746948; cv=none; b=phiiyvxuz29+n51Ak7afC3v/ZFYEZpXSEFHSJPl0r+YOcs7fY6UzTyzgCW+U0vI+h1nprgcFoIJF311YfOZJNJIDzCOcfxY1tmfdfgf3G/JbbhEMiwfLor1+TZSZzNwdrQst6R+1caVsurLyQcl5R5mv4AONiEvGFcsBX1pRc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766746948; c=relaxed/simple;
	bh=ipL2B/NzInRqtMt2AU3bNhpY6GimKKXFXudISgvQy5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sL6xb4+luH0kPERpQnll81q34z1AO3CjiWd8d0DQ1zip7vclBY4r63qqBilTSV88pUCC90fartg6GQ95FqFu0aIKsVy46aVmENfCyOdAhO2fk0U//9zsonMyZuWQdRzTqbiNR5OEdjR/r7slst2e7Wpc/VLKSv/gzR0fYLTaqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9E9CF341F5F;
	Fri, 26 Dec 2025 11:02:17 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 19:01:17 +0800
Subject: [PATCH v3 2/5] clk: spacemit: ccu_mix: add inverted enable gate
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-k3-clk-v3-2-602ce93bb6c3@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
In-Reply-To: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
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
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTmsgT5jR+vsd4BZvgWGwSQBBDvmHrGe+HfU6O
 AvgT2dEykSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU5rIBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2x2A/+KORoRk38Z+VQGD8ZU+EKJ6aUdh9LCcl8lBNRAxuA8ZHa9dUSgPNO/
 xyoS6jJImkR8/rHiL7+omcFBZVQ4A4E9ImULLaYflYhcR0wg9M58Rz9pOZsFEd0MACIYX8rQJfj
 BkPqN8od5A0FvehUvHgMQzjrFD59hMAf3msadjvRnSsyz64Pb56druX1socRrzeJx4rm7RBoGXd
 X837rODIQ35rGrbT1nfhZAJAdmlOhQM0GMdywteopfK+JG+P+XR2naa5K4bcOplJ3Dx1bbUwm9B
 uLFJoOSKuRcoYSeqVq2FBe0Bpp4Hvyz/YLUjYeVeAwUSPrOWXhAhv1X0jJXUgjjmAPMEpIcSDD7
 OwbLTo2kPJKbw6K48hZwKceLqZBQkrNIhQc1WwIqr95stJcixANGDsFOUMA7pucoJgZKT4drojm
 6P6OjdnWEpqTSyWn9jquhIYO56Prc5jKBi4bOrEQIZrPhfVbqsBoDIT2jl1jD+qOxcTlO0cLkHA
 NJX+7+/KnVwyL7+LEsc7mmVyoksz8SgnpxRpA1QM+tEjfl/jwx7Tv1TKxInNH+ethvoaIePsZai
 HwNCTqkhmc05rf9fLKcLiq5Xc2nXt8qM2dYGkHwoP7BlPQYmGsbrpqY9J41699UmcsmZ92ehpnD
 mEgKe9WcHVf+kTQNTAXe18w8efef14=
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

