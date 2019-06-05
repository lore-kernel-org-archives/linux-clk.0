Return-Path: <SRS0=XCXc=UE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FF4C28CC5
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 23:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A526020830
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 23:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quruOtem"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFEX5g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jun 2019 19:57:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55072 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEX5g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 19:57:36 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so548563wme.4;
        Wed, 05 Jun 2019 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a+G/2dEOEsnbE77njerY0dEzhggxdzBtc1olhGXytlg=;
        b=quruOtem69W2QhHEuO85YEGHSWX2GXMMgVEsWJmX87XrfX+oEFF4uqGgMWHqlN7l5k
         Fcp61ocf49ehUcoMtvgScur1z5OfJIZA6qCWYD/RfO1FBQEr3HQGq5D53B1CQ3cF30oX
         nC0DA/mYvfrXxmd0nJ2l36rT6VBf9nJYnsSevgquaNLY94nDX4ue7ndVxaaEvQcPQ/g4
         zxTPG2Ri/yV8p6gBMX5mWZt7pnq/XXPJx2ExC6la9VUIpV96uiAAN/SGlQ0QOx1XRS+s
         B0fa+rHOPACOoJlxcoKBUDfIhiHJHKNV8556tjx4u10IXAXHb2B+GaUuTsoCN1VC2mcd
         3J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a+G/2dEOEsnbE77njerY0dEzhggxdzBtc1olhGXytlg=;
        b=A+c96pwsmFrJ9KVT5mQ4w16u1F6wURjwhdTLuZ/R0IkJlW3hT+GkocroULHWzn8j4i
         awHqNYx4qDIVW6tSkHwUHjo+L6HYRIpXMW8PuThxRAXhlUd1bd1EfP394LFy3ZMLd6Te
         raqpXE7UGTvdw1pqOGv29ECLo3xEoWXr4mWgZebsEx//gN/dxQhNrnZ7J3BLBbfbwPDA
         9XZfNDEPbUNSzHJwUmTLD6F7c6srT7DRkvdJga7Kq+JEGe2sp8+KsEHwgZtctj3T72ih
         l33GDNPlfgbuuawfaVDUeJn9UkK6SsWwCsFYRlhs4ZbWRCuGNsS56J/zw6y5jnEfYdXg
         8+yw==
X-Gm-Message-State: APjAAAXNibylH+ERld/OG9SQiTOMKkqIELygrNHkeaZkiwidydP+ETlK
        OD8msdTsJfPOG31alEVryT0=
X-Google-Smtp-Source: APXvYqw+F3qx6Zsh+mA0aetKfVYltOG6KeaG0XDLA9aqdK2eY7tXvI4nC/JkW915YNGhTbRYU2uaUw==
X-Received: by 2002:a1c:f408:: with SMTP id z8mr23548559wma.140.1559779053877;
        Wed, 05 Jun 2019 16:57:33 -0700 (PDT)
Received: from X555LD.home ([2a02:85f:1501:7500:4991:f471:d726:d8ee])
        by smtp.gmail.com with ESMTPSA id q15sm245915wrr.19.2019.06.05.16.57.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 16:57:33 -0700 (PDT)
From:   "Leonidas P. Papadakos" <papadakospan@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: enable rk3328 watchdog clock
Date:   Thu,  6 Jun 2019 02:57:14 +0300
Message-Id: <20190605235714.22432-2-papadakospan@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605235714.22432-1-papadakospan@gmail.com>
References: <20190605235714.22432-1-papadakospan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: <itdaniher@gmail.com>

Add the missing clock property for the watchdog on rk3328.

This patch depends on:
clk: rockchip: add clock for the watchdog pclk on rk3328

Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi       | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index 5d499c908..49d51dd93 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -349,3 +349,7 @@
 &vop_mmu {
 	status = "okay";
 };
+
+&wdt {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 7cfd5ca6c..18a3e0dfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -405,3 +405,7 @@
 &vop_mmu {
 	status = "okay";
 };
+
+&wdt {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 994468671..e0a6279da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -407,6 +407,8 @@
 		compatible = "snps,dw-wdt";
 		reg = <0x0 0xff1a0000 0x0 0x100>;
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_WDT>;
+		status = "disabled";
 	};
 
 	pwm0: pwm@ff1b0000 {
-- 
2.21.0

