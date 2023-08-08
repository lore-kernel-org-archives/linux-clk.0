Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC23CC001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 16:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjHHQhd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbjHHQgJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 12:36:09 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DEB14251
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:53:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bdf08860dso1467579466b.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509973; x=1692114773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc7oZvOcJDkiBa4MtO2BaU3uRCE2+ug+vLU72IFcWhs=;
        b=THHRDTGsKZT/AfWbz0lQjUSft5Heiaj5DC1lg6GbpWkm9e3We54K4tAHwk2BHtTx/u
         I9e+kdjn0xjQIUYql9dKHnu/WTwpXuhs6Bd5dsIi893j7MJBTgUi0yP2meTRRIZK7DhL
         tlxhyd6p1AJyGvBwEoaZ6MZGY2a5Wm14HR9z7KDCyprNdhTZvRVcBaCvGnPiiEc1WmlB
         BN6rAyD4CCyUsqubup8CusD4MQk6wTDs8P0KzOTsM5BMMBu5TD81Ht7Zrca2JoOa3MJb
         psHQ0399Sg2uPNMvrCJtmADgPW2eBddUHQJulhZIlXxD+7WlqkX2aHcyNW03ZYFwLspP
         b9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509973; x=1692114773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc7oZvOcJDkiBa4MtO2BaU3uRCE2+ug+vLU72IFcWhs=;
        b=UYWs55S+g8PNB6vLadr/Crep6FJH1fNp1PL5SRWFKCyLlJMd/X/8CEMitXaSyVwJd9
         qSnl88xkEKaqzW6U5Z9Iulm+Xqd5+3Kpm2ekNDCtD+d42HWmL3INvKPNI8t6Eu9e+s9F
         1u6TuWo8cQX/C3F9Ce2eHbuWOsJv7uO3oJHR5NciUOVsCaeHNKEsqejJAA5jFgx8pSfp
         3Ao35BWeGQTbGDSyZIrUeLe9/RXPWARVjWdB5XcGfaJlkvz6+90kA6RXZDa4qSKGiHqg
         HUPP9bKSGO7FW+hSuyyKd185nkV27DtoBYvFjY/O7tP0fVngdYSY2/YFQ+xS9flAd97G
         7POw==
X-Gm-Message-State: AOJu0YwWJQawRoZIc1LUCEDlauOfV3qK0YRZDTtGYLeup0Pls1KtTO8r
        hdB7TSLq0+0hsoVuDp1nToblbk6sua1HR6vsr/o=
X-Google-Smtp-Source: AGHT+IGIViV1UeCd6ELmCSkLWBe6UBi27tTfxw7uswsQ8FS8N7MqPD6g+EmoJwhsZKgDL3YjzXYphA==
X-Received: by 2002:a05:6512:159c:b0:4fe:8be:6065 with SMTP id bp28-20020a056512159c00b004fe08be6065mr3416540lfb.5.1691495023110;
        Tue, 08 Aug 2023 04:43:43 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:37 +0200
Subject: [PATCH v3 06/10] interconnect: qcom: qcm2290: Set AB coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-6-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1336;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gKAcxl1xTWi9i07xf8cB7oRhF8MPHDTJc+D4hon02Tw=;
 b=/bhzfzY1MtFGMTp+JULsYOGnTOJIwGJE49F01H2p/MlyJ9JEx0rnCkANXo4at1X8Tkomohnvh
 OqvdFmQjUgZBW8klOIAOfgdxaBhjsxg6abuLyt5iCorjdgBVtxRUJaA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some buses need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 52a6eb32e832..42fa01c66e73 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1201,6 +1201,7 @@ static const struct qcom_icc_desc qcm2290_bimc = {
 	.regmap_cfg = &qcm2290_bimc_regmap_config,
 	/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
 	.qos_offset = 0x8000,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const qcm2290_cnoc_nodes[] = {
@@ -1327,6 +1328,7 @@ static const struct qcom_icc_desc qcm2290_mmnrt_virt = {
 	.bus_clk_desc = &mmaxi_0_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
+	.ab_coeff = 142,
 };
 
 static struct qcom_icc_node * const qcm2290_mmrt_virt_nodes[] = {
@@ -1342,6 +1344,7 @@ static const struct qcom_icc_desc qcm2290_mmrt_virt = {
 	.bus_clk_desc = &mmaxi_1_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
+	.ab_coeff = 139,
 };
 
 static const struct of_device_id qcm2290_noc_of_match[] = {

-- 
2.41.0

