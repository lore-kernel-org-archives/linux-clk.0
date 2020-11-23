Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38771C63798
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6FA2073C
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fK3T5zpN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbgKWQiT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Nov 2020 11:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732563AbgKWQiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2020 11:38:19 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE16CC061A4E
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 23so19199591wrc.8
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
        b=fK3T5zpNtdFE4qkfblQOvZutqPBlD3t/zRsxTZQ1DwegYq6O8j9idVvZDz1yqtrcIw
         KdjNOyImu+9ASuREdRApBcfK4GceU5+rZc4trGbarkKGPCMrOfppVKTEILzXEXeQ32CF
         boBBiwmAwrUPDYsp/5HG346RA/4d3D4vDepKpYifN1th2mmdv2N2UtF1odHVgGVmInVM
         7S9xizR7ziJn5nEyqRza1QdDg7jIRZyHlcrvToKIy100osWsGDYLRAHeDk9fn+5Z3x4l
         ovGYm5Vu1NrbTGKgrJ3yB02AccjBmSFICqWs//Rv/QwBFJdf5Gg4RCgBp4Rbc9wGSoAo
         rKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
        b=ZtI3/GR3A3W3S565F80u3ah2jSGa4QUPJOr+Q0NYKoYmCpzw1XusDsO0zWRpxnldVV
         /6kAlSfmXRsjaKmewl+FVSL2+gU1hRJ03vlKLewYyP1NC8mMUZNZaNyAV3j9W2TwioNb
         gpvYwC8NpiOXQ2QO1RBhh3K5KmBhbUR34KTuo3c1ZBdsfVUJ9MhO4FczN9+HKozdHviB
         RMofn7CriK1uTiQM+NlWBPZocmgRVWPtworZZ1juvdrEGEpMMXg3wnI82U+nhm0aASxt
         KmndfglJZvjrBxs//bbEFWPUEDpJGQdLASCw/yVTZ1+CNz2NmxRalBKye4kFE80CHTQD
         GY2Q==
X-Gm-Message-State: AOAM530R3XD6Qns2xp3YVK13htAZMNDXKcmf9gkP9CCk7DjjD0FSPHyf
        7gHGvr3R2g7NrTDw22N4hEx8PA==
X-Google-Smtp-Source: ABdhPJxZuTuVAK9+n55is+GQzAN6UGY9JgbVtQ0zjEb8LC2wK2PgJkVpOv+zzDtsyXTi0up/sHeVKA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr491465wrr.423.1606149497579;
        Mon, 23 Nov 2020 08:38:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
        by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 08:38:16 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
Date:   Mon, 23 Nov 2020 17:38:10 +0100
Message-Id: <20201123163811.353444-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123163811.353444-1-narmstrong@baylibre.com>
References: <20201123163811.353444-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the MIPI DSI Host Pixel Clock bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 40d49940d8a8..a93b58c5e18e 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -147,5 +147,7 @@
 #define CLKID_SPICC1_SCLK			261
 #define CLKID_NNA_AXI_CLK			264
 #define CLKID_NNA_CORE_CLK			267
+#define CLKID_MIPI_DSI_PXCLK_SEL		269
+#define CLKID_MIPI_DSI_PXCLK			270
 
 #endif /* __G12A_CLKC_H */
-- 
2.25.1

