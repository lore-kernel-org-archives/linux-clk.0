Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0990EC4167B
	for <linux-clk@archiver.kernel.org>; Tue, 28 Dec 2021 04:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhL1Ey1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 23:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234789AbhL1Ey1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 23:54:27 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2BCC06173F
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id s4so10792180ljd.5
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/xP2htbqSC+dm8dkk68Wvra/tXtCp6NMEoNyacJ+SGI=;
        b=UpUy0f3nsp6B2yPITAvArwf/AQZMTNqw4iUpnGce1SwVhsooigTRX7lC00TD++Q0ag
         Awnf/2Nh7vhn/h9+h7FL3JhMRxb+ePVqqKbH8vyulkhYfFgpVAJqwLF29trK9YZ5LQjE
         pMu5x/BRPAJianWyQkjenkd5w1OH+t1OXEGmCV4DOMUpiRyo2d6k2ppLB6q6mGGDTXi9
         WR6mHacT4MDbqCANdmeU1Ms3Qmo1ekW4uTUs9R+DYLR0XXfJyalZRZZb6ouHopR8JQk7
         Z2wwI+gbK1Qdf3hKp5A1kkrmmLZJShimQ1LCkPYDKkOR6QAIO3N6DQ379vmzrmFNJpbc
         er1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/xP2htbqSC+dm8dkk68Wvra/tXtCp6NMEoNyacJ+SGI=;
        b=TvenzcWMuVTxEvRBfP3zYzHf9HvU7QxF7G0nCldTDvOJa0p4EfKo0+LivSaGFlVhby
         nm08Td7zjZKZx3+CLFCfvED8GTXNhV00IRsDvT2c9WOzSC90FxhblLDEYcSY+D73PcWY
         fIKJG8/CU5j9Ctrwh69TAbZYmg0QOWfB1010Zer46WNrJNJ/iyXTXsL8c+W48sk7BpUI
         Jdqa0zSiLsnId0En9SCQ+oIWveDH1CXwlpOOiyxOu1hMEUVV9EYnJ4j7VLyv6XRL31pi
         +YkNCMqbl6Mf86kH6ieDXf0y8qjgiC8MHv6MxsLjz5QLd98j6okQtYP0Mve/BnEheoAz
         GWvA==
X-Gm-Message-State: AOAM532gmN6qk4AfIC3TcJwsi6mFZMM91jn/ViYr72KrjjiEbmI7jjm2
        QaTO533aakngqVY/rdaY3aQYLA==
X-Google-Smtp-Source: ABdhPJwjuO1XizSiaTmXZB+2yxIkUfkEPb0WaES4PSb0lWZBb56cgAv3nFbOszmcY9fdynHgrrUuBQ==
X-Received: by 2002:a2e:b808:: with SMTP id u8mr6575126ljo.282.1640667264538;
        Mon, 27 Dec 2021 20:54:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 08/16] clk: qcom: camcc-sdm845: get rid of the test clock
Date:   Tue, 28 Dec 2021 07:54:07 +0300
Message-Id: <20211228045415.20543-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 97024e466dcd..6210b0fb7eac 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -23,7 +23,6 @@ enum {
 	P_CAM_CC_PLL1_OUT_EVEN,
 	P_CAM_CC_PLL2_OUT_EVEN,
 	P_CAM_CC_PLL3_OUT_EVEN,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static const struct parent_map cam_cc_parent_map_0[] = {
@@ -32,7 +31,6 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const cam_cc_parent_names_0[] = {
@@ -41,7 +39,6 @@ static const char * const cam_cc_parent_names_0[] = {
 	"cam_cc_pll1_out_even",
 	"cam_cc_pll3_out_even",
 	"cam_cc_pll0_out_even",
-	"core_bi_pll_test_se",
 };
 
 static struct clk_alpha_pll cam_cc_pll0 = {
-- 
2.34.1

