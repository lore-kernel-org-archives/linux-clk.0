Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864284;
	b=G0Tlvo8/8nenKRLfsZ5ewT7DVHmsEoBUfnp2QaK/PpFELRWzA5lf+1OriFobBLHUfGY4
	 j2nXQgdwrV8w9fG73ZD7GGvU+V94jBWM8T/1QOthVSMiSH+3GAWxeOV1IHvlIajQpm9tQ
	 amRS13YOiGYFTx9bgTOnJA79BSB/LamBLDtkDx+zBRcbBGg842BAnZqqk6yYYXJMnUhVr
	 MF1plmrPTDEAgCKsL57+eXMtX7Be+Bdx7TnPB89LtrXvbNXS0ScLo/kU5DmiVTj0t39JG
	 BQO8nCbGjj6y17wVQHq31dVXP58b1dlNRGKwWAmmv5ANwgg6gFtXh2uoMwcGsqZY9Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xVGUSyo6FJQkeAl4OJ7wGugeKaNYu9bYFvgm94rpxiQ=;
	b=CKGkFgnD2nnUONbNVR0GmXMujzqwykk7LpfohZkkaROSWdDabueyG8Abl8izxaP+sXy+
	 SSF0Xhyblja7Ye2FcmV9V9sygVR3xyLIoEQ4nd49laoRHSdhx+MzoIUPjZow4AmTIlim4
	 QZchiopfoDIb2y+ZVdV8434lz23t422dfVHCPwSqV9ka8zmZ1Af1M529DbaC6Mjh/SUHo
	 jD818vVpjcskCAa3MPDgFANzbmjM7CrHveqoqg456GPfQQJeXMpkIbRfmBD+ubO/zXqyW
	 7bJQE3vOu8T/Xazhn5C3MHka2+ANgbzLNN7oJvTs0ww+brMjKy4zYOLore/EPAZ1QjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yd0Xz561;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE8606A334
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 21:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BE8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yd0Xz561
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so2203778f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864282; x=1795469082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVGUSyo6FJQkeAl4OJ7wGugeKaNYu9bYFvgm94rpxiQ=;
        b=Yd0Xz561hE5XeVQxeUZeEXXs7Xj7+SIx42AfyZiCwifcbBQlh5amkWsRQzBXli7Zce
         FLrhX1UXec0Flzst1bGCwJnpsLiO0JpZGsmFN//bERdSqFrBikb+qKQjxUCSdL4kaU7k
         CofwVtpwlle5yMQeXlSUO1ylI2j9+J5VBEnG29TQX9PNugusuBHy1MzdnB/Um7tskKXk
         eNVAmS0xa6zR1iDECfg4fawKK3+qHJREHV7gcmoXGJgRUrsNIMHTFGa1rT7N0l0B3Gjz
         OKyBEZEcImf6q/Z5qDZ2XS+/QvR/a9z6KytquwZpGxZOR8mHEZtAm7rWu46Z3E84ac1A
         1aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864282; x=1795469082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVGUSyo6FJQkeAl4OJ7wGugeKaNYu9bYFvgm94rpxiQ=;
        b=A15q+EnOd7Au96HFp3YSp98t3zNMIWdoZepv1EIrn9I+eDOCyr3r90r4jL59oOwwKq
         /FYVYt6MZMdkVioiw01Nmuzx8volDZk2NyGZKYhvdNy7NRXaz20aB1SRHt4Vizq8G34l
         3M1iu1KKUJ/9aJH5y98dVCOLMvKMAlVWce/gTP6LKrf783dZEdvySN166gQsSLOzg29M
         UNVYjlMZ0juLacxkySWg7GYrqvGqr2UegDIOvs0lYRD3y+evFABSIXeDdFHo1razu1FK
         6z9l+DyNdvBJEv7AV0YaTmpLxY5Cpw497rdX57SgcdLob06IrJgjrTnFA05nByvlrSf+
         P8jg==
X-Forwarded-Encrypted: i=1; AL+hErEDK0iiTBSS87HuVzWh3W7cAIHgqkNmT8YI33ntIDDV6dXjYmiKRY9Uq5bRtJIuQrzCQInqvBcXVYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0z40dyoXVwuEyBD7Gpsm2NzQi3SF/6Ct3NMdM4pyy/t0eSffT
	0g23PLdLsVWAaELq3h1b/FzLNciIX+X1O0fio1HCOrY8qVGrTr1b9IOp
