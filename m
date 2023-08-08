Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072D6C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbjHHRW4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjHHRWa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:22:30 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E637D783
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:09:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdf08860dso1840766b.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510923; x=1692115723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dpheXJF+49EUivNSUbko8L8HswCx+ro843IAYVBLSQ=;
        b=NNWVCJ7QjxRaFk0RAvuDR2j4RSTeAkgXG5v2fpE7hCYZTXoC2VVtavwA0XbHDMj8LB
         TAJ3ZNRuY422O0s4o8mUoZHIjVN3h+WEqwtZB5JuyLW8b75XIM+eIWw8L5P3KNVKgqnG
         q4kMJC26YCghB4EXwZFUO2e3nfonYZKHEdwHkGr6e8PNpNi+lrWl1qoZY/qWl1y66Wmq
         jZmVQRgLFB7kZLaw32uTVAnwcTLum7qUpYARGY/JvN9xB/MXqN9icKjEiajSSmCrh6PQ
         d8I9H0DrhGD1k0r/rJKzCDdsKV4K3mKBQ0EfpC+ux3M+OL0G8iI0jQQvIVZvg1edZrWq
         CGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510923; x=1692115723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dpheXJF+49EUivNSUbko8L8HswCx+ro843IAYVBLSQ=;
        b=UH7Nhraud1RQOKtIue5BFiBkPVZSfg1gns5j8cK5xLBstOYRI4wDdS4LiT4k6jdA4U
         w6iyvRnkZ5mptan7ntLV692yy68nkbv54BWjvOCJqiJrqNLJBJvldWwUC010iDisdpcp
         kdW4rBivBPgwLjL2GfgQjrBghGal1CGKoQ9JFfpahXBPUmszUrEGyBEeqyPPP4qXvW6n
         GFePoLzWY1q8wfuOG8RrW7uCXJhxwKXDao89woifKA5WRJ4bl2MjyId/3n3+B9esfdb/
         aAdqIstVeFEZ4hGtPkX0uwGAFTncANECz4BLcheKwFo1OU6JgOGUjPDayzXHHOIGXCLF
         brgg==
X-Gm-Message-State: AOJu0YxprMFWSV3Gm7BaQ4+Pf67+ztTiGC84asDUoS74x0vhG2XeKTkP
        Popqmr9trQ5NqobRuHcIf7A59G3+AaIkmnRN+Ag=
X-Google-Smtp-Source: AGHT+IEsAOGBsxEiddk78huJfUk6LcIJdX0Toz/a1q/qoB84+jrC9oYDaCQ2Jq95OeojWd2RtLCAOA==
X-Received: by 2002:a05:6512:3051:b0:4f4:7a5:e800 with SMTP id b17-20020a056512305100b004f407a5e800mr3468887lfb.10.1691495016756;
        Tue, 08 Aug 2023 04:43:36 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:32 +0200
Subject: [PATCH v3 01/10] interconnect: qcom: icc-rpm: Add AB/IB
 calculations coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-1-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=3362;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PtHTjiWgQBO5SjMZ6oomj/9k2KcOHpsmAcBX0YEWtv0=;
 b=mKs8Vh24BaouL9/kklS4fc/ZntNALxrPg1h5q7n5dx/NyCkJoJi2Uy1djpoUO53f1Y5PJW0Zt
 Y5TKpai734mDuUv/Hi1sEC8msgfry+G4zOspXXksOcjoM/muknRRlv4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Presumably due to the hardware being so complex, some nodes (or busses)
have different (usually higher) requirements for bandwidth than what
the usual calculations would suggest.

Looking at the available downstream files, it seems like AB values are
adjusted per-bus and IB values are adjusted per-node.
With that in mind, introduce percentage-based coefficient struct members
and use them in the calculations.

One thing to note is that the IB coefficient is inverse (100/ib_percent)
which feels a bit backwards, but it's necessary for precision..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 18 +++++++++++++++---
 drivers/interconnect/qcom/icc-rpm.h |  6 ++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 2c16917ba1fd..8b02aa8aa96a 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -298,7 +298,8 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
  */
 static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_rate)
 {
-	u64 agg_avg_rate, agg_rate;
+	struct qcom_icc_provider *qp = to_qcom_provider(provider);
+	u64 agg_avg_rate, agg_peak_rate, agg_rate;
 	struct qcom_icc_node *qn;
 	struct icc_node *node;
 	int i;
@@ -315,8 +316,19 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_r
 			else
 				agg_avg_rate = qn->sum_avg[i];
 
-			agg_rate = max_t(u64, agg_avg_rate, qn->max_peak[i]);
-			do_div(agg_rate, qn->buswidth);
+			if (qp->ab_coeff) {
+				agg_avg_rate = agg_avg_rate * qp->ab_coeff;
+				agg_avg_rate = div_u64(agg_avg_rate, 100);
+			}
+
+			if (qp->ib_coeff) {
+				agg_peak_rate = qn->max_peak[i] * 100;
+				agg_peak_rate = div_u64(qn->max_peak[i], qp->ib_coeff);
+			} else {
+				agg_peak_rate = qn->max_peak[i];
+			}
+
+			agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
 
 			agg_clk_rate[i] = max_t(u64, agg_clk_rate[i], agg_rate);
 		}
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index eed3451af3e6..5e7d6a4fd2f3 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -44,6 +44,8 @@ struct rpm_clk_resource {
  * @type: the ICC provider type
  * @regmap: regmap for QoS registers read/write access
  * @qos_offset: offset to QoS registers
+ * @ab_coeff: a percentage-based coefficient for compensating the AB calculations
+ * @ib_coeff: an inverse-percentage-based coefficient for compensating the IB calculations
  * @bus_clk_rate: bus clock rate in Hz
  * @bus_clk_desc: a pointer to a rpm_clk_resource description of bus clocks
  * @bus_clk: a pointer to a HLOS-owned bus clock
@@ -57,6 +59,8 @@ struct qcom_icc_provider {
 	enum qcom_icc_type type;
 	struct regmap *regmap;
 	unsigned int qos_offset;
+	u16 ab_coeff;
+	u16 ib_coeff;
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 	const struct rpm_clk_resource *bus_clk_desc;
 	struct clk *bus_clk;
@@ -123,6 +127,8 @@ struct qcom_icc_desc {
 	enum qcom_icc_type type;
 	const struct regmap_config *regmap_cfg;
 	unsigned int qos_offset;
+	u16 ab_coeff;
+	u16 ib_coeff;
 };
 
 /* Valid for all bus types */

-- 
2.41.0

