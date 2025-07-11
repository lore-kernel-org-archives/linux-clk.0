Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7B62E54BB
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238698; cv=none; b=ExwWD9e+wtZWBHitIEaCV5wUHkw5r7ENkYdGJYI0cR3IH30dU42p0mBGKdgthGalVg4lDUVTlrJ9NF3kx/YjHImoXSL+LzzzhRd+HIlaLx34XKkZ77jNWx9ORlfRMHU4ik77jl/7o4MsurN+Q4mZxzdmohAxPfkVIWcwQvrLScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238698; c=relaxed/simple;
	bh=uSDaDaav64zb5yYxypWWibFdUxaoPe5jKMH1pUZLk94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keuBEJVWsHFJnBwXJNlqiJwimHyfNSINIE5/j2PT8dLkkdGkDt8z9kK3K6rX5DBU7mktiFZStz3G7Qx+V5R0+6had96PXA84QmQG/CJR4OnypCR0dnphRNlyntMnlAbrMhMcDcxIyjF6wxX4BJ8Uf9h8UlwIaBn7c1+yZaFXbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ds023dpA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ds023dpA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a582e09144so1341755f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238694; x=1752843494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCX8cXoRpgVx4P5Io0U7mbR/WruUP4Knm+tOtVt+Hmc=;
        b=Ds023dpAjFm/8I06Fklf696c9WE0RAVjIBUQ89HTFkasW+08G8FoeyDTAVghoEk+NU
         iofxdTu7cIgp0zOiTVQJY481r93Nhhd9jUeFN4/vtN9+MRQ7bV7RJng5SLXiEKSBxaGF
         qHbgxTWf1juZZnYmiT+BrHk4nJgDJIEkmxTUkWvTuZKCQGhp2kxo8BVaPsX9vVqLOBee
         6CTHyeUinLiMm1Ub/s1mXAeNwC4Hx/+nIxZGdpI8gvI8qdSi/BDDirJWyBaFcusQjHuC
         Ckm8JarB8u8j+pxroTijwOa4GfVhK8uwXBeuBMRXWJq32VK7g+UmQHP1yN7iyigqpYFI
         XhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238694; x=1752843494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCX8cXoRpgVx4P5Io0U7mbR/WruUP4Knm+tOtVt+Hmc=;
        b=E5X6mCnlBko5X059JJ1NRETGywPDSHvYUVA40N1f7rac44zu2pyhvE6f8+RJ1Ga7oj
         0nRubaEnwsL2vodNTJAj47T7HeQmJwmBEDgLkxqfZfuSj/5s2PQFDlwA22mg6iYJVEpV
         pdkety2K2hm6VZjznpEQFaHIX4694xqfwMgK/MsAnjynlliBuLPOGxnq6yEdWbBOaVKH
         Gz3Njv5RFvXMphajxuSgHnBgAdimbWqUikER71L7Oha1Hh349t+IVTSewRaICGFZBv1c
         UWwm5vUEQj7BI/hUXd9UDElk2TrbcGd/+RvWoKyJGcw0moSlCHP+GgzLGLob47VrrWzy
         Xcfw==
X-Forwarded-Encrypted: i=1; AJvYcCXBzJZfFJk+y5OvklWx+Nm+cUKPXUpXoezjrxhCZ17F3CTRzdqkKgA6uKTnPzhPtaZEbvxFpKQfZCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZA3uAw9E6tAkeXz7dgNP0USYIeUQAE/G3RlHbuhlNs427qtRQ
	Z0hrQLzcIWij/s1DtRq+5fUadrILe1dcOSSUiSQ5mYx/8adjw/Krw/RtliSa+emux6A=
X-Gm-Gg: ASbGncsKWqyhnf5/UQf7E/lyWWimulYr9qKWLo2SHybWPC5ErXbVQgqQyZbcL9gobmY
	auJQib94QDFJqAOpfpHVbyrO5JLHvuKv8g7eB79Ep+RH3ipIHxKUHOGI1cFwB7p7EKGh42BJFSn
	6LJ6Zr3QI5D0Jh8/KYEonPyDMm8S53mUjOu1mHJMY2zgzebL6O9bjCaT87c0FB/x7oquX3L/GiV
	Dfs9CtL1JwmCgIGPIEaMTD2KusdZOZvusaGXVDIwif3ATJr4tir1e2ZyGarxuQc/KTcaMlSsWz+
	AFATxkLAngK1YrOvHT1s59C3jcilzyU2CRLlwR34l7Bkp+Sbd/DrLOJLZor3xlr/4UzsaF/kt9A
	NeVIHsMwR8Yrr85LiOhgLTnFP1Qc9kQmHZ9V0qbRBlQf4GOHSwtwmJ1x68HihrL5K
X-Google-Smtp-Source: AGHT+IHRdrwIdEYn1uWxB8RWx/mQy9xRQiWitmMhrYOydAjTq4r03EUNHWVCdeBVi97TcQejktiaCw==
X-Received: by 2002:a05:6000:2913:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3b5f2dfd84cmr2243331f8f.29.1752238694191;
        Fri, 11 Jul 2025 05:58:14 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:04 +0100
Subject: [PATCH v7 12/15] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-12-0bc5da82f526@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=uSDaDaav64zb5yYxypWWibFdUxaoPe5jKMH1pUZLk94=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpUR6ijDo6ewwpWh7R+yqfwdvx080SbYU0ga
 UnLG43hu8GJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVAAKCRAicTuzoY3I
 OqGnD/9To2DAf4tBf4dnVNpVdMKjTwLe+wGnSXZp9TNedJD46rnySjgr4T0z5++Pq+VGRUi2e2q
 G02DcGPZ7JjafRmei0ewJJzDvdtGKiCPMSmo/9zFxU4KRWAHFffydGvXtWByGpfec13af96dSfg
 +tGcyt1E/H34cpcHHIXYmb4KMFVaLlGaldAsminlYZawgFMQFNiq6cbHy4TGvNGz6Abm119gJUL
 yPcyAshaKZUY8QGuOnisJvrekp6apsAlAFDT0jJUy7JDPFaN5k0CXjph3Ns7K0dLsX3KgEu2pDr
 5QBnY0TfmsseKIOtt4eU9h87WsH/XRgshexll06g+tt+sQeJbMVOfUAbRAjyaPlZgagIuMMWguy
 OqcTaQ20/tgoMDwklaHhUsANgmgj2n3IQCYeDxbSbzqhdRgZ9rzYfK/Y6XOXMH2XbN8s7z/cKP2
 Y2pWiK8pQThF10KEqVFYLpXL33GWTDoQwdDTScze9dbc5QpLOMEX3BUEfENw2XzUBKA/dbkR6Gn
 +AiiThdh53EiPaeQqat7QdyzuFHfOuKJc8lOsRVw8TJWhQXt24kHv8NASvaHHz1rMhQdxQZu01S
 ZAJTFDCRrDdgE/cfYOm36j+j6fEwUYRCKAp7xiGp1zKztjDSnf5kYbp9In40suEOG/KmlubqEBK
 X/zVkaDMgaRI5DA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index e19daf0f41f1f081e4b0c04be71e37f6ef492b6d..c9215c1a37cf4e7bad1512f52afdfc18ea616127 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -580,6 +580,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -823,6 +830,58 @@ vreg_l3j_0p8: ldo3 {
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
+
 };
 
 &gpu {

-- 
2.49.0

