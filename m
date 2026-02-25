Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6923E9F70
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032313; cv=none; b=F98arh8YfqkvXEuSnVwXb55MkHUmel90a7p6YpVwL35e/0HsnmZeLoLeYadspD3/c6nbDGUPjeitCXmJnDHx4eO2ElETFXHGy6P40qFvILPn2BdsE+aeJXOZjqRBViyTsG6Q/RiZlI5fh+GJ1tcP9UAj+qCDZYopdwlcOxv9Ybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032313; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3Ycjdavy/UPyGHKnN8NL79XXPxvAN+jsrHUVAyOqY448mrZiWVUELq5av3rMi1rArJTvE1I4RMfxMJQ9T2y+w076DZej+JC5PLTlireUjVd9XnYCWR7ZfnANLflKFVamSGqn5SPH/sCxnLII3V6SSOKHgoukX9MAABDJy+1DsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNMmFbA8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNMmFbA8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso76344225e9.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032309; x=1772637109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=FNMmFbA8J+aa8BXYxyPyC4DGsCg7f7AnjRpqdnLLGZUbb2BT70/88ET4iHTa/o3bCs
         fUylwvWUBfryOrXtKDoswQafDtrkk3xLSpdB2Wlihuww5ZWpfF0+honvGluGAJ27qLF2
         tlRU99nrlAdcxadaIQqUMRzj761dvArqD4jSToklrWkMrFz/UY0Yd0Rm0WZJpNUCDlV5
         cDFHg3W2Or3dv3uVAXqVO2Jpvm1rzFnjo0vDYZb6HPxJxqN5cnPDhyNVmHkRJk6N8fSZ
         FJnVnpxD+301GzBlXhmSBY1HSWWLsj78bUubmHMTtvlF2xg8IVkqv3Rh9VqYUJHBu4EE
         aqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032309; x=1772637109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=NAqxB8KjBt7fKMT+BpVZlfcy/R8oyTyc4LmLXAkBm+5Xb+n8shSQXtfGWMLQ2E3OFf
         Dfhqb4nhzzwyRaKKxcr17OTjGaK3Lr5YHiJ6ZYlm6Ad5wJq2kt5sxGS4ugjpLTPfWFmR
         d6PZ7kQmc8ZcTQ3/+P9Sf0yF6XuVTpSGSmuLDqClHVdc0kaPTjBSiYO9oXYmWECz5HwA
         6ghgQvBqfBHJz6B/J8FWgPMQDBLDXMC1LI9MpkJ+YpfRux8CsrMz2GwyFdaT2zT2brh4
         JRJ7k+bvRMnWZl13VJ/OEeHPWfeTpkJhAGqSh5XZV5uX+/tUqg0SzJ3D3L3gsIK2gvcd
         77kw==
X-Forwarded-Encrypted: i=1; AJvYcCV06i+JVZ+nBqwIvBn9MLVFPwFKerNgiYKvkg9mWtgxIOEAN+kdyjU0UdbgEORV5yvDSGP0fGvon+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxONyl9GxqqGk7ryuRZX0W9AKWh9t080aJUtm0p/Ljt6N99fUZy
	p5o4sZ3PWvBo371lyYA86yoaYdwTu8N6v8qmVtQe/F+JRyuqTTkXvvZNueDec5fT8i4=
X-Gm-Gg: ATEYQzz94aAhKCEuu2sWlD3Z2kgE7DKL5e5qGsCcT2IXGdp7V8mtpKae3W2K6MIxDKU
	iTK5h6dzL7cSx1JoR06PbQHosEBYcrj9TuoN6LuGx8SYR+KBy111hQ81xHhvgt8cebqelOx2H95
	C3+oPfN1klTYreZ3c+KrgEbwkq10na9tbe6G7YdJ/qmk275U6FshX9OO02DLoEYzhKhOn2xFfTW
	htoRkuhBIQNANXqs+shef1LjFNTn12iLgtmcaKmJtKoFFNYN04P9Ulo8fSi9oUmEQw2xRdgpxZB
	fqIM8/ihyJgnYJZ+Id70Qhc6damRu2xJv5xm8R3Cc0YU7ZEPKH/PyhTEvkdn9yQERlAwoLy5MjB
	oT373c9rDqJjzi3wXhErMhQ9DFdJFPPTRselYHYh7gnSxBXWtREVut3M8Pgb1OaaW94c/1uTSoP
	QHnu/wq3j+j7SFzdIHgoGWF3ypg4ZksrIkB7VTIQBqyS0Tn0UhprAJRtXR1xTWPAPcTxDRzywc2
	go=
X-Received: by 2002:a05:600c:8b11:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-483c21a105fmr14251445e9.23.1772032309482;
        Wed, 25 Feb 2026 07:11:49 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:48 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:31 +0000
Subject: [PATCH v8 14/18] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-14-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEbypSY7gQZZrQMbqcWn8NesQ70gzgmL6Cyd
 Gb3AnBBqliJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OlA/D/wPqQ2ruTl9hmNW5HP+yVRYKk5lORR5HSS3jlYHHPr3hklIFEpx1kD1wc2JXv+F+YW8nQJ
 gXvNk66N/U6wGWvHx3JL4upH3aqrkg1r4vissfTWqLxIur0Vx+7u+He+GktNpKAbjOkMwg52lR0
 NSCORdIDYBI2WN6tnBjE3/mYRigIbNJ0ZUR8l158vdW2MNq7Muz1/OK+GEC7yvdodNT6A1zY8E7
 gjh0lkSy7iJzO+kZ3ZLt6y0vZxj/oQBx08bKg76zw94J+diV7/EbvWfFA4AxetI1Mk6J6X6CFr9
 1snuyw173QBRlUL1ivZu/xFOiuQqJzzLozniOQH8alv2OHslMftGxyuolikOFp7mB4xbOF3JKbk
 P2AO7JK7BQSACYamfWO88dtEvhdOGQPEZT59fvkxLtgyBQo8iAVBzSKPIJ3W8dJkbEIxp2WhVdr
 cgYpmcFjJEhYaCQ0MH9lwSdupHVDgPTU+1StMcPfYHN82cPmdetOPrB4FMTdq/RcfQiZvigEkpk
 lOo3B5/zSUd44gvU62ePZ3Zg0P1AbaUgkeBMjMI3FACzJyU0PINN6JvE7vUnRgfjKNtsyX60Nur
 tFYJsfNZV3Jnbc9s3pHVzEZyvgztuMUTWh+S47CsbUgJgyeha2jlfdMF5S7NtnovH7ZppYibS65
 F8NCKKrwnv3uuUw==
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
index 4d7fd51f370b7..ee49785c9d005 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
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
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
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
+
 };
 
 &gpu {

-- 
2.52.0

