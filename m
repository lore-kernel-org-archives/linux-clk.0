Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539726;
	b=l/2ttoUlcvPczvogxgJGPAdn63SdJQKhAZXzssdwME1vxxbxMornpX0L1y7whaSS08MW
	 Aijj7KAte4ZuPYu4NUuob5d71qK4hYdakgpjuCsHvRaZyKuxnoj7ZFzkbKflN/XpXBEpm
	 +xeoWHvmihyGQeuL+aITA5JvZCmdW63BjknJYthW+Hxx4ID3i1ptGmTuFpC13HgGoKqpr
	 4ClODU6Ap0FOPa4E0mMMNEjZGTNxd5xSCN5p6VufeeNBcT++7AyEXqw5w+EDZfV2t22nd
	 FNtLu0u2A8cXqacMK/FEt1xF5pn+VgekWqKHZ/Yo2b51sPGTUHTN9Zufu/5KH+6oclg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XwT3aZFlHsd58KLKRbLD5G6I9G+3wvp/vZ5Z0SPwh3I=;
	b=y2Y9MgxLPLij1xHZcDP+qnxbfmrTJiKWXxfo7qE6O+ewz7F6LVn6zXU0EC7L9tyGqUqi
	 HmLpBldIkpAWrcAZ/H9pp3Qmnh0f+jheMIL2yslANyuVLcYpTosbLbAZtYy+G7zMifuJA
	 o9IOUm/f5H0BIyWUvqrM9k20gbSOUN39V0HqoPxCd1z48gQawvUV743c5aCJrv1TxNTkw
	 elJC2hasnAoNU5tBK0wlpbuTnWxffuspENYGpmkxEMlqLfRs92BwXQ/75mVodcK0IqDrU
	 0P8sFjZZQkNTW8iqNtXwzy2YwbzQyTA3IRPU7HO3IKGe8sKJpHHQ0MebaopMJZTUugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SPS5lF+P;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED92606A32E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED92606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SPS5lF+P
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so6511871a12.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795539724; x=1796144524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwT3aZFlHsd58KLKRbLD5G6I9G+3wvp/vZ5Z0SPwh3I=;
        b=SPS5lF+P0V8ueoFqaMschkK+BT+fq5Dq9t2ANbnQ5/YeAh84fFyDVU9QQ5ikaAXFBA
         yIr0ILHNjTrKHb16ZLuO/H3xZKFLVzb75T9X/NKnSfPxK1h5c0EzauiLxEnLZ+Pxyk99
         9zPZoarVwPv5CXgyFasTA5/BYA3g7HGRmAnMbLBsyDqbXyAYAaC5HZ6RmEYzlyzrauQC
         x1Xi7RkSntl4DDqMoGcF9RHRDAHHDW0ZgDMYtExDy6S8GFSbooNL1QA4Fr1/RSPIAAOX
         noWNLUbDaLvu5n4QSM+nK/6f8088NUIhT4Emc81jGsMtBUoWSrxMO60ewUcM4tTM5FYI
         Xcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539724; x=1796144524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwT3aZFlHsd58KLKRbLD5G6I9G+3wvp/vZ5Z0SPwh3I=;
        b=CILGLAdZfvD3ymBwXj4HIvZ3JKyVI2ZEFiMiB6ANcWG3rJf49/VC6e/ndS0CIX4xRQ
         n9hhWWpXJv+2jjfABr0hdbmQfytNHPluCbFYCegnBtJBS6OETplYAsKCoLUrFmhCqjnL
         cTJOY1Tk/s++d/9PuX4+jNZfHa3PB/9VYnl0drSRjXPWIE65laoagmoxPFdC4xcp4aO6
         sPxQc2A8exxNg9Q3mXyNWZ4OxF8QnB3MgbmBAqG+z0u9gb1yoqq9shgsGtMMnB1aH6cV
         uezQ+MTnSVkCx+dZKXvL10qTRkUYPxMCZgOrq0cTf5p2omSsTMySB80yiiW3PS9gnBbg
         LIdQ==
X-Forwarded-Encrypted: i=1; AL+hErHpixa5vMTFdSpp9DHMmFNaSMqEOPJG+27Lv8YTi4YhYAXZOkEcQplM3g+6lvCGlPCsu6bToZNl48A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dPh7u4iWdS5ESXNOYNb6PnpNUa/EVShRmikD3IpP2H1mVs4G0
	CnD2cubWANaeg0XQLcc8V/Bp//CKx1WE0d0ZjydtAkvMiDhEw6KFfwP1pOmFrEfDYFg=
