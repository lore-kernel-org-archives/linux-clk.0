Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9426C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbjHHRC4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbjHHRBz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:01:55 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DA958F93
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:01:14 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so49485815e9.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510429; x=1692115229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiT0zdP9RcVMfv6FtcplHy2nGhazgGSIvo5WbDUA63E=;
        b=c5GVFNFjq91jrG5jWGzEXEAeFbMvu/Omar7II7onIrOQVxnkF0ms9dEYGCs0U+PnBY
         M+ZRfElrUU8xHvDfjCBYyV6gDA79l7iMkn+NkRZsSTZukgzoD51RMKB2gZSzpuwcubvU
         3jI92JJBFjKvMX148FL+D/K34RuLuaqpLkeORbTMcnmOOjrChgGtkwi0PecOoMpFoBt/
         +4eevC2CL/EPTLPBcsRQD/ffrhNANb8RNGSqDQY0yPTDEQKTOSVFm3SIHJMaMKFbNZJi
         9pNRByc1Fa9BaeLqvfYesk9Q6iP8/ET7dF4DcN+REAzrDE7z8iSZZdhIW1Uo51iZeO+q
         lFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510429; x=1692115229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiT0zdP9RcVMfv6FtcplHy2nGhazgGSIvo5WbDUA63E=;
        b=etgTqIeeo94LQuHsPR187y1RB9FHcxuU6p0iLHX1lJ+OVQND26BVkJMMgC5udyGO44
         u7DhcUh+5Anz7szm7QVSpO2dYdUEgVuaSd7o3BoS7dVCydIarvRPJWK0dn0zP6Fvt3y6
         n+qGDOfcIkpNY4Z/1qcULUO1PLm9CsP5F4mj5X/kdL63i88kjudNHJWUuGAzGYvizRAA
         Z4JI67uxo9bWBEV8xyi4nqMv64yUNKvfUIpOMZjs7rY5mgua2+jUACpyjoUPTh+325+Z
         LDTOgKr7Ht2pMEjnag6fEzYAutWyu09TeaeMWTsmMvWYFqluiH7IE/cRWNvGNT4UparS
         A5fw==
X-Gm-Message-State: AOJu0Yy2FCha5oylvAiYBBtU8lNlCXrty9h1R9n9DS9KEJ+Rj4PrTtXR
        1wGUuewt0mm1J4S5PS5/gDEcSHRskz8L0UWwCvY=
X-Google-Smtp-Source: AGHT+IF7FsNW05tchzFLg08e24E0C6uLzAZLbxhdVKl8LRAWeyHXHm2QOMKSVvO0FNrWGNxEl3ClCQ==
X-Received: by 2002:ac2:4e88:0:b0:4fe:ecd:494f with SMTP id o8-20020ac24e88000000b004fe0ecd494fmr6969822lfr.33.1691495018085;
        Tue, 08 Aug 2023 04:43:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:33 +0200
Subject: [PATCH v3 02/10] interconnect: qcom: icc-rpm: Separate out clock
 rate calulcations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-2-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=2930;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=s1ZE4XHCfs1j0oOrUS6GpKQLQgPUfnNi7YQdZMNs0uA=;
 b=BNLRtVUx+or/VTf6c67Fn8JQREAUM7KBMxBUw0bidTpwWnVF2uG46h/vQ7rWTJJxXrCyqlcrL
 IOWQVTe2E5gCEsjBZnt/i0WfG9lrZKz3P7zP5BydAdzwZBurxpKPb6a
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for also setting per-node clock rates, separate out the
logic that computes it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 53 +++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 8b02aa8aa96a..8c1bfd65d774 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -291,6 +291,32 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 	return 0;
 }
 
+static u64 qcom_icc_calc_rate(struct qcom_icc_provider *qp, struct qcom_icc_node *qn, int ctx)
+{
+	u64 agg_avg_rate, agg_peak_rate, agg_rate;
+
+	if (qn->channels)
+		agg_avg_rate = div_u64(qn->sum_avg[ctx], qn->channels);
+	else
+		agg_avg_rate = qn->sum_avg[ctx];
+
+	if (qp->ab_coeff) {
+		agg_avg_rate = agg_avg_rate * qp->ab_coeff;
+		agg_avg_rate = div_u64(agg_avg_rate, 100);
+	}
+
+	if (qp->ib_coeff) {
+		agg_peak_rate = qn->max_peak[ctx] * 100;
+		agg_peak_rate = div_u64(qn->max_peak[ctx], qp->ib_coeff);
+	} else {
+		agg_peak_rate = qn->max_peak[ctx];
+	}
+
+	agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
+
+	return div_u64(agg_rate, qn->buswidth);
+}
+
 /**
  * qcom_icc_bus_aggregate - calculate bus clock rates by traversing all nodes
  * @provider: generic interconnect provider
@@ -299,10 +325,9 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_rate)
 {
 	struct qcom_icc_provider *qp = to_qcom_provider(provider);
-	u64 agg_avg_rate, agg_peak_rate, agg_rate;
 	struct qcom_icc_node *qn;
 	struct icc_node *node;
-	int i;
+	int ctx;
 
 	/*
 	 * Iterate nodes on the provider, aggregate bandwidth requests for
@@ -310,27 +335,9 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_r
 	 */
 	list_for_each_entry(node, &provider->nodes, node_list) {
 		qn = node->data;
-		for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
-			if (qn->channels)
-				agg_avg_rate = div_u64(qn->sum_avg[i], qn->channels);
-			else
-				agg_avg_rate = qn->sum_avg[i];
-
-			if (qp->ab_coeff) {
-				agg_avg_rate = agg_avg_rate * qp->ab_coeff;
-				agg_avg_rate = div_u64(agg_avg_rate, 100);
-			}
-
-			if (qp->ib_coeff) {
-				agg_peak_rate = qn->max_peak[i] * 100;
-				agg_peak_rate = div_u64(qn->max_peak[i], qp->ib_coeff);
-			} else {
-				agg_peak_rate = qn->max_peak[i];
-			}
-
-			agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
-
-			agg_clk_rate[i] = max_t(u64, agg_clk_rate[i], agg_rate);
+		for (ctx = 0; ctx < QCOM_SMD_RPM_STATE_NUM; ctx++) {
+			agg_clk_rate[ctx] = max_t(u64, agg_clk_rate[ctx],
+						  qcom_icc_calc_rate(qp, qn, ctx));
 		}
 	}
 }

-- 
2.41.0

