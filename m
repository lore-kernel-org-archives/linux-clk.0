Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2FAC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2882764F2B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 19:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbhBYTo4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 14:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhBYTmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 14:42:46 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3201C061797;
        Thu, 25 Feb 2021 11:42:05 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u14so6418090wri.3;
        Thu, 25 Feb 2021 11:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qTlTcDSdxImTa7ViobepPe5YOpcOn7A/xAH3auWjaM4=;
        b=PW+JrKonb2ZmsN1R83sYbW+WJGOkW0UGVRYTQQ8dM0yNhdq1hvciySQZLFMX3YxEfC
         OcAuWIo+N3OjUFq6XcVaO9FLdr0LqdkC4+7VeqSzqNmBQyPCucs7Uj5iGfMPjIF5AK6W
         bqVhxkrXNEmqvctRrPcEI6W7nbN4r/83buY/hj6MGyy/PSXlrrHoaBmLZI14DB61qQ8r
         rsCPnZU97VUCvakWLsMb5XL6xb/tgj767yVuedEVuK54X6ln0xJDNbYO3trMO6FMr2yV
         izSXmY66diq4lGKVtCHm/1XyQBU80teoJkiVtqv+WiZvvkVsK9eHgbwnRftQfqgSIx5q
         EuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTlTcDSdxImTa7ViobepPe5YOpcOn7A/xAH3auWjaM4=;
        b=m5KgpO+ieeq6/G615MtC310xPUv8dHYCeC+Fyxi6RFDRFO+RTn0LzOYSBhEk6FuCkH
         DJxSZNC7Exbk6Xj+Jo6OCRAfptKJh38m4LdRSvIthUs6nRL8mb2ByC9tTsJKNKaHV5pY
         wkdw24MiCODSupeKaKlgeU0lGovqNo48DXVieflGZtFjMmVE8Uro8fpUUhsK0H0LauGI
         rWXt29pr6XzxG+Z1BXQcSiQITOPTpg+Y98PtdeNkEoeYuFNyk5cbKUPpBY3ZKYktTl/7
         ULRAOPUvkuke5I2EwBepBEhWMaCSL9zNlicOR6amHWWe/KE5s3FpRQkC4N9i+3uw6LVq
         N6sQ==
X-Gm-Message-State: AOAM532Pjnpo9AEm4ZYmlC5D5Z36iDgwaSJ/pBTGakX/0u1dr4QQQgLW
        qYKhPLFg6aWPyyy5cGW0GGg=
X-Google-Smtp-Source: ABdhPJzEMzLHj4q+xSnoAgsQqs+nEcKezgAzOb49FU7j2c36aZxnrM0vIM1oT2cBXT9FBf0DRPraPw==
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr2847672wrs.420.1614282124627;
        Thu, 25 Feb 2021 11:42:04 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a198sm890603wmd.11.2021.02.25.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:42:04 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mips: bmips: add BCM63268 timer reset definitions
Date:   Thu, 25 Feb 2021 20:41:59 +0100
Message-Id: <20210225194201.17001-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225194201.17001-1-noltari@gmail.com>
References: <20210225194201.17001-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing timer reset definitions for BCM63268.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 include/dt-bindings/reset/bcm63268-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/bcm63268-reset.h b/include/dt-bindings/reset/bcm63268-reset.h
index 6a6403a4c2d5..d87a7882782a 100644
--- a/include/dt-bindings/reset/bcm63268-reset.h
+++ b/include/dt-bindings/reset/bcm63268-reset.h
@@ -23,4 +23,8 @@
 #define BCM63268_RST_PCIE_HARD	17
 #define BCM63268_RST_GPHY	18
 
+#define BCM63268_TRST_SW	29
+#define BCM63268_TRST_HW	30
+#define BCM63268_TRST_POR	31
+
 #endif /* __DT_BINDINGS_RESET_BCM63268_H */
-- 
2.20.1

