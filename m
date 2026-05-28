Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B93655D5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 21:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005306; cv=none; b=NZSQukvMVnmx0tnWlG65dLyR4q3mK/6Z5mKBIPwq0JaTBIlklSUsx7moakC/7nUrK0LKbaUb0dZpOekfXjl5Ot93y0WQnkppyCXHtxoi2j6+ai86Y3MkpobqZU26hWL6oB+LF6BeQKAkpoO7dlgD56u53KdELo/UxNLtqnsx0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005306; c=relaxed/simple;
	bh=vr13qCo1Z4urs64TigR5t4iRfx+iJfof5p91YFBaIKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrz4dcwbX22iDKIq1uBZa/efftCc9YamlIeyWf0z8ZRYcbTAKUpnS8x31OBUw04wacgbiHXrswMn11/uK5Bh0Ms+5pbVU59BXpBwV02tF8rMdDc0ecUdLHuSyuZ746CT1wnxRM6icosiyLilYZn1Eo6G5LypeiwURc0qAlX/aqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=namSOi7g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="namSOi7g"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490426d72f7so64918445e9.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005303; x=1780610103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUyxjFC+AVWv6DcQ33VYTF/nj3i1vMmIuuMKgQ010aI=;
        b=namSOi7giaKft9yGGu/f1WfNAT57ZO32T7IJ6cjrRI2nUXuKy5M4bb2m+dtmoGZNIE
         eJU3kawmGMj/DlXdhWDRmFFRzBjmW5VEYaukr3gkPw3HyNZVg2uWQOO84jv881Er3CKF
         5XG+08ENDutRou4Q8G2gK5e9RGzB1T7ElP4SEV+ahdH3XTG6JTh/AHYmlOyCCJCVxlSg
         NvFCHSPKA/Usy5KbvS79CX6Lt09Co50X1wwGoM0tmWuHksMxpKxVrWo2hnwImKMXWBtx
         2Vs92Ex8JUX8PVqTY9V7q/B/16ROoUe1mwM2bQmMSJSD+r7Z4NG61qxEauwYxeWbibtA
         UEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005303; x=1780610103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eUyxjFC+AVWv6DcQ33VYTF/nj3i1vMmIuuMKgQ010aI=;
        b=owpkUxp73vKvJKNpuSDgoetEd/A5uvo43hAoUQsyz7pCmKNSOOZKI08v4EvTJmVaIp
         2kYKQm1u+qQMhtQvabIlAVouTRIXOgHQIZTq2xuKGoiOP84CpdOY5v8ZWPJkIft07FP4
         PAy4uJuNe0L5tEgHXyhvH15KfjvgRwebL9vFmcTx+5wvgAhVNthCqJvFYxdCxZ6TDCzs
         tEg0otbCqgYD/1vD52GT4i9eCT4g8YJllFf3uUUdP7ssT8xqAxHpoxCizTSozx03JjZX
         Z+KE1DG2wO69jiK4hbugzgdN8c6f6poF8O9HUiFxrlIFWim4qdb5eXMK9nmO0TmUUuCw
         UN5w==
X-Gm-Message-State: AOJu0YwkfeOq07dW9n5CvOexxuTj4d+tfeB+vC7h+hzjtpgVlJN+qXFS
	FfRtYHidhycVW997MYL1FE+A3F0f7kfa1L1V6rsZMrQINYCV5hYRfKaV
X-Gm-Gg: Acq92OGcjxJqSfT/XfW4dsrfMUNCDPTpnnC6YwTPqpdJwxvyeOPWkfMDtIGAE1BJ5xD
	XYhYDVI1i80sl5ud60AqPE6VTkHFvvzOoGZMJuc9+jHM4nA2wgUT3N3APYDutNsFpXz/D9xuPX5
	xEdpZsLkPnoyu5g4nq8xJ/ouYpCH4IDvoFr5dke8wuD9iEL5ph2JUag+rVdmSMwwtvOH9sz6oSx
	ik2qq6D24MFqSsMsAK2GXWGT3kQNmAnmgOs37sO/SzZ1yirK9RbQu7e9hIdMF/DrozcLSXWxuUq
	CgjJqnkwAwvQVzGeLvo3XzEWpRMCD20zXRInpnyb18HGEnAMKwCT4E5ScAe8+e7AC52Gr4Lq8z2
	Q3o4pfghRnSwlh+KYhZrUs7oT0CgJBmuESvCTC0vsu8FhDyBtufkGx9JORNxTdjLP7EJNs8Ka5O
	a2rqbRk1NjJtTQ7HAlapsuMNw43bvk/HKkOv3YpDPqFoLR
X-Received: by 2002:a05:600d:8486:10b0:490:3d45:48d7 with SMTP id 5b1f17b1804b1-4909c080a27mr3071855e9.6.1780005303122;
        Thu, 28 May 2026 14:55:03 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:52:59 +0300
