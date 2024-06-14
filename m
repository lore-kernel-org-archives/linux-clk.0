Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42D1850BA
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349611; cv=none; b=m7sv2sJMWca8GkbGpXOLyrbj9r9sVQcQ5vw+lpm/lD87Mju5R9ZlXfF4nfCa6DDLFB1wEQZ3Fg1MzN8Gy4fP2UNH7KyZq+C09UMcAU6pdaGKlnj0vQ5JFa93zbuC/+tRkvgG/yD8CFlv9WOrFEIxron4/ObVYPOzZa8UWL3Yv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349611; c=relaxed/simple;
	bh=ZjuEMuGz4kEcDxmYs+Tz54ejpUmpl5dvxMt2UpXcFeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFLHA4W7FpZmZhrC+X1c57eLHOzgxs4VI0YsoO5KLd6FNts2rBc+si8rPZg4AjDLX6+HyDhoNRSXfOK/vW9Zyc7co10b6g0R+LkLr+AlZulG3+lJWqUQcwkF6MtER5uhRxfmeZ7b+be058LtgrRS7SSwiMhmrOP9WMylbOOmZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XDllDLJv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XDllDLJv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52961b77655so1858099e87.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349608; x=1718954408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzLDlH1R3QvhEoWnEPi6zyPBvjTZXZax7kx4ffcrpgM=;
        b=XDllDLJvqPuKJ4LfEgbjuMwbCxfa3EP7WnqQkLDDZESrI4nNOr6k6LSj/pGI+Op34j
         HfE8hkYqTlrptNwXvhbux5L2TTkCvFhr3iVHfqdYR/YPPl1VCsdzrdP2/byKWCXC2ojU
         NzNO+jd8JfqdRs6IaZH/VGSxq1ll8CtqInNVuvumjt2d2x+NIU8zB7LfJqne+REel88E
         mr1OyEcgmmA/7D94o8oDka8Gb1ofVdDm3fKgKNxqfAGXgwj1qEJEEZMhq5h1IhZscDYZ
         KBCseqPy9Y21ZpJh+6Tu1eZGRWPBu/5O35To10OKKRYSeJAZwqB3/SPyZfoOze/23/Ls
         estQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349608; x=1718954408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzLDlH1R3QvhEoWnEPi6zyPBvjTZXZax7kx4ffcrpgM=;
        b=TfLQroMSPXFBxzjUzKAI8XpFT8AHvvGMqpZ7NeSBIIk/c4XyLgI2POUFD2cQ9eK5hp
         mL+6ulK5HECSfkFTaqPVLPm/9mOmcG3hpgN7cSqdtePpVwInkCDqOo/OLi7vAJnFX9rl
         ytT5LQFWIfmtR+nGsAFsxaTsNk+0X3D2S/L7thF0WF+vosbL5GVWl/26itjDkgNY/6mR
         ght0znCp3ibgS8sBP+snh8LdeBXfaGyUCk/skwFRpB9J/KqL4m9ShEdo1tgDblKyKVHb
         8neUUf2cg4T1cvitgEbwIcjz2r/++kcXDjDPgXsDlcsZKF4amj3TbbJgfgaaMgJYYHXX
         06dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB8l+vZSngNypMww+uiv29+hVbIAw1D9wuEUM/Qr5BQ4RToJFoxRmqzQnIEsynhUUZmJYrLSXYC8BbNKZAKfQOMXo0j9UTtdci
X-Gm-Message-State: AOJu0YwrTN2ROBFas2YoZb1TfjlRJRDUcbW7eTsUZiwlbX0ha4LkvcXT
	c/bUX1i/cSgPFzF86ncomPDVNaZ2XF3KR5UP3H9qTzbQF28KXUk5b01W4PQIrwY=
X-Google-Smtp-Source: AGHT+IF4qIKLx7IZ+2UtBCIPSzZcpUllkHDmUeCt9SMCzs5Sn55tugKqq4zj7ob8TjcqfCAkwIcU1A==
X-Received: by 2002:a05:6512:2255:b0:52c:89b5:27bc with SMTP id 2adb3069b0e04-52ca6e90a24mr1435235e87.42.1718349608338;
        Fri, 14 Jun 2024 00:20:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:07 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Fri, 14 Jun 2024 10:19:28 +0300
Message-Id: <20240614071932.1014067-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index b7bd2e1f3462..88a20c954ca6 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,rzg3s-rtc";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&vbattclk>;
+			clock-names = "counter";
+			status = "disabled";
+		};
+
 		vbattb: vbattb@1005c000 {
 			compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2

