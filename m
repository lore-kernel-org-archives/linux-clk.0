Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184173;
	b=SeEAy9rn5UeeZNrYe+llyhiTmuExjOWMx8ag5oHjd2Bj3Rjrte1pw0CxqLv5IM+EFuUn
	 siu6fhBEs/5YPJXPee3Bme5OHN6fLDRvh4Zv1CEw8UnABgCYx1D5QwlGsf/1mMdhdhk3S
	 wJ78+PATviaBIZvLl11Y11mHgBYpD2POjsj1L2sPhscjuu6BbvgOhR21KgbtiLTZA5RAe
	 OUMz61JAS0Gvw0FpsCoTbuBiInjj/hFaBzHFdf4tSka3aLJGnB4xb3bzKM8TGLPtsvSPh
	 WkWRYb25OtivITyEcWy7q8n3RUMwzcHIObq7gA2/5MVeGYQALI3n/s4hIMvukHr/ylA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
	b=L9ibouoUDfgrjKjxrBgD62muOSX6PcbEA30YN+7Hbj0Q+nG8oncVzN1QYWXb/YieXwoe
	 bd5bSAxCK7VnxElhXViV76deEVCLAtwamYf2Apxz+EM3CPrqU7tpHRhf6c+3vTcITnBax
	 TfDXYI9Vhiko+brtpRDV5e3EZfe84KVUH05FFTlKc1CZJ6roHdy4K09KQC0pFYkNHq38x
	 GDM2HYpQHCHwWk5O9EbYjD9wnkw/zL2rPjMuecZ0Dp8fiAqDNCt1K3lfcV81NM3/NOSOj
	 WK/EWdmFjKxJgGNN/YpihPVaf2OeoPkuolT8vknqXYi2SfW191uqPbMYyYf9IHmExZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ifkkn4M+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35338606D818
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 00:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35338606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ifkkn4M+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so2015215e9.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 16:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184171; x=1794788971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
        b=Ifkkn4M+awrav8xhi1ueWb3RWavBcu70KGOz37S2wxrSAmQ0yGfdmZVvTQHqyxZqvN
         WDfWW8rfkbjAuV4DdswHh4ne9VBL+ZcepSt4v35REhMHaIy++JDAnMN94cjz5J9xQ6KZ
         mn6WIYUZy3SLLyMZ9w+iFXoHiJIKqXwlXAC419zDtu0qacuRREDEMym/7mA6nHVH3dUQ
         317VoPGKo1nieboNtC/caO+fj5FezAjFgTcZjhHP0D3bNkcizlzZDjeO78JrcNy28DR3
         ee2Mvy9x+iFTNXOc3T021lveLj0RyKe4vnZ0wClxvzp5HOwTatDy+1Kr/CoVrDcsjKFV
         XoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184171; x=1794788971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
        b=SoPs65s8VIeHMb2vOq7TpufrCfOpCXleHolzfUi5fASDsBsQC1UVpxd0MwYCHrDKyH
         qcSlgE+eAXkouLiJhrDPSL/XBB0Q06GO2GVzVSMZpB19wuMQs2gB9AbCZgJHPcekgbk9
         tc7MT7pzbRZhidp9WypMATNMQZzVP/8PyHPhE+Hx7gpBhfYBoEwfgDVHlE3XHMp1RbTl
         l5TNZPA8rNwnRmh2LdRBMQAWF26uDWaz9I6qCAGx+RqI2DLK0dWSVEC5f78ikQp/IRC6
         Z1h94bmfpqlyy0TXOOsfkEWLMly5sGXz2HXi7hhFWjuedxWF7ZOUyCUcBkVVZCJ2pASt
         bCcQ==
X-Forwarded-Encrypted: i=1; AL+hErF3A7CecDxsXrnFWwBxF11J+dMeWQCY+g/m+qaujOffqT1Kp1bSL4/YjZe3AfOrVEyHUnuAgFN2PsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v4OO/lXaDCoAi7pCXcDcFCItuEBphYZ4WSxp4peVT/fh5+bWG
	Rn+TMouYux7LM8+M69aCovowBhEINRh+Q1vb8jXewaujQ6WFxl9rei43
