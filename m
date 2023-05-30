Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71C0C7EE33
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 10:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjE3KVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 06:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjE3KVI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:21:08 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261CEE51
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so4866540e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685442027; x=1688034027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjqIG4URIoua+lHLQfg11PY6ELEnwMa1moxb2TKDOn4=;
        b=SVLmXkEIhAzbbxnFrfcvBdoNri6Czv4hbdGCXaZDze+EzoDfp+6K4+XB/XfVXr+qma
         KhC+3f+kxEBlaKe+jNVTakeGgWwfcmp2inWBE5P3+PaGV0bfkkmJTUQmbBV3eSWwSswy
         JR9CUR+ffpS/tQbdRHfSrhklBjz0d113vkMAkRNgJNmO934qD+lmCZ9nZbs+av0hXblP
         6/oHzjSCY9gKZG75bHPDTFfL0iuJmznjszDMXxseMm7/xiU5WsRu394IZmeQAWRPtlmh
         uNhf5O+dorlMtBi9NWstMPzVPpnyk2tGmSK6OJLTjJNSeMfMREZI1OB9/12QdGvOb0OL
         gd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442027; x=1688034027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjqIG4URIoua+lHLQfg11PY6ELEnwMa1moxb2TKDOn4=;
        b=IdXErDYPOO6G07aeWRiGfEWa5GslrcdWdZZ6bi9o4wDuCvlv8iWscHgRkZuFdwJ1EW
         FmEcIv7GHf+WUK0N55QFcOkWASWJ5lwinvbV2HZCoBFGcZxfAkkCmNfqvEXu9xXkfcDW
         1APtVqhrvFHmnHaLakLdcS+BgVV72g/EZB4tiyayY1FLguWatRdeX2GPmgoQVqxaRQFu
         Kr561k75lmBTB06l8X+YiGBFwssAYVhRK0+3NXmjRuHMulpTGu3xcIDD3oluqDvoj0t5
         cY+aBMvdn7L7E44BQPVum7bQlwnGfCJsSmz6zWl+RaxaqfzWNNiLhwlWIT0wR7wPxv2Y
         It5Q==
X-Gm-Message-State: AC+VfDz00aDnvHZrYdC5B2ob6qHiaaH8NSyb53NrgjFJ5ROxpHNmeLob
        mp/JHpQ+F6kjflHDXA0CVF3NuGwcyswL6d6RmF0=
X-Google-Smtp-Source: ACHHUZ4bCxKBR3PP/s5vecNEA495ab/hysFtcFS2GVyawuGXqtCNofVR7K7Rtqb0s6PlZuBl4L9bfA==
X-Received: by 2002:a05:6512:11c6:b0:4dd:9ddc:4463 with SMTP id h6-20020a05651211c600b004dd9ddc4463mr464627lfr.5.1685442027590;
        Tue, 30 May 2023 03:20:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c25-20020ac24159000000b004cc8196a308sm290902lfi.98.2023.05.30.03.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:20:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 12:20:17 +0200
Subject: [PATCH 18/20] interconnect: qcom: icc-rpm: Fix bucket number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v1-18-1bf8e6663c4e@linaro.org>
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685442001; l=2704;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WF7ldM/Iz77YHgJ7F9fOqcoIKTA2NJmusrp1SsEdUMk=;
 b=jpkYdzXFWDoKVAz6AYnYdeSgan0HtBADUGl0JQy3WSI4gTlBsf42eR6LIDlTuIhwdOUjc1Dib
 V0akIqRTNZFBmAj8ZwpWux0ulUXBCBoU3tCV0eSyHE+Y7H6ENAf+5YH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SMD RPM only provides two buckets, one each for the active-only and
active-sleep RPM contexts. Use the correct constant to allocate and
operate on them.

Fixes: dcbce7b0a79c ("interconnect: qcom: icc-rpm: Support multiple buckets")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index d08eefd963f4..db84bf56bde3 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -249,7 +249,7 @@ static void qcom_icc_pre_bw_aggregate(struct icc_node *node)
 	size_t i;
 
 	qn = node->data;
-	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+	for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
 		qn->sum_avg[i] = 0;
 		qn->max_peak[i] = 0;
 	}
@@ -275,7 +275,7 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 	if (!tag)
 		tag = QCOM_ICC_TAG_ALWAYS;
 
-	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+	for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
 		if (tag & BIT(i)) {
 			qn->sum_avg[i] += avg_bw;
 			qn->max_peak[i] = max_t(u32, qn->max_peak[i], peak_bw);
@@ -300,11 +300,11 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider,
 {
 	struct icc_node *node;
 	struct qcom_icc_node *qn;
-	u64 sum_avg[QCOM_ICC_NUM_BUCKETS];
+	u64 sum_avg[QCOM_SMD_RPM_STATE_NUM];
 	int i;
 
 	/* Initialise aggregate values */
-	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+	for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
 		agg_avg[i] = 0;
 		agg_peak[i] = 0;
 	}
@@ -317,7 +317,7 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider,
 	 */
 	list_for_each_entry(node, &provider->nodes, node_list) {
 		qn = node->data;
-		for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+		for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++) {
 			if (qn->channels)
 				sum_avg[i] = div_u64(qn->sum_avg[i], qn->channels);
 			else
@@ -328,7 +328,7 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider,
 	}
 
 	/* Find maximum values across all buckets */
-	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++)
+	for (i = 0; i < QCOM_SMD_RPM_STATE_NUM; i++)
 		*max_agg_avg = max_t(u64, *max_agg_avg, agg_avg[i]);
 }
 
@@ -339,7 +339,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 	struct icc_provider *provider;
 	u64 sum_bw;
 	u64 active_rate, sleep_rate;
-	u64 agg_avg[QCOM_ICC_NUM_BUCKETS], agg_peak[QCOM_ICC_NUM_BUCKETS];
+	u64 agg_avg[QCOM_SMD_RPM_STATE_NUM], agg_peak[QCOM_SMD_RPM_STATE_NUM];
 	u64 max_agg_avg;
 	int ret;
 

-- 
2.40.1

