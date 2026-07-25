Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EDC353A64
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949582; cv=none; b=D2FTxEJ4az/BRAVq/nDnw6L57TQD1j6Epz3l2axD3aoaug8q622t0jU3DSKiCOqXO5kYeWkRmE2nSoK8wEY8DQWBQELVKMMgVyxQ/fT+uGXNoWZQRy6uD3W+4LqoSCvVRcrzF5ZZpdICdfVuCOc19mGG0yQoZURpj68D2bKRSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949582; c=relaxed/simple;
	bh=Ich4f6q4tajR0qNR1lNUbENzsTq+U+zWcM4jg4iHZLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqcv1v9NQny77ACkW7BG6vpimKPevQ1/zVhCPQB2xFCS0T1vabuNNKBAdUjogv2Pb2tyaambTpUvI9TAwC7brtLY4g6LAMEVSC/BoZ9bmHZ3O1dorVAtSEX5apkPDgCaK0TgRs51wXaY6HsDFIssPtp2+300HKmCDlK9IWv/ofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL7rJc2S; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL7rJc2S"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so635030a12.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949575; x=1785554375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=aL7rJc2SImzCdv/KRhQAfCExczISwTjc9fDNr3lVboMQhht66XuKO/gbZxmlsLndfa
         mwosIosgj0jimAemMxtgC3vMgQ+80hsRVqNEJnXtbpLqgYCdDcRhpXCc1YeXYUno+RkO
         v9xvwqiPBXwrWJBn04lG+eSLIivGST448N2B2Ee6+WGWf0FbULM5imq6rPwILFRiy2m+
         jyytmGbHYjfhPga8RMfOdDWJPU15oB921g34isucoAqDvMTzRAlE+wzAPX3CpBHAjee/
         r6uWRFIIWZrS5p0mtZLCizttGuPzlc/BnTgxfrId3NO0lECcl65ayN6yHC6f002MCey4
         LWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949575; x=1785554375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=R3SEFjJGPc+At9Z0JzHBg1iBs2Ib8A3hDiynyinFFaCu0JIQ6mCnPxxxkkxmH8ac6U
         6c9n61oUkeHwHME+4CzYrLjOlR08l0eu9/TTt74UGmqbJgKsjAAK/yrfhwKpP+j4rf4e
         7e72JRbfUO+H639FOxP4cPGY+qmcYKMyj654hX/fGzLIg/Y8tZrrBcZm3BXBnk6xHwM4
         bLWaD/JDURC5AzJvYKMU/qsTN7cd8EZ2kaxZbJjavDuGhHjwZsGe6YoSKkJCe9ZtyVAv
         ZqQPdqx9i4XFbYYpXn8ZMSg2vyq+30I83C16z0YdMvBx2rc5vLwIN/5yjj00nm5xXZps
         Y2mA==
X-Forwarded-Encrypted: i=1; AHgh+RobeKkn+6D2K4fe3i7dRq2FKBRRWUvDw8Z13UvVp2kgTpEm6a5P2woihFQhKlQXsJ3dgQ9GfTMIQfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvOF84DNWRJlwyYjVTsRFw4r3mosC+htdFkrS6FVEiTO7Q2rD
	43P3H/IJJanHAzZ7V338ayEHWOAg3CDzRqzNC6PI42NElZxXF+Q/jp7V
X-Gm-Gg: AR+sD12pJUodzTfkl7FREPeVYHgaGSHp+Q8kstTlo5/ehQmLLYD1LI6V7zcgtx2eKVs
	5Kn0KdTRYCPwE0FSeWBgeTCgT+jJ6goZX09Fct2NgjAZLROXY3z4slPbYs1NWDpxwW9H28EGW8x
	5RTZTerTVaQg8Ma/70/X+YiJ9uLUmC1cnDY1Ae7rxv2lLXM1ZNJ4Fap7sqAAVMhaHMvO7MifcDR
	ugfEBvcMVHXSlCu30THt/JYYAho67iKa3Gtd4ZFzkdDgxUIaUGwCcVsgWQmKmuSovaAybnwSzCv
	oLZyoxzdLeJlaVdqdXwOj56eN25uuDJy3xYPviOA7ACWttu/yIIlspZX8g50au35ZMHmS/++YkX
	ASq8I3j+ZB1MEw/4GV7jJSMQ4r2NRXJUm0cNyvKIdmrQAkIxV/Wno1LE=
X-Received: by 2002:a05:6a00:298a:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84e5944d694mr613698b3a.30.1784949574747;
        Fri, 24 Jul 2026 20:19:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:33 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:48 -0400
Subject: [PATCH 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-16-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

CoM260-IFX carries a single DisplayPort output, so the second DPU and
the DisplayPort controller it feeds are enabled.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..114d0e02fed9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -19,3 +20,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_3_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1e..dbe8db4a8b76 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -22,6 +22,17 @@ dp1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dp1_3_cfg: dp1-3-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(72, 4)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0

