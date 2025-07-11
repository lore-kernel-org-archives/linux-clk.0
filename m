Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6EE2D9790
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238695; cv=none; b=t0MrgEN344OCCPBvjzxcKQGt9PQD1BDtd7ykh/ZV4sYC9yLWdgHBQSmuj0vcKC4px7YP7DSWvaHWYaiZtM20y7K8Q5JQ7ptMRGUQQ2yS91NY1Bx22AGzH2WCNmea3HT0bldfgzGBlj0fOZs/KpUK+1i07oPOE+lgI+7UmHtc4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238695; c=relaxed/simple;
	bh=DC8lQQgBhGrUjuVpvDAzUOPXyBUoKAMOWS8W0IK286Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NU6YMK+/b/2XZ5VErycWj9+5GMOOPe6PDsZ+wS+Z6EIpFBIvvUaYUdiuTo7qnA7xCfQvMGxjmN+c0xzKOQeCcXhT2oV/I6XNpYpazC71hpBVCkuXtrog25lCKTlfoF7jB5KqabgIvf3SNKr41+JS8NsTBi8V8iBPEvqUYFZt6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grU52zbM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grU52zbM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453398e90e9so15843545e9.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238692; x=1752843492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CMfrZlT6BOfDK51FjmKuZQYkC8CEqLLJ+DCN6w6Vww=;
        b=grU52zbM4frZhFEMQWwmPH1auPRmh/0wGljv3Kyh2RgyLPj8nuXmqcnbnUPo70fAmr
         oaeJywO2eU6NqPakdEo04Gl+QxVhWR2LZDBi6GPA54EJMrCf7uI4yZXkyBqzJ4fz72nZ
         ey+09J9red1sDMl3uaQbkerhTmGzvSz38odLV99+NLEZAEUvPm53ovRhTpG8SZXMfPTj
         spw7a6uoKuElhfe6huS8GNuiSHrrIv1CAKMNaaJ/+qBjK0pripPvvYZ5ExnccrQHLA53
         1PY6J0dIHVhNmfHpBU2tBFBQ6BJS9ELQ1QDTgzFVU6beLqZO8Wyu3ZdJdPe7JNov3Kh3
         0Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238692; x=1752843492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CMfrZlT6BOfDK51FjmKuZQYkC8CEqLLJ+DCN6w6Vww=;
        b=t9/xGqdwrI7qyj4uy+j84N8MHyQPAWd9zvuVaCeoYA0Ig/EkMx9h4f4pMBLe4mM7If
         7fPwHcVpUA+HxPbkpzPj8O1kKszIbZ+Q3fMhSG6/QAw2DqJKbznIy0BZeqXNP1+jHNPl
         pY7yvzQo0WbuD22/19BBYchmm6Pb/1K5mbNbf+oEghQ3RMbEUYTm/ET4lLo4xKjrxfyW
         kD0BZTPUusIgfUts0z9MeOblPtYkPuRPQ8EHdW3Y5KSONckIP/fQX7A3+MzOiuD+8bwX
         3hXgW/HwmuwFhNY+HmbXiISx5sEaZTozei9KVwwo5XkbnvOqem1NYztg+yp24Nbcj9yI
         wgTA==
X-Forwarded-Encrypted: i=1; AJvYcCU83Nf9bXT4RIvoPomYcgt1ftUYoWf0m0CUyxFImW0QqagFfpMZSobkzTW5J2FJx0dJVIwqUAhwNeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGQM2TokyAwEsV5Evx9M8Nfud7/t9cAX7Wgr04+kK/4ceDY1b
	RFSaZ933OBbLeEKL6ITCh4sMeK1GPZ3EFESwBwe6RQxCaIb1vyM9tEff/Krg9XgI2zs=
X-Gm-Gg: ASbGncv//xxz6Q/a/SeX7wFIXoSL30UYWt+9Nx8si7UnRucwem0h5KIR+ZfQnvczIKq
	XUrFol9jFX1sxfc1sgGptg11qzAlANDVUTk0PWAdHFPjwS++pt4RMobO2kbYc/YmhAEQ9/alGk9
	21lf7+brQpJA6hlms2cSivkOuLFgtlVLJOXur/FyfoXJXYcghEt9a5dkCtgDbg1NHo+EvPvRZYc
	boZXsYx/IiD6DZ1QT3GOuaVYC71Vz1s+7LYBX9o242BylmbY+UZvIa2EtF2Hc0JiMwXpUdiwBv9
	4UuYQkTiQRa/l86OEKFHnNLH6H44OWTUHtELYi9mWU3ZUFawnSe+DZzvtFrahOvv1aNNOKk3UXC
	CmXA2yqTsyqgLhsp7WGZ3j4rJWS5lylSfK8O8U/ORYEETFIcGl9XTWzmNI5o6Vf2h
X-Google-Smtp-Source: AGHT+IFeN7RssZ8OZq46whVzMLk2ZaK0VONX5ojCESZtAHH3N+yYFixxxLG2K5wteMhwrNLjZyD69w==
X-Received: by 2002:a05:600c:608c:b0:455:f6cd:8719 with SMTP id 5b1f17b1804b1-455f6cd8ac1mr5110775e9.20.1752238691851;
        Fri, 11 Jul 2025 05:58:11 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:02 +0100
Subject: [PATCH v7 10/15] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=DC8lQQgBhGrUjuVpvDAzUOPXyBUoKAMOWS8W0IK286Q=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpUVxNLCyGgV/xKZbQ373RcoCEKK5iErK3Oa
 +LkMmEITyWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVAAKCRAicTuzoY3I
 OqPyEACmzIqvaXkIDWbD/Gln56eur3/lpZDyJDaOwABLvZO0pAML9msun28tWxabKpb8buWiJtg
 l/tt6tt9tjAH+jjwVpqWDJSWC7lqAw48Lh7fndVbB9dCP/6cM8Pgf4Jj5DTIUvf9v4F2sWAvClc
 kWU664KVXvulo1FhfOHXCxD6WzQmoZJobKqRCMPZ+NEIsmshZDpU9LVxQUcwlPl4bP/aC4/gTdT
 6vlxB6fx2VJqyuRLzmL+KjVqr76W249aO7bxcbPdMCqLX1iAMNL4gfzAuVuJ28GGiq6AyeKti6L
 y7+EFGa9iibgaKee0Uyeuy5RSvHzi5mnQoZcfOOtsWVIqD65CauAA10uX0WBYk+3UoYmEE5OmCP
 4kOdr4t4Kg4Q+SW4Th0eaJ0F6ignNn6ClCOXqIswGQMzllN9vyY2EZdxwzWtPhy7qONQUQaGYd7
 baaTKPRcEFvjfGr3/8UnxvazrVhUrurUxAa1qZtm5RPoS+IC74MSfv7ItqdSwIelIQkuzfxZ+w+
 7pTz1PyX4LMsibwnQJHEae/0PFToK4v/NJGFTPmuTLxg0U3rQF16hdAeXpxKICQzeETbjXNd8FS
 NqKX04AF6hARl828nKdh/jRhVKEzTswpiLYxyTP82Xg7aJzWUrAJc0ot4Pr4GbvwlDA5XtNlvCf
 sQ7g9lCmwozagpA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index db87b9b5be63d4fabf5ced20b23080a1a49b1207..08268f60c305cd69baf937fced6d37f2ea788b62 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -960,6 +960,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.49.0

