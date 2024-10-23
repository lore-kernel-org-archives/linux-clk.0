Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19753207A2A
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702258; cv=none; b=KaUBAqhdUPq2yk8rvwR8zxuKRZzwvuD9UtxAeSdIrbSaKi1ZpWvLmEm2IzTB2p8fbbn+VG3eydY3lQyEIKidYYB6OR06GH9MEyEFo34WGtHRFB9yjPjD3pebLZA+Xsuz1eLw3MM3BzTUFpp34QRx/mrrZ0RCP5aGvUHIkFSHBfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702258; c=relaxed/simple;
	bh=6GIQGcktZBfb3EW9sCT/3N7/H28SyLep9RyAXNQs71k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1CXxnhFgfGME65+pprKtTj2Ul6wDyskIIhyA+KLKNDhsihTQtukGsBVFPTcgk0qox7j2bwZvomBfdAbPZCr5TR7O6+NebWJ7HpmrrPvLFPNUnckcWjCZ1M5nzQwu+obd994KYVnuguqlaTBh0U24YzGTPCmw9p/yUNRwnJnbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WOePlJ8t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WOePlJ8t"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314b316495so68477235e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702255; x=1730307055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=WOePlJ8tIpimRsafUkx/Q3TGB8qAPwiMHHEulqLZkl5qGQ2wtqFQAkghs8Xw76pSX1
         h9/MgcQMr0udvMn8Ce6O6C3kcD8riQx0bDsx0EUpI2nuDX/1Zehf+leSHGpLL8n+s0iN
         KYASBWMjdLTpFqOTHmN4mPh2CEiUElF4svwECBwQ0pidYU1FtD+YaqK6+YFaHJGl5lkP
         jx+jse6Kk4DVoASAW20lVLjlioyd0aq13M/sAJch/dZGVr5D4IQP8zoj7NnXEL8NnqwA
         hz2vJHHkHwDug3OKM4BnHUbJ1wS97+oO/ozWL6FCRbe1IbI7NG02iHJQhwodkTeZCfPb
         UryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702255; x=1730307055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=o8VV7o7WUEq3OtPQrRgpybO0BioE23A2DNmA2Ay1yuyEgNmPxtsgn01tpQqQDMg4Oi
         Jy1XARJMUHDzYaob77LqsD/0gZEZxCSIUSpx1VPCtZ0a8eogh9df+oEjDs9qZfrCFpSV
         YlsvSCLOhEcIEz/tbGjR8dn5ugbYuFc07DO41mjsRra+Z0X82dv6OcdE2mfGK5BSVWzl
         tVUulTh39vRHdNBIGwYw0YlYk2z6wHg0w0yzLIT8AZGBh6+xbN912LFwQJayMmqCWZ+i
         PfUWUGNjT9/ze4NBeUOIWlP2JeaJBAGUJZ5Vy8Gh5+wXKnDdeslGSilynDE3dN5mwwDu
         iL5g==
X-Forwarded-Encrypted: i=1; AJvYcCVrZGaKFQJf2Na5sMYkJ9SA/0Br5GmcW0zwTIbkyCk81f/gjoWKpOPreH/Gr3KfyK9G2GBGoBe3M/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrkggp3afs17cCZlu436uqLFJahC3KjFCg2KeSJBuciYmXmBO4
	5sH50YtcjXgL+4J9JX+HvVStqycvxicV3nBPxB3j9xZ29J8qAId9B8+Ei7pQGFc=
X-Google-Smtp-Source: AGHT+IFBguMU8OEAESQDL/dSrL8fzEBB5IpCHLayBxdUcUsJXhruVCscX1KffjfpU7lvEVL73DyGQA==
X-Received: by 2002:a05:600c:3b1b:b0:431:594b:8e2b with SMTP id 5b1f17b1804b1-4318413ee73mr31043765e9.12.1729702255516;
        Wed, 23 Oct 2024 09:50:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:32 +0100
Subject: [PATCH 35/37] arm64: dts: broadcom: Add firmware clocks and power
 nodes to Pi5 DT
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-35-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
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

BCM2712 still uses the firmware clocks and power drivers, so add
them to the base device tree.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..92a2ada037f3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -62,3 +62,31 @@ &sdio1 {
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
 };
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+
+};

-- 
2.34.1

