Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7A38171D
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301980; cv=none; b=emguRYXedqp7IwWz/ndPS3Z3bkWf7xoFX/3wB8020Nn5K9093lsns9mFVOs4D3sQrSJ3nRIo3Evjo1FEIGBXlxG/EvUYypMuMokk7VL/gCgD1T6jvNTLyJMJd0xisZ3bVqj1r1okArD6Q6pP/F61tirFFq5IVAF+VDVKYqNl8hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301980; c=relaxed/simple;
	bh=2yubVwhwO7ns8FZQYj8MKduIIlis7alJ8q+O1SQ6y/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dk0GYneRPUDnH+e9DXSDeqH4sIGYDCv2xAtwjqy8a52dXrHiRGQDjEKxT9BucERtvj7ppXRR6EX2UMzJ5C4L6O9nGfZd4h3XAQN7rq77S+MnhOg4RfYlwqCdhVVOOwBDPQOPP61HsOyoF2ITXsI7JKD6U+mFcouUOsettq9Cm5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDDBTUN1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDDBTUN1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-431048c4068so3827827f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301972; x=1768906772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2O+ICvJOvqFIrMEVsuBmNNVxd9PD5RyBiEWFT9yHBo=;
        b=HDDBTUN1G75/pt4RgMFqcelGHCicXgUjak/a+ZId7OAY1Vk9cipm7U4MZXqSfrEIZp
         YMy+Tn0ywWBV+MOi9SBCk2rTqVGcRTT2LgDIstf1RLo343dkPyqGj4k/ZhhzR1gXt7nn
         BSNXQ4ssbEvKAZDxt6QEysCZYfTiBLxDiQHaCiUDUuOR8719X7kSxG+n7eIB4mereTqv
         r6LDqf3ATRfq6qtX3bToS5Skz3Ni4UTXH5wngUi17pfiJKoYKOiwltaRDINAUZaM+MjC
         +fpJbY6viVaEWXmEb2BfEFNnEOa71B4tq7Bj+xJjnC9huUSSUrlyNudoCKL0Wopw2pL7
         UVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301972; x=1768906772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2O+ICvJOvqFIrMEVsuBmNNVxd9PD5RyBiEWFT9yHBo=;
        b=IsP5cHPGdkXoca20Boy/4EO5vmUKSvP+beBwCwFN129gkJky3dwhwPV5m+3dnlHHNw
         6XH7zKdx594E5PNidjvjp0mmwUz9kJPwBsNhlIIQDqbWQHBX0n6lYTxUIhWohpRE56zj
         uHdtQ8owv7gnNlUn7WkFEX57pehSrz9blZJPCw/dRb59r+9AUi9P1X8Py2sTvoOzA1dM
         id5IzZvArUBcRadjlSW08s1AEbwq775MSBOpmAEowpix95ihagpxdFoaEEQat2AMe86f
         g/2/ooy4Lcki33HOtaiuvdCboFxRNSTBP0oxCmTsKVjT0eSo0MP68S/WnBEu09S6sbcQ
         +m/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC7MdAcTPRmTp+umrdKZYa4uDeecd1nVOI9CFZAnolIk7g2Mpnaq6mUChsiLhE5tpvozVZRmDz7/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uoKrr+AHYCw++4SnjmZZ1NFVanyn5m2wBYkG4hM7xRjhj5LY
	5vC8omJVRa1wr74x0t/DbkQs7uWbt/4rZW/z0yp5F+LEQyWa5ic0kCfnIPo45Yxktvs=
X-Gm-Gg: AY/fxX4WknAcOWpiRT7Es7LclgUDeRW93omVNKLGf4Xe6uwlseLG2yoFyCJ+JNX+MDC
	tAXpoMYZ+vYE5O2TM9SSFWHpcx+4H6qq6Tg0roN+exzqCMwDYMP5eV7liEdVNi7UckKhsy6bpXT
	J8rlibc7JBm4RXfrvfU1Tm54p5NFcICHUMzed3YItjk1HdqPbMVW0z3m3JJ+CuAZBKOauNnFbKA
	c+HRsnklbniP+44nroPasRN30AiOH4iPfGVf7QWvjtRErHT7LeUuz5YVenUzeHKui57sQS0GvW7
	vP7HlAJqDyyfd23BBlb3Vmh61X3hrydHvjOeAJFyp5F2H/BdKIUYlr3T3fKQO84srCMu2Vjpcry
	BVEQXN09dggICOpg/Hr1zILjaLgM7iV5Ov3AWCuAreQYhehHH1K4X/x2ObP9gAOg0Ufkb1UjKY7
	9EsX5cCUamDloAWP9juG5MOO4Hg3FC9uNK4P0Luts5Jxo=
X-Received: by 2002:a05:6000:1862:b0:432:5b18:2cc3 with SMTP id ffacd0b85a97d-43423e7458dmr3411889f8f.4.1768301972016;
        Tue, 13 Jan 2026 02:59:32 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:31 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:58:59 +0000
