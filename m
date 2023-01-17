Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1E5C38142
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 23:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjAQXtm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjAQXtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 18:49:25 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A535B442
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:30 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id az20so59960733ejc.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffmz50pw8nPwLzpCb3k/Y7pVVRgml4iBTms0IYKw5eU=;
        b=eTtCESIoy5KGNLL4eVckt+DQ8nG4VXBJo4LJiaTXlDVIb2o+SentgkjSgiQ+/A3oGo
         N0yJrkqaC5wU4NkIXKJMLTMy3/7CoA8W/hq5S+AdbcNyPmkIgvdjUfQYizan8gtoLHA7
         mLZ+omB/QGJAHOx76WaesIJdnvVEOubBHPpjNPfnlMkW1foVy3HgKkRzZRrXp2M0xjT2
         i1mDB3NeRk+IluJeqB5/vbQNmHMPgbA7v47ekxjO0vO8UTHpyHHFeygtMsrcl0+1xGEh
         olgq+QMIeOZ3LW+LSE9isUE7AIZsStL+Nw/P2zw3Ug7LGpguvADuugJxCjvehG/Mng0o
         o1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffmz50pw8nPwLzpCb3k/Y7pVVRgml4iBTms0IYKw5eU=;
        b=6VF+NrZfieH/Ewf/c9oe0Xwf8xUWLiMgEtw429L7UmyvX/7NulR+1ayPI/9ipUxH9z
         g4Do6+6qq2eEkDQddm44zGqii5hNLZO4I/Y4hyYM5OEzEY47sBkFYnOFUYbn6jrAUFrt
         UN8WHYYKMw4HjxeWwuAio3Obb0HKsxmh6HhaHl1E1WvzN33LUviEIolTK7h5ba5/1Vg1
         jKFrNiXkGCvJTgK5cw3a/WrVgphoviG8W/yrMWOdtdQdig8uxiKNixGLWfWDZm6GOgsp
         MTCRWCluBUfrGuPQJcuUtBIxOXVWGP01/FVVTGDTBLSNPySBWbybox5pf0Cl5vX3g8vl
         Be3w==
X-Gm-Message-State: AFqh2kr9a1tB8xD+Rv2xQYPhAhGCeotgSoV0mZ72OWdvzLSWnxdWC+fW
        wC23WBLaMXJ33xDH5KF6RedCAQ==
X-Google-Smtp-Source: AMrXdXu/vIbe9EZFTHKs6XdPycmwDH6zwyZfj6cyHdhFEat6giSEm64+ABszX5W/qwMssIsfn5Ze9w==
X-Received: by 2002:a17:906:fca5:b0:872:a754:da72 with SMTP id qw5-20020a170906fca500b00872a754da72mr4109889ejb.63.1673996309479;
        Tue, 17 Jan 2023 14:58:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:29 -0800 (PST)
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
Subject: [PATCH v2 3/7] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
Date:   Wed, 18 Jan 2023 00:58:20 +0200
Message-Id: <20230117225824.1552604-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
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
index 9cde0e660228..9e30311a310b 100644
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
@@ -283,7 +411,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
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
@@ -294,9 +431,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
 
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
2.39.0

