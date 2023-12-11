Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRvB1UR8"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE659CD
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 14:46:18 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50c02628291so5286540e87.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 14:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702334777; x=1702939577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVuml0wTQI2Sh4+KLUTzQhGG7DP8PaZ2ByvLlSAt3kM=;
        b=vRvB1UR8Gx0+5ud6Jjod0KaJmC4+0g8/dYBluzhDFIda7bsrOj+D3CXqMBw1K897tC
         XBzuTXf2SHiTSxmxuOck59S7qT4xiJRoTBIvTs+koqyEfZnQ8iWcZkPJ6Hpo4h0OZH71
         dEV92Aeka9qq6CbXyeEDPsZNjWa+yIMfWlW69auw0JEsUPdY7xwslKQHbgz0SVGBWlFf
         FJdXtzcIORK2xTi7drjvMcofC2nsp9tgHl112STJHXjX6ILqUqc80Z8gUhPi7UofUkZv
         Q5f598jQm+vBYIdkj1oX0fc9lAZ5KuHHeqxAJEg9xgyb2el+6sk/9Zp+UXyXs755m6V0
         FXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702334777; x=1702939577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVuml0wTQI2Sh4+KLUTzQhGG7DP8PaZ2ByvLlSAt3kM=;
        b=P1vyrD3kw5Qg6E54u7qGb9c8HIQz+B50/lUJ8tLjHHv7BSoHVz+aQm5xte2093vjLi
         Y7nQkUS5rk9W+g2qBOn7YRTGp4yU4xXgBkldML2w5wjBX+htW7B9rXITLCQXHCS2vaqe
         xnCRfYy8HPWIKNg+8V3qVT970mbcvs3FfdN20gQdYm4E4j+pZbzXBQAUZv6AlxFUpEfN
         cR7xXbqO4sA2s6l7rcy7TQcdl2D0TTy1/fW51g5cNzFKt1dS/FTA4nDo7XTcjyjbeRgh
         tiL9E8GTKkP2ezRonuam2SI75L9RVSQaWKA/cospJlXn8GAJ3VrkP+5kOWzxbQP/QXRe
         gHlg==
X-Gm-Message-State: AOJu0YyXZXOP/FHeQ/f5ovZZ7DmgPX1qk+UtGSz9Ug38yNrw3S4ceBti
	UiSGelQfq09BTfgdxDeCte6ONA==
X-Google-Smtp-Source: AGHT+IG9L6Qk+j/0AR9e+xyWPUF485AB4JdFSdAddVyAled9jrF2XHO2pQ1Ku056LMEzBmg9n93eRQ==
X-Received: by 2002:ac2:428b:0:b0:50d:ae2:2a9f with SMTP id m11-20020ac2428b000000b0050d0ae22a9fmr2075279lfh.24.1702334777135;
        Mon, 11 Dec 2023 14:46:17 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm4091789edb.59.2023.12.11.14.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 14:46:16 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Dec 2023 00:45:44 +0200
Subject: [PATCH 04/10] dt-bindings: clock: qcom: Document the X1E80100 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-x1e80100-clock-controllers-v1-4-0de1af44dcb3@linaro.org>
References: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
In-Reply-To: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=FOfc9+LMTvDZfP7GW0tpcJIBG56UMDNwWt5KwU5RA5M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBld5EoLtTNiIaAQ2h5mkx/v4NusoVb2sMUJthPh
 Bfqi3vJMpyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXeRKAAKCRAbX0TJAJUV
 Vjd2EACErzhicYKDln9GwLSFKvqpNnKglF14qp5zpALpWI+a87uXTEfQnSvtg8ec5Yn5S2y5+9H
 um5nG2Hphp6sGvUfvNOa7s05FlKGMTUOMPnH3ERFWelNG39PrRgVLDOMJWeDQzSrchfpkgkFzZi
 zDu5NjZ/0W1emwv+0fIut0cZwmIB1lDbd1M2g8GwiefFwTstqBuUzoGDN/YVS/P+3QqWrAbS+uS
 tQf/4SCspGyWBuRqAWk4MtWksoVmUvc++b7X1X2gGiFSSH15W024G3F0YgCkfTtonCNGwwvq0au
 KGEHso2Fgy3NIv0hJZ975WQWw5q70sitPw0vDfcrL0ToVy8Kf/0QTuZlB+4ziaiUFybCWTTadhD
 3CbRzXNEDwWb62ENrV6WHijX64A7uS9+p+WLWydK07iCYBQ9oACzcQ+C07sPX3Rgez+6K8qge7J
 XBWhwDL4bZkcQG3pkGKz6fiBFK0u70il9EnQ0vRWpn5GXToJswB7Xd7lqNTA+hFbqOX5AGXVXkI
 KaEPCAy9M0D0PWxAvvJ5dLQiMgBK/kuwmjEhDtVzSfEuD0VVjJCqN0xvwYmKwTun1Lvp1QE6Iv+
 ATrSCtRd75KZ3QYWaN3mR1LdFCa38hE0wdItYUs+HRnpHq9KqKAIzjme4m8VwwDxkN53SjdWHJf
 RTMZWapFpaz4Hhw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add bindings documentation for the X1E80100 TCSR Clock Controller.

Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  1 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index af16b05eac96..48fdd562d743 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
+          - qcom,x1e80100-tcsr
       - const: syscon
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-tcsr.h b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
new file mode 100644
index 000000000000..bae2c4654ee2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+#define _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+
+/* TCSR CC clocks */
+#define TCSR_PCIE_2L_4_CLKREF_EN				0
+#define TCSR_PCIE_2L_5_CLKREF_EN				1
+#define TCSR_PCIE_8L_CLKREF_EN					2
+#define TCSR_USB3_MP0_CLKREF_EN					3
+#define TCSR_USB3_MP1_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_UFS_PHY_CLKREF_EN					6
+#define TCSR_USB4_1_CLKREF_EN					7
+#define TCSR_USB4_2_CLKREF_EN					8
+#define TCSR_USB2_2_CLKREF_EN					9
+#define TCSR_PCIE_4L_CLKREF_EN					10
+#define TCSR_EDP_CLKREF_EN					11
+
+#endif

-- 
2.34.1

