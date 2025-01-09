Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32286204F6C
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457563; cv=none; b=czIepR7naJnrUDBKh3YVcjLUxjgYHksVaR1234MndqMcFMfg/4RfVOsO/B4qIOog9I0ugG7awXteZGMbVEPKlL1y8TY5+0uK4g+gUQmLtBWg91sdc1XDYH2KJa6c6S5HzVa74mlDdxZePcVZny6s2HNRf5O+/TPZ5xzMH3LiwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457563; c=relaxed/simple;
	bh=lm8eiZDlfcHQJ0MS0bnwvslqyw2imRABsvWe0la5PQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cao9VnVmvyjKzx4NGr4NKUZLfRGxqD8AqnUmWICe89AdsB+3Eze7UPAMK/6aTzdE73fkJxKBAFGv0V/r+k6RorzARTmFFdbq/2SAuQmKDAwIgY3OheKi1ZPwIcIa2e9IUsex7SUQEEtK//KiFO4YVOnJwT7FW7UkmYRomOy6uCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KIct9FBm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KIct9FBm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so2108440a12.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 13:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457559; x=1737062359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
        b=KIct9FBmT7L6NKGb2ue6Mhp5HghrUBoGW3ABvKpq+cOvw4F/65fG0Z3bMZANptW1FI
         KdErekULAY/Ny7H6yQKPFIeJyofFUIz+Q3pu4rYML3fRJl2MPlywSmndMizvogzjd3hg
         1+6EL+XcHJT8x2eI1B8TZctQ0TajEXeSAjIgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457559; x=1737062359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
        b=fh5ZFUhDqWStUtbH3AGjAjnW8vS826XJdRzGa1gdy0xlyFbwjvPsiEuEj85c3zJvqt
         TtLRQsctfogcLgqfzRrk29RE2uKLcLQ7vJgqqJiTJkk8NaaPrL3xo7N9arlpgQ0OLP9w
         33VTGwiqOOqgw9SIzji/edHvZkcq/YJBh867U4nHIgYndxBJ8AJeQeSOOFjAhXjVpTpF
         jU6lc9aJ+hfdydROdxppoIo26LmpOs2b0+UgOHtvtdzE34vfqr44Mnkd+2sXeGyXyXdp
         tMvrIpvHn6Hi1zbqOHWBLAcMgt5csrpuJPCsx7dUbhYPwfdAc6eAGGx5E99b8l/nZimE
         nRTA==
X-Forwarded-Encrypted: i=1; AJvYcCVmWzRDRFEON4BJs+CrFWACsWBKzixR+dQFyZrR/L7quoHfX6hCGsUDyZtXd1FhOV67NkyD6K4yOp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZ1p17qQKMifhfGINneOXCgPs5YBjAi5cz/aXrbPDDxMZ/wQ8
	+T4yeISPFMrbqAgicgf2/d7H/wFJPBErVmFiE4Qds8jkTNEJaLgSwddZkGt67GI=
X-Gm-Gg: ASbGncv79tu/2lTBMDlGCibCUGanSRmNbY448Dyd4s5W3UbY5i0UiVfiQJM+25m5VVW
	Fjv9qX0Cyu5ugnww+7g3UyAtDqTdGbPibIsBpsRCsAD1H8ueqs/tEFXPet7Wds1roDi6FYdvSws
	QctvTkqJJ+ThBjjPxhnh2mdUlDufentH76hWklSiSgKl++Fy31VzTaCq6N0vODKosxM33mdWEif
	+NmzKzZBzm9X9mLoD0L3fdKoJU4De80d8rpaeHy/lvxtv46R6jKkppDWHHODtVXNxodmxPpiX62
	vDfMEH1r/k9VGhKBtb7AYRI979YNiqcK7Ejq2IJLeyWHF1EkMgsr8k+66C64Zsc+/yEbn0OicYL
	zEOeqxK7asfvg3LN2ug==
X-Google-Smtp-Source: AGHT+IFfiDSYYvGnEgMP2QwNnIkAkHlHP9l0zHJQ4yI1SUJQxTP9wEsEdwJ81wysyqIM0rn1EM70nA==
X-Received: by 2002:a05:6402:4407:b0:5d3:d733:7ad4 with SMTP id 4fb4d7f45d1cf-5d972dfe6abmr8251883a12.3.1736457559390;
        Thu, 09 Jan 2025 13:19:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v2 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Thu,  9 Jan 2025 22:18:29 +0100
Message-ID: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
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

---

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

