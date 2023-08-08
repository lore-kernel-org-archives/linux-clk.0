Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57F6C04A6A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:07:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjHHSHX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbjHHSGr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:06:47 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A278F5FDEC
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:06:49 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c10ba30afso9858566b.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691514408; x=1692119208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5cHR9R1zj6+fWN0kfJbhPUfhYqf7kqDHOcaH9ExP6c=;
        b=fsEA177hsKHTpA69U0DmRpoL42q7QRy59QZbP8lw1XYbpWlnmIdDjQjcdagN0I6hTN
         1iKdt/isJvKQjuIL7jFbBpmwP6AI5vFopu4kVv+ErQ8f2nvIJpnMopelvqX4byVVo7Tp
         oetbrlQg5/wa8z9xym2z2ny+eTGhVmf4lpgfmK2VbASRwaJ3xue6KWKd7uDa/2GqxU3R
         XJtxxSCRRky9RRMVdKUQ3+VqhQoGPyvDtDdcdiGb/fGnZ3DhCEfKW/INFipPdYhewV+U
         ZhES/9/yBBEis632R0f9z8+Z/oy2QIrLuhHTQ0RH4AI5XVSq0BSoS8KeeJIziFZF0RQ2
         U1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514408; x=1692119208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5cHR9R1zj6+fWN0kfJbhPUfhYqf7kqDHOcaH9ExP6c=;
        b=coIQAzco2os1BZ8qKA06fPOFdUQ8marRul/XAplb/cs+cyMh99QCtBlzYIPC7LzfSk
         V8biGal8TUmyMklnuUcwO26NRDzR4bz/gg0H8gB2jeCy14VTX27+ULCbfs9lCFYkTrmf
         LpUgmxaG8wn4V2bJPuw6zv03U/nn3WsAREVb0VEpzlZdNBTdROfZlhOiTTEHIknI/M/J
         apll3w7dK4gPovKjvy75aLIHCM4vDcqSRWrjvAGQBzf0NqL5xt+776cpohgoe/HFARrc
         JUr+tTQuGCoiKcN94E7zp04jorUnF7T+joj88qO2vg5AN1/HXvjc2Nd3G2YdPmIe7rns
         2h/Q==
X-Gm-Message-State: AOJu0YzVaj4xao+5eMmOgOESW0MG+tQVeCte/ftNEU6ENnABhe6H4IaK
        JTZ5t1o51QWGqlHY+1ytB7EYh5cSqpdytBICwlU=
X-Google-Smtp-Source: AGHT+IFa8hs7gdLp6TteRabPqqDMtp2xucJzNgO9gR2weT3XgRWhGg1PX/JaOpY6/dejTFD0ACc/DA==
X-Received: by 2002:a05:6512:32a4:b0:4fb:fdf1:8b25 with SMTP id q4-20020a05651232a400b004fbfdf18b25mr3031231lfe.24.1691495025312;
        Tue, 08 Aug 2023 04:43:45 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:44 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:39 +0200
Subject: [PATCH v3 08/10] interconnect: qcom: sdm660: Set AB/IB
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-8-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1519;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EjLG3n/q4YI8bbEqplfHVOwV0syrmI4lAF1qcHGTJvw=;
 b=EnNVF/Cr9uzLzEU4BBg3kNfteX8HGav2OxqYe3b702ezBcqQnBiKJXPeKjEEqpkCP0IXg0ZPZ
 0Il6GgQVQ25CyjPK0/MyGHqxPxzBT36JDWPV8X6rvNGRMAfLmNFuhLu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some buses and nodes need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sdm660.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 36962f7bd7bb..7392bebba334 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -602,6 +602,7 @@ static struct qcom_icc_node mas_mdp_p0 = {
 	.name = "mas_mdp_p0",
 	.id = SDM660_MASTER_MDP_P0,
 	.buswidth = 16,
+	.ib_coeff = 50,
 	.mas_rpm_id = 8,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -621,6 +622,7 @@ static struct qcom_icc_node mas_mdp_p1 = {
 	.name = "mas_mdp_p1",
 	.id = SDM660_MASTER_MDP_P1,
 	.buswidth = 16,
+	.ib_coeff = 50,
 	.mas_rpm_id = 61,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -1540,6 +1542,7 @@ static const struct qcom_icc_desc sdm660_bimc = {
 	.num_nodes = ARRAY_SIZE(sdm660_bimc_nodes),
 	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &sdm660_bimc_regmap_config,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const sdm660_cnoc_nodes[] = {
@@ -1659,6 +1662,7 @@ static const struct qcom_icc_desc sdm660_mnoc = {
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
 	.regmap_cfg = &sdm660_mnoc_regmap_config,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const sdm660_snoc_nodes[] = {

-- 
2.41.0

