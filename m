Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A49C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CEC8611CE
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239663AbhI1Ivi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:51:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48172
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239694AbhI1Ivh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 04:51:37 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D043540257
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632818997;
        bh=v20vzGvpKOribJ20xC/9VCM3R/uezZSx/XMUZB6UVm8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=DfFm55n0mTX7Ub5BgElzmsPlapzLra6xgsUekULZKfjbTahDjtuEQ/bKPO+6vCrlk
         x7vVCaFWvPNrBIEoSfHW57jXZrebyMbch9MqFVEEAqlvPIha9q+rMtpkYrcd4HPsEh
         neQb9je4AHZD8up4ytb7AGwvTkynreYDAG9I1PdUDjnMUkNXLu3fxysW9ajOAjbnck
         vXTtZ8eMEQUSUDtQyX3E6XKwWqNwH/7ZmVmAsNVna7S8zXvQcGKXB0hrxVzswrDWd8
         CN/SfnRO87QVAj+1U3NcJUdpoykQZl+Ifj5+mUbiOwuaULdDA03dELeysFFlLnfVTJ
         0ZxNR4QXBH/4g==
Received: by mail-lf1-f72.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bso18608048lfo.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 01:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v20vzGvpKOribJ20xC/9VCM3R/uezZSx/XMUZB6UVm8=;
        b=zsdznY9xUuumMKrOukRrZTxMKQ76+xXJvzcIZnYui3vZr3ulAAYax+oSzgosFx1ogO
         0FX5mlnbXKu1SwzM5zFEPwiarRjSq1nGXRxarVm0FitrD2stPQ1rk9EZy/sbyWaETEpM
         NKL2iWnNs0WX9E/6DzYrcGSLBO7IsMI5WKvWGKAuMs8MtAg5itKRWv+6bwVhAa0mJEK9
         oC7bULCTF5EhihDPWi84FuQYwwLx6+elVOfS9en+i1NnhmAeecLZwG2FZNaj3i6KyYXH
         5Pbyeb17QhQ34IiXjZ0Q/jyjzQtS+U4ogU9WVtSPMbPrFLqHTraw4xvwEODIer2eMIRs
         vgLA==
X-Gm-Message-State: AOAM532yda0MZJRGk0/kLvd4BzMXz6qgcuuSxRPVktofJKDiBEm3DMer
        y1RuHkjlsmKdqlKWzPlTzTHS6+QZxga4h2wmuz8Fi/T5p/0t9pgz9Ne9izEekL4wOi/TS1KTz28
        P1QyhAkEDhHGrmJcpHNJ3ehtpK8HzdKbsMs4AXA==
X-Received: by 2002:a2e:a78d:: with SMTP id c13mr4516786ljf.314.1632818997184;
        Tue, 28 Sep 2021 01:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn1DZ4C+fEVaEYbQRrX8F3NoN0kRzP4cvC16ni48lRwLDjdgeQWKFdTOyfrNO56dsRHkODKQ==
X-Received: by 2002:a2e:a78d:: with SMTP id c13mr4516764ljf.314.1632818996961;
        Tue, 28 Sep 2021 01:49:56 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:49:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH 01/12] regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