Subject: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2yubVwhwO7ns8FZQYj8MKduIIlis7alJ8q+O1SQ6y/c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWOE3nOy29Cjg+ucJWaFXVn+xlXgJc+sb9Yx
 oBWrDqH0GyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljgAKCRDO6LjWAjRy
 ugTlD/9NkVH/qEv0c/R6L8J1N386xpJvXJ4ZWLMUvx103TNRGX8cpOZTDA81xch3tj2qyam6OGE
 pxcoUYH6SMoXuiCGb/SpiF2EbtZSV4wWHn4DaeX7KjIGwbBOanMVstVMDNBNJnQiHyODT347Wq+
 LxHO0WRSf8WGhZiHPQIkdGXw5wRTqMLQviyLFmg1f8DpQO/vUuKsJHHVrkiARSvnREj/YztvV+u
 EjPFDCTQ9kojSCduthNhE42DcfdD+QOiSj8mUsh9z4YfenGtz+C53RTA1V8FxJdW/KfYLUMGyhU
 LWOfo8YOBgjGqPKHa7YXXFVXkWJ+w7oHhedfeLiRg+gZ20/FtJ9Hev++WrN60wmubxuSenKoy4P
 mFAC72neP2rpiqRwXAHPdv+y4xfqq/06Yfjgv2tPbzlBoXeOVjKxPJLYDqhMvLP7CmRgxZpd2p4
 qFppyKsolpBsedaYne/JSqDLLs8ekCUIhnBaUECa/cpsJ+JosOYIukgfPkRoXGWJLkPFBUFxI5D
 8KOO2vQTbwQDFWZOWACjTONcSwfyNoXQRvvbA0M78O2ITYCM/96rXA749a5hxiDRB+7TRQtQu30
 wrQz2ZIALpR99tRvznwM7o9bv7Tm6otahymTRAwmB7GJidt7vYtcAsJo2YNXfkckCTzD6tGK8is
 nEnOE7heVyTB/2A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dt schema documentation and clock IDs for the Display Process Unit
(DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
enhancer and compressor.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3
 - alphanumeric in gs101.h header (Andre)
Changes in v2
 - alphanumeric placement (Krzysztof)
---
 .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index c41043c7d25200fe947a2ca5b2780e4dd50ad433..5122c5827718a3e3defbbecd926ec40e16574529 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -29,6 +29,7 @@ properties:
     enum:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
+      - google,gs101-cmu-dpu
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
       - google,gs101-cmu-misc
@@ -82,6 +83,24 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-dpu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: DPU bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..7a14dcb9f17b1e95d792b0c29fc6b8bfdc78213d 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -313,6 +313,42 @@
 #define CLK_APM_PLL_DIV4_APM				70
 #define CLK_APM_PLL_DIV16_APM				71
 
+/* CMU_DPU */
+#define CLK_MOUT_DPU_BUS_USER				1
+#define CLK_DOUT_DPU_BUSP				2
+#define CLK_GOUT_DPU_PCLK				3
+#define CLK_GOUT_DPU_CLK_DPU_OSCCLK_CLK			4
+#define CLK_GOUT_DPU_AD_APB_DPU_DMA_PCLKM		5
+#define CLK_GOUT_DPU_DPUF_ACLK_DMA			6
+#define CLK_GOUT_DPU_DPUF_ACLK_DPP			7
+#define CLK_GOUT_DPU_D_TZPC_DPU_PCLK			8
+#define CLK_GOUT_DPU_GPC_DPU_PCLK			9
+#define CLK_GOUT_DPU_LHM_AXI_P_DPU_I_CLK		10
+#define CLK_GOUT_DPU_LHS_AXI_D0_DPU_I_CLK		11
+#define CLK_GOUT_DPU_LHS_AXI_D1_DPU_I_CLK		12
+#define CLK_GOUT_DPU_LHS_AXI_D2_DPU_I_CLK		13
+#define CLK_GOUT_DPU_PPMU_DPUD0_ACLK			14
+#define CLK_GOUT_DPU_PPMU_DPUD0_PCLK			15
+#define CLK_GOUT_DPU_PPMU_DPUD1_ACLK			16
+#define CLK_GOUT_DPU_PPMU_DPUD1_PCLK			17
+#define CLK_GOUT_DPU_PPMU_DPUD2_ACLK			18
+#define CLK_GOUT_DPU_PPMU_DPUD2_PCLK			19
+#define CLK_GOUT_DPU_CLK_DPU_BUSD_CLK			20
+#define CLK_GOUT_DPU_CLK_DPU_BUSP_CLK			21
+#define CLK_GOUT_DPU_SSMT_DPU0_ACLK			22
+#define CLK_GOUT_DPU_SSMT_DPU0_PCLK			23
+#define CLK_GOUT_DPU_SSMT_DPU1_ACLK			24
+#define CLK_GOUT_DPU_SSMT_DPU1_PCLK			25
+#define CLK_GOUT_DPU_SSMT_DPU2_ACLK			26
+#define CLK_GOUT_DPU_SSMT_DPU2_PCLK			27
+#define CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S1		28
+#define CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S2		29
+#define CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S1		30
+#define CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S2		31
+#define CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S1		32
+#define CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S2		33
+#define CLK_GOUT_DPU_SYSREG_DPU_PCLK			34
+
 /* CMU_HSI0 */
 #define CLK_FOUT_USB_PLL					1
 #define CLK_MOUT_PLL_USB					2

-- 
2.52.0.457.g6b5491de43-goog

