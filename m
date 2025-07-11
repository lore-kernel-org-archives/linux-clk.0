Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28172E7BB1
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238702; cv=none; b=AGYYHlTYw/aX+A62l5QdkuxnFw5YqcrD4vvraZgnyXhRkE0fY92ywp0/sd8VICXIAx09YiWo17REjrLcOszlmBXp79uFxXag7gghKHUWiKJwpQI3SPUxNXVKvu+9ZjrQ8Nk+oyMDb3ybfQzrmWc7grPqYX9XlDdbNkMuqCNZeYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238702; c=relaxed/simple;
	bh=JuMfXpzZJqCKUZySt+S5Ow7vJcUCRTmY3zPLXLDylck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axGkgeCR3MJFplTxja6w1TmVJ5M982pr3K8UL0d60eIhbPXACwMBV0KUK1lAqghmzk4rUZA2xttawPyaIODlCoIHRqVbHGTQ2UWawQENr/XKA5CW++WDAa9bITxSATTUSDDU81ko8GC/v1ngSUlcIysJxYtbICOb72X6thaWeTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s722S1ma; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s722S1ma"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1242531f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238697; x=1752843497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pktvql5qXi5RHa6y7vJTm1ICaz3CVlfcGW+HEZczjkI=;
        b=s722S1maSKpj5bKECASvZyTFvVP4+8TV01skE0SPzUN4llQ3Q7aBZfbdk9dxF6c234
         AvVPTtD0kKPQL2uRSWjzg4MpY2XYUxqXAcPB+QAT7VEG3X7iwXOL+POB8qYOq8E7odXF
         E17sEkM+v5LVl+3KQtY86Ho/vBoxRSCREL0KAoGc6NzuHbpk7ywCzaml/wwC+pCCT1bi
         xTasf7k4qbKNQPcwGkkvw8iFVCqDUaAbBoEbv2EJcOai80g40FDV3sAYjKU6s28TCNt8
         NHrarngufH6uZyjJ4ppC9rniI3hcoB6f6NCFgPvRuhs/7KWVVH5gFUdmJHw2uc1nl83u
         sEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238697; x=1752843497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pktvql5qXi5RHa6y7vJTm1ICaz3CVlfcGW+HEZczjkI=;
        b=L/R7pRxjOLX8XAIgkt64lgEgdTfO3xFujIKHZPF+d1SheX/qpjizm78fkfbepBd1Zl
         txUOd8Auag1xmRtaGNTpT/1kitYEWbYIAx4N3IGzUssDRlKvnBh5TiYgEN4TXe0+s34r
         TNhaxGfyZK/PEoQoniD37ajKrhMBJTKG9XV2sin2LSKgY6Z+TFtTLRzMr545XeXujbJ3
         jlIOFg7rfb9GP4lkFE6oxV78nAv8FyNN+FWEeGBiII54W/L8SWhdCyHFkCfpWwvtom6Z
         ZeNDYMdQzLFr9Ts8iSmaYnNxLBOjzFiEUD5Xv37knP/yg8sYipoujIZY7/NtkOKZSK4b
         yEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXJb3bgW93L5Qh/Ur0JkcR29bbj0txrCbelKOcb/fBSuhjoN0CTnGN+ojPkeHK9rHmoevd8KRoPj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKLR/ROIWB8aGoT49SW3TFZTQ3OPbMSt79beQIike26MPwurw
	1IH1InQmz4LtVWZ5o6jDfJOpO5UyIsBc8whkBSC2G9E/XZxxVY9ykIg62PPIhv+qJLw=
X-Gm-Gg: ASbGnculR+bDJAsPx/orNuScC507sJg+F9IporlMPTpSHGlmIMJx1bX3hF0sX1TBXM3
	kblmT7fWrYntzGxHJlh+zGG2byn7QdQnsUQWCc5amABTVjk574EJrANDQ5qdu+XSkjp6RZyBdUk
	UTRWRrAOxdf4xk1nuqJ6WquYFxQMsPXv01CxwJ+Qgq2Q4EcqmMFoch26YLsnw4rHD1pE49xoS2n
	O16MSTBj8nQUiAxvRAsPW/Z0fK4V7/HSkJBfC7iGU1OeODxrygxILGkiyHmzmSw/lQeIrR/aSMI
	Mf8zGi91SD2dkyT51um1EFlUsOVAyqb7fEg1jldCz/NEq1SbQj/Njry4g1Z3yGCfIWOd2wrUuME
	swqYdIHNsWwgGgiazdIIjsTk/hkDCCmO7ddwXxHHN09djRITpwkxjGEA1nQ/knj7M
X-Google-Smtp-Source: AGHT+IGJ3flhCLSOXK3CHO11MPCEW41WFI6YSEJ3lV/vNzkSbt9mh+xtyOKj1hmUEY7xp1DN0bdp6w==
X-Received: by 2002:a05:6000:230f:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b5f351dea6mr2058389f8f.10.1752238696782;
        Fri, 11 Jul 2025 05:58:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:06 +0100
Subject: [PATCH v7 14/15] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-14-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JuMfXpzZJqCKUZySt+S5Ow7vJcUCRTmY3zPLXLDylck=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpVZjDDAeLwqpUWjJ5s/P4/FwWYA0N5tDyMB
 J9tcma9TV6JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVQAKCRAicTuzoY3I
 Ol6bEADBgHcb07UJdu9PCUH2ZAUA1W7bpVPwuCrhdYn+9S96M99YcP7qC2ifWC8+74sJfcmM4lS
 Okwjo5Z3u0CpvCjnWQzbSshdaWqD6SBjMviQO5CYDE3v2S0cpTBZTpee1OGc8ge2ntEYdQTa7oM
 4IrHt29dO5MSnGBWmjGmeMbzv7Ewheg2TNiP0u9/koOeDmt24y79QdIfRXiCYiljcWIQ6/KLJ/I
 YkCT6gwJw4efDasPr6IxTkyrWNfIAFa0rareIFvJD3uX4Ui7hjB64iDXBsz7SAxv3i/A6uH6vXc
 TmphaR6uAMfPl2kmhuW9rViKM/8R3DEI20JSswtOIf/14lkqqJ/1BMCHpssYDCfK5xoeItQp+Mx
 VdiKu6ZofhQBkh8tF0Lxo+z8DxD3Uq3VK1V2hb5icd3qtVgTqz4NqCh+T4Wv56mVfpKPMNqHdgd
 sZzwNMX/8d2+QkANALvYwgxlGZmdqj5WfEvbMBCCeDP71lBElzi3M+tvlhVA7SXwoSg/2YflJU0
 Am4XKRZCDp21ipdv1QwxTvmuHw0MpZDHPNdh5KFvD/pVBIN1p2/d2Rfj2LAEg6wjvFWqBe/sUU9
 qe5OMzUWYwXEL7Pu30C1PBsETlLOrtZ51pnuRZAJ93mKcxbDuttT9Z+LuQN6Y9Ew82ww3oFN3QD
 FZIxwMqXysJvTIg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l7m_2p8
- vreg_l2m_1p2
- vreg_l4m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dad0f11e8e8583df6fd8aeec5be2af86739d85fb..ce2625f8fe85287a16fc3c85cae5d58f99cc6fc2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -693,6 +693,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p9";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.49.0

