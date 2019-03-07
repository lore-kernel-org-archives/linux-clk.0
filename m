Return-Path: <SRS0=2CmL=RK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD5FC43381
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB5B120835
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 14:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Lf2s0Wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfCGOPL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Mar 2019 09:15:11 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40825 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfCGOPB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Mar 2019 09:15:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id g20so9308739wmh.5
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2019 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/H1m/oJJRpi+iUidODU0Wo3KnSYRlpFqEdDR4058GA=;
        b=2Lf2s0WdH4Vcf3P+AGKP/GoFJaNPDBMQ6sxEyFlx63ctQnfrHnpCNy2R89iKtOMIJW
         q3y2QxTgeauw40XweFaxUeTGAUyjonx4KEVB2Z5TP2LUWoaUKH7IcYGjS7EDSrb+GIVG
         ejVKMef+wDDTKTuBHJXnHCCGt+69X18+YIDN+joa7jV0A7AtMDb+RJsqJ/hpW6FsSwgs
         pL9fmwNx89cF0fyMnY5Nu1GtxxUF4VJ28j6ZnxD/ZauRmDQsChtfUD5/sQiiV0f51djC
         uXugehi9UZ5I59CWLYtPRM0X4qACR7SmcjibNkO467npR5GHEVY8KlWSzaTACufTq/EH
         oUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/H1m/oJJRpi+iUidODU0Wo3KnSYRlpFqEdDR4058GA=;
        b=IzVQU0CsN4xxYX0HdnrJrkPlSqLqyn11XiPyRjmIiKIqgA1eIbnjgPb+zfLz50imAp
         zx0lcyLPD7DLRWbPOa6shn/7Tn7Drcs4MvjTzLhaLH1B15vKqDAsfKeRzyAoIhxHcpkX
         zbOhngDmM3ez+pHYJuZlJmrXMSEkYrr46743w9tK53s+1HRTibRut91XtMJGmlDqHkVh
         S7tmBZqS4a4g6qwu8Wg5FrnTT58CP3BwBvXf3RkqkAJxaSYoo2y0tKFeB/9r9BY4J+xL
         WIev9fFYFpjMQapv1zKNWPHYhdSWfkD5QZPA9Z1Bxh/TQ0sff3RuoZvgupbGNF2O+X/0
         tYSg==
X-Gm-Message-State: APjAAAW6y6fJtN+FbWFltrh84v6mN8qt6EZ9x+4++U48/4UC8ON5SclZ
        0Wn3+dp1RTX7EqOvmBdFd8ogBg==
X-Google-Smtp-Source: APXvYqxs79hnv1rLJa4FV8yq2ms2ggAnLXAuSTztruFO50CAdMSNGTNjR2F3Lgoq5rTRbrY7+MpaGA==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr5880513wmf.65.1551968099501;
        Thu, 07 Mar 2019 06:14:59 -0800 (PST)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h9sm9679304wrv.11.2019.03.07.06.14.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:14:59 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
Date:   Thu,  7 Mar 2019 15:14:54 +0100
Message-Id: <20190307141455.23879-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock ID for the reference clock feeding the USB3+PCIe Combo PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index d7bf0830c87d..30303728fe09 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -132,5 +132,6 @@
 #define CLKID_MALI				175
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
+#define CLKID_PCIE_PLL				201
 
 #endif /* __G12A_CLKC_H */
-- 
2.20.1