X-Gm-Gg: AZFdTZc7Z6Fm368kqBMs7X+AhCNV2d87erTxQ/30XFwDZHOPzcjiDBNejZstyWFO1nQ
	zo3lX4J/q6IZH/LZV0q8YNTdPvWREap+TlfvZtu+VmlD38BeQ0f8dKaTTeqmpPPlJzi8Hld6mkR
	W6BlO9ga0kVMUMowC+WD3XNjlH+xagDeCcbm3duIlmq8uv0MUdfMG90uACIFKZGAzGDqnBQmj1+
	H7zmzrbxixCbaVqgs5vUtUl4+on8t75rNOULhesyJ/OuIk7bgwpmf1xke6ICV9SBJV2Qfsr0ZAv
	4K8t6daamTPVaXQzkeFeK+0Rm4K6bz/8TUKNvHizNxok5kleY+odAWEOsvjcTdA6pdh9gp5kOCj
	NuEjo/o6K/3oSQgvVLwxk0caJXVCKEP+dg9gicOBFbQPZCwtkzcRo3basUAoQm2GA4pesBC/iyN
	9JnSXkrfug+A+1DFEtL92MVQtPXv4012cA9UIvy6Kahx3yPBv85Ij8XUssjqz+T6MNxgXeGi0Ak
	fKTtpFP6cKV+8frWfcUwMTiJ23U2lbmVChYqwFi3Bcf79DaG4wI+iznuDVAKLnosApbMRY+0o/z
	TLy3sRaizUjsbYnzcfS33/3/VfrE58uND35A/j7fFJWbCRoKrao=
X-Received: by 2002:aa7:d353:0:b0:6ba:22f7:189e with SMTP id 4fb4d7f45d1cf-6ba37d63cdbmr7700846a12.7.1795539723652;
        Tue, 24 Nov 2026 09:02:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm30778526f8f.1.2026.11.24.09.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:02:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:01:54 +0100
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: add SM8650 LPASS core &
 audio clock controllers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-clks-v2-1-8086440e2c09@linaro.org>
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9194;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vhU5lxH/H/+EwXmF5EBX46Y54+E+pVR+8x03INwtyfU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcMJR0OkwtINf5f8wKP1MohM6EwcAEgHkLh5l5iH
 fGlpu2aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXDCQAKCRB33NvayMhJ0QcLD/
 9C0HaX1zNIl0B0SCoppJBxEl7WsnjMjzFZH4WZxVnwmhGbxhbEfL4ofl5Xo0gdzlh8WKBRgqKIvsvE
 Q+NZLPUKV/4IpoauFXxcxWWJaIFO23hRXa/7If+urXMFjC0AP09+KxTyEINS1gPXvMVZf6rlA79xYj
 HFJHkl0TM4UxHsl2HyWksPnJmNaK4bnbb0yJHImOX4hxzFyzStYIlm6F/I1ooMAOfoHf9bnSdrtPkq
 D8sAaO8a0RElVU6r36Aw+Z3+YzvZgIXwZrUADG5UeKLiShpCG3jmJpcHjBZEZGBTAivrXDX506PYLN
 C6dBjogZw2RLE9ozLBSSrl5qU+PPfFimWR3zLnZJzp4G3LqIVuRWiHfrqoMa80jStCwJlEKd0Xq1eq
 JOEtm7htU9AGbb/8h3qw5lZj/Pb7p7DgroRM0fHXXVietMYzhMTwogPwCOgVSBhsQ8gquYMbwnYYmq
 KMPUuu6KICDORxwK6uyEgMeVLCOerrOqv/cNq4LlD76nvQQJw7LKN2kqr0rl7U+QnEg+WH5GglmSUo
 QiyvAnolephcuf94CL2jhZDZMgiHy0zUMkYM8LlXtxLgsZ2x6xQcAJcOtXoy1u+iCEnoYdEtm3QQIT
 pMcdhjgqC5NcqYNqdwHUS0jGGoMqW1qEGfT8TqNMKt5RZ+bF3xukPv/x+3aQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The SM8650 LPASS HM, core, audio and AON clock controllers need to be
described to drive audio from Linux without the ADSP firmware.

Document these clock controllers and add their clock & power domain ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/qcom,sm8650-lpasscorecc.yaml    | 178 +++++++++++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sm8650.h   |  47 ++++++
 .../dt-bindings/clock/qcom,lpasscorecc-sm8650.h    |  30 ++++
 3 files changed, 255 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