X-Gm-Gg: AZFdTZchYORieQdSwCwCnVYJRiPDlAZCSAcLilVMeLs2ZKOaBgv8IsIFtnqO7vTl1Yf
	SVb39uYQ1wA6nD9l21qVPmthFcGxcPWN+/HDjWM1u9kH1ZDUoptfHfWHO11rQlRoB0KUe1MjY8M
	zj4PeUtBW3oyX3ai15lStaT4UTMwW3JoKIl7CsbpfS8lzsg3Ykz8nGtoZKdmcUMpFg5F0vkCemK
	o9wYZCn97BOkqvoVD9g5twLbZ7x+VpGMCszy1wuR6WgmLP8ZdLoX7xZB6OnWpxxAl4PDPSLmeG3
	8c4Mnx0tCK5NNVUPVTfGAR4Yli+6sqtrjUq0tanNKgW7Tw9PoCcxBxD3UbRu5wqwH7ZZktHldz2
	nizxTC/7exCn6mlxN3CfEf8BhGBxco86/FBL86U1g8CY13Y1ouBmLSo5jzftgD7tMJ2fY2CoY4M
	DOzAGEoXzN0mloMHbcFmlbXx4h/xSwZcBQR5qFroBCpcXaracFKkIC+iMBPzlTVpAHaVxFO1wyG
	g7612woGHnECPkhp9gmvgFCx/W7w0Q3bchThuW4w6neukq22cYts+GNQux5ScmxgSUJTIEx8ZvG
	YFed4xyEKOXFED7TvVfuVFdXwb76BeoCeCFvD/NI
X-Received: by 2002:a05:6000:3105:b0:4a3:9e1:edcc with SMTP id ffacd0b85a97d-4a309e1efeamr2863578f8f.32.1794864282484;
        Mon, 16 Nov 2026 13:24:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:22 +0000
Subject: [PATCH v2 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
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
Message-Id: <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=9309;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=DFMSyh5Jp1l7y1LkZAbAX/VP//4T6jp10DS1IqOynIs=;
 b=E4sE7Nz1/6fgyoDH6D1Q6umm6ysskmfG81fxe8d8OjalTrlnYjSxJ9leiJ2/+2gbbYthg1MbB
 +u58ug58iAtBp3XmU7O5+4suk5PHhOt5I3koY9m20W4jzfD2t4KkuPt
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The clk_ref clocks model a clkref_en gate together with the supplies of
the QREF block that feeds it. So far they can only be registered as a
standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
X1E80100 and Glymur.

On Halliday the clkref_en registers are part of GCC, and the QREF
supplies are shared with the UFS PHY: when UFS runtime suspend turns
them off, the USB HS PHY loses its reference clock. The GCC driver
needs to provide its clkrefs as clk_ref clocks next to its other
clocks, so that their users keep the supplies on.

Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
its other clocks. qcom_clk_ref_register() now registers a single clock,
so qcom_cc_really_probe() allocates and registers only the populated
entries, and qcom_cc_clk_hw_get() returns them for their indices. As
with the other clocks, entries listed in protected-clocks are skipped.
A clock ID used by both a clk_ref and a regmap clock fails the probe.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-ref.c | 90 +++++++++++++++++++++-------------------------
 drivers/clk/qcom/common.c  | 68 +++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/common.h  |  9 +++++
 3 files changed, 115 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
index 3efdf6749770..a0013a1d9c0e 100644
--- a/drivers/clk/qcom/clk-ref.c
+++ b/drivers/clk/qcom/clk-ref.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#include "common.h"
+
 #define QCOM_CLK_REF_EN_MASK BIT(0)
 
 struct qcom_clk_ref_provider {
@@ -96,63 +98,45 @@ static const struct clk_ops qcom_clk_ref_ops = {
 	.is_enabled = qcom_clk_ref_is_enabled,
 };
 
-static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
-				 struct qcom_clk_ref *clk_refs,
-				 const struct qcom_clk_ref_desc * const *descs,
-				 size_t num_clk_refs)
+int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+			  struct qcom_clk_ref *clk_ref,
+			  const struct qcom_clk_ref_desc *desc)
 {
-	const struct qcom_clk_ref_desc *desc;
 	struct clk_init_data init_data = {};
-	struct qcom_clk_ref *clk_ref;
-	size_t clk_idx;
 	unsigned int i;
 	int ret;
 
-	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
-		clk_ref = &clk_refs[clk_idx];
-		desc = descs[clk_idx];
+	if (WARN_ON(!desc->name))
+		return -EINVAL;
 
-		/* Skip unpopulated indices; the array is indexed by clock ID. */
-		if (!desc)
-			continue;
+	clk_ref->regmap = regmap;
+	clk_ref->desc = *desc;
 
-		if (WARN_ON(!desc->name))
-			continue;
+	if (clk_ref->desc.num_regulators) {
+		clk_ref->regulators = devm_kzalloc_objs(dev, *clk_ref->regulators,
+							clk_ref->desc.num_regulators);
+		if (!clk_ref->regulators)
+			return -ENOMEM;
 
-		clk_ref->regmap = regmap;
-		clk_ref->desc = *desc;
-
-		if (clk_ref->desc.num_regulators) {
-			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
-							   sizeof(*clk_ref->regulators),
-							   GFP_KERNEL);
-			if (!clk_ref->regulators)
-				return -ENOMEM;
-
-			for (i = 0; i < clk_ref->desc.num_regulators; i++)
-				clk_ref->regulators[i].supply =
-					clk_ref->desc.regulator_names[i];
-
-			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
-						      clk_ref->regulators);
-			if (ret)
-				return dev_err_probe(dev, ret,
-						     "Failed to get regulators for %s\n",
-						     clk_ref->desc.name);
-		}
-
-		init_data.name = clk_ref->desc.name;
-		init_data.parent_data = &qcom_clk_ref_parent_data;
-		init_data.num_parents = 1;
-		init_data.ops = &qcom_clk_ref_ops;
-		clk_ref->hw.init = &init_data;
-
-		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		for (i = 0; i < clk_ref->desc.num_regulators; i++)
+			clk_ref->regulators[i].supply =
+				clk_ref->desc.regulator_names[i];
+
+		ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+					      clk_ref->regulators);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "Failed to get regulators for %s\n",
+					     clk_ref->desc.name);
 	}
 
