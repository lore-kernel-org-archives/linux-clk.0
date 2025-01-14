Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B928EC94
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845899; cv=none; b=IBLynEBv75QAF5qNl8nRO1lMwS8MDwHoqYnr+YV6vJ1nFFi4LXw/qEUbRHKMtqbRMzzQhViBZ38OWLuAx27wa9FPqrzv6a83tzJK+DEWcv9pEPphZZPMwozg5yYqcAw7bCyeB6ShHLcC6Gef6QFWBY1S/+yWjmd3TuAKDKIdxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845899; c=relaxed/simple;
	bh=Jm64LKstJ4pAW9yrMK46CoLm71la60rak1jBChy8Qio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHAltEtWQJX39z9Rzz/oh7KJtRbFEsGUjsw2l3e3j+MqM/pOfW9uhmDIte9SSLGkhXipJtcsvC2kCBcVKQsUFS8B0KV3xyiMNwGNwE497JqXvpIYl4COjsJxBDw84DlWIRdurk9tOQnhDxmai2ZNsHak86RyuoCAUcPLXXjTxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=is4RTWpG; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="is4RTWpG"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeecbb7309so983067666b.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845896; x=1737450696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
        b=is4RTWpGFfkuujd48o4N8R9JU1m3pgji0Yl4CUxkXNOSGi8xh9KaghXrIODi2rUsVS
         /haGcCuvsdJ06yB9t49IHdZDoLK80GGSBbcXlnO8Ul2FxTo1REx3XzZQc9tMcrhADvoW
         MTsHPZHFpYZd9v6GpSCzjmUaRQmQ93Csroi48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845896; x=1737450696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
        b=bVR2cfzmThWUor9/Dd8DzQ7+kbhLaXNXgDbg53DS46WXfCBu7MVwooDwKv1AMa+GIT
         FJB/yaq/AsQbsAPUxAcYgIPO7uLXW/qmnO9n8qOQ+W3/tvwx5AxpvZNNpaywSlXRB4JT
         Vy1EOJvZ3YUEPs7mi1fzgsy8etWvnIAP8I4bBp1iSQH81CyEyvcTsFOECLWUF1JpzEWn
         1aihV3YDrDHu+1fNZW5PCJ9JHS+v2auXlxGkyutsgkemtKesPw6cX0dlI9iCbwW1fUcL
         jRPMaMWf2YIQHmIB2JpAnFzZDhYw2rKlqcT+rRFlkFvQseVnTmDDNT3XsisWBnqlUnNO
         ixxA==
X-Forwarded-Encrypted: i=1; AJvYcCVy/34UzVQFoahVA6UYDNYWW+yrWyoCe5oUmtWqCaQQdiEPyMAXTx5EOX/QRu8IT8kpLe6I5QOL118=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3mNfpeWI3R1CYf87v2MVQvidxu6GGLyvkKt1jO0r7Ydxx9EKQ
	CfQRUxgYOwRsctmnhasLqClCfQePQwWsxlCzeqXvGaB0nERmr6uaYCMSnIeUm+Q=
X-Gm-Gg: ASbGncvrdag+8yZ/XnOvlElTxeAkbVSobTeldNIwKBjNcnhpf+Ti1U2iU513uthQIVg
	5z+cq1k/x3gvEhDQ19E3jGu0fcV2Y+jb1jaK9zAmdVSgLrMlsGnDMwbiJwCrHn0wjb8qUVpm8IB
	s6tbHvOBS0uuqN2f6ULyXBR33eUNyWQ5uNdXKti/8DWBoiiNvztp7xts4fIftXEcChd1cKAIYeF
	mxqtS+y1yYRkw+e0MNsY8SmJ+zCE/k6yli6Zp1firpDxrS1H9XZOH8vezGKH/83AKnongX8NHsY
	QGnccsQwe7e66OV2UGASUw==
X-Google-Smtp-Source: AGHT+IEv+eCR9PUfncvDs0wzTMLxOKsmlNsAPus1k4vRWAgjsSpUPjW9jboACPYNr+RGKV19oiU74w==
X-Received: by 2002:a17:907:704:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab2abcb198emr2288992866b.56.1736845895670;
        Tue, 14 Jan 2025 01:11:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Tue, 14 Jan 2025 10:11:14 +0100
Message-ID: <20250114091128.528757-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL of stm32f{4,7}
platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 779e547700be..628bbbcf2875 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -56,6 +56,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -81,6 +101,10 @@ allOf:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
             - description: Inter-IC sound (I2S) clock input
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -98,6 +122,18 @@ additionalProperties: false
 
 examples:
   # Reset and Clock Control Module node:
+  - |
+    clock-controller@40023800 {
+        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+        reg = <0x40023800 0x400>;
+        #clock-cells = <2>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_i2s_ckin>;
+        st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
+    };
   - |
     clock-controller@58024400 {
         compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-- 
2.43.0

