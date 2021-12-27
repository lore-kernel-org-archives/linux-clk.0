Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FF1C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236911AbhL0NgP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:36:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39692
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236885AbhL0NgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:13 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A550E40036
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612172;
        bh=umuAKwTKb8yE9WwkqLjV1NuEa+crhr+K5jfCriD9wkk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=IsjLeVaJpf5cnPlhiNzDbxTAxDi8yJubj+mvpOktplBKttSOJSzpIsrkfkQtmq1R/
         4ZeQ4VLChgK5EI9TnLqRJJqZBrLdB/aXlGTzPIEkdsrhyT8JMbgk8GqoZA8DtRsbIv
         KGHSdhjMbDSuh2o9Mo0Wj0cCs1n5WnTlYzhaVFFbqpFqE/0xvEjs1WSLJhLoFEp4K8
         TUf2LMh56ul+5dIrO0SqJ9O9rZ7d/EGWo9a3P9lig7lPp0w43uyUwC2NBrZ2tKYw3S
         iIZMnyExcFJ5SWFCt4TJlvi3tmgTM/fzGwIkyj9anwZqIxZXGesFG8tyFTR3eFjkzN
         Trdx1xG4QxTBg==
Received: by mail-lj1-f198.google.com with SMTP id d12-20020a05651c088c00b0022d989d91caso4021117ljq.20
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=umuAKwTKb8yE9WwkqLjV1NuEa+crhr+K5jfCriD9wkk=;
        b=0Njt9tY9vqpl26Z73EXuaKGisGbd0hV2CxUdkoYs75BCRiCD4LdgSxe3NM8LZpr+kp
         lEAwjjsf2nm/NU+CFasPA2PHAeXZVndHVpPMzeToAqEkTJXKQoClwPhXNnSoOOSrw43J
         cAxzQRFX9dYpyKE2fLD3DFC/HQTEOFdKCH1tI7UkjNovpEsrOGdP0X6aAakd2UoyXW7b
         n5kASt8ZvXWTwCGCfHL/QaJaVPKYINviVOxrqCUKfX39WJCqjlaB+13g5g7qZZi5of9q
         UD5z9Y8e4nnW8Thxm8zzwCmCvwIGs4iksLrZohjYCZuCvdDYcaG5SQClnI8bsPWZ8M0+
         0ApA==
X-Gm-Message-State: AOAM530l+IQqzxrY2GmCPj3BUGzLWD08Q95vVrKC/rwuyaqm62wkzOcu
        38N+41goLSQmYryVR8m/lUdzHXj8B9p4eSaM5pQlG669DBXPJUnWfaLuUQZI2fL04JCqJ/HcgoD
        jJPDFx3X1JzQhiUbq83DWFlLCIAZspoUWCv6lyQ==
X-Received: by 2002:a05:6512:261e:: with SMTP id bt30mr15698664lfb.264.1640612171949;
        Mon, 27 Dec 2021 05:36:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznmc55u25BPLIRmeUc9OTW96YVQXWBrEmbf8C7hA3D8nLWO+K/o8U3VPkvvw7Nyo8EcVLSrA==
X-Received: by 2002:a05:6512:261e:: with SMTP id bt30mr15698647lfb.264.1640612171774;
        Mon, 27 Dec 2021 05:36:11 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 15/19] arm64: dts: stratix10: align mmc node names with dtschema
Date:   Mon, 27 Dec 2021 14:35:54 +0100
Message-Id: <20211227133558.135185-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Synopsys DW MSHC bindings require node name to be 'mmc':

  dwmmc0@ff808000: $nodename:0: 'dwmmc0@ff808000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 4a527d614ee5..eadc81dfaa79 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -296,7 +296,7 @@ i2c4: i2c@ffc02c00 {
 			status = "disabled";
 		};
 
-		mmc: dwmmc0@ff808000 {
+		mmc: mmc@ff808000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "altr,socfpga-dw-mshc";
-- 
2.32.0

