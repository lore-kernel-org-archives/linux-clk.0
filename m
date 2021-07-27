Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3C6C4320E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 760DA60F9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhG0UUq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbhG0UUb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 16:20:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41BCC0617A3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h2so23940801lfu.4
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwHyfFobMRMZKUio9uUatRxtV0PWAj3xDN5CdY+KXtw=;
        b=pd0N30nr0KqMooVCHpWMLPM0lsT+3Zo1tpP7D4POtBf4e6piGSVRF/hMLEXNgAO64U
         Td4HPhY9c/idLVNAjwWLC3SV6ZNpzRE1mTwumX6MC1exIDQDNkVyKBmxdVvbs6C5BJtP
         utGHC7m6LnyDj6L97DFFZDOGOydarBu1PnvOr3VCOYQsOedejk3cGJnZzj/P7vwFop6w
         6csPBbZG4ABdc3PvZJgNb5EkghoyK6bqGW1wY3ftM2QNaX7KeOG9ZRn8o3R86jzzRZBs
         HyzBaw3J0IvtI7blLf0nTAJaOseMbQCpTheV2fQ5jXyy9qK+wN4Jo0OfhD2NdfWb36+P
         80bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwHyfFobMRMZKUio9uUatRxtV0PWAj3xDN5CdY+KXtw=;
        b=L3Tr3aj0uL9jAuK/dPQkB0Qui35RCGbq6Y5KKRePmnyixfZL72lAZ//Yo4jq5OubNd
         NLxWwL+AfY1BWyITtxS5vaMuHDsBLR8Tyg3zPk8ryzyBOEd81VjDxJ6j55OKF5Xgp0/M
         AjfZucM9xJSuURKoEsJtAltf7dC+5elVSmz2jv0D/tY8BFsdJX3z0WBWNB15dNE3oAgD
         XEbCkl6eIpY2zI5RSqjoFC9qka117l7d8lzBktbVvQdglvum48/qU5oIBIWmhk0JE6DQ
         5QKGDGEkqgVWbHUt8EQiIV1tqQXTKAVdO2oGxg3G3cm0rR/gwzIAFNPyPTjZRj7zO6vZ
         ScKQ==
X-Gm-Message-State: AOAM531hHHtZSWjRdaqHKvtYhEe5Vvd0HAHa7Tu05wYs55W37aChCrG9
        rIjaGtQFw58P5x2w0CjU1IW8fA==
X-Google-Smtp-Source: ABdhPJyoEkaNryf83y9vVHT4RF65941FKDyLrwGoeOtj/lruPuXft73AI4940p9UtXDiNRM19V4b7Q==
X-Received: by 2002:a05:6512:3767:: with SMTP id z7mr6831909lft.128.1627417223534;
        Tue, 27 Jul 2021 13:20:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i11sm376502lfe.215.2021.07.27.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:20:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/8] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Tue, 27 Jul 2021 23:20:04 +0300
Message-Id: <20210727202004.712665-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 8617454e4a77..f28f2cb051d7 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -277,7 +277,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -287,7 +286,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -297,7 +295,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -307,7 +304,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2

