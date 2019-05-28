Return-Path: <SRS0=Al5s=T4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C3C282E3
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 08:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F8DE20883
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 08:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ctHKr1LQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfE1IIG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 May 2019 04:08:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34101 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfE1IIG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 04:08:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id e19so1639347wme.1
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2019 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWm2X3Q1SHaRgDsfdal1fBD3D11iGm4q8VAE3tF/iqU=;
        b=ctHKr1LQXJ5vP+6axdeIJ+V9sZIoJ9v88fbLhQZM9CKzXmPKQkACV1zNcuL8tJ3IMJ
         Rr1DCS+lh5kGaXqFNvk4djnFFALMezxEZjRxbuIis5bBwJNUlvWtFRKK/uEn+zW4Zfac
         L/TZNlxszvAq6Jn66/fzhWOKX8AgMU/+O7Fg6qXA8O85/VeLQYdT23bxkLcEZqM9gH3Q
         YtpcVM/waV9YLR+yD5a9vPmygzJqf9NIxa0BxO6+esIKwmlSMws8naJIAxCgVGEko01O
         WuEoHz98UtI3LtPrzzfxG4Ka6p4Usy5odhD69vW4wg7uEuxnAa8uyOb+m3GqJDGe9saZ
         W8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWm2X3Q1SHaRgDsfdal1fBD3D11iGm4q8VAE3tF/iqU=;
        b=YlJCSWKxN6xdCsXaX0vvAPZP/2xT9GHiuyLc2JgYBCbJDnzo+E3JaNtjiUHsPCi8Df
         hgCWgfE9aOyypSPEvFNPmjpZ+JHEDH7KbTIrtMu3ShaklgdP4FdV33obnwI61FRZKZeX
         S+czi2I6iGxSjXBXOd+PxYH8HS4KVnWvl2yM2dOHy8oHiX/g5hxk7BTraXTOPlk5qebi
         kE6K50HbEon2lqMRinXdHvU9QJCIZdF0RWpd1rXZZiY9aegP+0PEBsPNGmHV2N/JJ/lg
         5SDwqstUL0llwEcH6qdKo+7wGoEpud+h8BdYKKwukfY+3tnijl4wQuHq43waZ9B47iwt
         ULdg==
X-Gm-Message-State: APjAAAUAH+T9oHCso4EU//KO120hVkQiDThR6N6PEgfpECUCHB5oZR95
        lwraCUr9CNNnV6S5V8en9h9QOQ==
X-Google-Smtp-Source: APXvYqzCHJkvZAfJYctRLpCtxU9n2375PkWPEqPrqBU3t5zIM3N2tH7wsQ+C3uBM9n1nB4lMzlNv4A==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr2249738wmh.68.1559030884486;
        Tue, 28 May 2019 01:08:04 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z74sm2456121wmc.2.2019.05.28.01.08.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 01:08:03 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: clk: meson: add g12b periph clock controller bindings
Date:   Tue, 28 May 2019 10:07:56 +0200
Message-Id: <20190528080758.17079-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528080758.17079-1-narmstrong@baylibre.com>
References: <20190528080758.17079-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the documentation to support clock driver for the Amlogic G12B SoC.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12B has additional clocks like for CSI an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 5c8b105be4d6..6eaa52092313 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
+		"amlogic,g12b-clkc" for G12B SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.21.0

