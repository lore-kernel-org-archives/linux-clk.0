Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81A3ECBDB
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032315; cv=none; b=UdPbCjJMVqHYkiiN9FiXxPGW4whLQ5Q7VJz9mp+a3hV6UIi6tHAj0gmImgjcO244TWEPtnvJOZVe1CAyfhOlASip8T5DJY8SAQnci/G9JcR6tCZp21yNcEvNzMCCV46azL504+N9ImD6AUna7WfYyRi5C7JfsQGc8ytm+QCW/Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032315; c=relaxed/simple;
	bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCzVOAit00mTd6geenp12CkFZ+HSq9Q0P3trgKHHPtozw58irf2ln4KEE6cVzx06S+MRM2ySb2hm69lnv4KT9dftK5vOYTmun+5F+dFnMwGtOAB18d/ud0B3g2f8403oDBqv2gTq24IT12PBjSPb6qZyapaMLf/0lZG8HiuzHiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDUmUon+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDUmUon+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48375f1defeso47616475e9.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032313; x=1772637113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=JDUmUon+++4UcIjtyulxs0/tct/N2IreWv+XnKKe8JTibOpRRO5wDrFbXB9wuqg3QZ
         xwVnS4Qe3Jmj8GDDP88sqxQ0fvUF0cGjG4/3NdaGzsNL9eVljcFEDrmfAxpCZeXUA/6D
         ADwR/OZ5PyE0YhL3n0iIK8AncjVLH63vj5Cg0tm0aN5GTT4v4cGrnBwpM1Ttf9wHU8W0
         HtU9kDAQfgVHpH81QCV/vyEulXq9GwfdedX9jq+w3y3K3bZMyjkdksQDtv2L0BvNJHdD
         jb6oU2XdxQ3J1JYpbT8S35973S8euqPsGhZFx/BhJKmrT70H0RXV0Hi7jfu3ddFwhVaR
         z33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032313; x=1772637113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=PS82oCRv6AZNa9twI9kqnomSM/zueiuZxENZewZY/P169Et1x2QR7kp/oZya2De96G
         IVLEUVeL/LPtKSGdAN7MGHRiCnXkuhtzxvzRuef37PMSToRFd3ua7HwSL47z9hdt5ZWD
         pI1RmQy6oTGYz4D6uBNqAylQ1ocJAfWeyfVfuUF8x135aq7E+sN6GI7wSF84FVz7CiXI
         bYeiFwyMmLn0ydHDKC8gEQ84kVJQfndH7jbkVydKbf7alrT8hOENeU0k3W/jleAQzwUz
         cIQ7Sdyr3zFUy1LCVaew3DkifnQEhag5JcMggt4DwlOYz1VXdxDnLnkqqai8amCcCDHJ
         C4jg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5XVbUVOTJnCKExO2dLaQ/KSphnFCUBC6YBHteqEcNnJVWvRUI/0fncqCgEflQoDMlgAMbskQVzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmqkbxdOr1lLG5fhoaJyB7JasLB4LHcfldgvJVpUMRQEGIeQp
	p/8AreYzPYt33ottKAUliL+oDGF9+K6zaoL6SllZTGRJDX12+w+BW9LUnpGun4REX5U=
X-Gm-Gg: ATEYQzzwgve8tHVMSs09riMBcqcy8JMfzh2duY8sfjtqfB/fQDvFVejsLN4sZrBx9YL
	1Br8Foak/8SVNLaKY9ZXx7Mv8b/jovQ5JrXm6b2US5KL30pXfr/4xZHLZ6NTHMuTkXgQuUX+79x
	VJIjQu83v5r9+QvsFlfSCBewQG7fRb+22ptyZyxMgQnPVzWOL/zdtkFZnITpXG6RQP58XAPvzu4
	Btcrwl9lPq56MAlt4HbCiO4Z/8fs4gf29MogbVn5CaChO9Fn8xqZiqQy/AMPKG6xlNlTWjzvWdn
	osVpNLMAoOhFcfbnsJTm3rEOkxYSKWFGRwn4K9hN5GtBpCvf4pmFvGE31+E5gLlNfrF3w8Zt5So
	oPffwXpsA8dLTBkwEZf2ZQWolpHHtFKnkFMOoQ+BfmYRHfVjgZVFllArC8JPQ+LC2Zer2emKcOB
	ag/bdC2r1vZoigQZNXmRWL34X2jq0pJ2KWfubMzOA3rpjoAOxM9rao5TLVvw88y3sM
X-Received: by 2002:a05:600c:64ce:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-483a96378f0mr254970275e9.23.1772032312854;
        Wed, 25 Feb 2026 07:11:52 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:33 +0000
Subject: [PATCH v8 16/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcj6Z2Tptyk3dXGDm4ytGQWB3RGUhMVI6TT
 vaymiQG5GuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 Ojp0D/46vMLxdNq1k6N+H4nL+XPI+bC3nMN+DdJmlokpqnT277P9/FF+q6mAO50ra7IAWdNGyKi
 /WaUlDe1Hv7nlVtMAwuUvTfkLQ6/bDj2SI2ocf+1op1wN+ene4hTTZi/vNRMzeAqKHBMgo0H3uc
 7Kr1yhRq33h8A6BCPLjQY/Sev+tmG0ov4ulTajz+ecXErvHRNUMge64AR5yLYb2rtBh61oR8tEN
 OLYBkuUmNwdM8q8K/Cn2DlKYn+6ZnIUACfjwBQ2wQbT1WQPEZy1Bz42+RPLeVl19CUficqgVJ0x
 PmpnCFqozJr4uEKVyqwMlYwxZET8zAR4iBz1zDr/YHcF1ehW+IrajvIhh3/DsSZw+6WZU4wWA0r
 UWhGyhi1OKZNDoxuMSTfpuAdJLHi1MmVZuZZdwkI83KCD4OUS8WPjL93KSyPYTQf0SSocJlHabm
 A7tZJZH2v2jzSBDQ1xsIaQk+k6SgBzYY56KQ9aXO1JBSeEAvLp2yH8MZ4zQDLnEA2w0nfvo1Ju3
 HN0W76SuBZzdEPRJIkjpT/H04ATo9Iebreo8yxf2mUlZKx52l9dlCes2CfLpyrT3Qb/cFcGSoPO
 ASAt/g45FYKP5+kABKuX99yUVbjyoLG6GBRz6WdsC2yNTnui4dBAt1rHXr0AesOV8Bq72TbWCZM
 sCpA8PPdrVg5FWg==
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
index d6472e5a3f9fa..f10dff1da7f8e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0

