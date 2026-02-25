Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB33ED12C
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032319; cv=none; b=MJ49hywCJj76Tlxz74Rk+bzkkxWZy1/v+WX4pfjUwTeNslp1hwMvyE54Sj5LspgqL4GX6REE7min/vwHfACNOWDlCJ3Z0mm+h4BvnfkkQd+kHWJvLAyY38L/pqE/S/IhYoNpgHBxl/zjJ7PKG/FpK8Qomw2EMsa80yTii4sdJ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032319; c=relaxed/simple;
	bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8ASaUqLpClEhmQBRLmMfya42Lg6EKvEjqxiVLYM1eF0hn0tfh5JAkzSW6pZmlL+tB+MvcdGF/LPNO40OEXHOIyMhN1ybc6n+4pxf/dLDnJwqfG7zAzutyZYxP1I9+S6cmgl/b0AGC6how5dTIhHn6r66LxNCJW8Q2LGMCdJ+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeaSEnys; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeaSEnys"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso52016425e9.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032316; x=1772637116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=BeaSEnysUQJJmPwOPyMxDwDj6Nvu47ngZf1f1KyeaSu1Ll1VPKQtbUJs9EVgH9x0cm
         hGwcDfdf1q8Y493gqvylCaUpywVdXMSbxPLI7Yu6EdAQjNVbmJimN4gXUb1mAFN5EBM6
         MjoPCGXkGd+vNEI/FnBSg7ueUdU6plzthAExgbSqRM4D7pH5O7oGZAjLwNr49y/5wVPz
         V+6ZpBxYhtV7NFT3ToMkztdb9p5nfr2nbgveWnkZa6/lzn5DTKxk1z2ML/p6uB7bFj6H
         +4HqMszswXAXtbS7YW5w0Mhw4wnctExv3zy2cMF5jtSZrKJoqy79oVcdVrDjuawElhmq
         IsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032316; x=1772637116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=nrfddtdKMiZefujL92jXIcoHwNjlMmCqeMdoFiHuefo2ExEvMz6sguYOTpRvTMtUSz
         9sEBdT/xEJuv4Av5t6kYIlMs3rveQxXEg3xgxq5nc/0ym+jQFa89PuMuGzvo9mJ3BmjE
         ww6kuPN1kk8lP4QpFRUfGrV8PVjs5Zl5P2CwMIrCfz3IyAIRe+hRb+fB/LcUS+ANYjoO
         pYz28kcHR89buTw82OJ4keLBVIbUME3d4iHt4NZhFfACoU70ocYgYwsrwcC8JF3X2AWY
         2HTFfm784UiZ8XKrNYBkrl4f8rjHHrP8rqVkHAiBp00qMQloFnyVejKUZOUUrm2NFA/o
         KaXw==
X-Forwarded-Encrypted: i=1; AJvYcCXatGDdUxT/dHGjvvdwnkHN57g30T62aCoA7zP8Bk2bpfta8jsUPeB09YbUNw9YI4i0OW1TW7YLlPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOo6VuN3qNMjjwWv4qaIEDPo1csxDsFDMRjTbX+sHleWc/AD3o
	WY24hN5oielOKw+21QyELvcGgygpqXHEuu2JGK5e8EeAk5KPStkK/cyiUx9Dw+1cX+8=
X-Gm-Gg: ATEYQzwzYbmfqq2tKmPfTcUzqIFpHrq+OrnFNvy7yYvIoW0J4xqaCTvV4mvq3F8v2IB
	id3V9UAJQuTst47FWkN9K85KYzHfn0cLpS0JtB8QQVvkRT4/9T/W0VlPE9wMwJ9QRmo+NH7f2qe
	44nnU4WGBqkNoY22DNeIRVjduVMe5UUJ+NDoYMeAOtFjkvitdyp6pvoa7e7//7MEHRNosdclnbP
	+4IAkKS4hP/dxad7SQvNepzkJlMZpH8VJWT3htdt5yKWSeRdfm5xFKLazYMmIWMYbx04gBPVVqB
	yrPGxpy9AkMHqrPBJlcbtWxL3Mfp0ifywcWNcOB0LueM4judu37EtYeuVLH22a2WOd/bkqcTfcu
	7hwhGAyk5T1RbP581piSKCWdi3uv0oXEvtXnJp4uH8LmqJc+ze4TzAlgvJanSFz9yk2zzDzrSGq
	eA83a7n/p4btkhgEzqJVegEx+1W51lnu7GESTY0p6w+9cI4pbQvfMXkK+JSjkn0/Gq
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr255370725e9.22.1772032316285;
        Wed, 25 Feb 2026 07:11:56 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:55 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:35 +0000
Subject: [PATCH v8 18/18] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-18-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcTGwAibtB0wENsoOC1s/k6bz4RyirTAXoc
 7ZjukTPtpCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 OitLD/99TbZpAmDM1v6XAbKZ/oSRLA+tzBou8rGcdJ5nf1guXh1CLNuuhnm6GqG7Pbyk8X3WfFW
 VE+3wWLJoFwv8kXwlkwwwCYtdMYID7E/IItqUBVlNyO9v4POOYomAgvjBfozD1ee25uZTMDvPQ5
 JCXh3ubpjOPoFOZ9VlFx/0i8ADEbFbthhl3lsFO4YNaj8dOmACrVm7nbtx6l1tAKm15W2KAc4jJ
 eaYLi68Ln3i1n0HKMsfO9tWtRlBvQw0K1hpyOq4vlUPGp+qJ2mfs7xldjCCIVXQJnSKhuE44yuA
 CXCKOt19GiwEtpFb+ZpAWmVrEsKOonWyEXYKvf+5H8bVcbo7joTfbcWsYm8PCGJHnG4VXqqjZdX
 XyOEXj4ys3FtU0JknkO55+9gxne80Eh5wUHcZJWl3DyOi1c3Tw9Y818tH6jqR0Ai9I7ZLNWVD9l
 95L8CTR6rg+NemKwEDFCRpelZWzCSjq3/Jm6b2F1Y2zQgwge3cJhwJdaFhIU9ieuy+Y7NqvP4Gr
 fD+O0qt54vAD0ZsrC6X5p8JZ2JxAcmvi2hiOtxN+3IWfbkHYrTTP8W2s44eap+9jKsMwInTUm0P
 dwqjIezR2ZTAeNOpYPyZ4op83A5xinGC08v3HfHM//5ak0BONBW86Xae0EV+pkI5UKV4CSv8NiD
 iX4GYktCULafB8A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc9..d21963e52ee48 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,66 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.52.0

