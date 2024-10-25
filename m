Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB0217678
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876602; cv=none; b=Apk0YJocpvtZv5yL8sL0Oi7h3iq/fKlu6EKpy1ddTnp7LF0KDjMJd0xJJj74JRPzlZYYnWIMn6tWd3j7VkwVepp0TI5Rr5Eyu3W4aq4RKILrTsahDIkh0ieb4UKf+qvNkmLq5hkE4Px0I40Q3h3yPcLq3tdj73aGpGLPvtGDh7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876602; c=relaxed/simple;
	bh=nMBH0rWLQkU2soF+Cg2c4yz0aba3rmak7d2lggM5H44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2YnKqAmj+vaklOVLHs/0SP5AAesN02Q6fO7nuEn0PeNLWJg9X9iu/x/BP05H7s2+JHZD+y+ieIU3fvO1iZcR6iide10pztbFAGnhjZjJLQF56iBehwZs2iziDcldsJRyBLVdMEReZG1nRKEBsVWvPDhtKqA+Rp179k0YHPESXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iPiniljf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iPiniljf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43152b79d25so20755935e9.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876595; x=1730481395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=iPiniljfvGf/M21704gt2l1jqwdzOlJjIRhoKQ1Rjy1jM7lt9JQWHkB+l9adU39vMz
         /vs4mzTcsLlNuqt0YI0skXwAGblcUVOlXVZ7yvBUfY6ZvGmZ1JEFeX/CmoeRfg6MRob2
         qilHyEMud8J/o5Zc7EFZlMg4hMFW0SmB5jEuc/bC97vYUkT8Cc+xJfTC5UxBus1sGjy6
         Md5fJ5/HzZFtKi2VoCwVtLj0Wxcm1IABHRH2PhX5VIK2TDk10DgHONAKawU5HbXo3Dn4
         fjNHX79iiWpJcuRBI2DvT8I4xvlnlf1CKGUxvFCknVtv++uzkSPSdiBiwEv69ZeWX1zD
         Wm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876595; x=1730481395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEz4/9qLe30swJeAKIBBvm5fHc5WeQ4yezYVAmOgKA=;
        b=FU4u5wQrTnzSW/6dMQcKHSGBhatNXJtQHm3InXixrsSWBssCNGKTLu/Bo71kuxJWy9
         As/QBwis3W5w4jxkfda8ZrD/Nm7EoVrIbbPoujEE4EFtqLEeaiTNrSEDO2umit9pfqJI
         cXOXkHUDAJSM3nVFWVKMvwh+3piWKCmk2lz5VfNsZsBLA8Amq5lexToqXC4WxsvQj1zr
         OPSWmZ0PbW2OhdlVLZdUmhlN3XfgmwnnXFJ2Y84zWDN0PuBOopLvkdctmxCPxpheU/p8
         2w33vDEhfLjEyT58+shphVQQlzX52ZLlI6xVXJyoEbytey7bSrK1otC21fxBymgrLr/l
         sZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+z4lD4cRiQRODUc0IVUmqa2LixMQLQ+VIcQ5kaSwz3kROVIXQu/PpDO56uR4Ea1U1rpSSqxyEecg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjtUDvOwxH4eDfQ1EXW3iA+RuBIrp5bXdx8uYtWiYQWpcTZPY
	RFnstETRFDklqh8rsc6B2/YL4K2dDDWmzoz0/miA395rQlt9SId0sF+A87Tn71c=
X-Google-Smtp-Source: AGHT+IFIR9g4wPz9AIYx6zXI6mtmRWJRoukoFOA0zSanhmararEgIJGNhppbZKvOIcKdNVw/sX50cg==
X-Received: by 2002:a05:600c:1d84:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-4318413f0a8mr100184415e9.14.1729876595075;
        Fri, 25 Oct 2024 10:16:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:06 +0100
