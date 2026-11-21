Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296475;
	b=q6AqYhnFUwfRhfddA6ajemXkgzu6TTAM/pZQRkq4YJjx/qFImilDxc+nKcHwlOZGuQAB
	 WQZtZD+ubJAE0er85etiW/Ggy411Jd/tkN0fl3xnHPaAsefyP2hYU7hx2nyyERXikwsEU
	 kucBujnkZcks4yXYModMD/nEpUEV9vQgWFe8ivdl4CvBCETi1i97Dn9uwt0D83wCygqdI
	 OCXldNXGa4dUi07Cvv3l0WKWLdeWGg7M1Qeg/2oKKqdeQiggeVrslAzV0mgLjYqn226DA
	 t7YoFLE2b+hwCm1CDIuX15r/CEGDsFLqf9qlhVteqx3aplpf5JRLsXQZE9Trhil9szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
	b=Kb23DKIi25i5x9/KPZZu/5hrGRUSQSJmjErDGRVfqFHZmd5uPGyaSVvrJLTkD2gycRrp
	 ha8f5SzX9AEGgDgzDLeDpuWcJEKoUmGsbhshsy5qqKfiB3Lf3etU++UhP74AC4EcVB2To
	 6dlo8bRKNgMqsSn5rOAaV/oNtKH67H3S6BiWp+HY+uvDxzu6/BxqVlsP3AOAOxe+UAMzX
	 up7Wp+kRj8HgjmIrk9e7YQt8RWKFY7xo6OMJdzavYFsbPfd4AgAWjAUxJ3Rj+3wW1/ABV
	 6TzJm3vGmMHCxcMWDLu65UZG76e2Js456saPXBC4Q75tEx0Xs2aPNvSaOvjp1Mg6jOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySDkEIO0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66D5606A330
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySDkEIO0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so15235965e9.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296473; x=1795901273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=ySDkEIO0wCb5tRjoqzeT+i/kWYSzCqfpvATi+OfIKwYVhTdRRWSAeHlqrDNGRPM3xX
         ZZuOsJa2B+yh7fPT6s/9jHyWDwt2hF5PSCI8oyNIblpECewVmWqGBApD8nH4lVzGuOM7
         A0JqY4dnkaXkn5qmNvG+t4Vkt8xxY5Cfv6wLktd3HeedX2SfBsqdYsJAt4AD/cszuAo8
         f/zkUAidDg1iA0TlekOCEpwzniwRfxx+tPPQvAZELM1Nvt3hxgOeBjqAVIKPzoQoVb3w
         Jdhad716cTUtELqrAsJsB+RpqasK5fXJaPE+lLCZ6AA7qw8xCgrbrbciXs4ll8+qY7S8
         barg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296473; x=1795901273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=XqxcLDn+OldYOQ+pGlceaWcrOk490qNanBtyi0qLUP4/KxP6g59Qqy/NTVJeHTyCmv
         I4oLWYsBfqfp0jsw+grFHTZPnYEGTjKc21955k+R7xuf041x0SGqcik1gWztrDJi+jsl
         Q8I+pEu1gwtED957e7eTGdR7/aphrO8pleOJfbW4j9H+9+Chqn8wmbafhuu1nfmYiEFX
         q2h+tjTe1UgCqOQVfAACC3DEeOH6wi97Ta83Sxufyz41QkCVrHA9C9cL++Fyi8N1MAHW
         qDl0TJvknKYM/MHKbkdkqIWSjL6A7JfDK6DsDPfAF6v5Of2e39D92p22SgaT3aIdgYJj
         TJww==
X-Forwarded-Encrypted: i=1; AL+hErHs9k3Gy8Rw2LiYUJnGcE86Cm3zehBuM3GhHKQDKkOP5q/W2sV07Kjur7DNkJEExNBZG6ewO0zDgs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cCDGAMojG901X4tv1hhjUJWuPs8kyytKeZPYeiUyt+W79I6KU
	1ZR88v2GoP3ZA+IKF5kDyegcQLlNZCWrgRk5PW4EhFj2s2guOQ+llwJR
X-Gm-Gg: AZFdTZcyPFDt9JKoh7858qodT7p0K0KeYeUPRpZbv0//CZTRNI5CWFkQ5FAJcAhxmoW
	kEI7MKaDmbwHBmao537nBJu0YM0GNh1hUjBqpUNCJOwyD9O1gjVUbtPISrXwWAL4/jRHgCCBvtZ
	9pLbBJjF5bh3K1FsChKPBFGjmFUgMJfyJ1ihcV3LtFVWriHPY01X26c0IyiklfQ6Dol89cEh6Ct
	Wjzjo1g6e8dzROveJZqUtV33jNNkxyw4Li6geOMGv4XW5T0HO3lkI1ILEiAszaqJC28Xi62tstH
	DrkQpBLh1MFntMiS66DD5fhfWgGYU/g+D3PcoTnBRaNTcZLhgrgUv1S16yzlvkNMTbGbNDKyUV2
	YKjXpWawZ7mheci9yfH0MqIt6szresLcqOVj7rOoo7/ernWRAhBf85S9b12J1OrjiLUBDa02kMK
	oFC9sTB2v0szdO8eD2o5xjE1UznT2hNtEwn0cgk5SseAcoIjwGpi53RbaV2kqbjTySi6PEVc7Nz
	3EScSWvC+q9vGOY95v4MrbeH7rO20bPdxYgAULuSpFvmOO+UtPMj8TEKXFQ94bLSgklQaPFksZ9
	VG/X0u4cAaeiI7LXfVJwJWX70HfKNEFOE0Srvl3Z+7ju/eq5ZPjZHWVoNOURtz4Krt7sCWeASIQ
	bjMmhAKOpVdMCmMudHDWGWeF00KX4nVuijSsDOVHPsbgDqxoS9nZd2zz6OZAiD06MpdiJ56Nd
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr163930255e9.5.1795296472996;
        Sat, 21 Nov 2026 13:27:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v15 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Sat, 21 Nov 2026 22:27:31 +0100
Message-ID: <20261121212738.170775-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 26 ++++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..0d5f89187525 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,37 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring and read the base clock sources, dividers  and
+      clock gates.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+        - '#reset-cells'
+        - '#phy-cells'
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..433a5c6180bf
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST		15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.55.0

