Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC43C43334
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 08:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239730AbiFTIB0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 04:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239703AbiFTIBW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 04:01:22 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516271114B
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:01:21 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s10so10958011ljh.12
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUIvXR9Mu2pLw1SfGOC2FM4d/2jWMPxr8mZkKP9waiM=;
        b=qQjYJlRFdD687Uf+tt832g2VTANb/8zxoidvyGiwpQ04yXBPiK1rx08+XhNUMsceUz
         1fvVyoEkSaFJcDlvKu76iF5qHiF3hFzp5NaQoV7mUHvdcU+sdXuNfi5aGxwdgs8TERAe
         hmxPel8SXJQU7KfnwoR3QNIMqAHIoUUupjGUblmyLKScGihrYXy9I4L9he6jfF2ghUoa
         4GloSL4p7tDVmMnXPUunGCDRGiqzEU5ZsoM2Cg+B3+4SXq7ksOLdtWhhzttamq8uUR8R
         NYAToDYLueybLCGxFCfLlmo8ae3Tb1y1slLYCPogZWf/wiKTQCdeaQFEtoY/dNTUjpLO
         DMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUIvXR9Mu2pLw1SfGOC2FM4d/2jWMPxr8mZkKP9waiM=;
        b=mONegexNGW/4EysHhFZo74ntCdASDAKqYk8y/kEtfNepW93nHIz2e4vA2zRKhmSoVd
         3uGop1qymwKlgrUdcxWFlt1Vi/Ki2LOOdV+ehIDUBqRgVrALhgGzQt2vcJyzmMZ0hTxf
         P80vmh0g1WVn9sAOLq+6lMwuNsNeepNevCcNzxs1lM4ZjCHtd38w/BqweuRBY+ij0Dc4
         cTjDGwHCODeccT7cjHY1hFA6Bwlo0Sj0S3NEtpHvXsNKsZco00PmvxYYk0M9W7Z/gP4I
         RG/KyZ1nio9qvAbX9SNH0eYOCl9O6Qno5InUWkd26EWsWzrtamkU41yu8mPpX1tMQq4Y
         gcTg==
X-Gm-Message-State: AJIora826u8vGkTmrY95WpxO5BiHiuDI2+XUb8omgfSUx4BJpTFV35Si
        wI1q6LDAa+cFnTiBa8DiuYAQ+Q==
X-Google-Smtp-Source: AGRyM1uZA+3ncytO2eIJHcwDX/qsGA3mZKhMouzbCWKg9dQiH99RzrxHnVU8hgp8GEJ694E9CZ794Q==
X-Received: by 2002:a2e:96d6:0:b0:25a:6f63:ae7e with SMTP id d22-20020a2e96d6000000b0025a6f63ae7emr1782381ljj.73.1655712079705;
        Mon, 20 Jun 2022 01:01:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w17-20020a2e9591000000b0025a6d0509d7sm461857ljh.78.2022.06.20.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:01:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
Date:   Mon, 20 Jun 2022 11:01:17 +0300
Message-Id: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch _qcom_cc_register_board_clk() to use parent_hws.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..2014484fc66d 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -169,7 +169,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 		factor->hw.init = &init_data;
 
 		init_data.name = name;
-		init_data.parent_names = &path;
+		init_data.parent_hws = (const struct clk_hw*[]){ &fixed->hw };
 		init_data.num_parents = 1;
 		init_data.flags = 0;
 		init_data.ops = &clk_fixed_factor_ops;
-- 
2.35.1

