Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E398DC678D8
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbjAIA3q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbjAIA3l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:41 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44EDC74A
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:39 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so10625047lfb.6
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkMG+K9H+pGjfaEipJupWJDRprpXoKUTvkDrtSa1M8g=;
        b=wqduT1R5LrCWxZz2kAjG67pviB7V6Dm1m6enAewPqhUpa/IfItDXMMKIr8wPXYoGPW
         wmkzitgbO7/549EE73NlHdPG/Oew6KGx1RbbjfkujDyjBPnihhcTGy/do6g5pvOCeSYu
         z4F9jkgsmH+lcwQGBZ02FidrkyrbOmZAy66LDUlMI5ThV2yhQ4DALuRa1fh8TsJmR1Mk
         8ENA03LRF8tgV8mdo1mKjiEmygDMcBRqmK35fla2drTR1Rv2zeH2Y5/M8Z9NVAxuH8aK
         G7sV/ujiMcnVOs4/2cSHY2dowkoU5mXtUtAc9fYibVdU+RSBivTD4Elgm3UbdZszO9Jd
         8yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkMG+K9H+pGjfaEipJupWJDRprpXoKUTvkDrtSa1M8g=;
        b=0yuJlIJA1F2/RgDvlfN/4+tOscxBkVeNl7BGQv3djNyfDLwGnqGqwsvFF8VivOxlby
         WbBD4LA9NAbnEwTAnFisRQlU4O21wWT+3cYUmZmY6zozHhj/oOLRVecNvxRGy8h/bCLo
         4PEmszbcp7AbR9QoyabtxH9hat5+4NsVfjIvnta3c8DUwxX5+WSKZ6zwSSxg4lDTDbyE
         Mpa3PQowIgpldEBmx8/QQOrEPzLyueBhPVRdsj3Nmx9sizFraXoguzQRxZSgdikSFuTu
         r+QbMeVWw8rB/jYjFflY23zYf0AuEaMYVBM5SASnG4AuAa+omjyARhpbqjnnjb3rcT3k
         9qiw==
X-Gm-Message-State: AFqh2krMLadnlTBnZ8Kmpsu+yo1l+vrJHCturAfxIMMRk/oBISCo/RSz
        EBtaloCYAfnQLaj/ElTbJSFhKw==
X-Google-Smtp-Source: AMrXdXvzXzAp+pfOkAYXNni8+9k5QlRcujYQxSmxgYhrouPTLdtV5w0IhXVIJrtxD8EGgs8bgRoxkQ==
X-Received: by 2002:a05:6512:261a:b0:4ca:f432:3e45 with SMTP id bt26-20020a056512261a00b004caf4323e45mr18035490lfb.33.1673224177976;
        Sun, 08 Jan 2023 16:29:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 02/12] interconnect: qcom: sc7180: drop IP0 remnants
Date:   Mon,  9 Jan 2023 02:29:25 +0200
Message-Id: <20230109002935.244320-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop two defines leftover from the commit 2f3724930eb4 ("interconnect:
qcom: sc7180: Drop IP0 interconnects"), which dropped handling of the
IP0 resource in favour of handling it in the clk-rpmh driver.

Fixes: 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0 interconnects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sc7180.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sc7180.h b/drivers/interconnect/qcom/sc7180.h
index c6212a10c2f6..7a2b3eb00923 100644
--- a/drivers/interconnect/qcom/sc7180.h
+++ b/drivers/interconnect/qcom/sc7180.h
@@ -11,7 +11,7 @@
 #define SC7180_MASTER_APPSS_PROC			0
 #define SC7180_MASTER_SYS_TCU				1
 #define SC7180_MASTER_NPU_SYS				2
-#define SC7180_MASTER_IPA_CORE				3
+/* 3 was used by MASTER_IPA_CORE, now represented as RPMh clock */
 #define SC7180_MASTER_LLCC				4
 #define SC7180_MASTER_A1NOC_CFG				5
 #define SC7180_MASTER_A2NOC_CFG				6
@@ -58,7 +58,7 @@
 #define SC7180_MASTER_USB3				47
 #define SC7180_MASTER_EMMC				48
 #define SC7180_SLAVE_EBI1				49
-#define SC7180_SLAVE_IPA_CORE				50
+/* 50 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
 #define SC7180_SLAVE_A1NOC_CFG				51
 #define SC7180_SLAVE_A2NOC_CFG				52
 #define SC7180_SLAVE_AHB2PHY_SOUTH			53
-- 
2.39.0

