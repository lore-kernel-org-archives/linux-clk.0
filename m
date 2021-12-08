Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A376C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 17:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbhLHR6H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 12:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbhLHR6H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 12:58:07 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9DCC0617A2
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 09:54:34 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 13so5037801ljj.11
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22YkWR3aN8tZpq73mniQqTpyqlUPNCWHmLLEEwMvq3U=;
        b=pLEp1S5xy0lpAxHlyI0gM8qH7vvdm0h0xc6lxu89AWHAYKUXobqPIJ2/TLS+9b8jw0
         7OhiTBVfv3YvkfBbAjAamWagsWUw9S9EBqiN98vH063wf11iEE64fB/xVBpR0HlC0T+Y
         /IOQrgR3F7C3X9fVqIczRWncyTHEA08H3UmabpCNjrwePTIDaQtinOz9bHbPd/Opblkx
         Qc1mQwWo7Weu3pPX5w2gTYLmFCiftQGRN6gJ9kcih+HpGp3GW6bf6CdZLdPtrP2Rd8uA
         Zil9EgBZabjXpeK1R4WGpGvCzzUh4ViGxNX6sVBoVwu1/IO36BWO++7gpbKJBo9ibqYv
         zlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22YkWR3aN8tZpq73mniQqTpyqlUPNCWHmLLEEwMvq3U=;
        b=i8ALyJdolMEXhsfReylPYMDaOtzd/QV2WLaugKN+hKaOHngU48WgZ95q5Tfv3aT7VS
         uT553yDJ3j+i3fWaASbCa/Xac2hqEmVcqR/rc8NGMtfQxr6efO8QhWkCGoa/XJ1k/jQL
         rjyWySYzCCrwbkDuEn9clqS5syxSo3WEmLnxvU+ZWwOXx7zzxZxjujbst59yFgyUvMdS
         1bUmvIL3yCSC3bdICejn5u4M7r2hiXU2he60AmJKzcIbKXV7ZWzK9p5YPF9jfhJ/rMGQ
         Hd79HqBHaI9RSeCVQWZfaYWEfIxATavo53AhIJUEJshDpYgW1vZ+ct1GQMvEdDn3+b29
         Jj0w==
X-Gm-Message-State: AOAM530OrmB06sOCU5X6aPJZF8Uzq5giVbeaXscn2piRFpgt91bbtPiH
        SMxfLr7gmquPre8OxU9SRobo5g==
X-Google-Smtp-Source: ABdhPJxaUZVSYie1S6vwqKensJYHdkHUlZmXojW8ARTOMrU1zrIcJrBQuGJQzYNVrT4RjhLvgcRH5g==
X-Received: by 2002:a2e:95d6:: with SMTP id y22mr935516ljh.5.1638986072953;
        Wed, 08 Dec 2021 09:54:32 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 01/11] clk: qcom: gpucc-sdm660: get rid of the test clock
Date:   Wed,  8 Dec 2021 20:54:20 +0300
Message-Id: <20211208175430.1333594-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..26e17f349a77 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -29,7 +29,6 @@
 
 enum {
 	P_GPU_XO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_PLL0_PLL_OUT_MAIN,
-- 
2.33.0