-	return 0;
+	init_data.name = clk_ref->desc.name;
+	init_data.parent_data = &qcom_clk_ref_parent_data;
+	init_data.num_parents = 1;
+	init_data.ops = &qcom_clk_ref_ops;
+	clk_ref->hw.init = &init_data;
+
+	return devm_clk_hw_register(dev, &clk_ref->hw);
 }
 
 static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
@@ -178,6 +162,7 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	void __iomem *base;
+	size_t i;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -195,10 +180,15 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 
 	provider->num_refs = num_clk_refs;
 
-	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
-				    provider->num_refs);
-	if (ret)
-		return ret;
+	for (i = 0; i < num_clk_refs; i++) {
+		/* Skip unpopulated indices; the array is indexed by clock ID. */
+		if (!descs[i])
+			continue;
+
+		ret = qcom_clk_ref_register(dev, regmap, &provider->refs[i], descs[i]);
+		if (ret)
+			return ret;
+	}
 
 	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
 }
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 08fd62ac780d..7b0d56fc079b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -8,7 +8,9 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/interconnect-clk.h>
+#include <linux/minmax.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
@@ -25,6 +27,8 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct qcom_clk_ref **clk_refs;
+	size_t num_clk_refs;
 	struct dev_pm_domain_list *pd_list;
 };
 
@@ -247,12 +251,66 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	struct qcom_cc *cc = data;
 	unsigned int idx = clkspec->args[0];
 
-	if (idx >= cc->num_rclks) {
+	if (idx >= max(cc->num_rclks, cc->num_clk_refs)) {
 		pr_err("%s: invalid index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
-	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
+	if (idx < cc->num_clk_refs && cc->clk_refs[idx])
+		return &cc->clk_refs[idx]->hw;
+
+	if (idx < cc->num_rclks && cc->rclks[idx])
+		return &cc->rclks[idx]->hw;
+
+	return NULL;
+}
+
+static bool qcom_cc_is_protected(struct device *dev, unsigned int idx)
+{
+	u32 i;
+
+	of_property_for_each_u32(dev->of_node, "protected-clocks", i) {
+		if (i == idx)
+			return true;
+	}
+
+	return false;
+}
+
+static int qcom_cc_register_clk_refs(struct device *dev, struct qcom_cc *cc,
+				     const struct qcom_cc_desc *desc,
+				     struct regmap *regmap)
+{
+	struct qcom_clk_ref *clk_ref;
+	size_t i;
+	int ret;
+
+	cc->clk_refs = devm_kzalloc_objs(dev, *cc->clk_refs,
+					 desc->num_clk_refs);
+	if (!cc->clk_refs)
+		return -ENOMEM;
+
+	cc->num_clk_refs = desc->num_clk_refs;
+
+	for (i = 0; i < desc->num_clk_refs; i++) {
+		if (!desc->clk_refs[i] || qcom_cc_is_protected(dev, i))
+			continue;
+
+		if (WARN_ON(i < desc->num_clks && desc->clks[i]))
+			return -EINVAL;
+
+		clk_ref = devm_kzalloc_obj(dev, *clk_ref);
+		if (!clk_ref)
+			return -ENOMEM;
+
+		ret = qcom_clk_ref_register(dev, regmap, clk_ref, desc->clk_refs[i]);
+		if (ret)
+			return ret;
+
+		cc->clk_refs[i] = clk_ref;
+	}
+
+	return 0;
 }
 
 static int qcom_cc_icc_register(struct device *dev,
@@ -359,6 +417,12 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
+	if (desc->num_clk_refs) {
+		ret = qcom_cc_register_clk_refs(dev, cc, desc, regmap);
+		if (ret)
+			goto put_rpm;
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..438fe5be56e1 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -19,6 +19,9 @@ struct clk_hw;
 #define PLL_VOTE_FSM_ENA	BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
 
+struct qcom_clk_ref;
+struct qcom_clk_ref_desc;
+
 struct qcom_icc_hws_data {
 	int master_id;
 	int slave_id;
@@ -45,6 +48,8 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	const struct qcom_clk_ref_desc * const *clk_refs;
+	size_t num_clk_refs;
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
@@ -89,4 +94,8 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
 
+int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+			  struct qcom_clk_ref *clk_ref,
+			  const struct qcom_clk_ref_desc *desc);
+
 #endif

-- 
2.55.0

