Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4C272E6D
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672787; cv=none; b=SQitPOirDCJPqz7V8XeawLvf4TVWGCT6H5aTZe4MXyFOkljckffx/8dhyK8rxkGAUIgOj7zNDkJRgGlcm2i5+si2g2PehI3dtzgsmK2v39zDkfIcEZPTjnESpMCewrVc8Zh+Kf7tD69xeRaA09SyVw0cWfnKrof1EU9lJkQpmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672787; c=relaxed/simple;
	bh=AEAW1zkV8OeqaCPbh6SWv6MdSofvSEdgd3/hIrLWqaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+d7KcnLXcJcxpACfYxNp3ge1vTUitM8nNnaN2XDfqINnANQxfqLawrnE3j1LMvXEAEPgJR9jzjQp6wRhwKIyk1wKvOkjoTdpRA8bUnxXIGGDPFk4w1MSDFWh1LKquMmB7K2TmdZvBDeZj1XKO+o8RIFqQfKRLIdyHcWsvlKNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=joAWUcDn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="joAWUcDn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b387483bbso898807f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 13:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672784; x=1764277584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P55c+msKlLldk8RQlFeWnhvqXv9aJ+FbKMuCPpgPH4=;
        b=joAWUcDndOoNaIKDQfnBYU+hgMr6KdpHrGnnkJA7vSlNJHMwdnou8m7q+okTlJM599
         5Vnya8vIAoo/C6f52hgNViii0v3FM92SPrBKS+S02vyuJg0tKi3t2aRqXCvYwtBW+Uhp
         kmKWOF8x+0pYHV+n815jcHwwIyIvHDTlhUp/qYbylt1NlLLjc5xteY89rTfUeg4W49Bs
         WUrnN6NEPH4xZWxCFs+evcvt2wGz6hnjMU3ovqorppRu+ldgirCtpENXgOZXdR1ZMv0V
         7PBVTrcNQEa5l2AUxehdQhfSxeE+hWPVTJTdvLzaF5d7hExQcXJYq4WAcsS+CPoB5yDW
         ZUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672784; x=1764277584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4P55c+msKlLldk8RQlFeWnhvqXv9aJ+FbKMuCPpgPH4=;
        b=bF0iqJMSW6cHBfKQCH0EnxQu/sVXaKin28m2e2JxQLIUiVXBG2vqfNrB1z0ep/OLJ/
         p05foepIiWbPxBdHIOz692EUt14kw8enjXQZWwQpN9oKl165wCSw2Evf5+1nsVY8Zo9H
         k4bRuT8XWXSgWbhOcvrRQlUaVq2SvRoatm/x6cbV6nCumrzvGyjmb/EPqpgnMzBRbV2y
         z4HbhiOcSuNL+ulgvjrzVCulFSXEYEnNE+O86He756sY5msZazmEE3vGOhisynKGjLvE
         /Ld+UUljUADRTWWi0f+bOc+X/6d0n9siYlw/GA/xQxsGQCiXgqycynRNqXrGgbd2F2d1
         9sXg==
X-Forwarded-Encrypted: i=1; AJvYcCWdCWkH3CRFjcc1jYW5lhVgu/Kd0IYmj6GZfdx3bAh92Iw4D/SlwRNs94xKcGpcm1A9WL9cfxiDQME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOrEJdSXDfv3tz3vfwdaOCtYOSS1llSMd0/Bo5ZE6oFK8mfagh
	L5/83gAaS5CG0tSOisOPEswuGmK3UoX8PjDLCmDSCgQCG4h9QjxVIowPRM3IrnXBodE=
