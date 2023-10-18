Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028B1CDB47E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 15:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjJRPeZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 11:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjJRPeZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 11:34:25 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3F2111;
        Wed, 18 Oct 2023 08:34:23 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-581cb88f645so1256980eaf.1;
        Wed, 18 Oct 2023 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643263; x=1698248063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIiKTx5IOMw+xS6ILlA9ImHqJslhy4Q4M/1NT+5NQHI=;
        b=BpnEEnr1/QJgHIvNKsa1S51vEqowy9iNRIRC5FtS/K9o4n2L85A0akdbaY3atOMNtT
         CT8yPvh2xC5MkaCJww/Sjs1YUD0uMu+Q/2Byvy075yTdZiPFRuiQMcZTF2py/TT9lPkk
         IZWOmmipJSlNzXAhslPhHa2obM6i7JfpNWxgzMI3cdQ24OOgjg7N7oiOOdMMK0yvsVI/
         56zJG7sveGGrCau/+Fh2WhK6y4LXYwUdZ6eIw6I+GqvKHNfcO0CnfWLu7+3Egbb22p5r
         YeOSNNIWdJ8mTi+ZE5Fgo6NcsY37yvSKJLR5vU/HRv7FA3c+nbEm+yZtn5y62qg8jWDx
         A08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643263; x=1698248063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIiKTx5IOMw+xS6ILlA9ImHqJslhy4Q4M/1NT+5NQHI=;
        b=dI8Hh7qe/17c+6uBGi9t15ouaB0Op8r7xiTjw82JwjuTnX0BjT6E0mOymTEg9FES90
         lpMIDyLS9GXtkvuxUzJnQQYmZfFEWHcu+PzLbRUparWjVSBiEM3dsJIt6fZebaBDE0uE
         td9X5J99r9zyJIBHwFs31qU8+yzMRA0IhkOgnJS5esbeNIW6AXEm4hCkijhGUrg7LT8S
         om0gmavWHwaPtquq6Re+jPv7dsdLkx2nLDHqQ1Cayt32bh5mbftsuZgqBKVsz7ulaguZ
         JD10sHh492wZpJx+SEvXq/4imx9q4v5yIePKh14A7WTNHxp8R+jVN3FLDcZoPb/MmEbp
         Go4g==
X-Gm-Message-State: AOJu0YxVrBmWtoTNSzS1hWBgerFDjGMck1I505LtdADYfQw7zyYM60kt
        VJoavURuR8j+m0XuVopWrBM=
X-Google-Smtp-Source: AGHT+IFN49iYKj94sO+Ii7NyZhe0uPOWsh2AzoBd1cwspGvFw5CSngytJLUvZOSbCwldCkXh2Jbjpw==
X-Received: by 2002:a4a:bf0b:0:b0:581:ed12:98c6 with SMTP id r11-20020a4abf0b000000b00581ed1298c6mr3410894oop.4.1697643263134;
        Wed, 18 Oct 2023 08:34:23 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id h16-20020a4ad750000000b00581e090fd1fsm523782oot.8.2023.10.18.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:34:21 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Remove UART2 from RGB30
Date:   Wed, 18 Oct 2023 10:33:57 -0500
Message-Id: <20231018153357.343142-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018153357.343142-1-macroalpha82@gmail.com>
References: <20231018153357.343142-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 has no onboard UART header, so remove the reference
to it in the device tree. This was left on by mistake in the initial
commit.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
index 3ebc21608213..1ead3c5c24b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
@@ -64,6 +64,10 @@ simple-audio-card,cpu {
 
 /delete-node/ &adc_keys;
 
+&chosen {
+	/delete-property/ stdout-path;
+};
+
 &cru {
 	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
 			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
@@ -149,4 +153,9 @@ rk817_charger: charger {
 	};
 };
 
+/* There is no UART header visible on the board for this device. */
+&uart2 {
+	status = "disabled";
+};
+
 /delete-node/ &vibrator;
-- 
2.34.1

