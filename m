Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A77C3A5A7
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 00:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiLGAP0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiLGAPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 19:15:20 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4D14B999
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 16:15:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s8so26231535lfc.8
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 16:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SKz54S/Hjw6I67t6Tu+my8q9HQYMyowV2EgYU0Golw=;
        b=SXxtirNT2moVcoxWGn2/fNICz6sChVu7kZ/wIZyr1Dec628ArM4jJ08VlBXEVUHLD+
         fpmj/QBRoQLbWTkyv6L0dH9NhR2HbgmWp0KCv19Hn1NwM5Zi01GHICRY8fm+FV0qSctd
         LxZD6cd3wXREZIGsddqseYQBGDAeivUNpVLx0RwJSNX6LD4IpeMcNbHxmmfOYLC7bRmv
         AqU5IvtK+/CE8pz7mvgIEs+0Aed6XK2WypchZbvYj8VrzDWOXQGV4EY3ijKBc1VAvInX
         A6yH345QOwdulbXFCvNeT99X0aripxSisM7XPcVNpEWRFMFUQdM4f6XClwbrZT4jQJHq
         sh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SKz54S/Hjw6I67t6Tu+my8q9HQYMyowV2EgYU0Golw=;
        b=m/FBE0Ln24FR1q4QR/LSCsH3UD9u8rS9Jdhp5jEW6BZ2k6lJfKSxpvV/+kFt8lFLo7
         O399u4PR2IqHv0vdbXx33pPYzLSOmAkrVvPG+KqnLYeJuD0vA6+aixU8o/6EgKy+yajG
         KBwUlUsfALejmRfCHaknOXJEvRffPkUYBWohUIDsTjyat8/otf/nwMyF+Il6BpFzmfCS
         PEub/RmUEzMDTUqyb4JuMJbEzFiQiAKCxhqtT39xwKtsDoFaXivWLxNk7SchmyfgX07T
         K9INQ/iO26YKQzNT/56FVDJqG4FmHwgY224j8UQnUOpR8Wyy3t9MyFFPFfM7rUFgM9MO
         h9GA==
X-Gm-Message-State: ANoB5plz18in2XHqH9e43iH6CDQQqnhVkbgJSMavg6FXZuLwapFjR2en
        NIXEEAbxzZYYVr1t6/EzkqjueQ==
X-Google-Smtp-Source: AA0mqf7AU1AYLwbcQxWqjvxjlzebZBwzRncHxLz25paPCct6yNTKH21UL6rwKZXQ8C1jst/DvMkaxQ==
X-Received: by 2002:a05:6512:38b2:b0:4b3:a022:2176 with SMTP id o18-20020a05651238b200b004b3a0222176mr30868344lft.395.1670372110856;
        Tue, 06 Dec 2022 16:15:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 09/18] clk: qcom: smd-rpm: drop the rpm_status_id field
Date:   Wed,  7 Dec 2022 02:14:54 +0200
Message-Id: <20221207001503.93790-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
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

