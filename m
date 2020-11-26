Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EA6C83012
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7C222173E
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwjnecL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbgKZH3w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 02:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388548AbgKZH3v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 02:29:51 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2252AC061A47
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:50 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w202so850246pff.10
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DrIF8npwlrqxLr6Igah5Ek/omJmCk/eZLSe1ULAbqaY=;
        b=vwjnecL7+HRvNcp2/QtOXgiS5f1StvfUiYod01dCOQllzXdtF9MY2EUZdSOnOd0zjg
         rcyRDx080Fua0RfOcotAkNLHVETyneFv5Z4d2HiA48uJ46O09h5uJjkFPb4NvY5rsjoG
         r15qsySIVo6wFxU/ZGZQ60SRKayEup6ZBr5J91mBimojS6VMXJmJWvor8lViSrW//ukZ
         jKWtC1LLR+XrssnKeYTbKao98VHkmCCmVS0Mocb6jVtlnUqQkRG+CYnrsTcmfBoJ3ics
         m37I0olDtj15mp9oW6G9/nROfyL9YA/G1a2cSZP46W6K4+iMMxTugZa66smHM+y1U33K
         frzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DrIF8npwlrqxLr6Igah5Ek/omJmCk/eZLSe1ULAbqaY=;
        b=CI9pDdhhNqPzPTh+cWvH3h6Z/m0FYqGpDmxP+i2xSGjauHK2UyB6+aZI8w+ZKhgoNJ
         2BQbPSw5BYv38Ijcy+U8VuvlqPsCgYPWrP7a0SyE6DFluozDMz0d1rzi21raHFJDB4ZA
         YOT3oLnXXQ2GmOOL/GHKAZofejWAchh4y/gQQ646YNViWRUEgSM8YU0qYbh0fYQ2kBko
         b/jjAUhPCugI1+LPJk0QliFJMU8b8xxlNP8Z++R6DKcdOvNazy9E52hIhIuaGbn3cFJU
         ktwigav2I9CY4VMAFoSAQ5AYjBJzgNCw+3Tp4kMGYQ6E4fyb9MvRDA8+id2OjWufpX1m
         GSBw==
X-Gm-Message-State: AOAM5308Wl+Sj+DU+s1UNS/lF9jPEQyg4f7DjqaTTf1EmiXlLdzPcMmE
        fHHgsukNjwg9K8qh9UjYsSMaWds+OGHu
X-Google-Smtp-Source: ABdhPJxnW6Di3Yy8aHSj3rGQbdFEbp6WxXhA9CofeXAnnQgscmsA6ITioMijAb8veJ08ST2oH7Ghjw==
X-Received: by 2002:a17:90a:4a0f:: with SMTP id e15mr2162901pjh.182.1606375789668;
        Wed, 25 Nov 2020 23:29:49 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id t9sm5508097pjq.46.2020.11.25.23.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 23:29:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v4 5/6] dt-bindings: clock: Add GDSC in SDX55 GCC
Date:   Thu, 26 Nov 2020 12:58:43 +0530
Message-Id: <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add GDSC instances in SDX55 GCC block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sdx55.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
index c372451b3461..fb9a5942f793 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdx55.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
@@ -109,4 +109,9 @@
 #define GCC_USB3PHY_PHY_BCR					13
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
 
+/* GCC power domains */
+#define USB30_GDSC						0
+#define PCIE_GDSC						1
+#define EMAC_GDSC						2
+
 #endif
-- 
2.25.1

