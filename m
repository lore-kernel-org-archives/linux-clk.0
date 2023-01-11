Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899F1C678D5
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239485AbjAKUBJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239527AbjAKUAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:00:20 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B67943D89
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:57:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bq39so25232548lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NrvZgeB+CKgjWF0nxmOixlt2aAT3lyLrME/WlJSKh4=;
        b=zqXy/yelx3GClDxVha25+BchTCPb7WYIMbUfnJZB9G4kV+FRY8X9Nxtw8ET8QLMaFx
         Dk4ca9Ycd7mK6WnPSAGXAdcDutpzpmiINdwnVVeyDVOPHAWkW5J8AA+R6wLTi8OFpuj+
         P4xcnUMeKvf7oXuA6tZR4JgTQXElPfbIP+pdYgOAVZjyws6kizBCbzRr+k6zISOLCkBK
         HF1aY1HTvJHdqJJhA/KWA40eufA2kTb4ph1UZf8zz98hYbDt+3TnuPR9MrCoYOl4nWYN
         ++md/RkYVrfJgCN4y12NmqisF/5+0oc2MFLAZ7RsK/KPKPpaP2TsKM+aqVKmfAjaVRnD
         QJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NrvZgeB+CKgjWF0nxmOixlt2aAT3lyLrME/WlJSKh4=;
        b=IVXc3e5msWowVOizts3GgUQUEsJpQOzasyjg6ubPvPHMUUkOEsO/x4Og+nhXlGsZ2Q
         LmdBWg9d/taDOMELbvGiaIOjgo+JBzm8RwL8/PWn9O1ABenAzA4DyolGWJTpqrZ4Dqvq
         hP5I1XSC4nJUHX19Rg9R0+Qa/gFUmy1a9XUVhFDPEQdZMU6imYLC5ZrPDnpIIXGYWgZz
         JjZNaUNKyHEWgKCZchNKNQC6T12HEhDwMMuRkPvjoW/RzdQXrKkfClfzmpe3+WqgLsvu
         jZFvTWAGI5DeZQTx/Vkp1xsjS/e/nv7MUJf997Xy7jvs3a38uwhglFwXZ+Fy1VD5Vr7L
         pQBg==
X-Gm-Message-State: AFqh2kpD1mtY3CXYytZQ0LflQzGS6HGfVuGLXUgLWCf8wwaJBhj6hY6w
        F3Zt24ISh95P134I8bNXokb70A==
X-Google-Smtp-Source: AMrXdXvM2UWbfpo3l1F84i2/USGkW484O+6KM3uHUrEpykGyfiSoSHvll1g07jlOgaxm3hnV8vqpqQ==
X-Received: by 2002:ac2:4adb:0:b0:4cc:83a5:e64e with SMTP id m27-20020ac24adb000000b004cc83a5e64emr3147170lfp.60.1673467078038;
        Wed, 11 Jan 2023 11:57:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/5] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
Date:   Wed, 11 Jan 2023 22:57:52 +0300
Message-Id: <20230111195754.2593134-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
according to CPU frequencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cbf-8996.c | 141 +++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index bdd4f8b48a7e..76db623b0f92 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -5,6 +5,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -225,6 +226,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
+#ifdef CONFIG_INTERCONNECT
+struct qcom_msm8996_cbf_icc_provider {
+	struct icc_provider provider;
+	struct clk *clk;
+};
+
+#define to_qcom_cbf_provider(_provider) \
+	container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
+
+enum {
+	CBF_MASTER_NODE = 2000,
+	CBF_SLAVE_NODE
+};
+
+#define CBF_NUM_NODES 2
+
+static int qcom_msm8996_cbf_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_msm8996_cbf_icc_provider *qp;
+
+	qp = to_qcom_cbf_provider(src->provider);
+
+	return clk_set_rate(qp->clk, icc_units_to_bps(dst->peak_bw));
+}
+
+static int qcom_msm8996_cbf_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	struct qcom_msm8996_cbf_icc_provider *qp;
+
+	qp = to_qcom_cbf_provider(node->provider);
+	*peak = clk_get_rate(qp->clk) / 1000ULL;
+
+	return 0;
+}
+
+static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct clk_hw *cbf_hw)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_msm8996_cbf_icc_provider *qp;
+	struct icc_provider *provider;
+	struct icc_onecell_data *data;
+	struct icc_node *node;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	data = devm_kzalloc(dev, struct_size(data, nodes, CBF_NUM_NODES), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->num_nodes = CBF_NUM_NODES;
+
+	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
+	if (!qp)
+		return -ENOMEM;
+
+	qp->clk = clk;
+
+	provider = &qp->provider;
+	provider->dev = dev;
+	provider->get_bw = qcom_msm8996_cbf_icc_get_bw;
+	provider->set = qcom_msm8996_cbf_set;
+	provider->aggregate = icc_std_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->data = data;
+
+	ret = icc_provider_add(provider);
+	if (ret) {
+		dev_err(dev, "error adding interconnect provider\n");
+		return ret;
+	}
+
+	node = icc_node_create(CBF_MASTER_NODE);
+	if (IS_ERR(node)) {
+		ret = PTR_ERR(node);
+		goto err;
+	}
+
+	node->name = "cbf_master";
+	icc_node_add(node, provider);
+	icc_link_create(node, CBF_SLAVE_NODE);
+	data->nodes[0] = node;
+
+	node = icc_node_create(CBF_SLAVE_NODE);
+	if (IS_ERR(node)) {
+		ret = PTR_ERR(node);
+		goto err;
+	}
+
+	node->name = "cbf_slave";
+	icc_node_add(node, provider);
+	data->nodes[1] = node;
+
+	platform_set_drvdata(pdev, provider);
+
+	return 0;
+
+err:
+	icc_nodes_remove(provider);
+	icc_provider_del(provider);
+
+	return ret;
+}
+
+static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
+{
+	struct icc_provider *provider = platform_get_drvdata(pdev);
+
+	icc_nodes_remove(provider);
+	icc_provider_del(provider);
+
+	return 0;
+}
+#else
+static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
+{
+	dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
+
+	return 0;
+}
+#define qcom_msm8996_cbf_icc_remove(pdev) (0)
+#endif
+
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -284,7 +412,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
+	if (ret)
+		return ret;
+
+	return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
+}
+
+static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
+{
+	return qcom_msm8996_cbf_icc_remove(pdev);
 }
 
 static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
@@ -295,9 +432,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
 
 static struct platform_driver qcom_msm8996_cbf_driver = {
 	.probe = qcom_msm8996_cbf_probe,
+	.remove = qcom_msm8996_cbf_remove,
 	.driver = {
 		.name = "qcom-msm8996-cbf",
 		.of_match_table = qcom_msm8996_cbf_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 
-- 
2.30.2

