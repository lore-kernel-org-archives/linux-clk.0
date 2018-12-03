Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9A1C07E85
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C924B20848
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V9y1fEFC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C924B20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbeLCRRD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 12:17:03 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38562 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbeLCRRC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 12:17:02 -0500
Received: by mail-wm1-f67.google.com with SMTP id m22so6532550wml.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
        b=V9y1fEFCuD2h5uN7uD+DaVzIvzU86Lx4yzK6uxuJuZvEHPQcbmWNar7+BPBFt0RiPs
         uRKiBU5QQRJban/13TYK4baJkz4fVotz/nrqAvbhsmi+pAnPuBFjeCsYWCY8geeJ+ToC
         i4TyGm711cHH8ce5XBfJf+wRdW0oCYC9xcfOJAEt0RyO40tBskPSAefFQ3cBg0NT4pgB
         rXwt5U7kG/81STgqfrGTu+0khzDNlgDw/xlEulmgocf505qrCa04Z9l+MCPkFluTQhR4
         8NSmDGwm9W0gONByiN9txLhjn21d5IWDEMBbQQAlstFiLc/dr0DwMSirS6fKhYR3LqR4
         jnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
        b=al0VnSpNfQFADhrq73/8ZdciaFwHWsG1THz3exd9WJiFwVqy420wCYcb+TQKLm4JHv
         J7UzY5nNbD0Cy++bWe9TREcyCsEDJMSk1ZdxmvFXHLWqiScKMdzCgewY9TO5kpRNPooY
         bk6iYOdtsg1LMatoOZRHPu3IZNApUgvnVEXzD3YlU0LJnVEVeDxzEjaaYxaKJdBDr/ey
         9nuCx3HSWwZ5N7Nd4TKMaEy55ZzPhgSW2RfeR0tDHGwCJIbQYtmQCq2V81QtvP6vjdM5
         Pt/neTlZ4wqeEJXK3c/i9ilIsDkZv0wJGJg1lOg+zzqmkm1v2h0opqnxcpJHDY3puFVc
         0sPw==
X-Gm-Message-State: AA+aEWawN+s46X0DCm2kHcm6UpnbwfDJv0jYuhTZ6U8gUcx5USU/frCa
        mf40A1RlG+i2d6b9w+cmBobCIQ==
X-Google-Smtp-Source: AFSGD/V/bsrlHrXrvkgFoGA+uzecY9c85wUSZZyU7a47Du3yA4aU8OlPqQZ9CUrVa0WkhYEMFcJjwA==
X-Received: by 2002:a1c:588a:: with SMTP id m132-v6mr9040728wmb.85.1543857418700;
        Mon, 03 Dec 2018 09:16:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id h203sm22494889wma.19.2018.12.03.09.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Dec 2018 09:16:58 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: clk: meson: add main controller clock input
Date:   Mon,  3 Dec 2018 18:16:39 +0100
Message-Id: <20181203171640.12110-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..a6871953bf04 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,9 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks : list of clock phandle, one for each entry clock-names.
+- clock-names : should contain the following:
+  * "xtal": the platform xtal
 
 - #clock-cells: should be 1.
 
@@ -31,6 +34,8 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1

