Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAF3D904B
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032302; cv=none; b=bs1WADHQQqKru/q0iuJ91p+KK6pRRZU9GK3XfFRXUE8wprlbgtjlPCNj//rzees5TXgFJbBbJrZbOhLL6OhHLQ5XOmbfw+7NkbCXuxgeBl/o0Hkev2zeurDeNwFl9SQ5KCUH6NZteoZDOzjjwg3KplEn+aNuuXLdvsQqXZi54y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032302; c=relaxed/simple;
	bh=vxDWvv8mb+epglkH3Hn0cudwOLibzt6cGtozzyPrd5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5YIL1t9fiB5Z3+POiOpU3VQ6NdiJth46RTo2RjUr2OZDJPwTur3nhHi2eIjndEILHcNvf7GwdyMg3w5z9vqkn6rXFVcvjPfj4tZ8FM0+4nP/Jm/rtpGi1pi/94fUY/NT5U+pgdz403WOrvD5H8uHhma6xkEKTJ5QMObV4IVnMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCIlYHf/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCIlYHf/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so71739885e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032299; x=1772637099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9s59gT/FGqvCmBf20Rfr3SRMt29VGd619pvEn9JbdW8=;
        b=rCIlYHf/MuJLoWaEYbV5yNZN7n3D7u+rj77U0xteEzTJj61GY5wLr7N7AcmVO6pMZS
         XlrxqrDLzdClWRWZAeOjEPVxRshtrinLadwmOTz/1nWAM9Y8C73ArEBIxdMEhAO3Cr6I
         5ZZ9dLR69MTrqQ4wI0ayWIgvJ2k4tA6y1TvdsyAf+S72T2oZTkPzM56Ridw5ceIJPNWr
         lmM5BDwJuN5QwpLC/ZdJaJW6U+8A7Jf62of8fuA237iu1wzL38jMnNzmvkH9lZy9Q/x9
         zH5RjdhQn+/woQSwegaB6pz8YoAAP9UeF4UlTAlxnRKmIgh82kXct5kIW4iRM/8lrn22
         42bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032299; x=1772637099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9s59gT/FGqvCmBf20Rfr3SRMt29VGd619pvEn9JbdW8=;
        b=TddtZEChNUAA/P9zgw/M/Sy5bB4oCOiayFewrRoWTUsWFdbMOL3bUpkkj5/uOq4+hT
         K1cmmd/PcwCJ7vhJm93Vrzv4aXLDdeKdaMxFoKRa9ARvH1lrkib+ZCsCD7Uiz/1TFCVM
         RPzcyyEJ61eXKN7/ZgCe35fKKIzoT6i2j9+MLlKXL2c+7l8E9/vPrePc9yE69izKEDpM
         6e3AvMH673iPmYFFNZEiQ3j20CsKh6CZ9RiIVQ5rZ7UU86fuCaW1Ir7u2Pr5g7snW/Lz
         ZlJdH8IwvX7r6/cjoJtp5SaO0zh0JIxrfLWimGPvsHRNFJPqIjUVq+UxcCXWyVPTcqQZ
         C6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTFRMtg6FYLcOOqU+BM3QHuyUuSnXIJV1wCLBGHbVrdIg+m8hlSMJetrbrKsn87NqTpgW4AFBvHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWcx2b6nOEwTqvSEPVuQRCnC1VTleLPVlkOBxV4c8ruXE5FHP
	bsOCP/LsuG76Hc/xqYcdvrpsPMVXT9OBVx3OqxIuBbPw/Iu86Apmq4kzvYhk3cHnJ28=
X-Gm-Gg: ATEYQzy3OeYYEZDeDOvuJjKhztZaQG/MWAEWcifwTkRbLbDfFZXqX1NnwnIzx1R6cAZ
	9mK7MftXEbH+2d5Nc59yOOlaMYWlRIYs5XeJm6lU7HOx4p1YJPb6+c7YmIrbbftntm7CURE85Yj
	W5oV2SEtfKdC+bkaCrzWiTqiOFWl7aEwUQvllcF0r//QWpC/czBzQhen2nWHF9s3O9EOGMkXt3X
	piVWXFOeIeLo4+mndcaOOFcow1kWVg1Jv8FX47la6okrrMCXKcrnDZVFVT5sqd4zNnjv+w0p2cf
	RW7vu1TRcPlNFtEZ+vVM+my2dgVWl5lKr2uncILqm+dKeeioHSOmJdHRjGOLlWt5azHWJX5KtuL
	Lc2TZsOyKFy9/lRj/SlksENVyTpM6H5IAxjd9aksXWqIbEGfPGb4tHQ65w3vzfiI7mXJ2p7BwY2
	ho044MRW/AdflRJtdD/4DZYvwL2KxV9r3a98UFoohOyIKitLUmQJtZ7JuHggAizVAA
X-Received: by 2002:a05:600c:8287:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483a95e205emr250031735e9.22.1772032299093;
        Wed, 25 Feb 2026 07:11:39 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:25 +0000
Subject: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vxDWvv8mb+epglkH3Hn0cudwOLibzt6cGtozzyPrd5k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEaEoIre19oxe1OvOCjKS5o2WaF8BvG6PeQe
 aENn4a3986JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGgAKCRAicTuzoY3I
 Ot08EACIiJVmDfS7Z77Z/BcB4AiHRGmLOsl56C4TSvRZFG2UI0585PiSErQGcY5YaqN9ohoTcuh
 MMc2ll0mpv8cA4XjKiknzMyArY03vruff0HEhi2NtPE77SKjPZaXAG43sFVvXHBn1vFlNa+0OSc
 97sOsB5yGfx2u4fAqMkWuiclKLnifaC9ei/TRzWMyLxJ9/Gxg9KKPGQU9a7zdDs8Le83t5DoKsw
 lU3KiUtuekm0uEk0IJKIwFFrrWjszbpnQ6f1q1pZDldv+6udIbBS4wvfnSHZ+YdfnX/c6BdaocY
 rfhVKA9cIMAylGGDuwfOPnJucUZbkUAR9fmXI2stKrue5e3mdmGRx/YDQu7thXRP5somoNo6MQb
 H+Y7MfN7BvC/UOHmA2AQTZ/frhfFGkQrqmMI58ql/YSSdfoYV5lAMwW5ZiLWilTkXbHDnAaGotm
 dT9s1T9l9X5Xmjv9jX0bJMOOK5vc1WRyIIZEmiTM3IXyDlewM73E/NADV3iVpeAtTkxPldy/IdT
 bvLk+ThDvukHQcTp26hw/3fCdiMcsLr0pqxHJJ4Y5qC9IWrudCCrXGzqOeZ2cKw9Hb1mlv9MGHn
 rdyx+W4gPNeLdLOBgZr/5vhScMjnJLYsB8jjBhDOtcXVtT15az4NlE9JA+9DHiyiW8a8dZYPIZr
 cXegTQh5fGISTjw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189..f96411f481305 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.52.0