X-Gm-Gg: AYBFou1Cl/YvB602ymS/ZJLovmJH51kDPu9ryZS9rLXF7JdRiodLx7CUr5geCGbiSa2
	X/dT9/vn3nhKkCANuGHVqAztO0oLN/FvvYQZrUW7kBzXGMyEuFS5feORYiCmJiL5V7TPY1KNCMT
	ge05nFaHpjfKvYjZbUqQdMf+fi3YmCZjPR0BsKyIOtvtjye+9azFPPXT7ThDiEebx3oo1PlNVpi
	39VTTRvxoh2axbfWtm/wtofafdeA2HZTHRlyRv/MRFcPv3+WZUpHYPX6AHVi6V4/dBry+tHMOdS
	6iGtL9OSxD2gfnQUULAXzFfToeNIN0PculMQmO2dfmSNqcRSlWFr6CmCMU3eb/5XtwfQpX1IWau
	VvDD4loZCGgJ2DYWqZ3/H9nSLhvp0jWLhIlsZ4gj5MF+f7GgbSQfbXiu3C7qVXrz8hYCC4VTNQK
	F0yVEYASb1VH2VGQVyGoZmisPNuk/hb87/6HPnRQqw/tD2paQ3FPMRc3Pg9c1RRZ29auW1Eb9hE
	H1N6/qc8Z1ivHT25inoP7btkfK4UZoRhdQpreFC/VLll6wgEAMeUp2LWrRcI5CMa16W5NZfzWHt
	HWtT63U1DzSzEl00oiP3tCpOUHQpPzDEOXXsHukg0Q==
X-Received: by 2002:a05:600c:190f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4b94d76c162mr49981715e9.4.1794184170632;
        Sun, 08 Nov 2026 16:29:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:13 +0000
Subject: [PATCH 4/5] clk: qcom: common: Register clk_ref clocks from
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
Message-Id: <20261109-halliday-clk-v1-4-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=9291;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=IHJayG8/Hs+A92B+sOMJvBV+GKx5N2sT3c+tBl4Njps=;
 b=Z5iv8p8lY14gMyUg+6EQ5mSgNlGIDm4UsgTXrBZC5Mg3W2c3sscFdt6pmNPTAv7MWf3CF2Ndg
 yj4fItpfp2DDIc2DrpFY75jd+58ru0zvwj9wldLJd0RiZRDhzbLtxbh
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
 drivers/clk/qcom/clk-ref.c | 91 +++++++++++++++++++++-------------------------
 drivers/clk/qcom/common.c  | 60 ++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h  |  9 +++++
 3 files changed, 110 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
index 3efdf6749770..266acdfa5488 100644
--- a/drivers/clk/qcom/clk-ref.c
+++ b/drivers/clk/qcom/clk-ref.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#include "common.h"
+
 #define QCOM_CLK_REF_EN_MASK BIT(0)
 
 struct qcom_clk_ref_provider {
@@ -96,63 +98,46 @@ static const struct clk_ops qcom_clk_ref_ops = {
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
+		clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+						   sizeof(*clk_ref->regulators),
+						   GFP_KERNEL);
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
@@ -178,6 +163,7 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	void __iomem *base;
+	size_t i;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -195,10 +181,15 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 
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
index 08fd62ac780d..c767fa3d0207 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -8,6 +8,7 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/interconnect-clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
@@ -25,6 +26,8 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct qcom_clk_ref **clk_refs;
+	size_t num_clk_refs;
 	struct dev_pm_domain_list *pd_list;
 };
 
@@ -247,6 +250,9 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	struct qcom_cc *cc = data;
 	unsigned int idx = clkspec->args[0];
 
+	if (idx < cc->num_clk_refs && cc->clk_refs[idx])
+		return &cc->clk_refs[idx]->hw;
+
 	if (idx >= cc->num_rclks) {
 		pr_err("%s: invalid index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
@@ -255,6 +261,54 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
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
+	cc->clk_refs = devm_kcalloc(dev, desc->num_clk_refs, sizeof(*cc->clk_refs),
+				    GFP_KERNEL);
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
+		clk_ref = devm_kzalloc(dev, sizeof(*clk_ref), GFP_KERNEL);
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
+}
+
 static int qcom_cc_icc_register(struct device *dev,
 				const struct qcom_cc_desc *desc)
 {
@@ -359,6 +413,12 @@ int qcom_cc_really_probe(struct device *dev,
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

