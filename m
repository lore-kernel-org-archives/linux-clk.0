Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC496322A30
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129828; cv=none; b=S16YmrjkbhskG929RNXGFiPH6DM2j3BJeIu35Fo5/H0DHGCT79rKU0YUbQ3EZtrGPtyNbjeIWe4ZjfU/xYGKnIQLVnTT/YSB2HbyWEp5MO4+/vQVj0WpX2SGxckx92t42UtRSGp7yMgG+iALupJnFI+z4/BPgHqQDaLpS9tF20w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129828; c=relaxed/simple;
	bh=vvDiIFEQdPmovAX4ucJVT5BHyDxpJSnywN/cD8nxJX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmH4Yco5KA3vDCSVc6yX1Aq0ySVDvs3FoMS5bYx9ZgtXzlWnZ/emCyio0WHD3BkcpiXn4mA9nWAIwjNuMioKXj67xLeQ+Oa9o1l1DgakSKnwhrhuexfYAPAMzlPg///N9rk/fowdi2EjEflCeTB1cE/TUgMMQHtZZukwnyReBQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGuILrEz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGuILrEz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1641761f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129823; x=1763734623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edjMCTWbD64BX5sKIzjpYwFWA+LGAzfeHzBim4j35lA=;
        b=KGuILrEzPa092jrCyPFMGK1Ku5DLBM0Ve+HFNZ3sGNARoP3augO2KoFuo4tnmFQ7B/
         W1wy1F4UjiKfwU4qLLwu/66md83rEZFJxb8VA6h2BPw3fmZvFpl4erJ+92kbSPGnpbaR
         ydAsa+X4kOkyHpucfEtivt9xUCZknEXvjVe67aQ1ZNE9ZumE6nNbHbsAHrD0uxlzHVgW
         oy73vleYkb4/znUIubCRM3MxRO9MHRg+dmNLaGY4MRKPQ8ExinhAtxKEnuyz37HkhM/J
         7aPUerXbxGydjaD+TM9QSpKFL8qIQzGH5X7PCXJoq85TVTjU4IqUg5diigzKMRyNoJoF
         n1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129823; x=1763734623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edjMCTWbD64BX5sKIzjpYwFWA+LGAzfeHzBim4j35lA=;
        b=O20ayCJlKwOCiRj1E0dTU07jzgVxxlnKVkZpt4Nhj0r58LrMOZmi7khWbG3Ubx2Wpq
         io7JC4JPSQE5jQHUcwzFY8TKnTHMiphDLJOx+/TWckieGpFERxmrYGYTt+SY2KylztrN
         Tc8eq7A1kCLlub6ytOguVi9Vljzqta5FVhvaq2asZV/ecyCm8lSniLE5Ci/br0/7zOsr
         64BjjcYv8vE4xbl4rdgfX/Axshzq/sY2KXuQi3hqY3hTDQlaSWAhRyXPIdsdDBeRmA0z
         E1Q8Ax4az2qapC/yy5PBpVAESX4KNXiX8ePJymH/9TxXQZYC95JVJkB0IVFL+3mviCrz
         5wYw==
X-Forwarded-Encrypted: i=1; AJvYcCWWDtT05/MJkpJVoBuCbO0qyfVf0sTLGE4TlxiXXmDMbug7sdYNMXOVan+HWMi52w/vY0Ggf0Djlms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVdU6ewLP92eqhDAe1BEWnnojrnuwZeU3fkNJxq+nu/j4lo3L
	PIlFsgdNJ+djPYn2oNJxi8b4HTbnLIKZqhji47/ie9BuCbi76qWn6Yl/bhM00ScfY9Y=
X-Gm-Gg: ASbGnctX+anrVaUKxxsqHIwUNLhMDFPcoPO6iPKp7f97B07mkLF7ORAVcXJ7mMIA8QJ
	XGFJQzK8hvn/cOhTOUQHu4fv3eYLDwyUxORhOvrYUx0RLmr7oYRf7wHIKQkHYOgPhusf06vJ9pz
	926k96zuHv4z4y+9h4tm4mQrnVj37STwtFQQAUW0eqnymPVo1zFAz8Or8WvLE8rvnmETiG5QTk9
	BPA555nFe9dPKBgPHnzYvjeyHF4AjvPIxuHeBqKiQrDbW4dai4KP+hUKdRFJVgrQLA3i7jO/0yl
	uqRKwFW0C4yAk4hmlXLsIogTUAAXRArIhCbnkXi3rOePi8LsupWEFT0uvdtrKTFhDtH4093A5wy
	C5aU9xnOvOt6arwUf/tDDFR92CSBZ1Oamhv0n/Jr4y9m/Cg+QjykCxi6YfivBYf/0D6VmH3cBBj
	BpXr4g9g3m1ufFAZK2N4F/7pAa4S3V6Q==
X-Google-Smtp-Source: AGHT+IHL7jYF6WGNufs+vkyuP/U+Oh47CgmLkTpkbSqQCZMz0n5GmB64VlJIPQWWhQES2TnYh0lzKg==
X-Received: by 2002:a05:6000:1ace:b0:42b:3978:1587 with SMTP id ffacd0b85a97d-42b59381be5mr3622429f8f.36.1763129823112;
        Fri, 14 Nov 2025 06:17:03 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:49 +0000
Subject: [PATCH v5 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-2-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2743;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=vvDiIFEQdPmovAX4ucJVT5BHyDxpJSnywN/cD8nxJX8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznYdDgdArWryoZNC0/MrWhCS17nZdqxVoSZo
 s+gr5SKBWSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc52AAKCRDO6LjWAjRy
 unTzEACJjrMTtBxf19XpqpgBtDyjz86m/+UVUDhvGd6wILF5z7VHYoMoTZlkroiPR0bxvPESYxu
 OzdQYB3YuizxqAdtoGu8EeDpccS/dtxrTq3c9FyaFmHcu23Y6W5cmdVBWhh8Ols6QxQDG24eXbX
 NmxJyPV38QVFWKjUgfHn1deA8n/th2NM7WPoe9T8EmJzVSehOI3Ej5trqlSIeNodZ4LKzat9ACg
 ulhJKbHa05oZ1E4A+Qp6h+6RsZ2wtU3c+4xz4QlYJbpRniJgy3j75DiqGw1g3CTOaK4a2cL1BM3
 oe3z8pX/l5G6F7LpFrYDkuN8sWULDhzArwt/eGv0O4Q0A4AJL0pqYlDlzb2+9uPvzaT3hK9hxW1
 qmLwGTV49uzv/f1qGJl+qp24mZXJ6TIDEkeziMF6PbOUXTg+3TP/RT3gdyhracN1TSSIkmK54jq
 ciepYZeeld+hRWrOukqUCEliBOs7TegJFOCQ8EFePRqX+v2xEQ9s+YcBn2rSes5VZ6jPDmi7PKC
 TqyKbWmVsqgrR+OqWpfSVAiMBURrB/Y67XnyCxasSdwscUscee8Idv2r0Ycovtvo5sscawSokUj
 SRlVHvq31ENpeC8yM3Ryz4nwCZAp4Gs/DtOfSgtFEbJIiLvNnI2jmsl1d2t2Qu66wdu/5yALgNK
 kNBZXqX+5cV4xGQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..c39ca4c4508f046ca16ae86be42468c7245561b8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -662,6 +663,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1208,6 +1210,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1566,6 +1569,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1637,6 +1641,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1697,6 +1702,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.52.0.rc1.455.g30608eb744-goog

