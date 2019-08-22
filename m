Return-Path: <SRS0=TujE=WS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CB8C3A5A1
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A477E23401
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 14:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bLOp1aL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388018AbfHVOZC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Aug 2019 10:25:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40265 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387987AbfHVOZC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 10:25:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id c3so5618719wrd.7
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=532R/ZWuiDeQURoM9QVstK3VNVhlUb1b5wMTdcD1y6g=;
        b=bLOp1aL7F9THqfOV7Xme5zs7Clfg5QY4THoC3eh0rpK44IWqhwMShz0XtR/iqKv8kc
         NcQFoFY3MPRkiYgSRInPWeijRXC5S5f1rqLaSjPnKUoRSjG+eI/aOj7CvEefd4KmH/g8
         UDbf+h2tWFy8sjTBM8VbqE7RXx9e/19Xz+PxO7P48ixBT665fCzijh+eVYDnKaQUAXbp
         boZg+ini8cDQ9V7X9MhxT/SQPvbX6PZ3XuTgdtOJXKKwfG2+F7UZUNv78y7T6ckNRVMn
         H3BTICzwaKMl8djlpygj5xvQ9ogRv12RtOHsHbmYkOisf7LLjUix1ka3IbRQAxM9GhbO
         SDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=532R/ZWuiDeQURoM9QVstK3VNVhlUb1b5wMTdcD1y6g=;
        b=bmQspcPzzU2i4RzSYhmTILN6214gPAB0hYCz87L99E+cdaCKlOs2dn9WjX+IzkZDj5
         XReWS1G1UUfvelKSB+AYOnRSFjI1tVj05cIoECo97RPuMtVP6X1o2Yhe6vYShXimMpWW
         sgLkYkJTxmeGnEgxbxJaAjE+rwo7NpuSjqu0vZEGLxcD2/onLKsRZQ5sleCn8wK+q4h0
         xOIXphBx0cSCGFxeWqEG0w/WLjvLJojV8N7HSW8MJAD4zwMYJkHHuFanp7p4Tqf9/TMp
         UVFRvcQFP25ws4g66l9tifebV3C1HBP8mVkqxLDHS9eBh+LCu8cVsPgpKvRctUeIzqwo
         3tVQ==
X-Gm-Message-State: APjAAAVxjLVtS689k+JHqRK8nbIWNWF+/gKlcvkEWkrlfA37/gHpHFfZ
        d+PZ6kfVAz1tWfrkgGx0tDGRUg==
X-Google-Smtp-Source: APXvYqxNvQfiW+pmE3LmlxBbVlKlHM6v/pU91KToTSnslnmLS0Z+eHTKFQz+xNljPf3GF3C7gC2pJQ==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr25260602wrj.232.1566483899812;
        Thu, 22 Aug 2019 07:24:59 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 07:24:59 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, jbrunet@baylibre.com,
        devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clk: meson: add sm1 periph clock controller bindings
Date:   Thu, 22 Aug 2019 16:24:50 +0200
Message-Id: <20190822142455.12506-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the documentation to support clock driver for the Amlogic SM1 SoC.

SM1 clock tree is very close, the main differences are :
- each CPU core can achieve a different frequency, albeit a common PLL
- a similar tree as the clock tree has been added for the DynamIQ Shared Unit
- has a new GP1 PLL used for the DynamIQ Shared Unit
- SM1 has additional clocks like for CSI, NanoQ an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 6eaa52092313..7ccecd5c02c1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -11,6 +11,7 @@ Required Properties:
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
 		"amlogic,g12b-clkc" for G12B SoC.
+		"amlogic,sm1-clkc" for SM1 SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.22.0

