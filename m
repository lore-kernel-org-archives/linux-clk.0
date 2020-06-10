Return-Path: <SRS0=eZcb=7X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16493C433E1
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 08:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E12E22078C
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 08:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DTECFQ0b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgFJIa3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 04:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgFJIaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 04:30:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D528FC08C5C2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 01:30:18 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so1203449wru.12
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ig0Wg2PIvyajjV/Y8eTgJWpGeC/XcG4G3xO3aXfG82k=;
        b=DTECFQ0bjRfKJQiLq6V7fYnNYoGstQHaivOezI/tvE4vNkfVsM5E+kOKCoYZrkWQ8E
         07GF1OJ5g89l8Y6gsIetG5pftx0NdqTjpqPtKZKz/6k2dNaBn0Z2SZK7FL8znkkPohpW
         HS4BhLMugMY/q8R5tJQpq/MO5S9ZvJufVJS7ly/CpFL8AcdC+V1rLVnb2QYsa9abzIq/
         /pkQXuimNoTYoAIT9Am96pH2sY5EGmV8T+apfWzqDUUqtOuPKCoL8mz5V4Bj00tV3YWn
         euzCn5ZW9BftwIV05sEavFlk+ntT59KS5ZrP/UDs3u+URzOGKPukGgvjcQyNePbfNKO/
         pM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ig0Wg2PIvyajjV/Y8eTgJWpGeC/XcG4G3xO3aXfG82k=;
        b=TtV2Nv+k7k4maUfd7TcfZIebdpK8RHiHog3maPrxIn6iCYPoLIpl21DVyuBwqB9LdP
         EqBycxMM4KIRTC5yHqHjvFKiq35KU1l50raY5w8UQi9Qo3qgMopTKi86L1zOFBW62nVd
         U5TiMICJjBflnDLpa1/dr2v1AmqcJKylLyv6CUqgjTArETyWtQ727UWzKNtQbE3W20GX
         +6Jn3A0/dY367TGc/CMQX0ShsALctH6YCiaLzI8G0yE3/CaIn6/Vig5LILcO+0yBJe9e
         Vv9HG44J72e876ZoPpUhP7LNe7yn5ucypue0/vq/b1SyxP8Lh0Bb3NOb3QM9x2/hSjjj
         3jvw==
X-Gm-Message-State: AOAM533t35mrmy5afSHkFpAt6yvQ8TMzf3/peV9U3Q+0TxQNbXG07p8a
        4Hp3x67So2NFXjk+lRoqoVESxMg4+ICuuQ==
X-Google-Smtp-Source: ABdhPJxEeONnboKWlWlksQ0crqvdegr2mYAnJsEUGnJkTWBViWL1BgmpvfotRC7sgx0kvGovhCXAgA==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr2261311wrm.75.1591777817239;
        Wed, 10 Jun 2020 01:30:17 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id u13sm6958974wrp.53.2020.06.10.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 01:30:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dmitry Shmidt <dimitrysh@google.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
Date:   Wed, 10 Jun 2020 10:30:11 +0200
Message-Id: <20200610083012.5024-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200610083012.5024-1-narmstrong@baylibre.com>
References: <20200610083012.5024-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

This adds the Neural Network Accelerator IP source clocks.

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b0d65d73db96..40d49940d8a8 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -145,5 +145,7 @@
 #define CLKID_CPU3_CLK				255
 #define CLKID_SPICC0_SCLK			258
 #define CLKID_SPICC1_SCLK			261
+#define CLKID_NNA_AXI_CLK			264
+#define CLKID_NNA_CORE_CLK			267
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0

