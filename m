Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF9449BD63
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818661; cv=none; b=fU+3b4M/uhguoKccEGodSPna95vLvHHR3IO0Qo2h+eatjhwxuAoioHYOca28Psdtc1DwxihIWXnT77dcxDt49Rh0r/pBMbbrjjk6Le/z1YyVaEXZiERYj8DSluVH8kQLsevGL/ho8KKL9RUv5zw/3/22l4qh6qB/BlMWdSCY480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818661; c=relaxed/simple;
	bh=qI6zOkmEFj0l4I/SpYfq48uXMOvLdQ7LLkhW1No9yZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYISScOlxCRAvl4AR0vqkhtiV2Ez5r96J9Yh+juIqR8SiRu5Z0ww2hTeHwfvuNA0oYGfAoz+X1TDVQwGFcrSGPFrPUggz24iZwTN+21llMfU4uMo0+VqPBDT1pE4wCyfqCNRO8ZBCDkHzCto3gL5IpVVC4uUxxE1DndOL8kzDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=BS5ueC1l; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="BS5ueC1l"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8306b9f8so13651856d6.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818659; x=1792423459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHcOzpbWMU93Qrfa/l0Dgji3h4y5PhgvosY4FQWcj7c=;
        b=BS5ueC1l5w6AwWCwFJL/RYxM6sFt9cp4CA/XOr/rf2EfFYlYckGtgQWsqJljaOdxmU
         kCgDCnRKJ+4OZBfH8g/JougUcpjDzCwsD52mCWEOsFYZNBHtGtKriI3PM+8BOQrot7ov
         dlUY9La/9kL4D3FMD/mQqqGq+zBZfhLyVhQAQZD5abumf74nK6jXTLNwWyx8IT3LvyRt
         7dsnsymurNBzD3k+h9jc9fEyzwVc5PL42fzlXCUaqykZ5YbsljI3WsIZJi8Pdo6CQnL6
         Hi41XffQQMoK4qR5ShKx82oWvEVuaKcaV1FrG4gRoPouZUi+sIcDQbXKyEksmPdpLGb2
         OvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818659; x=1792423459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHcOzpbWMU93Qrfa/l0Dgji3h4y5PhgvosY4FQWcj7c=;
        b=py9SCh83HNrY4YKOr4XMZEEscm/v+WaKqJO9rkiFKt+q2M1+86XCVTnoTE8+KI3iuV
         rVq1H/7hYTHVUpC7V6WJeaMOybANLllgkOabRUNnVASVrAz6heOXkEhq+haLIskHUhHD
         uNaEOCmoLcpN5rOKihCGyB9KRbX4O9RrP2k/ROK0aI74g0l+CY9xwrjmD2s3521HdBMI
         ZCuYZBtNv2Oa6r45/ya6XEz1AsU9BGFHiPv1A5iAehXny9Lh4usERTvg5C82WctrvC2F
         d0UMvz2MrsNtaEZn1rbBt6Qp1Jf9QkaKgkfQTQrvI100HPCnVyAOR4hoF2NWFrY18Coe
         n1vA==
X-Forwarded-Encrypted: i=1; AKwUvBw5x2ScoCewHVJ47rjr3NfHfG4k+uqSer6wp7qumvn1ELXF+mluVgDqiMBhoKFq/CtJTL/IlUJFjFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvH8+k4DD5P3H62t5CExCvw4D0Ce2D25cYi5izs9IPeqN51Ji4
	iEiUPlvDYcKSeLM1dlNJHI1lBeyiVqjSj6uqSXPthFKKLM03j1WxI8PlulzOjoHior4=
X-Gm-Gg: AYBFou0guGtKtvJeFpkFokaGcZEH2kfwh3DMyCWFfcR5HRe4XFpWYYKikDyGahTzzNV
	AtC5/0+UvpJHNJaIbwI4L0U6y3C4MhWzkd9Lh6FLPW9zlEm8n51hg4ZaDlKp7Fbi5hp3JvLJZ+I
	xvqSYv4+UeZARPlMuLDSqIQjHZ7TJgftbsJQpGdSMAJgOWAzj2SdBL4QOCL9X/5BgmcP+hXuIGh
	Wh1g6yIeCJUgsnvMuo3fuOePba/f1ggh4GrrUcnI4z1gvKrPxVAwZ0NJ9F1pPrv53bzWQrKxHlt
	N60DtZDYhg9fK8A93gxcFG91K2FmakMhphFeWxr52QeUU0ymUejw42g8DJNKOsZlk8Lr1ImQqaw
	kWa8saXaIo7KM0G16HY8a966N2FwdjPqQLVqXZqRD+zR46/TnIhE7BzkNqFEUCSSV72nw6e01g5
	dktpZVeGHEcNMq7cr4NWaupX3gEpxvUx4Xj2pY1kdVgQY27yPfVKTMl4AjCWDPpT3CPGvBUIMig
	6M=
X-Received: by 2002:a05:6214:21af:b0:91b:8d9b:74f6 with SMTP id 6a1803df08f44-91b8d9b7649mr26732666d6.33.1791818658642;
        Mon, 12 Oct 2026 08:24:18 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller
Date: Mon, 12 Oct 2026 10:24:07 -0500
Message-ID: <20261012152408.3729237-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller within the TC9564 SoC is accessed via a PCI
endpoint bus through BAR 4 of the first embedded PCIe function.
A syscon node is created to provide access to a range of memory
that is used by the clock controller and shared with other devices.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: 
- What was formerly described as a "clock" node is now "clock-controller"
- Label for the 25 MHz input clock is added (new in this version)
- The clock-controller node is now a sub-device of the config syscon
- The config syscon is now (also) compatible with "simple-mfd"
- The clock-controller DTS node no longer defines a toshiba,config-syscon
  property, and the config syscon no longer requires a label
- The clock-controller now requires a (parent) clock property, which
  refers to the new 25 MHz clock

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index b8d290eed2f38..e7601daf1bc5a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/clock/toshiba,tc9564.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/leds/common.h>
@@ -891,7 +892,7 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
-		clock-25000000 {
+		tc9564_xo_board: clock-25000000 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <25000000>;
@@ -967,7 +968,7 @@ dev@0,0 {
 				#size-cells = <2>;
 				ranges;	/* This will be updated dynamically */
 
-				pci-ep-bus@4 {
+				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
 					compatible = "simple-bus";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -995,6 +996,19 @@ pci-ep-bus@4 {
 	};
 };
 
+&pcie_s1b5d0f0_bar4_bus {
+	syscon@0 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x2000>;
+
+		tc9564_clock0: clock-controller {
+			compatible = "toshiba,tc9564-clock";
+			clocks = <&tc9564_xo_board>;
+			#clock-cells = <1>;
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
-- 
2.53.0

