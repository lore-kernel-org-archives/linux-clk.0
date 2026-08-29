Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDAB3A9610
	for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996886; cv=none; b=XkyZOvKt/CUEN1YDuSfYkL7xlJhPgxdjZ1qOTjEEsNMgk/yOxyEeEbcgAOp4QAQxi1zX1A6anDOgrt3L/EbSglBWbwh7ZAtBeJf81HOPq4xHtKeBh8YKZoMeGgDCFvB9JUVet0UVHS5WaPbfXHl4wRdkG4lsRCcY1utVDx7BWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996886; c=relaxed/simple;
	bh=GuyYXi4ARuef6XgYQVb2CfaQCuutDzHN4PZLQaXdUgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4EjbBe4usi6oDHDctNXxRmb8UQ7uieJ09mauPJqq9jLYd3cT5j6CkQZNE8K18z8k0Vr6aSzKDMGDtsaiDpz5+Vu35934u0kW/DseItEayfPvI1/peFUIggWKB9zElH2zheNC5ndsu/jUte+m4yJs3oEHq9ZRUJxD2uASLw7oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4815bce4652so1327081f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFDWFiuHAiIqLz4eQ4QEpgbBiAo3LhkOv1R/Digehgk=;
        b=bW/STBTRW71XycYuJ4l0ps9WptTpJQ2/PCwgzAhH+LsMBBlGmgquhuuQzk3pNOoQfD
         dNqPOF6xnk3HwAaTlVyIMpcMEcU2QYTm0Z8mbLEaLMfQ6D9ahkKU7+bH0lCDiGcUGMhg
         s6XV69hK9BnEb8LxDmBUmnvH50q7l/sfIjgOj1su/gLcv3I4fdNfWfd/pbMVgBh2kcW8
         YV+rgWi9TMLedIZJFRP1UkhyB5NkMNj0MSU3YNmhM5Yu/UWG7+zL0Y7hT8DVqkPyQn9G
         YIz6+e3QGZK0SKHRasaaXfA7TVhmUf46at3XAWUlc3o3oRV6TtVyD+EHk5tDdfpesDFX
         0qbw==
X-Forwarded-Encrypted: i=1; AKwUvBwrrY0Q97nyu4Kh3Qus6VW1O/3eJRtA89Rxw5WWCau5MkqVEY8zuWeNOh1lW0RShgzxA3B103JAs4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nwiP1XZff5Wnf81tFU3cnqqI0QYSfqXMJjUPPSdQNBAhZm7rtI
	n027Mh8xgipdFC4lM0THMWfHeQ1JmE6QYLeJVIu7qNdIPc6A6y9/vg/i
X-Gm-Gg: AYBFou1nYBaum5r+nX2MOS8djthMS3q5TheoK1eLtPhNO3bgnoheeO4S520MsHiyRbx
	43Bf674SrRwUvcxgAehNjEJqbdrx1+n9dlwP6aP0UcsgKzvGsZsyPCNOyiKDZbz1iOJ84bwYHjT
	Z5fu6n8HCz77XcyHX/f9luQO7qReaW3V0ZkdwT17OvQHo1RA0nDukWIr5vfpwUFP9gVWqYLacai
	rRAbcTW1kUx8Xd1sdPQZlSt+hDVy2AOukGVdz3xMLceSbiSI3an7pFXtbAG/2yFrM++4Ch2T8BR
	Rnksym9m8YC2rJPcRZqR3z67P/jsfDZPaRVbDBMg8cYSw4n9J272hkGj9gRcFahENEFXIsI5Kl6
	zn6JEUbo1r1IYuY7DFvehLM7PHC1JbqVmAL4sz2CS4RU/2aJpE6vJyQnafVPVJm9QWG7emhBQXz
	dVSrQKyUR84QAYDd8l8dv4ZvdxxSiybOPJv5YUjLTAbk1oJvyhT4nyFzB0vpTkaIVDMcc5116FK
	BV1QlcgSReLRsPqPxU55fZXnIg=
X-Received: by 2002:a5d:5e8d:0:b0:484:3317:a00 with SMTP id ffacd0b85a97d-48433170b94mr2419990f8f.23.1787996882612;
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
Date: Sat, 29 Aug 2026 10:47:57 +0100
Message-ID: <20260829094758.23248-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board powers its two CPU clusters, the GPU, the NPU, the memory and
the always-on domain from regulators steered by PWM outputs. None of
them were described, so Linux treated those outputs as unused and
switched them off part way through boot. The supplies then drifted away
from the levels the bootloader had set, which showed up as random hangs
and memory corruption.

Describe each supply so it has an owner and is left alone.

The voltage ranges are read off the feedback networks on the board
schematic. VDDNPU is deliberately not the range in Amlogic's own
device tree: this board fits a different feedback resistor, which
puts it about 40mV higher at both ends.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c94afaaf8826..77abfd555ec5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -104,6 +104,66 @@ vcc5v0_usb: regulator-vcc-usb {
 		enable-active-high;
 	};
 
+	vdd_ddr: regulator-vddddr {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDDDR";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <890000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_gh 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_ee: regulator-vddee {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_gpu: regulator-vddgpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDGPU";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_npu: regulator-vddnpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDNPU";
+		regulator-min-microvolt = <733000>;
+		regulator-max-microvolt = <933000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
@@ -122,6 +182,36 @@ vddao_3v3: regulator-vddao-3v3 {
 		regulator-always-on;
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_cd 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddio_1v8: regulator-vddio-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_1V8";
@@ -172,9 +262,27 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_a_pins>, <&pwm_ao_b_pins>;
+	pinctrl-names = "default";
+};
+
 &pwm_ao_cd {
 	status = "okay";
-	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-0 = <&pwm_ao_c_d_pins>, <&pwm_ao_d_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_e_pins>, <&pwm_ao_f_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_gh {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_g_e_pins>;
 	pinctrl-names = "default";
 };
 
-- 
2.55.0

