Return-Path: <SRS0=wuwk=NI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FD7ECDE44
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0D1D20665
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hYoL8SmV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D1D20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbeJ1Uxj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 28 Oct 2018 16:53:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39937 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbeJ1Uxi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Oct 2018 16:53:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id i17-v6so5622633wre.7;
        Sun, 28 Oct 2018 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLGsgKw0hn+ynovVn/Gnvr2XfVmvYqxS2dkX4QEMo1g=;
        b=hYoL8SmVGWrl5BckB3kBPFtwuFoe87F7u1itqHz8NlXpSasys5hXmOjI/npIqe/Rqs
         XI4jUE+pwwr1kOjcWsoeA4jCsxooD/Mz2vUt4h9WyFV326dr4MKtSbzehJ6SiEtvOn7k
         0RRQJPiCKf0rva0NYnUrEGrmZAwTJoMPPiLZuDYY2bweJpawRDmI8h+Rh7vzXxwZKfe6
         6L4QO5L1+zccflCR4xNOxZeBTuFOXy9LNCbwruJfQEhpPfCrr6SjWMKqPFcpdIv+hYyg
         AmkuuBI641BD+zqv4n06jZMMgFqpTFUYLuKKYC3JR6EnCR/FlOGtp/Qgy08g8vBDROTq
         9xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLGsgKw0hn+ynovVn/Gnvr2XfVmvYqxS2dkX4QEMo1g=;
        b=TI4xZnldaL4ePSsmAje6jKfiaqzfr3AOMY0iNBGS1Ek8tbrrleurse31SpSIk6MVyw
         voRnYx6bJffTCZjvjz6PWjHdqWJMaz2iNnT4+qWvyGwzXcBD9/Tm6l1sI19Yfj6awMjc
         WQkRsSHp7CBk2PS3XQGxJyFatvEhS6L5rg3eMfcpdlOc9Vqrdiq8p981Mkv4WcxZiTWz
         Fo11QtPr0MrnYljfZBfFUVIxN6CUi0EeuEbWmeMIqGVcOiqbZ5MsCycKhCyezvSINbRD
         Fsz2/B6PtzixcPNEpu21wbZtQaseSag9B2k2YwCFcyqc4EevI3MzKLFef2Rp2OxGNydq
         2rDw==
X-Gm-Message-State: AGRZ1gICqoJX4sAKl3d5UzuZM9Klxxt/OS2WknTwei+qr2fkqFpY9OC3
        sEANOn8lxjoHV4vWmT9becwkG/hf
X-Google-Smtp-Source: AJdET5f/uFWEY3fP9Nrs0bYok6KkvH8upi0QPobheDw5FHDPzVf2OFbWJ4s53TQejLDmZA6ahB9MZQ==
X-Received: by 2002:adf:e808:: with SMTP id o8-v6mr1909967wrm.112.1540728549089;
        Sun, 28 Oct 2018 05:09:09 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD7072200691979D1FB980407.dip0.t-ipconnect.de. [2003:dc:d707:2200:6919:79d1:fb98:407])
        by smtp.googlemail.com with ESMTPSA id 193-v6sm11699772wmj.21.2018.10.28.05.09.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Oct 2018 05:09:08 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: meson8b: use the registers from the HHI syscon
Date:   Sun, 28 Oct 2018 13:08:57 +0100
Message-Id: <20181028120859.5735-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock controller on Meson8/Meson8m2 and Meson8b is part of a
register region called "HHI". This register area contains more
functionality than just a clock controller:
- the clock controller
- some reset controller bits
- temperature sensor calibration coefficient (only on Meson8b and
  Meson8m2 - one one out of five TSC bits is stored in the HHI
  registers)
- HDMI controller

The HHI register area may be accessed concurrently. Allow this by using
a "system controller" as parent node.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/clock/amlogic,meson8b-clkc.txt         | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index b455c5aa9139..4d94091c1d2d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -9,15 +9,13 @@ Required Properties:
 	- "amlogic,meson8-clkc" for Meson8 (S802) SoCs
 	- "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
 	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
-- reg: it must be composed by two tuples:
-	0) physical base address of the xtal register and length of memory
-	   mapped region.
-	1) physical base address of the clock controller and length of memory
-	   mapped region.
-
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
 
+Parent node should have the following properties :
+- compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
+- reg: base address and size of the HHI system control register space.
+
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
@@ -30,9 +28,8 @@ device tree sources).
 
 Example: Clock controller node:
 
-	clkc: clock-controller@c1104000 {
+	clkc: clock-controller {
 		compatible = "amlogic,meson8b-clkc";
-		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.19.1

