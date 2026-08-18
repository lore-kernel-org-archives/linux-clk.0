Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357441D13B
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040612; cv=none; b=ndBI0taLgcIvfkBtV/obwX5dLgFNO3Bd+THJ4BqdnNCawgw+srBMz/aQTZy2e/tlnN8lKMUSzeTZW6GKsC1LHl00GApU+n/xggOV48EhiOXxBTZ0tKE0lQxsz+NUZdkucAjClagNbltVYJv1CZAe3mqohYGiEdcyaGzkfekq2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040612; c=relaxed/simple;
	bh=U7Xe3Ghk6YiOxrcqjcvKcRICzku3TonfbBqw8FCgUS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHCSR1tf1cdWxA7livIyTozc6d7JN+3QXyeoKzM3qBle79c1SBHPAyNkt0/Wihj3/1ccWvMu5piSKQ6nLl9gfF98tWtPxRKe9bAhqIM+nArZxtXynHk8f7CYAvKUqv3MGxkvPD/5hoNw/NR4ab2yLk2YhcV+H/1M/ojUNqVb9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pk1IQ5DV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pk1IQ5DV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso6288624a91.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040610; x=1787645410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aByoav8ekJz/qmyEYpcX1qnDez9t7vTKYg7JjRl3V1w=;
        b=pk1IQ5DVtoOejaweP7EbCQfw5PJIZbVzCCFj5J0927yC52+iipFQtpJ23Du0ct2pID
         YusZKEnAPG81OvOjE/Af1ktqUthScthY5fSzxs5UcjYMWRxqmX3PRB19aPOYEOc9dokQ
         llHQXAGODoZthOABkAbTPhteIbiWTzxPiIi05eEIuM7C/TM8lutadvr+2RMUh7hszAEp
         Sk6pimARf2ezGHuDvB8G1H6KiSWapt2st78IjKUuokqjZAD2zBYRlSgU4yYVwFtXaq6+
         WVt1UqxUy6vQ/X6g2/zYynv1oKy56cHVWFbNpKyxGme1KJZsU+yt+NckG6AoD3nb3RPd
         dCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040610; x=1787645410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aByoav8ekJz/qmyEYpcX1qnDez9t7vTKYg7JjRl3V1w=;
        b=QpLQ7buUmlQimAzSZISI26sN8kIbNTSicO66eVDoMagRgjSHoWAG/QsHLtyomOYwSD
         fg2U8F7UOsE3lRqKVBb9hTtnW1/Nk1IVESLMNRebDO7bXD/jKqSYUurrvFil4DFNM8na
         uHTkGijKRWRRWP66MTOiomGvEFOk39Cc+SrJDt5t+49oUeSCEogbrMt0akFLTnFAXRcc
         tKMACbhvvtAaLs55gxuNN+9gzhlc4WgoQdMp4zQ7cRo7CCdYo4z4LIVYaHLD2/vQG3PI
         pTV1+xnN45N0A5ejVAJ8kGyP7R7b0jnGQ6v0DJIDf17dAihlrgrtN1sSsyEQY9zJDVV+
         OF/w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/IaGz60cvnOJnxVQowN+dz0fPz069bf6u/bn51MOyG9mtswIFapKp82twEkNmFMnIq6ji+AfU6Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz08qOXdt4BMUv9G3BNPBZfH9MXzGTHApL3Vu0Uu6InU3QiPPjd
	OzfcZ0SsZ8tX8TGxne4r2Wzf0mj427ZRzszcEvw7GHo3KEyNCuKXRudb
