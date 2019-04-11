Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CD7C10F14
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 728982083E
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="brU6yRC2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfDKIpn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:45:43 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50359 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfDKIpm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 04:45:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id z11so5647962wmi.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
        b=brU6yRC2/R67qR7FwEPXgWq7TMtY3G392GEJp4iDaBRyvhCusWFHyAaS6pYicJMf60
         FJV8zzS64jtbceJfeADF5+UAO8jacrkTYcZ7pp6+JGcHd5z/neIKvlLN+wRfC7qUHsIh
         YOEUxQTUj6SDJ+t9OGUxNCOID2PE43j+B4dvYouzart1YuyCaOp/MMPwSJLE6bpX8aZD
         NDbVvy3g5fHNVl1xV+TuRZOS7beZEef5kJmo5F1wFntu8AfiJt3eVeDYMr48o3LoqYXn
         +VdlfQayRS8iyKStauO6bGg45cnZefIdE1snnnrxUcwm9SgI1JygDlhOmNyxVecixHZx
         HqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
        b=PbiPLJqQvH4B4ov/EtNi4rXvsmLhcu8N3CwP2PU5qIW3mcNEiKgfaT7RVflHp+OGgc
         wa6JiNKHpMMBIySzE0+ogfztBkQyOfRm4vGaTTTaM2RWuyNxK3W92wlQ1b8g3RYxJCjk
         Gligsn8r+TvC2sUOztTERz9vOhH1imYdJXBbgmEefcRykKFlIdSKY6l3tEbnUAwZ7UyS
         LNidYt2mmoX4DsAhBNeuMZ3+qhlfPrCXIwQbRuAtdUYY9/f2OmukspsWPbCRPpl9ALUj
         IubaW1nBU9yTyurdVMrnnn8OEN8O7j6Z90hoDWkuhz0Qt9/LLaLv4iTY6T80gn+n2fiO
         qdkQ==
X-Gm-Message-State: APjAAAVIdPUCORZVXYDCRR6M50DCTCnxnKCUnS8lgNVy1VoQ4qdQ2CzD
        bXppNxXXcS5oYlp1+DEk+cvm2Q==
X-Google-Smtp-Source: APXvYqzD6/VS9PfVDNO6HphW5M4EV309P4F8/HO4da7MQt2vi/o/ZoTzBqwZPAJIq2PCDip1y0tfhA==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr5858487wmf.5.1554972340768;
        Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 7sm128602876wrc.81.2019.04.11.01.45.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
Date:   Thu, 11 Apr 2019 10:45:36 +0200
Message-Id: <20190411084537.30299-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411084537.30299-1-glaroque@baylibre.com>
References: <20190411084537.30299-1-glaroque@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..85cfcab10507 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,6 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_TS				203
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1

