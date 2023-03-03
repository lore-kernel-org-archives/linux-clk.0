Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35219C7EE36
	for <linux-clk@archiver.kernel.org>; Fri,  3 Mar 2023 02:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCCC3Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 21:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCCC3X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 21:29:23 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A991EFD5
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 18:29:19 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j11so1761245lfg.13
        for <linux-clk@vger.kernel.org>; Thu, 02 Mar 2023 18:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677810557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTPSVEvvP89bGB3D92Tz451FufVn0eXFUs87v5JjTuw=;
        b=N8NDFXvx5McWRHFGaW786k6TdOOVLszqOVhIRYQ0CWW22ECnC6B49A+lhm+NtqMj/h
         b9UeIUU7o7ux5JnXjy5hlil4LTzdWfaN0miEPmaIawqDU7hrDdjbYZIoRoNWcErdATtX
         VgUihqiq4e/RYnhPXr9TudRmlDTfsNc6sPEGlQ7dYUsDWkow02PMIe9DLzpfif/VRG+a
         L82ze9FTIszLPLKawV64yeqme+twH2D0pRh8YVMgUQwUj4wsAzEgeskymYir7weJog9t
         tmWx1KldhpWhFQGo1IFGXyUbceXGWGxMNR3DDiPMrURW+KKnN85KDurhXGX5FOZJXag7
         J6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677810557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTPSVEvvP89bGB3D92Tz451FufVn0eXFUs87v5JjTuw=;
        b=LDwvDMXYrNqXZKF/ThRyYTP7rbwaoYPf20P0sUlIMzyffiZIpXflZmE3ZVT4F2flmS
         w9/g1gbf1iZl4Yk5W3VWH6H1TmTeS/L4V45XjIKwyum1AYk8b+RwDecaZgYcMOiM6xol
         yyEZLRcJMaqxFdKLu/Wn6coC0gBQMd9qrkQsS7Gla+5lpEztx/Pi3EIJYTZdcIzQWdI6
         dB/E0xx8D1hfbUBjQL2apLAAYJ+5JbbgYyKJtgbBnpcmIRDRsOwY3928OGLzwEHn90Md
         ZYC6DhaVmWnN0JLFPILuHkQI+gMVvmR4vIFgzf+MFf6OcbVyVga2sSUPvFm3YT81CSVE
         +2RA==
X-Gm-Message-State: AO0yUKXVL2jcNlS5LBu/zGA8CF85ISy9BUc64rjRs06MO3NNnJw2gDt4
        Gg2Y3VoGD3O2fL54UY/mvSMZZQ==
X-Google-Smtp-Source: AK7set9is1XMi9TYXqkC3FsHqGmXHGcVtKQHTEfClKlhu83v26vCpQiu4njnbLdY5O49DJtIKYqTkg==
X-Received: by 2002:ac2:5a45:0:b0:4cc:8682:ec5c with SMTP id r5-20020ac25a45000000b004cc8682ec5cmr87320lfn.34.1677810557388;
        Thu, 02 Mar 2023 18:29:17 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b004cb1135953fsm175574lfo.240.2023.03.02.18.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:29:17 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-msm8996: Update the .pwrsts for usb gdsc
Date:   Fri,  3 Mar 2023 03:29:12 +0100
Message-Id: <20230303022912.2171177-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
References: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The USB controller on MSM8996 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Fix this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index e16163706735..e068c9e51441 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3455,7 +3455,7 @@ static struct gdsc usb30_gdsc = {
 	.pd = {
 		.name = "usb30",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie0_gdsc = {
-- 
2.39.2

