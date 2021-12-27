Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145A0C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbhL0NgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:36:13 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54614
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236864AbhL0NgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:10 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D23F73FFDA
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612169;
        bh=2raMQbTEO7GSuDvkY6ovvPJxx8orpnvUqhVxP2Jtxb8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QqxrP9aLF3CkaHVaRnB4b6gz5KiA537BhdOAC0aCGFgcIZ1Fp9Wz5q2Z8bqqVg7or
         Tzqu7DPAEQv3gIM7ZUuonaeV2h5rIczORENCGzk7rfK9/cmvH7evBqqw1+yGysTq60
         8oR92jq5thvJJRVYr3ZyrogjVp8PSVDkKXs5TJLSmdnF0aacn4vhFgwwtk1p4fgHnO
         zg+BbLhzu6zduBXmH6KFicfcSjxSw0qCodRi+n0jW55GVBZ/BgY3thEGxJq/Yw6w9m
         rXVV9dsgbx+3g+PRoyZ7FyYmXyFBH3dOs5osvv3MtvAveEPYn0NZ2b9r2Blbb4b/be
         1qL0S47iroWpQ==
Received: by mail-lj1-f197.google.com with SMTP id c31-20020a2ebf1f000000b0022d87a28911so4837629ljr.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2raMQbTEO7GSuDvkY6ovvPJxx8orpnvUqhVxP2Jtxb8=;
        b=6/52m662jM7FERCRoO5gdkFiZAOuIE83hrf09cudn/CqyEYW37Dr6Jn/GkdZWislUa
         IaZIaY0QCvte05e1K94+pWKR+4O/kb4jKGaGywY5q0XnozzSpSmhVyBaESU5t6kWnbNX
         xocoTtOk04j8cd+ESDLYVitpGPIILmdkN7m92pRDSWCtva8zNdTH1PL9AqOYfBdVxVhn
         pv41oQGXS7VQrpF0InPuUQ6oZRsgotsLpEWqtZfwSE8sbNkmSzX68CG12BmDnJeliC2E
         34SoYTrfKx9srFAKOn/dv8raYTfKtuOLNUbpRgCHsg9lqt3fOI4FEnQ5GQjJ7a7Z2yg7
         NLwQ==
X-Gm-Message-State: AOAM531ruWsORw67o6mvckCGc6fbk3VdQ8tKHiJ6of3VVZMXcTvFGoMs
        /X4udHBYJkX27Em7jdbN0otJWO4cEpVStUvWSAfneOK/sA5BtmXgT3H6u+uPe5yyWhTDvZO0a7U
        BPN+lt8fMdKUXtedWkW9GU3ZEW19miPKYsAwQXw==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr14726554lfr.295.1640612169354;
        Mon, 27 Dec 2021 05:36:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8X2sqRJEu3DvxBtUDtpU3Y5uc/tMDwNZZNmfbYtUwIkhKBrQTFmqTLlfc1ZtsOof7nER7vw==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr14726540lfr.295.1640612169204;
        Mon, 27 Dec 2021 05:36:09 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 13/19] arm64: dts: stratix10: add board compatible for SoCFPGA DK
Date:   Mon, 27 Dec 2021 14:35:52 +0100
Message-Id: <20211227133558.135185-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Altera SoCFPGA Stratix 10 SoC Development Kit is a board with
Stratix 10, so it needs its own compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      | 1 +
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 46e558ab7729..12392292c62c 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -7,6 +7,7 @@
 
 / {
 	model = "SoCFPGA Stratix 10 SoCDK";
+	compatible = "altr,socfpga-stratix10-socdk", "altr,socfpga-stratix10";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
index bbc3db42d6e8..2d53a06deab5 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -7,6 +7,7 @@
 
 / {
 	model = "SoCFPGA Stratix 10 SoCDK";
+	compatible = "altr,socfpga-stratix10-socdk", "altr,socfpga-stratix10";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.32.0

