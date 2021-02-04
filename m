Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C99C433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 16:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B3A664F42
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 16:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237980AbhBDQ1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236811AbhBDPBr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:01:47 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93409C061797
        for <linux-clk@vger.kernel.org>; Thu,  4 Feb 2021 07:00:07 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l12so3406144wmq.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Feb 2021 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2V2m5rFMMubWGXq76HAlBgLUJ0bO/2ibl98uXVHvBnk=;
        b=Vr6z69kNemvb4ISPZBfKLFUvl7Qwz9RTvkne0fGh90hcug60aw+RJQuYrgq9ZovLXn
         1kFySmYTQ0+lRYNFTX7UIKMOrjVFJKNHye498apgZBy7sloGZAHkkX36IiUxQ2szXOIY
         QQrfxwI1cdOBne1unSBK4yk02VwFGPUIDL7nu3Yg17lgu2WPIc/MNnVnsJFGuz9wNeT4
         PDSXbxo9y7TLzZbrJ4m+qTzkrf8UCdbvk/49z75iLn6u8MZp/EqiKEvC7rmB5J7V/57q
         CM1LiL67on67xfLp3BSdLHuZNMv9ETOO+T1dp/5ykfQi/W/RSceGwH2xtT7ONRhIs0Wm
         N3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2V2m5rFMMubWGXq76HAlBgLUJ0bO/2ibl98uXVHvBnk=;
        b=K6+XEvfULeJN2E9puq1FLAgQxhHFnpjJw41MopX0mgQTG/zJlnQRrDLkInrr6oDqge
         dG1w5g8qcpSYCbmBV5YKnFbJslSFL9D3EV407OpPtKsOX6H/CafJ4snm9aabtZwOhwU4
         xlTGOF6A2OITGiWFyIlP+6oZAoFxyFGioc2twKoHhbGrB46pLN0EDL9W4yqyxZ+ClRMy
         DMiXRPI7tewzOSTH1POiJnwKJDgs5rdV19mDZiBNTCBW1uF2PIBSTc4YKRznYrEFTobP
         D77hSCzs+wfkAKiHK3GmD4wM60RrI348ytthA4y65s5Y12jp48Aj/Nqjqj39ORLgakWN
         u2ww==
X-Gm-Message-State: AOAM5314BUZ4U71XRJVx1VeLi7erkrTwgUApJ/gsK5OAQ8n7yNbmVXE9
        yBpeX2jX9XHn85pzo3ckIi8Mm6ubs2H1UQ==
X-Google-Smtp-Source: ABdhPJySjxV1EgJQJ74M32YnITdnmrBITFlqYSxQ32+AwO33LuKPe8/3Im3vp2sh77jSlmWetIvHUw==
X-Received: by 2002:a1c:a957:: with SMTP id s84mr7753547wme.166.1612450805830;
        Thu, 04 Feb 2021 07:00:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 1/4] dt-bindings: clock: Add missing SM8250 videoc clock indices
Date:   Thu,  4 Feb 2021 15:01:17 +0000
Message-Id: <20210204150120.1521959-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Two indexes need to be added to videocc-sm8250.h for venus to function
properly. Rather than adding the missing indexes when used we add them
separately here to keep checkpatch.pl happy.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,videocc-sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
index 2b2b3867af25..8d321ac3b1fa 100644
--- a/include/dt-bindings/clock/qcom,videocc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
@@ -16,6 +16,8 @@
 #define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	6
 #define VIDEO_CC_PLL0			7
 #define VIDEO_CC_PLL1			8
+#define VIDEO_CC_MVS0_DIV_CLK_SRC	9
+#define VIDEO_CC_MVS0_CLK		10
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_CVP_INTERFACE_BCR	0
-- 
2.29.2