X-Gm-Gg: AR+sD12ky6YGwNxHIgIcLjlZpAlECvkHRkcRxcnVS/27PqFyzxDQ+kqYHzJ+MWApE9a
	txYmD1MqDw2DDJMQ/5MS/nXpS3T0qqy8aCrKsFLFyP7QPtnA9KZ3GtElt3x+5oit3pQeT/hnNZ/
	uQDCHu09uILKjyP+OBgh7sUFQmg+BHwUGp2XTukBYPVXC05QQNpb+Y25v4H46PYBCYJLhF7a/1M
	MxAy2wCD4srBTlOH71M9LgAKAtKV3hXaEmbm4gTyxwQDimLvAD/ByeI8BWkiBccLUEpIV5memXV
	IEYWbxR6g9pPjzyg/wUVa95NJkeD+qqNm1nbvys1C8+hR3OT+FATBnrxklfXZs9Uw78N2BIlYTv
	aKKOWnIF859KDpITrct2GCyymPJ5N/l0FR+JgOrUu8b/XcQ7+deXkS9tKNp/LjWUNge6AoSxhe1
	Y29Td/5/VoXIrBnS8kC/g55X2eY9dV5j/z2zsTPnA/1cLBWq9N5l9XM5Vup6oOgcSAblri07VEW
	KYA7hL/TPs=
X-Received: by 2002:a17:90b:520d:b0:38f:5801:cd76 with SMTP id 98e67ed59e1d1-3933b6d0171mr36666554a91.3.1787040610155;
        Tue, 18 Aug 2026 01:10:10 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:10:09 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 12/12] arm64: dts: qcom: Add SM7250 devicetree file
Date: Tue, 18 Aug 2026 08:07:54 +0000
Message-ID: <20260818080754.4362-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add base devicetree file for SM7250 SoC.
This file adds the basic nodes like cpu, psci and other required
configuration for booting up to the serial console.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7250.dtsi | 556 +++++++++++++++++++++++++++
 1 file changed, 556 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
new file mode 100644
index 000000000..3f052daef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
@@ -0,0 +1,556 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm7250-gcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-size = <0x200000>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l2_200>;
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_300>;
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			next-level-cache = <&l2_500>;
+
+			l2_500: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			next-level-cache = <&l2_600>;
+
+			l2_600: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			next-level-cache = <&l2_700>;
+
+			l2_700: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster1 {
+				core6 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm7250", "qcom,scm";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_aop_mem: xbl-aop@80700000 {
+			reg = <0x0 0x80700000 0x0 0x160000>;
+			no-map;
+		};
+
+		cmd_db: cmd-db@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x80860000 0x0 0x20000>;
+			no-map;
+		};
+
+		xbl_uefi_mem: xbl-uefi@80880000 {
+			reg = <0 0x80880000 0 0x14000>;
+			no-map;
+		};
+
+		smem_mem: smem@80900000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x80900000 0x0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		removed_mem: removed@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x1300000>;
+			no-map;
+		};
+
+		camera_mem: camera@86000000 {
+			reg = <0x0 0x86000000 0x0 0x500000>;
+			no-map;
+		};
+
+		npu_mem: npu@86500000 {
+			reg = <0x0 0x86500000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: video@86a00000 {
+			reg = <0x0 0x86a00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@87400000 {
+			reg = <0x0 0x87400000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@89200000 {
+			reg = <0x0 0x89200000 0x0 0x2800000>;
+			no-map;
+		};
+
+		wlan_fw_mem: wlan-fw@8ba00000 {
+			reg = <0x0 0x8ba00000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@8bc10000 {
+			reg = <0x0 0x8bc10000 0x0 0x5400>;
+			no-map;
+		};
+
+		gpu_mem: gpu@8bc15400 {
+			reg = <0x0 0x8bc15400 0x0 0x2000>;
+			no-map;
+		};
+
+		modem_wlan_mem: modem-wlan@8c000000 {
+			reg = <0x0 0x8c000000 0x0 0xf800000>;
+			no-map;
+		};
+
+		cdsp_sec_mem: cdsp-sec@9f400000 {
+			reg = <0x0 0x9f400000 0x0 0xc00000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,sm7250-gcc";
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qupv3_id_1: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x009c0000 0x0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			uart2: serial@988000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm7250-pdc", "qcom,pdc";
+			reg = <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 42>, <42 612 28>,
+					  <70 63 1>, <71 640 15>, <86 522 52>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x0001100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x0100000>,
+			      <0x0 0x0e700000 0x0 0x00a0000>,
+			      <0x0 0x0c40a000 0x0 0x0026000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			label = "apps_rsc";
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm7250-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm7250-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		timer@17c20000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c23000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c25000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c27000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c29000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2b000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2d000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.43.0

