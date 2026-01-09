Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA22DC789
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933258; cv=none; b=OlaAviTZzsfuurMt0sihYNsFIaXi/+8KB4GFqlgmfClJwHGXpT3XCOWToyhkvCAh2UeiAClabxFnr5WDtL66rDrJoc1gcg2PmJrB28i4UEjhgDUrYicqPkT1l0ufiIupYtLRRyzd6clFcjUPzFT+DKU6ejFDe+6NNcppsSl4PJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933258; c=relaxed/simple;
	bh=Rj5PF4kkx8UYCh2Z9Zcdx9RhapFodlCcdhqtn13jraI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNqLkzqYiPJUMOwyMdSk5KE0Vb43ym/opz1O34aBDC5NK/ldBSMYr1oOsDRTohOjYf0XmbQJ+g+l14qSAUoGIWQpr4/YKDpIKiEzsiqkLvBVlcWnZn96rycNVqS7vSjdrpGx2f21ON+aLjHuXuSPR+J7NfLaKKHPOf2ITzILqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka564WqA; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka564WqA"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3e80c483a13so2449871fac.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 20:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933253; x=1768538053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLAZec+69W0xvV+E29B/iSJ71Q0zPCP3JKbVoTTx9Tg=;
        b=ka564WqAwbDWkk5vubPgKmfOZC6oGceuv6syzKSg1CQff/dZICUXtFx6Qmt7FFGQ+0
         7mFRGnl6aVtdcn0H+zTTl2mZ/1SJVUY1q/fHO4C/JobRXuTIbWhoSnWvtDwy63k/wJuZ
         acf4U9rxxcNFuefU1QzYcngKE8zmNJMtSJHTd4gvKi44+9vHc+LTR1DJ+JiN9cuJQxRu
         fN/RcuO+j7ZONhuyVTDfpkEIdRwbiQjPuPz5KS6FYOH7wWdE/agSfR4JKA1TZF9VfZMv
         YYStORNmBXMduVr10QLuPLYuvaOxlP+AttG+2nvfryJ4tniocx4QK8CMjXMDM5TEJAIE
         wzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933253; x=1768538053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLAZec+69W0xvV+E29B/iSJ71Q0zPCP3JKbVoTTx9Tg=;
        b=RrX0GZvBtwNDqeIX2Uw4yYInFJ69O9sAJ2ucVm3K6TkGmO32e9I4XZXLMMReEGbjhS
         5McutgFJEpihXsvzSXtkTTBwp46/cTt/pIVPkJrDZ+LSsRBMos9OyoVWH1NM2bk3ATKO
         3VCbKyPoJWs62NznbZzc9JJjxmNgMo3+4DMO9cpNzj0PUp90Es8l0GxSfzQ65ZuEUrcz
         ImuLtzbblr2A96qhkbIBnwv1EsjsUUIXZ/RoAsYoLe7oRzjOl+Ih+UQqVyQvz7vnTY2H
         LrbjDZum1DpJrgHAxdsXzQ189TeHxI7UP4ph+KftToW4P6wiIabiKW/ZerzNMxEzOj5T
         xenA==
X-Forwarded-Encrypted: i=1; AJvYcCUgkKxB15DMs2Yx+oDny2N0uPzuPzs9XbPqsIkk0GBsWr5jzlH067O0f7fxsNbSqeCvvnCNVZvjxLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEU9viWZUUm75TThNs/qRAo2ZQYgh+tL8HaCn6Qdes/F6wojTk
	jkPu/tt9OA0Tz4OAZqGsrUKZqNZfIY/E7t75hxs3CBc21CL/6krLwAVH
X-Gm-Gg: AY/fxX7VMMMZEFqi/RNhB3ohql+dG7fYilST47kD/WoBttITuQvr37NcIi33TnkZK/D
	wuqIaNb7pH6FREoPi3rDlk2IuvH9I+7UNtwP2XQShAIt4mwpoBj0bGLsKHrddN3WRJb8JVfy240
	OwTFrzhpc3T7U0XX+2biWR1VuOcQgYoO1BnuN8rTLi8/cuZLvVajV6uYvhi2YYg4yMqwBSOuMyV
	GbA7ovgg1S4wEN3RY02yeyWti5Purtzs5PwDaFmHXetwMHL/rz98ey+6BeUAZYV6PavKVn7EB7t
	lKAzeGajl52MDGzTIxU9ijv7WKLBkxlzy7ZBJOKwLxLcptubWrJ+/OJBEnyDUYCxfO/k1cypoLr
	NUjsOO4FlxImTzS7YDSPqvaoj4SVQ+9Mo5l3Jj/livjxOcz5mDTFl1FYlBoRNWAJrwlHjq+omeh
	f9qBCYn3+PLNysjSfnFV9fLqCoITyZI/ZERYR70NCikzKvFZMV0J36/ecmuPP2rt7s1aE1J6d9I
	M066Nlz9s6WpHQYuq7SUI2IO6zu
X-Google-Smtp-Source: AGHT+IHhmLd9QokCnmdrjmN460hm0QSVTgysKbvdgBbpEqXgCTi50/GZXdPKyd7ggwHgyojjtJjDzQ==
X-Received: by 2002:a05:6870:3353:b0:3f5:b004:314e with SMTP id 586e51a60fabf-3ffc0b5e85bmr4714763fac.46.1767933252709;
        Thu, 08 Jan 2026 20:34:12 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:11 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: mathieu.poirier@linaro.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 5/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
Date: Thu,  8 Jan 2026 22:33:40 -0600
Message-ID: <20260109043352.3072933-6-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCSS remoteproc is typically used by ath11k to load wifi firmware
to the Hexagon q6 procesor. Add the nodes required to bring up this
processor.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 101 ++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..56e6f1370d6c 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -226,6 +226,37 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+
+		q6_region: wcnss@4ab00000 {
+			no-map;
+			reg = <0x0 0x4ab00000 0x0 0x02b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			qcom,smp2p-feature-ssr-ack;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -903,6 +934,76 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc GCC_WCSSAON_RESET>,
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			clocks = <&gcc GCC_ANOC_WCSS_AXI_M_CLK>,
+				 <&gcc GCC_Q6_AHB_CLK>,
+				 <&gcc GCC_Q6_AHB_S_CLK>,
+				 <&gcc GCC_Q6_AXIM_CLK>,
+				 <&gcc GCC_Q6SS_BOOT_CLK>,
+				 <&gcc GCC_MEM_NOC_Q6_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>,
+				 <&gcc GCC_WCSS_ACMT_CLK>,
+				 <&gcc GCC_WCSS_ECAHB_CLK>,
+				 <&gcc GCC_WCSS_Q6_TBU_CLK>,
+				 <&gcc GCC_WCSS_AHB_S_CLK>,
+				 <&gcc GCC_Q6_AXIM2_CLK>,
+				 <&gcc GCC_WCSS_AXI_M_CLK>;
+
+			clock-names = "anoc_wcss_axi_m",
+				      "q6_ahb",
+				      "q6_ahb_s",
+				      "q6_axim",
+				      "q6ss_boot",
+				      "mem_noc_q6_axi",
+				      "sys_noc_wcss_ahb",
+				      "wcss_acmt",
+				      "wcss_ecahb",
+				      "wcss_q6_tbu",
+				      "q6_axim2",
+				      "wcss_ahb_s",
+				      "wcss_axi_m";
+
+			qcom,halt-regs = <&tcsr 0x18000 0x1b000 0xe000>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.45.1