Subject: [PATCH RFC v3 2/5] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset bindings.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-2-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7298;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=vr13qCo1Z4urs64TigR5t4iRfx+iJfof5p91YFBaIKI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmoLTbh1SJ5vFdLjU9/XR3vX1Cv6I7aYZsQB
 E/ku8D9EqyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLZhQ//e8cAqHfB9uyHXY6yqNXCDvbERSrzuLA
 arLGyljoZ1tXX6dH8yQH9DX4O+PFFfbjCoFVeOjSc9pYGdh3+Pxigtof/9p2K86+rel0rgjJ58W
 Or9w9ZABO3KWJEHCGvLbkNfLYnImLKjFpGucJnXM08piL88dIAiUyONBs4Nam9FKkYfA7Qnttye
 1djJqJweXfhFivbUE8eA/NtWXDwZs3e1XCmrOwEdx7YgjbTihG5rY+6zLe9hNApY3cUzK4D8cz2
 W85uhcofmXLWxdNHIILOrdhDzBsPX1d5b5YoHPeHHsnIYX9F+HGfsAP9yjJFZ8gXGAR/0hdzc9m
 SYede274khPLqvrLcpmvXJx+2+jckf7sUukRrG7O/p3Cqq3sKavAIzUI6oqHIBS9CDxQYFn8174
 iyc/P0vMXSXCDwtZEarnETvXEO8/PhcfkU5eEA5WlI8jWcM75xkJ7A/A2M4QCN08/smXQLbcMA8
 O6xo/bd1Waj96u7pdMT4Ra0sEzGQhc/qbBMdzEVvLW/j7lMKfTvwcYJmpDqAmbja1CnS6bWo4K2
 A2GWb9TNhUOVHA/2MoM0ktMCoFjSEhd/ho1CjC9Stm7XY78NgzgFABLhcUaVScMtwXZjcCxnyyb
 94gMSsB6fgJJREZ88BOx5HPwIIKH6bGWVryMcu87Xr2Og6N8roKg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the Low Speed Peripherals is relatively clean.
One register per device with gates, muxes and resets and for some
devices a divider. There are even bits in the top controller to control
propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
list is complete.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-lspclk.yaml      | 119 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  58 ++++++++++
 2 files changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
new file mode 100644
index 000000000000..e4d50d40e834
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The clock controller is responsible for bringing the devices out of
+  reset and enabling their clocks as needed.
+
+  The controller receives its clock signal from the top controller and need to
+  be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspclk
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from topclk (124.8 MHz)
+      - description: Main PLL divided by 4 output from topclk (156 MHz)
+      - description: Main PLL divided by 6 output from topclk (104 MHz)
+      - description: Main PLL divided by 8 output from topclk (78 MHz)
+      - description: Main PLL divided by 12 output from topclk (52 MHz)
+      - description: Main oscillator output from topclk (26 MHz)
+      - description: Timer oscillator output from topclk (32 KHz)
+      - description: LSP pclk output from topclk (26 MHz)
+      - description: TDM wclk mux output from topclk
+      - description: DPLL divided by 4 output from topclk (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll_d5
+      - const: mpll_d4
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm_wclk
+      - const: dpll_d4
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: IO memory region of the LSP controller
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    osc26m: osc26m {
+      compatible = "fixed-clock";
+      clock-frequency = <26000000>;
+      #clock-cells = <0>;
+    };
+
+    osc32k: osc32k {
+      compatible = "fixed-clock";
+      clock-frequency = <32768>;
+      #clock-cells = <0>;
+    };
+
+    topclk: clk@13b000 {
+        compatible = "zte,zx297520v3-topclk";
+        reg = <0x0013b000 0x400>,
+              <0x01306000 0x400>;
+        reg-names = "top", "matrix";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+    };
+
+    lspclk: lspclk@1400000 {
+        compatible = "zte,zx297520v3-lspclk";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        clocks = <&topclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&topclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&topclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&topclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&topclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&topclk ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&topclk ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&topclk ZX297520V3_LSP_PCLK>,
+                 <&topclk ZX297520V3_LSP_TDM_WCLK>,
+                 <&topclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 4d85251a0ce5..144a3b064d49 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -118,4 +118,62 @@
 #define ZX297520V3_DMA_RESET			28
 #define ZX297520V3_TOPRST_END			29
 
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_I2C1_WCLK			6
+#define ZX297520V3_I2C1_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C2_WCLK			16
+#define ZX297520V3_I2C2_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+#define ZX297520V3_LSPCLK_END			36
+
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_I2C1_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C2_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+#define ZX297520V3_LSPRST_END			18
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0