Date:   Tue, 28 Sep 2021 10:49:38 +0200
Message-Id: <20210928084949.27939-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver and its bindings, before commit 04f9f068a619 ("regulator:
s5m8767: Modify parsing method of the voltage table of buck2/3/4") were
requiring to provide at least one safe/default voltage for DVS registers
if DVS GPIO is not being enabled.

IOW, if s5m8767,pmic-buck2-uses-gpio-dvs is missing, the
s5m8767,pmic-buck2-dvs-voltage should still be present and contain one
voltage.

This requirement was coming from driver behavior matching this condition
(none of DVS GPIO is enabled): it was always initializing the DVS
selector pins to 0 and keeping the DVS enable setting at reset value
(enabled).  Therefore if none of DVS GPIO is enabled in devicetree,
driver was configuring the first DVS voltage for buck[234].

Mentioned commit 04f9f068a619 ("regulator: s5m8767: Modify parsing
method of the voltage table of buck2/3/4") broke it because DVS voltage
won't be parsed from devicetree if DVS GPIO is not enabled.  After the
change, driver will configure bucks to use the register reset value as
voltage which might have unpleasant effects.

Fix this by relaxing the bindings constrain: if DVS GPIO is not enabled
in devicetree (therefore DVS voltage is also not parsed), explicitly
disable it.

Cc: <stable@vger.kernel.org>
Fixes: 04f9f068a619 ("regulator: s5m8767: Modify parsing method of the voltage table of buck2/3/4")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s5m8767.txt    | 21 +++++++------------
 drivers/regulator/s5m8767.c                   | 21 ++++++++-----------
 2 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index 093edda0c8df..d9cff1614f7a 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -13,6 +13,14 @@ common regulator binding documented in:
 
 
 Required properties of the main device node (the parent!):
+ - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
+   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
+
+ [1] If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
+     property is specified, then all the eight voltage values for the
+     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
+
+Optional properties of the main device node (the parent!):
  - s5m8767,pmic-buck2-dvs-voltage: A set of 8 voltage values in micro-volt (uV)
    units for buck2 when changing voltage using gpio dvs. Refer to [1] below
    for additional information.
@@ -25,19 +33,6 @@ Required properties of the main device node (the parent!):
    units for buck4 when changing voltage using gpio dvs. Refer to [1] below
    for additional information.
 
- - s5m8767,pmic-buck-ds-gpios: GPIO specifiers for three host gpio's used
-   for selecting GPIO DVS lines. It is one-to-one mapped to dvs gpio lines.
-
- [1] If none of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
-     property is specified, the 's5m8767,pmic-buck[2/3/4]-dvs-voltage'
-     property should specify atleast one voltage level (which would be a
-     safe operating voltage).
-
-     If either of the 's5m8767,pmic-buck[2/3/4]-uses-gpio-dvs' optional
-     property is specified, then all the eight voltage values for the
-     's5m8767,pmic-buck[2/3/4]-dvs-voltage' should be specified.
-
-Optional properties of the main device node (the parent!):
  - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
  - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
  - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 7c111bbdc2af..35269f998210 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -850,18 +850,15 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	/* DS4 GPIO */
 	gpio_direction_output(pdata->buck_ds[2], 0x0);
 
-	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
-	   pdata->buck4_gpiodvs) {
-		regmap_update_bits(s5m8767->iodev->regmap_pmic,
-				S5M8767_REG_BUCK2CTRL, 1 << 1,
-				(pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
-		regmap_update_bits(s5m8767->iodev->regmap_pmic,
-				S5M8767_REG_BUCK3CTRL, 1 << 1,
-				(pdata->buck3_gpiodvs) ? (1 << 1) : (0 << 1));
-		regmap_update_bits(s5m8767->iodev->regmap_pmic,
-				S5M8767_REG_BUCK4CTRL, 1 << 1,
-				(pdata->buck4_gpiodvs) ? (1 << 1) : (0 << 1));
-	}
+	regmap_update_bits(s5m8767->iodev->regmap_pmic,
+			   S5M8767_REG_BUCK2CTRL, 1 << 1,
+			   (pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
+	regmap_update_bits(s5m8767->iodev->regmap_pmic,
+			   S5M8767_REG_BUCK3CTRL, 1 << 1,
+			   (pdata->buck3_gpiodvs) ? (1 << 1) : (0 << 1));
+	regmap_update_bits(s5m8767->iodev->regmap_pmic,
+			   S5M8767_REG_BUCK4CTRL, 1 << 1,
+			   (pdata->buck4_gpiodvs) ? (1 << 1) : (0 << 1));
 
 	/* Initialize GPIO DVS registers */
 	for (i = 0; i < 8; i++) {
-- 
2.30.2

