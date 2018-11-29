Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6EFC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA2CD20989
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P1WlIP5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2CD20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbeK3Dvu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 22:51:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40411 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbeK3Dvd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 22:51:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so2583003wrt.7
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLou7dz6KpGeOcdPws8u1aBOfWLU1UkVe4gPfxDCfrk=;
        b=P1WlIP5Kc76QrXy9Wia3bb0nq5VTZ95vXfTAPbGbh+Spe23mkzMStCbqfraD7/eYRn
         kyxdINTXLrCLmXiQS//jVkrRP4FWTY4NMSLzQtIVETV7W3KDw/sq3jHxB7eEqUEA2ZYP
         gyaMbMqR7eBouti0krrLtdy3DNzYsoNZ2iazlpIMzMj2oGY+dQIXnADQwnxaPMhz72hL
         1FyHYz3WLHE60GfSm3e3FWvN78k/Xybq1GErXWmFuW16zFHQNnYOcsRMova2pDrojQXn
         qtCLDT7nPczexkEIcHc2gAM1hm+b125Gfpb78zTLQJbM3GkEiqShUBUP1mX/LHu1+N4r
         qrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLou7dz6KpGeOcdPws8u1aBOfWLU1UkVe4gPfxDCfrk=;
        b=oRpo5wGbpsr4aQ4YysUNGNKbFhTJ8SjzRceazI4IMtKai7/tB8S/6Gd72MtCHFWyMc
         cpTEAE7SIRoT1vHbkob9EGVmSK9wdsUW2MT6GXFCe6FpLo2MTm/KPV8lTnjAF/EHdqDb
         4dRDoPWoAURFZyaQW5KVsv0RHqyzxE1pOwXI88zwcgLX9gfB9DKIzRvzizGBx4E2fI90
         aFQf0zXn7QVW6VAqEmU85YeOAsVw92TPQ9pU9yX+iFxH3lxmW4YdM2HCdDOKxwGZyVYl
         Z2ay9q1JaZc3aWoy30xjRgSNWPgzdeDzkjtDCluEEW470px42b207YNcB57L+SN73y0d
         uVuA==
X-Gm-Message-State: AA+aEWYoHuCWuGy9gDh4A8oTxILCEebWv/lMGxzH6SOQ6uSGiMNzWc52
        BNbl3g9G45icxRwpYE5y6WcOpw==
X-Google-Smtp-Source: AFSGD/XJVzqD8Bevf0E6VAajZr7dxenfYwYpoeWVVK3O2YYBunsucT3udfZ72nG+0NPadhfr17Ua0g==
X-Received: by 2002:a5d:63c3:: with SMTP id c3mr2053402wrw.215.1543509932876;
        Thu, 29 Nov 2018 08:45:32 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id d4sm2721909wrp.89.2018.11.29.08.45.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 08:45:32 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clk: meson: add ao controller clock inputs
Date:   Thu, 29 Nov 2018 17:45:22 +0100
Message-Id: <20181129164524.18670-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129164524.18670-1-jbrunet@baylibre.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock inputs of amlogic AO clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index 3a880528030e..c480db8f4793 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -11,6 +11,11 @@ Required Properties:
 	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
 	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
 	followed by the common "amlogic,meson-gx-aoclkc"
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "xtal"     : the platform xtal
+  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
+  * "ext-32k"  : external 32kHz reference if any (optional)
 
 - #clock-cells: should be 1.
 
@@ -40,8 +45,9 @@ ao_sysctrl: sys-ctrl@0 {
 		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		clocks = <&xtal>, <&clkc CLKID_CLK81>;
+		clock-names = "xtal", "mpeg-clk";
 	};
-};
 
 Example: UART controller node that consumes the clock and reset generated
   by the clock controller:
-- 
2.19.1

