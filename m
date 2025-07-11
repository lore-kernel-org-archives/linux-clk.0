Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626D2D63EE
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238691; cv=none; b=Yn3Ta2+uTQC7Tp7fB3DNyWD+nly0eDUJG4aGMmByNU0VRtgXg7pO3Ty34n1ewsRdzi9D+prWdrpSmxGMjE+8c/u4naR77vwTpLZxVtzuyPHA1r/VdDK9gtLayF5KNEWqsl3HH1CgSrB0Ib35ldX9310aybdNn2+lj4s4g8UBorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238691; c=relaxed/simple;
	bh=s/FOJbSlQeO3+Z2J+SJp/YZoIIMUI5Bn8uUQnBwBT0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHyA3Hs4+nJCANRce9yf9rTkcNPHzfjpIDDlERtHyvcULKZCKGTSdpmXHYiAgMNlUcdiiCuOgoEkVDj8c/c+/g6gW7HHfvWMxXtG9MUEpYpwi8OsPBsDdTA38p6U4HzYGZKCg2OyEZzhxgF0RcSA8+jjK029XoPPoaN+15lHlGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqP53cyl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqP53cyl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1654578f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238687; x=1752843487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J/cnuWdOkYkLDLmAVpB1tJoL9yoCzJpgqRMTTxoVtA=;
        b=KqP53cylcMe4r7F+4dIxcky6PvPo18aP0ot6E8zLHqYTGVnqyFh/8yJmiLFKtrxdkU
         SmqTIZ1RrlWdKIKFt3R3sWrxIHX/aMnAJaAv2WtWbeEFRKeEmj31nWI2SImRHQKdF8qz
         l2GdQOhc89SJMddYJIYDqsRqJGK9UxQ4lBQMQFLLG+cLNnvZMy4gQ9W8XaGSyOLOgk7U
         Y6L6OExtDNecuMkMNjwDtLqY+STc1Jd7kdC0Ntvrn0pq8BN5uBgR0GzuGJfw0UmLvAQS
         RYaNSr7VP/p9FQy5J5FwXSVY2WgVO2dHnzgpLOeBlms9zOn8uxqPxbsKlIwv5kuaNxpU
         HmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238687; x=1752843487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J/cnuWdOkYkLDLmAVpB1tJoL9yoCzJpgqRMTTxoVtA=;
        b=qJzUcFk1Ui0uRsCi3oQ4skcRiKyAWyN+F9RU9iu7eyJY/0T60j9SKSKaDaKZkbOsdo
         DOIrYQ7PV0B9EMuGT79LFD/pJYaSn9dniFen9GR1qshpQ2TREF+qzlqwLXH8lnRfPrtW
         H67lmGaEQFgYrfAOktXGpvIk8cFZ9Kp2JbpdTAI9W/DFmVTDlPLp2NypUMFVJixa9wqq
         cxo6LD+zBpVDF599axSAWuWP4c1/OKPYNLVlvDG73uPTNqMfB8eL5h1tEWPbPFsZBX0q
         UTQvrtHSFnlvlDlhV+iT0sCjxjZSRVADMYanAicuYJ3QbWLduVu1frcai7unN4j593JN
         DW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUE9O8l4ipYL4QoesKNfL02+9f1OiCPqOScd7mTBiHFayTJY47eqoG6mwsBvd/voJOi2qcHuGkSIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCTAF+GoRffEmHjeke+HqBqRVuesAYC2Wuv7J5Bwkh+mmPxFN
	v9zvHOAYgxB9cP7A9Xiqt8ufXPdFvNqOh6aF+sysofNPxraguLsDAgUo/XQdmHvBT/4=
X-Gm-Gg: ASbGncsCv8gTKkIdDjoqVyF0TbuVEFFuy4fLLrPtNygSmqJ3w4N5ThMXQP3LGjUdeeZ
	M4VGY0mafGCKM0Zxed0ZbWWnGF1VPmOIuQgXuQMUx/NO3WQppK1k+pTOWW+171QVALWSor2iDPC
	lXFD73A7fd0wAuaAWTGIxOA/4r0QHc0BwzPCoycuBNYg1oyPjhl3teapRAE1NNLalTiwrOklvxc
	qf+qSLCTsVsfdVZ3ExHsPyt4Qmrphoqv2dBI2S7QPjwX3S4mrGGJY/1jkf4znGbVnhqeAn+i1lj
	77PvWJ2my0ZKvzlcB0pek06q0f6ai6l2J5O5MmyAKUbDdGfS/hN0NuTWCmVk2qB/2E9anPdhOzT
	e8DzMkZeL0leGxkqZR/4GW1+qv37aSqdHDWjBQFMRetm/gQmHHucvVCsgAfZZXAUX
X-Google-Smtp-Source: AGHT+IHvcftvippoxTzUMJZLipfURwlMqWOTVLT9wxj7eNWp0iqgE5g0VRrFKt+R2FyVjN2LvI2ebA==
X-Received: by 2002:a05:6000:2dc3:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b5f187d0c6mr3318556f8f.2.1752238687019;
        Fri, 11 Jul 2025 05:58:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:58 +0100
Subject: [PATCH v7 06/15] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=s/FOJbSlQeO3+Z2J+SJp/YZoIIMUI5Bn8uUQnBwBT0E=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTFx8zkceNiUaYUsZdvK7WQvRVqH+03l0zy
 bCCWoyEDsuJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OoJcD/0Tbn7oETww3XOod3HFb0uUXY2Ruy9prCVJDZdiqMlCft2C9sMT3KyCPvsEW67o9RU5Ypy
 o+FqkIpAKekjMuBQv8N9WAUEO4fyYTmL8S/TwLU1wNLzpAk0cc38m/vXh2YkGxwuPfWbmNuWUOr
 9dC4zj1HyXQSUd4WwAUJ5rcNCJA3f0akDP60V2jdCZDqC6qFhYxrxAbDIVAJQsE/JwcQCsWR1W7
 0r5prowzaXXMV9S7EuXxiyufZ0AqhJ6MQA8Kq7EbFNnwVEsF4Y0KEU33wV0bePisQySMHSNLNyR
 c/bWa42NsH8TctDa//2fqMy2nQ1lA6NNn+D5S7mQbd5qhBWhccw2zJ0T+FfDgwfOriYxoK27m8o
 2BdyezWCVegXutdV3c2+Wr+0muNns5hNNifpGOEEWMUMg5xbiSa5CIdYphmK2cpPNJY4oSVDMg+
 XlRC3y3ckDgCxl+GCothjDk3YjpN5f+m0GA1OvWtmhXap/TZvJTdb83YDgbCQ/nLLN8/5uPG//+
 8Ht56rygJLZQkwhUTj53hBqH6hunsNrN9IX70/WNR6VMLv4l2XJ965MiAYDiuJvLwGKNMKzA/P6
 GTPCH+S0JsRKpgNNLWHoBEmnjV9JUYhKRVQEgV8LveN1NzyAWwfBY7cJOgszBmwjR28OPukoGtj
 bjK9obxCrIuMOng==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..1dff82692ff6702c5577ae9e693ce3f7ea215eee 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5165,6 +5166,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
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
2.49.0

