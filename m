Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F162CCDB47E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 15:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjJRPeW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 11:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjJRPeV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 11:34:21 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDADD111;
        Wed, 18 Oct 2023 08:34:19 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-581d487f8dbso1034162eaf.1;
        Wed, 18 Oct 2023 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643259; x=1698248059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KzXz3q7UxD8yzrIaZqXLlJtzg+A1VIwmVfWbANSNxk=;
        b=cE2qKWZAi2J/5TDbkZVNEsKwgIWwK/PcJ/ssP2ts9QpckE3j2+4+bo+I4kZWFyEa2k
         NozhDWWoRnCHOs3RIkJnltdTei8inIg+Qi0EIb31/BpM2K7tCIVD77v1yNsLgMPGR1wp
         3uVEfDeRfGOvuvA5lPyDyo7LrBiHWVYEjLuIAvGBnDmRwfaxPmsUSXc2R52zvvDeHuKv
         TTTAjYWc8sIr/R4stk1IFZRm5BZ+nrpDxGbcYymVFxc/HNvm4Z17OGB0H/nNvNXS4CmJ
         LGknh1j0exw2VfMm3ExlpLKV75lNNZr2PO2xYdsjw7FIH7gui/h08+pIeop26qW2uWsx
         jWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643259; x=1698248059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KzXz3q7UxD8yzrIaZqXLlJtzg+A1VIwmVfWbANSNxk=;
        b=eidVVr9phdBsKBxKvIDvC35ruu2nZcAtX9XGxxAK8EJsYSlFhy0GnSLwcBBnZvm9/C
         TPFePsbWuf8brSdWSpJtXDKTnbSJx9vAHKrK9nUfgfKrDIgacheMFmaQLS84kBtmJJD3
         iACAWDZP5RMK28YXXAFJC5qAy93Mb0oMf6HpMqDhg2WQB/rib4uprCEgXFL9Y/6PAsXW
         7kRPWDX1/eP/7pg9cccQ+MrLBEzbifAmjsy7lEALGtz72QS1hO1aJmV7Res2xTd+u2Rr
         UI4RGaexAc2CwhEmTAIV3m5zKnqQfZ2L4NtqCffnQIVxk5iCQNho0jQe1RcD5rEbzFrq
         1uBw==
X-Gm-Message-State: AOJu0YyEHd6nG4lkyEAjzQuewP+vFRPc+tQicNW7aRV2wCUN8IE1fTJg
        kUt+Go/hXqCcJt5Rrfa4IWQ=
X-Google-Smtp-Source: AGHT+IEL1iEm/4noFAPKBHY/aZb1xaW7voyUJp5gaU5xNsKksALHSoYPn96HXOSnmMvff6IagNC7tg==
X-Received: by 2002:a4a:4304:0:b0:581:3e09:2623 with SMTP id k4-20020a4a4304000000b005813e092623mr5207123ooj.2.1697643259195;
        Wed, 18 Oct 2023 08:34:19 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id h16-20020a4ad750000000b00581e090fd1fsm523782oot.8.2023.10.18.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:34:17 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Update VPLL Frequency for RGB30
Date:   Wed, 18 Oct 2023 10:33:56 -0500
Message-Id: <20231018153357.343142-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018153357.343142-1-macroalpha82@gmail.com>
References: <20231018153357.343142-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Set the VPLL frequency for the RGB30 to 292.5MHz to support running
the 720x720 display panel at 59.97hz. Without this change, the panel
runs at 59.08hz.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
index c7828c99a1bb..3ebc21608213 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
@@ -68,7 +68,7 @@ &cru {
 	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
 			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
 	assigned-clock-rates = <32768>, <1200000000>,
-			       <200000000>, <108000000>;
+			       <200000000>, <292500000>;
 };
 
 &gpio_keys_control {
-- 
2.34.1

