Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D6CCCA47E
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbiFLTbX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbiFLTaR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:17 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25BC41FB6
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 129so3833204pgc.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XzJfdd+eY1FSY3EJrVVoRPIZ/kYDSOHrX6FKhVLc53s=;
        b=lr76V+y1HQ4bnVgVbZvn/zasgsi+ANf1vQIMC65MXiW17OFAc+Bd5l8kp3Hb85SN3a
         EzPShNsKA0QMrrRD8WdcMiy9v3ukSsggsNrvV1jLVQkLopXj4ZWtzs/gjVujrsuUQyZt
         52/xbGGELYUWodqc3Hr0a+RaPrKsR34ZmeGIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XzJfdd+eY1FSY3EJrVVoRPIZ/kYDSOHrX6FKhVLc53s=;
        b=u9T7WYdE2yzwYYnINoyQBU0RroDGwn0dgPx4EUpg0ps7R8Phvh7xdkJn27wxvTzkwO
         Wd9A5hBY2OyCbdRGRsYQ7S7vQ6LoGNKt94QnWLmA66gFvb6hPxu6jrL9QSaA7JdHscm4
         obbDjtHir+wdy+VlW/mTQZBiAnGfQWMxAgkci91WbUIUlNSm3AEgPT3mvBDdzTXySI3L
         R+beyYfAIhi4iOXm0n9ImUe3Tn5DdWuMD1bop+SJ81cR8ix748ixaC/MnKn9dSSIjdNU
         VfNmC96zxdPGFEsgke5+2I02IiUf5jr1uBeNWCu8ano0g12l4X6/uSuQPSe8mjHg/i+T
         zUdg==
X-Gm-Message-State: AOAM532/l47aq0cJoJOauocyiwHtmHsRGFhK0eoldAiu4H9ohE0g7F8u
        PSBKa3Eq+rNgJ1CI4eMK0Sk4YA==
X-Google-Smtp-Source: ABdhPJwSjFGDVG1mKkZhlCON9X99EX+7DU6gXE8RsS4Cl6HfyMd5nseD1V5Nnb9+azZ1eilhddkReA==
X-Received: by 2002:a63:5424:0:b0:405:230e:3d9f with SMTP id i36-20020a635424000000b00405230e3d9fmr5983355pgb.271.1655062216321;
        Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:16 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 11/12] dt-bindings: marvell,pxa168: add clock ids for SDH AXI clocks
Date:   Sun, 12 Jun 2022 12:29:36 -0700
Message-Id: <20220612192937.162952-12-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These are clocks shared by SDH0/1 and SDH2/3, respectively.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 include/dt-bindings/clock/marvell,pxa168.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index b1cd4f20d175..c92d969ae941 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -60,6 +60,8 @@
 #define PXA168_CLK_CCIC0_PHY		108
 #define PXA168_CLK_CCIC0_SPHY		109
 #define PXA168_CLK_SDH3			110
+#define PXA168_CLK_SDH01_AXI		111
+#define PXA168_CLK_SDH23_AXI		112
 
 #define PXA168_NR_CLKS			200
 #endif
-- 
2.25.1

