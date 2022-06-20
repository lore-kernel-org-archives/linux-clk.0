Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53764CCA481
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 15:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbiFTPkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbiFTPkD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 11:40:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FAE19035
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 08:40:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c4so17853015lfj.12
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8OxkVIDnDND/pv8hLioHXK4chnXUFokYge0wxIqKsg=;
        b=BlxtnFGAOjxdMrbWTGZkSjzaS/Pfez/NUkbmnFQi0GzI/8kqIPgORNxKKkxbmeImrj
         //6+tAbOb7D95UuOuC2x9IqESqPgEHBj5LmO/ANXwhdM/2tDN7qgwU7/1OYp/Aqcy/dR
         EhOehADSOHheFnHmfwf/1c/Zu1aIS0jla98Ab1cOjkLBJich3SVDD8IsBuKwQDhBHmof
         3GfxUXkeVgz97SMl3m3omk1w0okIKQZ5JdMDDXSs195hX5zCYstrsouHP/+4hyKhehi0
         f5yQHPphEo+w0H4C8XrR0ApvWHyrae5IDyiqx65wErFvMj1ZlCTdJ8vNt/4wE883ClCx
         FAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8OxkVIDnDND/pv8hLioHXK4chnXUFokYge0wxIqKsg=;
        b=m3moeASH2Mz98w8i+RDe1VkcrshepHwNxCTzNah1HHOblglypQlNX5wFXa8XfxIUTC
         /yAodkUT89zZ7lE22lgWNu2Nm0pKLuugxCF2qSWbC9WAUH/0xhbwhLw07xITqTg8oaGF
         +WlGig93nCwYdOedNuB3kIzLf+kDcs+Srf1lNsr5WKCu4mNdm6N/aSvlVuWPnAkNWdgF
         efZu5JmdMQ2IGPbID2ZTGychp66BgtR1T/6o77ezx/wHzPhUNQRTxAuTzJ6qrPc3RW4K
         oQamKzbJHybCsMyFcANJKuuQFzOpx1txdPEDw7WkT6Um3na76QC40x+f7Saz2ZEO1qrF
         rOXA==
X-Gm-Message-State: AJIora+5JiOERgC2Cl0tCZc2kLIhyaP6MbDneq9G9r70vCRgfFIjHuDx
        VUZY3DFpEWazZM/kD3yYeIWRKg==
X-Google-Smtp-Source: AGRyM1scOf3NP8Q3N3AGDEllJszfo7xRssZ+gnDXjpA+AbzHUXpKb7XPjJ9wXhezMmOlDCGoA5W39Q==
X-Received: by 2002:a05:6512:1292:b0:479:6313:789e with SMTP id u18-20020a056512129200b004796313789emr14547845lfs.538.1655739600633;
        Mon, 20 Jun 2022 08:40:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b0047255d211fasm1801029lfs.297.2022.06.20.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:39:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Mon, 20 Jun 2022 18:39:56 +0300
Message-Id: <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
provider to let other devices link these clocks through the DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a2526068232b..0f31d3255897 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1167,6 +1167,54 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+#define UFS_SYMBOL_CLOCKS 3
+
+static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw *hw;
+	int ret;
+
+	clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);
+	clk_data->num = UFS_SYMBOL_CLOCKS;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_0_clk_src",
+							   NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[0] = hw;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_1_clk_src",
+							   NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[1] = hw;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_tx_symbol_0_clk_src",
+							   NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[2] = hw;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+        /*
+         * Roll a devm action because the clock provider is the child node, but
+         * the child node is not actually a device.
+         */
+        return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+}
+
 static const struct phy_ops qcom_qmp_ufs_ops = {
 	.power_on	= qcom_qmp_phy_ufs_enable,
 	.power_off	= qcom_qmp_phy_ufs_disable,
@@ -1358,6 +1406,13 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 			goto err_node_put;
 		}
 
+		ret = phy_symbols_clk_register(qmp, child);
+		if (ret) {
+			dev_err(dev, "failed to create symbol clocks, %d\n",
+				ret);
+			goto err_node_put;
+		}
+
 		id++;
 	}
 
-- 
2.35.1

