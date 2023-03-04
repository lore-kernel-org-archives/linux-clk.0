Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F299C6FA8E
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCDN2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCDN1w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:27:52 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8049199E4
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:27:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i9so7025215lfc.6
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYL13R90UNi1dy00Ua3Z1vWgzMNDfwLwvaxSvlHKzh8=;
        b=RCKJ26K5qc1I6agiL5AP+pL4YEenytEy+i9wyCSp8Uzl2MuPkwMWDfozSnnsWuTfCe
         nX+lXs7PFvR/wlMJTCw/KIBL08vyZivJ4y1umQQQibk99BxsGvcysD+MeSNy+y7e8IGC
         iZahjEZtH79HtCx/jLsvnP1G46yC6CSrkvTcTgWc124/ZPLd1ygewF2zrfJTIDsO+RhS
         sB1vCTrtI5XkyDP+xmMtVG+z9ooBZifxV2qoCTBOH8k5jAjKIqPl7inn/8Wojs+849xi
         GWzFFk6F8cNGeQNURx4Rh5Jgs0xVZxKF3ADp/489e6435jSElG5ClELFq3F4degugCwy
         O/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYL13R90UNi1dy00Ua3Z1vWgzMNDfwLwvaxSvlHKzh8=;
        b=wYbhAyLL8WFqznYKWyPeflesZe0LfkXWislHi9KgAxPxahpOLQbxbKoTpINR1/joqM
         iBw/8wqhOQEuqEVQdBQnfN+Wa7rFnK42ejRPQXHZhSBCZFi4vabNegQZfpHRijYCOHyN
         PXmp5oqOCAOOI9EUufWC4d8p6AkAIOxvtQcvydyaNg6oyMQOgv1rrHjbWHcHn2n93/E3
         v2GS918kMoD9HjTXV7xIm0btvrBgG5vDJ0mCokXXKNHIu8gDfOv5QGelpZnIfdeXlVtI
         8Yflt/e4bqg6AygfVvanysLwlC7DwKnUgDt8PH2GiNMMqls8DfL5L1i8/j7sM5s+oDw9
         qgmg==
X-Gm-Message-State: AO0yUKX2c65m1NWHv4rsookzUXh2xoKa2fos48pHBhaKCLhekDU2XsGD
        1iFNgVobejhuPzLo5MpHA1GNiA==
X-Google-Smtp-Source: AK7set9mp6EwsUggTaIpC6o89B2+12WwRP/LC0HtjG6fOWyqGmtjvOq1VT86bdF/CYm/vj9bMTJIhw==
X-Received: by 2002:ac2:4ad9:0:b0:4db:1fdf:4c64 with SMTP id m25-20020ac24ad9000000b004db1fdf4c64mr1544079lfp.54.1677936469122;
        Sat, 04 Mar 2023 05:27:49 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:48 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:40 +0100
Subject: [PATCH RFT 05/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-5-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=1165;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YYwH7HEKpalW8VgmKOZODnJie+e1J65AzjEIw3E/AUA=;
 b=SXHK0npSEW5c2nRa+iH4S3G7CKK0VZ/NRX854uT+wQDjL1qLuJSv67mSVt7rT8+yPMBLEQ4QxNxv
 afv6DPLuBPniTwNFVzaqdk0BV6KK7xyfWnPOo+TIgFJNOiqGa73D
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8ca301c58909..72d06d9d2619 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -526,6 +526,10 @@ static struct clk_hw *cnoc_snoc_keepalive_clks[] = {
 	&clk_smd_rpm_bus_2_snoc_a_clk.hw,
 };
 
+static struct clk_hw *pnoc_keepalive_clks[] = {
+	&clk_smd_rpm_bus_0_pcnoc_a_clk.hw,
+};
+
 static struct clk_smd_rpm *msm8909_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
@@ -882,6 +886,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 	.clks = msm8996_clks,
 	.num_clks = ARRAY_SIZE(msm8996_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *qcs404_clks[] = {

-- 
2.39.2

