Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3D1D47AD
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878833; cv=none; b=WSnVFIWWLLdubnG6+XUlarRnVby2bQ/JurpxtrsJ7r+OKDsqWS91d5++GnKCssv89+UY5QCBlAFTlfRK7JHOuijH3Ddg9LZD78F0CbIhRsWZmTDyXaMl9Cz9QyBIhHl8xTMkE3aEigXi/AkA2tr3+88YePmbmkGwCfDl45bMHao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878833; c=relaxed/simple;
	bh=4K9iFpgEz2yPmgk+BJfkf6hcPSKJsJttyhj2iGZgWmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFAXIaHuHa73hlsV6FPMD8M+aIkFCtnNhwslPNtWvStYAUgbByANJrXClOpBUXxbt3sTBNnQ6Oi2QZ0ptze/mAKQQoJKoLMSN55HegAcXJSZdQXPy51XDaYlvmARzN4hhIwRcnGYpT8khf54Uwx/nQVplBlLVSlxPaskn/eBbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mOCbxCAC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mOCbxCAC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so66668935e9.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878829; x=1737483629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
        b=mOCbxCACQOc50vvkgEzEeLqza2s+kVpZNNQ4EO9HXiuo9u+U3VfCCZO1KHIMwmmUOl
         3j0AiuQPNtZwa0sWBVojyOW+Marlt2BRwUh+4qj2LTZ9gGcGC0xdVMG8Wz1EduI4sUB1
         jPb5faCXgnIq0cqG8xz6W19h3lMf1DwdJttmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878829; x=1737483629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
        b=t4wUpt+TjAzTEKEZSHm1gmDAAnWu7eFcDBIPqERM4mywq1hd0dofbeVwhw7au4X0a2
         fOyXBi7VsVkR6E4xyPKMTHDy7B8DKPS9ekpE+5Vpsygowq0b0CPMz+BxFBQhnNlZtn+K
         wa1Wk7SY8iT6EFIYY85/f1xTbBDa7/MNgZuoni70+lY5C0LqBqDPcvXlmieO0laxrkKA
         UhbbfhXbJymYv25x0qxKPfdNKOojFSckjQ/13YBlgcGPZAg7GyCzkJiSpKm/3fTwx8LF
         aogRvwGrscppF2dbzEkQoal2BR89l0xWDaiblBmcpzUzJPqmYD1RUzo4Jloez2jG7i+M
         UsJg==
X-Forwarded-Encrypted: i=1; AJvYcCVDLl5C83rEwOSGgE8p3O9ThhLqYb+lJUO1B/I62YxZW8TL+WrILdnLBU9SgkzJCkeOVTklBd0US78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQuGXXQ3kMGlRoRjanuiNNy7ZJclaQ575yEfaQQIFTfazX4DW
	oyKGOzkLqJ6dMMLWeHmC6JuTEJVmJ/P6i9CnvOrWcH4Zog1dOqCYl0E2B47omDo=
X-Gm-Gg: ASbGncssLRbkW5yED1+1idUUbxAUqtIZ2qPzZqmVicnyPdN3vBXLEWlj+L4FvnHullE
	AP968HJLp0gqVOJr9xpDK/97jdVmQPI2HHP0NvMMsHwlCU1gCDXZyq1AWe6x56SX0yeYDusxqnU
	67lU3uo+OMXV2bKMT9Jqbk6B6wGsCulW5LSPMDWEPzG30bwVVcj5vEfT6hzq/J3ZqlLSznpIZDC
	VRV+nwVDJ7av1nmDXmZXBJmqGoScR0Q/582ZyV4N2b4ND5U5f/Lwwp2bBFTe3UHW5EXDx2fk4dE
	DY8jwaFJN0dtWjDV6jl1mQ==
X-Google-Smtp-Source: AGHT+IHnG0SooqxUeZ0EsULhwv0RsoU3JoPUI7vSBUDQG3JQ9VKYcmjmgQ2ZhBW1LT60TAvEZ1greg==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a872fadf3mr22273830f8f.7.1736878828905;
        Tue, 14 Jan 2025 10:20:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:28 -0800 (PST)
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
Subject: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Tue, 14 Jan 2025 19:19:47 +0100
Message-ID: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v3)

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 8f2494a0b28e..f83a6120d65a 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -53,6 +53,26 @@ properties:
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
@@ -78,6 +98,10 @@ allOf:
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
@@ -95,6 +119,18 @@ additionalProperties: false
 
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