X-Gm-Gg: ASbGncsMyJV/FP6QTOp6W/+Aa7hlfAfvva29gnx5UcdB0D4JEh/3SN7P5RHst3yOuHT
	2l5rz1syjtE9YdQUdoNQvDgWSFLDWilHkLpKekn8jvnCyM6R3dUm8iR6z8rxP4eP1uXNfiyG+QT
	Zggx2LoS42BwDLbHG/qc8/TSZJ5NqV3+EKbekHJQyvVBT1Spl/BSUhw9UWx12CbYQIBBlDa5UMD
	HN6poU/lPVqiS6RYznPunBavc0Qu+Kc+kn2wQdWBXQ1g6pr8doKB7/tv2CsEMIYFr9vGFyBemsA
	2WZ14wio/xieZxmMMIezafVVavW6mIuHN17TFYmQNgclp2hpPWNp0/jCjBWJmWI1TEGoRjIu1i/
	aMlm5WUQ7/IXUCZ7ZO8bqT06Tt0UgkHbhghE/0yIePlpMgP5qb2Atge+2GylTrLn0vaxoHe0qpm
	g46FmAllJjMeGJosDLBSyaeBBc1KzKVORe9NHabSg=
X-Google-Smtp-Source: AGHT+IGIJwaSzwyO+MTFf7E/UmXMY9JoeBa+FWmaF27jX5h2wNx7Xs7QpA0f1RkN48GTo1rGH2syUA==
X-Received: by 2002:a05:6000:228a:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42cb9a0c90emr4361812f8f.10.1763672784217;
        Thu, 20 Nov 2025 13:06:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:23 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:11 +0000
Subject: [PATCH 1/4] dt-bindings: clock: google,gs101-clock: Add DPU clock
 management unit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3579;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AEAW1zkV8OeqaCPbh6SWv6MdSofvSEdgd3/hIrLWqaw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LKxot89zhu24NNYx1+eiy+Zwr9lORhgN/Jz
 xQZOkSi7H+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CygAKCRDO6LjWAjRy
 uo3aD/9g9k0zz3UXUDo7aMqJSONMZmDHvPz/woh+qQn2TNuKjaDa146nRp9NPCQVUIwKcDx6aRU
 pChHevHf+p7y3yDwltHYJenGXOth8wgzZKHFnIUiehTSnqMC2tPuCv7mEbDYCpYfEUrql2NQX4M
 BdvAJZs0AFMQzRijdxZyBJi5awaVcg5+jRqinP/EnCYM28jTGlSn7zWDdbrehJQ9YJSCcUyjTUg
 FtkaKbzJ9XNnbBuO56V0MamL3YVb4gwJLt8Ajv/2RiWvl7b/nFl/ByXfApCLBYYjjhq+7PJEx8s
 RcJ5OvrRGyyzd2m39Ix6Lng7/F9XbmuDfPi2lq1LkG7uEqeIXOyL2GYDSMTzOj/EdRMfSjL8Stm
 Bh8p+ZYAHin9iW/SSfSiqzzwzDkjfDUR0Nj1uBRfEv9KfSUCqKuTNda3Rgx1f0JUv6AiAx5zPls
 udrSZqPNh0mN3adzPUamcGaAKOa7Khlhewh2kFhimdhYo2zziABZiyIM0Co8Q3QABOCuG9MxT0X
 bxJsEJKopm/ZVPcKEh8UAiH7QRZc9CFLonoNvVQ2xCZcS72LIiijR1BSjSuXfFvQ2hUXgoJd+xx
 E4KXBF2E9fAIN9Rvi7Y1Pgh30pT8SWTMTLkKwps2dWL1Sb8Ovv22FHNQQpWOAxATgUmswVnhDrP
 uxGprmJfFeMEtww==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dt schema documentation and clock IDs for the Display Process Unit
(DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
enhancer and compressor.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..1257be9c54a42ea2387e1112e53b5ee1f03e09f5 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -34,6 +34,7 @@ properties:
       - google,gs101-cmu-hsi2
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
+      - google,gs101-cmu-dpu
 
   clocks:
     minItems: 1
@@ -171,6 +172,24 @@ allOf:
             - const: bus
             - const: ip
 
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
index 442f9e9037dc33198a1cee20af62fc70bbd96605..4ee46503663c1f8d9463536c347de5d991474145 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,40 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
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
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.52.0.rc2.455.g230fcf2819-goog

