Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80EFC001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 16:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbjHHQO0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjHHQNM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 12:13:12 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE0C7EE8
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:47:18 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d43so16672245e9.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509637; x=1692114437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCSujwELynCWj7HlDSXXF4+s6C7wX8tgmYY0fFjd99g=;
        b=w0AGwZ9RZgYlJ/wVOC0xivR3LC7URVkQE/M3rlLaiplYdrb0ViVqHooXh809Y5w+qZ
         JYyu8gRzAJkst4Yhmhia+2fDJmP4h0P6G5920SeHxP4DXhYXqKmE3uOittggCXK4J6UZ
         WDVQtE9z1Ls3Qh02PvXHum4UD+AGatfn2woDZQMdb7YmWRDp+E9GqDWPMqp6y2y2gumO
         5jHDO9uCISM7aNV5JXcgPpjnK/q6Qyv7Ya6VcNF28fxMmKsIBBKqa94vNifHEUh10O86
         3KdGzftZT7YgsErIkoy3ME6PIGpXKhz87KhbAHj23GnrxcwqVd7nTUHUtTTk2WakAnfP
         on+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509637; x=1692114437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCSujwELynCWj7HlDSXXF4+s6C7wX8tgmYY0fFjd99g=;
        b=HVszW1HcgWEus7BuQ6uB73pNwxjT9c6rtTkKlBeYHUxFsRH3wpIfQMtbYVVAbPOp2J
         OPCGHOGOGwWSW/gYh/05+PZtBF1TBpy4AxVCQYc/D8iE7kOLrUbiO3CncAofQ423IdJY
         onngFJWcS8oBL40BcWtU8jALXY1fSQDi3s1TWJ0D4slz5/4NrhMOOu634TClyWxv0r3g
         DxoqayjlmySDFBMnMAB86jCNOLN3ENpimCeB6V+ZVRFtmmIcjPl97e1yjgEOcqZNnwlI
         pSNUaPmVHTZEdeX6+CL5Ku7R+q5NWGC6+S84/QjB5yFTzJWRS5dPnlHbANgjjZvL5gax
         zpig==
X-Gm-Message-State: AOJu0Yybp6wc1iApdhn2pV6DN3vb/bX/nvwF1T6MqaiNFApIeymUxeWK
        SouMv/7zj8LL9GfAsOkRsv1kPzvxRD/RMPVxlDM=
X-Google-Smtp-Source: AGHT+IFn1hMW+EgRiv2I2+i74hLXUGlC6o94339U3IKqB9j27xcUBW7jI7TpyAbL5OCB6CRzA0e3dQ==
X-Received: by 2002:a05:6512:2348:b0:4fb:94fd:6465 with SMTP id p8-20020a056512234800b004fb94fd6465mr9652271lfu.15.1691495020747;
        Tue, 08 Aug 2023 04:43:40 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:35 +0200
Subject: [PATCH v3 04/10] interconnect: qcom: icc-rpm: Check for
 node-specific rate coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-4-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=2718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=V3/dsciTVIDrck+uRJI5qEMHITJaBEaelfYfVi/Pbmk=;
 b=HzD0DwK1CveDCoCgBnvGmh7+X1ivvay4l7unb30p+mPYrxkVVbvissbWZwoX5Pypq/qvJ59A/
 2ftrhv03XzzAe0Vr0MkSGOjDXXchkt5u8Xwlk2Sm2i6KwTywyuIt62V
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some nodes may have different coefficients than the general values for
bus they're attached to. Check for that and use them if present. See
[1], [2] for reference.

[1] https://github.com/sonyxperiadev/kernel/commit/7456d9779af9ad6bb9c7ee6f33d5c5a8d3648e24
[2] https://github.com/artem/android_kernel_sony_msm8996/commit/bf7a8985dcaf0eab5bc2562d2d6775e7e29c0f30
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 14 ++++++++++----
 drivers/interconnect/qcom/icc-rpm.h |  5 +++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 1d3af4e9ead8..9c40314e03b5 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -300,14 +300,14 @@ static u64 qcom_icc_calc_rate(struct qcom_icc_provider *qp, struct qcom_icc_node
 	else
 		agg_avg_rate = qn->sum_avg[ctx];
 
-	if (qp->ab_coeff) {
-		agg_avg_rate = agg_avg_rate * qp->ab_coeff;
+	if (qn->ab_coeff) {
+		agg_avg_rate = agg_avg_rate * qn->ab_coeff;
 		agg_avg_rate = div_u64(agg_avg_rate, 100);
 	}
 
-	if (qp->ib_coeff) {
+	if (qn->ib_coeff) {
 		agg_peak_rate = qn->max_peak[ctx] * 100;
-		agg_peak_rate = div_u64(qn->max_peak[ctx], qp->ib_coeff);
+		agg_peak_rate = div_u64(qn->max_peak[ctx], qn->ib_coeff);
 	} else {
 		agg_peak_rate = qn->max_peak[ctx];
 	}
@@ -563,6 +563,12 @@ int qnoc_probe(struct platform_device *pdev)
 	for (i = 0; i < num_nodes; i++) {
 		size_t j;
 
+		if (!qnodes[i]->ab_coeff)
+			qnodes[i]->ab_coeff = qp->ab_coeff;
+
+		if (!qnodes[i]->ib_coeff)
+			qnodes[i]->ib_coeff = qp->ib_coeff;
+
 		node = icc_node_create(qnodes[i]->id);
 		if (IS_ERR(node)) {
 			ret = PTR_ERR(node);
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index f9ef16f570be..4abf99ce2690 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -103,6 +103,9 @@ struct qcom_icc_qos {
  * @mas_rpm_id:	RPM id for devices that are bus masters
  * @slv_rpm_id:	RPM id for devices that are bus slaves
  * @qos: NoC QoS setting parameters
+ * @ab_coeff: a percentage-based coefficient for compensating the AB calculations
+ * @ib_coeff: an inverse-percentage-based coefficient for compensating the IB calculations
+ * @bus_clk_rate: a pointer to an array containing bus clock rates in Hz
  */
 struct qcom_icc_node {
 	unsigned char *name;
@@ -117,6 +120,8 @@ struct qcom_icc_node {
 	int mas_rpm_id;
 	int slv_rpm_id;
 	struct qcom_icc_qos qos;
+	u16 ab_coeff;
+	u16 ib_coeff;
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 };
 

-- 
2.41.0

