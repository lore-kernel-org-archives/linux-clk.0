Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A6C433E2
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D66820872
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 12:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KzcCsQcC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgIOMyN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgIOMrT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2020 08:47:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71949C061797
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:46:00 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o5so3108054wrn.13
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
        b=KzcCsQcCjNO2iAn9TLGuYKccXqq76Nj0G9UJEj75DZeAVJEgvJT6Akrl2s/t8SN2jR
         f+VpZ3IYj0dWNYEWjt3KYBSzy+3ss8FhI3NjAX9w7PAbvdI1K75ZPZTCdZ3N9EZTpRcC
         9KyxKduWnNaYewl+WxNSAPi5bUdQAPrc7dH2IXz/+fOpTb3AJ92YfMuVMk3VtQtucnyc
         WeF6Z35o9CcD+fsh2JtEmSrhXeediy1NniiqbJptEfq45VvvtOXHPVKjusNu4HMMoBXC
         CHYpVKAW42yRxwxbyVUQvVGwzhaw46d2jKslG9h9oQI15IMindO2vTldycnwE1V4VQlW
         dF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
        b=FLgBEHX2m6+rL324BKEU1NT88n+q6FDQbK+cC5ZUVXVsm/C2FvgEAOBKacJyKSMgd4
         v7SDiwrLXct8RhKzK1RpHiSgjuw6Jb+unzs770qQn7S+9oUmYOKPeWbQ1MK6bbM84Bdl
         LZ2GMpF3Rv7gHGG5/0aOasAl7odgkXtd1GmgZn6cCOt/Wc3lzriLxQ2MupxQvSEvBzvD
         wPpYw+iLOom7jitHPvpH/yFuBw5B0JqBHGjaEgXPMsWYti4iY3m8WJUfPj2qKtmucLAf
         G/jMsW5rkQqL6MDGCI+DL4JTSpnONP1YLcqCOUmEThZEZbiBkG0+OApilgmN7gDJKuVf
         BmsA==
X-Gm-Message-State: AOAM531MDGe5RYpgxaVlUecy/34w2dWfL+hkHdyDjG3M3/PS6F2wCRSi
        PLreF2GyhHSGtfhSpPKsr03RXw==
X-Google-Smtp-Source: ABdhPJysDu/Y8r8jEY0r1n/+h2yMo4tuRHu2mdOTiCUa1sJv4dyYJnuG+Dz8/5wjkBbEz3rOODjJgg==
X-Received: by 2002:adf:e690:: with SMTP id r16mr21086562wrm.15.1600173959260;
        Tue, 15 Sep 2020 05:45:59 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
        by smtp.gmail.com with ESMTPSA id q8sm26548589wrx.79.2020.09.15.05.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:45:58 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/4] dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
Date:   Tue, 15 Sep 2020 14:45:51 +0200
Message-Id: <20200915124553.8056-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock ID for the MIPI DSI Host clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 281df3e0f131..e2749dbc74b8 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -96,5 +96,6 @@
 #define CLKID_VCLK2_DIV6			130
 #define CLKID_VCLK2_DIV12			131
 #define CLKID_CTS_ENCL				133
+#define CLKID_VDIN_MEAS				136
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0