Subject: [PATCH v2 35/36] arm64: dts: broadcom: Add display pipeline
 support to BCM2712
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-35-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds the HVS and associated hardware blocks to support the HDMI
and writeback connectors on BCM2712 / Pi5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |  14 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi        | 188 +++++++++++++++++++++++
 2 files changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 92a2ada037f3..fbc56309660f 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -88,5 +88,19 @@ power: power {
 		firmware = <&firmware>;
 		#power-domain-cells = <1>;
 	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
 
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..39305e0869ec 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -265,6 +265,172 @@ gicv2: interrupt-controller@7fff9000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		aon_intr: interrupt-controller@7d510600 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7d510600 0x30>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		pixelvalve0: pixelvalve@7c410000 {
+			compatible = "brcm,bcm2712-pixelvalve0";
+			reg = <0x7c410000 0x100>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pixelvalve1: pixelvalve@7c411000 {
+			compatible = "brcm,bcm2712-pixelvalve1";
+			reg = <0x7c411000 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		mop: mop@7c500000 {
+			compatible = "brcm,bcm2712-mop";
+			reg = <0x7c500000 0x28>;
+			interrupt-parent = <&disp_intr>;
+			interrupts = <1>;
+		};
+
+		moplet: moplet@7c501000 {
+			compatible = "brcm,bcm2712-moplet";
+			reg = <0x7c501000 0x20>;
+			interrupt-parent = <&disp_intr>;
+			interrupts = <0>;
+		};
+
+		disp_intr: interrupt-controller@7c502000 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7c502000 0x30>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		dvp: clock@7c700000 {
+			compatible = "brcm,brcm2711-dvp";
+			reg = <0x7c700000 0x10>;
+			clocks = <&clk_108MHz>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		ddc0: i2c@7d508200 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x7d508200 0x58>;
+			interrupt-parent = <&bsc_irq>;
+			interrupts = <1>;
+			clock-frequency = <97500>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		ddc1: i2c@7d508280 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x7d508280 0x58>;
+			interrupt-parent = <&bsc_irq>;
+			interrupts = <2>;
+			clock-frequency = <97500>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		bsc_irq: intc@7d508380 {
+			compatible = "brcm,bcm7271-l2-intc";
+			reg = <0x7d508380 0x10>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		main_irq: intc@7d508400 {
+			compatible = "brcm,bcm7271-l2-intc";
+			reg = <0x7d508400 0x10>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		hdmi0: hdmi@7ef00700 {
+			compatible = "brcm,bcm2712-hdmi0";
+			reg = <0x7c701400 0x300>,
+			      <0x7c701000 0x200>,
+			      <0x7c701d00 0x300>,
+			      <0x7c702000 0x80>,
+			      <0x7c703800 0x200>,
+			      <0x7c704000 0x800>,
+			      <0x7c700100 0x80>,
+			      <0x7d510800 0x100>,
+			      <0x7c720000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			resets = <&dvp 1>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <1>, <2>, <3>,
+				     <7>, <8>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "hpd-connected", "hpd-removed";
+			ddc = <&ddc0>;
+		};
+
+		hdmi1: hdmi@7ef05700 {
+			compatible = "brcm,bcm2712-hdmi1";
+			reg = <0x7c706400 0x300>,
+			      <0x7c706000 0x200>,
+			      <0x7c706d00 0x300>,
+			      <0x7c707000 0x80>,
+			      <0x7c708800 0x200>,
+			      <0x7c709000 0x800>,
+			      <0x7c700180 0x80>,
+			      <0x7d511000 0x100>,
+			      <0x7c720000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			resets = <&dvp 2>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <11>, <12>, <13>,
+				     <14>, <15>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "hpd-connected", "hpd-removed";
+			ddc = <&ddc1>;
+		};
+	};
+
+	axi: axi {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
+			 <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
+			 <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
+			 <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
+			 <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
+
+		dma-ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
+			     <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
+			     <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
+			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
+			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
+
+		vc4: gpu {
+			compatible = "brcm,bcm2712-vc6";
+		};
 	};
 
 	timer {
@@ -280,4 +446,26 @@ IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	clk_27MHz: clk-27M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <27000000>;
+		clock-output-names = "27MHz-clock";
+	};
+
+	clk_108MHz: clk-108M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <108000000>;
+		clock-output-names = "108MHz-clock";
+	};
+
+	hvs: hvs@107c580000 {
+		compatible = "brcm,bcm2712-hvs";
+		reg = <0x10 0x7c580000 0x0 0x1a000>;
+		interrupt-parent = <&disp_intr>;
+		interrupts = <2>, <9>, <16>;
+		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+	};
 };

-- 
2.34.1

