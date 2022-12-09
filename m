Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1CC10F1E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiLIQtM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiLIQtH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:49:07 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BD294194
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:49:05 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x28so7924430lfn.6
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SKz54S/Hjw6I67t6Tu+my8q9HQYMyowV2EgYU0Golw=;
        b=chDi9dFAXCP/IpWdhNKtxSnQjc/sdfV9yH56uQyCSsIADc85S9K9pwf9/lhTxFf5Cd
         2EWjWucPjOOXWWPa3TOfiec3ld49hkmd5sx6VDoBuqyw+DdMr14yS5zPrnpSFE48/H+N
         +ZzkkEgMZZgCfu2Eq/1PN4H7lJXEfwlv3fxtqpPVjMOifAvU5SsEoroKLu3ffwqzaBXE
         GmPfCeMuxtPaKR7qSyg2jpVFufEsrJ/3Gu57+YO98sTkmf3FKJfwbVrokOhOVrP52xW2
         Gx18vnO8lYEzy2zq1qJ5qgvu7dUlVjcJZK6oZf1oWKcdgla5hU/adXIPVFsrOEcBlhCW
         VVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SKz54S/Hjw6I67t6Tu+my8q9HQYMyowV2EgYU0Golw=;
        b=aRj7SEy02cYL7z1BYS74MxEAT+qyCUs2+ONZtFMtUUY/qj6DI/dJS5wUwpb7/z1drT
         jv1FqZDMU5b1Ki3pnPpvYq2rYwumSv041+1fht8YPXD7vGli68dSpyUzCdZKlCGpHGSM
         n2XsqG5N/hLqSz2ZAYs+QDIOdxY6sQmkwEJCyhPr3Zke8HnN1F3lNKwPhw39h3nnMYv/
         cmSS/UcwZdjyRIm2RQ7aMdSDkGjUn4fXWBmcmwFF6PtrHuN41xXpFUAF9VINNl7zhEV4
         GBfBqKL9nnwb8uK/aT1UBHgguIqw66xvCKt8bbdCdIPkvr2HYm9j0j+dcFse52XKaoWN
         k9VQ==
X-Gm-Message-State: ANoB5pnLP7Zf1ts5pqkUEiZJtpyACUl4Ol7Z+AExx+QR1xfohzi9ZH4d
        x7fL1ddKrYCzyUvoSyU57PbSw5Fr02wjhGbPliI=
X-Google-Smtp-Source: AA0mqf6s41C+QEfxLXovYE4ofH3lEY+Wm9pKTThewCPyopx64Q2mD6LimbktRJfMf+q2hzbkJ5jg0A==
X-Received: by 2002:ac2:4950:0:b0:4b5:7925:870d with SMTP id o16-20020ac24950000000b004b57925870dmr1618694lfi.12.1670604544352;
        Fri, 09 Dec 2022 08:49:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:03 -0800 (PST)
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
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 10/19] clk: qcom: smd-rpm: drop the rpm_status_id field
Date:   Fri,  9 Dec 2022 18:48:46 +0200
Message-Id: <20221209164855.128798-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The rpm_status_id field is a leftover from the non-SMD clocks. It is of
no use for the SMD-RPM clock driver and is always equal to zero. Drop it
completely.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index f9d8382cd274..2075cfd34f99 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -25,13 +25,11 @@
 #define QCOM_RPM_SMD_KEY_STATE				0x54415453
 #define QCOM_RPM_SCALING_ENABLE_ID			0x2
 
-#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, stat_id,  \
-			     key)					      \
+#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.rpm_key = (key),					      \
 		.peer = &_platform##_##_active,				      \
 		.rate = INT_MAX,					      \
@@ -48,7 +46,6 @@
 	static struct clk_smd_rpm _platform##_##_active = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.peer = &_platform##_##_name,				      \
@@ -65,12 +62,11 @@
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    stat_id, r, key)			      \
+				    r, key)				      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
 		.peer = &_platform##_##_active,				      \
@@ -88,7 +84,6 @@
 	static struct clk_smd_rpm _platform##_##_active = {		      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
-		.rpm_status_id = (stat_id),				      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
@@ -107,19 +102,19 @@
 
 #define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		0, QCOM_RPM_SMD_KEY_RATE)
+		QCOM_RPM_SMD_KEY_RATE)
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
-		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		0, QCOM_RPM_SMD_KEY_STATE)
+		QCOM_RPM_SMD_KEY_STATE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
@@ -128,7 +123,7 @@
 					     r_id, r);			      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
 		_active##_pin,						      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
 #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
@@ -137,7 +132,6 @@ struct clk_smd_rpm {
 	const int rpm_res_type;
 	const int rpm_key;
 	const int rpm_clk_id;
-	const int rpm_status_id;
 	const bool active_only;
 	bool enabled;
 	bool branch;
-- 
2.35.1

