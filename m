Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E88DC43461
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E111620684
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="maBZ3Vb8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgIOM5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgIOMqD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2020 08:46:03 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BF6C06178B
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:46:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k15so3137482wrn.10
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
        b=maBZ3Vb8DL4XTv3jqb6hlktNtUC+mPnj7ioFAFOv8/3UOIWFfzdKHlgzW2ssBnnwyh
         6fmP4vBycJ71D5tbvixxeSaGBgX4MjlhCVFc9XsncbxLqnRPUaVbDiysZL5+a9ejIm+9
         75VZJtf5AsstRbHXqKc4wATG17L5+BfQzRJzGKZyLw3RXp4MZgRZ9hqYNQ8RIYHYOOzK
         Kh1aSVnWhxbDHFJTA+VTKphT/g3O/5Kt/t+9WPvEv6B0pcUtfIghsiJsx1IvVFn+bvI0
         7FQDHoCY1S3UHFaQsQJ5krZzE0o+eCIgpPdbtdyY93rgmb/1Z164HA2DY5F05D/OPbud
         ILJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
        b=XP3LPMYFiJ8DCgK7UOJli2wtjt242r13MfkmmR967s+EGus+ay6DDZMFpyk0GLltFm
         mCZ+jM5oq2VKq0LPT9RIRJQ82P7Llb+gh09HJMUJmZXeY2VpKcsG2Bs6r0tq9ZDBi+3F
         3OBSA2kffb082ZDFGzX64tCLAujGrkjdb60VToC5aR4FZaHK5X1uZegTr8L3dRqZG9Co
         AeRMzsSMRO8YLSheJ9PY0A35LKdXacUkzHXwCkGljcdVSpcvImCgKQ9DRdC+QhfutlFe
         c69r3jSwE2hMj+KuKLye30KG+DCKO20JsNLuu/CsDRgxZaKpCgSRWvLFdIH2zR21pYC7
         N8Hw==
X-Gm-Message-State: AOAM533rTdcd6ipMnSk26/jTnyc8NcEnMOcriyE5yPzvSJFfTJrqcPy5
        4mDLtQ5s29Xcfl8YflHKmxSpew==
X-Google-Smtp-Source: ABdhPJy2eRTWQ+g6UmDXlmlM53iqWF2j0sszPGZYETQLzBt+ugwiGbmbWIu+s6aMP/ZkXhMe28KDEg==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr21433215wrb.307.1600173957934;
        Tue, 15 Sep 2020 05:45:57 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
        by smtp.gmail.com with ESMTPSA id q8sm26548589wrx.79.2020.09.15.05.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:45:57 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: clk: axg-clkc: add Video Clocks
Date:   Tue, 15 Sep 2020 14:45:50 +0200
Message-Id: <20200915124553.8056-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock IDs for the video clocks.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index fd1f938c38d1..281df3e0f131 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -72,5 +72,29 @@
 #define CLKID_PCIE_CML_EN1			80
 #define CLKID_MIPI_ENABLE			81
 #define CLKID_GEN_CLK				84
+#define CLKID_VPU_0_SEL				92
+#define CLKID_VPU_0				93
+#define CLKID_VPU_1_SEL				95
+#define CLKID_VPU_1				96
+#define CLKID_VPU				97
+#define CLKID_VAPB_0_SEL			99
+#define CLKID_VAPB_0				100
+#define CLKID_VAPB_1_SEL			102
+#define CLKID_VAPB_1				103
+#define CLKID_VAPB_SEL				104
+#define CLKID_VAPB				105
+#define CLKID_VCLK				106
+#define CLKID_VCLK2				107
+#define CLKID_VCLK_DIV1				122
+#define CLKID_VCLK_DIV2				123
+#define CLKID_VCLK_DIV4				124
+#define CLKID_VCLK_DIV6				125
+#define CLKID_VCLK_DIV12			126
+#define CLKID_VCLK2_DIV1			127
+#define CLKID_VCLK2_DIV2			128
+#define CLKID_VCLK2_DIV4			129
+#define CLKID_VCLK2_DIV6			130
+#define CLKID_VCLK2_DIV12			131
+#define CLKID_CTS_ENCL				133
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0