new file mode 100644
index 000000000000..c26d16b4ea3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8650-lpasscorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controllers on SM8650
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  Qualcomm LPASS HM, core, audio and AON clock controllers provide the clocks
+  and power domains of the Low Power Audio SubSystem (LPASS) on SM8650, used
+  when LPASS is driven by Linux instead of the ADSP firmware.
+
+  See also:
+    include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
+    include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8650-lpassaoncc
+      - qcom,sm8650-lpassaudiocc
+      - qcom,sm8650-lpasscorecc
+      - qcom,sm8650-lpasshm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpasshm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+        clock-names:
+          items:
+            - const: bi_tcxo
+      required:
+        - power-domains
+        - '#power-domain-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpasscorecc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+        clock-names:
+          items:
+            - const: bi_tcxo
+        required-opps: false
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpassaoncc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: LPASS_CORE_CC_CORE_CLK
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: iface
+        power-domains: false
+        required-opps: false
+      required:
+        - '#power-domain-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpassaudiocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: iface
+        required-opps: false
+      required:
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@6bc0000 {
+        compatible = "qcom,sm8650-lpassaudiocc";
+        reg = <0x06bc0000 0x38000>;
+        clocks = <&bi_tcxo_div2>, <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
+        clock-names = "bi_tcxo", "iface";
+        power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+        #clock-cells = <1>;
+    };
+
+    lpass_aon: clock-controller@6e00000 {
+        compatible = "qcom,sm8650-lpassaoncc";
+        reg = <0x06e00000 0x30000>;
+        clocks = <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+        clock-names = "bi_tcxo", "iface";
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+    lpass_core: clock-controller@7b00000 {
+        compatible = "qcom,sm8650-lpasscorecc";
+        reg = <0x07b00000 0x58000>;
+        clocks = <&bi_tcxo_div2>;
+        clock-names = "bi_tcxo";
+        power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
+        #clock-cells = <1>;
+    };
+
+    lpass_hm: clock-controller@7e00000 {
+        compatible = "qcom,sm8650-lpasshm";
+        reg = <0x07e00000 0xa000>;
+        clocks = <&bi_tcxo_div2>;
+        clock-names = "bi_tcxo";
+        power-domains = <&rpmhpd RPMHPD_LCX>;
+        required-opps = <&rpmhpd_opp_nom>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h b/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
new file mode 100644
index 000000000000..c10e2a2639f1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SM8650_H
+
+/* LPASS_AUDIO_CC clocks */
+#define LPASS_AUDIO_CC_CODEC_MEM_CLK			1
+#define LPASS_AUDIO_CC_CODEC_MEM0_CLK			2
+#define LPASS_AUDIO_CC_CODEC_MEM1_CLK			3
+#define LPASS_AUDIO_CC_CODEC_MEM2_CLK			4
+#define LPASS_AUDIO_CC_CODEC_MEM3_CLK			5
+#define LPASS_AUDIO_CC_RX_MCLK_CLK			6
+#define LPASS_AUDIO_CC_RX_MCLK_CLK_SRC			7
+#define LPASS_AUDIO_CC_TX_MCLK_RX_CLK			8
+#define LPASS_AUDIO_CC_WSA_MCLK_CLK_SRC			9
+#define LPASS_AUDIO_CC_WSA_MCLK_CLK			10
+#define LPASS_AUDIO_CC_WSA2_MCLK_CLK			11
+#define LPASS_AUDIO_CC_TX_MCLK_WSA_CLK			12
+#define LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK			13
+#define LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC		16
+#define LPASS_AUDIO_CC_CDIV_WSA_MCLK_DIV_CLK_SRC	17
+#define LPASS_AUDIO_CC_EXT_IF1_CLK_SRC			18
+#define LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK			19
+#define LPASS_AUDIO_CC_EXT_IF2_CLK_SRC			20
+#define LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK			21
+#define LPASS_AUDIO_CC_EXT_IF4_CLK_SRC			22
+#define LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK			23
+#define LPASS_AUDIO_CC_EXT_IF5_CLK_SRC			24
+#define LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK			25
+
+/* LPASS_AON_CC clocks */
+#define LPASS_AON_CC_MAIN_RCG_CLK_SRC			1
+#define LPASS_AON_CC_AUDIO_HM_H_CLK			2
+#define LPASS_AON_CC_TX_MCLK_CLK_SRC			3
+#define LPASS_AON_CC_TX_MCLK_CLK			4
+#define LPASS_AON_CC_VA_MEM0_CLK			5
+#define LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC		6
+#define LPASS_AON_CC_EXT_IF1_CLK_SRC			7
+#define LPASS_AON_CC_EXT_IF1_IBIT_CLK			8
+
+/* LPASS_AON_CC power domains */
+#define LPASS_AON_CC_LPASS_AUDIO_HM_GDSC		0
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h b/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
new file mode 100644
index 000000000000..2849729a2e56
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SM8650_H
+
+/* LPASS_CORE_CC clocks */
+#define LPASS_CORE_CC_DIG_PLL                           0
+#define LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC      1
+#define LPASS_CORE_CC_DIG_PLL_OUT_ODD                   2
+#define LPASS_CORE_CC_CORE_CLK                          3
+#define LPASS_CORE_CC_CORE_CLK_SRC                      4
+#define LPASS_CORE_CC_EXT_IF0_CLK_SRC                   5
+#define LPASS_CORE_CC_EXT_IF0_IBIT_CLK                  6
+#define LPASS_CORE_CC_EXT_IF1_CLK_SRC                   7
+#define LPASS_CORE_CC_EXT_IF1_IBIT_CLK                  8
+#define LPASS_CORE_CC_EXT_IF2_CLK_SRC                   9
+#define LPASS_CORE_CC_EXT_IF2_IBIT_CLK                  10
+#define LPASS_CORE_CC_LPM_CORE_CLK                      11
+#define LPASS_CORE_CC_LPM_MEM0_CORE_CLK                 12
+#define LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK             13
+#define LPASS_CORE_CC_EXT_MCLK0_CLK                     14
+#define LPASS_CORE_CC_EXT_MCLK0_CLK_SRC                 15
+
+/* LPASS Core power domains */
+#define LPASS_CORE_HM_GDSC				0
+
+#endif

-- 
2.34.1

