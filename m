Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815662;
	b=lDDWiOJyoBYTbrQiwgdjzf+5RYpJJQdxCZrw3FWyZwXzYaVFtGanQ8jhb1yjXWLUHrIT
	 qo+IeZ9Gm/c2JgPSy85rTTrrTvBzBzI1qwdt2emxAhXEenspmnkdt+kMbIIQawd+BVlKl
	 W7atCVlpV9ZLT7Nl5djbS+l0jlFZHCBkiOIVz6YPBVZDaYKdiPRZq1vifJVciIX+x+ZL2
	 1GgWfG16KJsJq90gKyb/VSMVUQAH84UVbWgIeLc1QehkXdb6zlBpV+XSPnEiC4W4VqEXB
	 7HvX8CV1JTQdmH/BPPBKmyILp+uJn3YREV5Km8CGcETfr5EojU0sGXEFNENOe7XZNpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815662;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YaUwMTzCfNzLT2P2nK/ChOVNcF1qCUoCauFG4VMwHxg=;
	b=PTL0skJMnPL/LONWefzZRcx9CEwD5C3lBAnwUgJk1rjF8W3OkwXS+ffap5DD4LXQUCXP
	 qEeXXiNb4wV3po2zrmEGxqCcU/7aD7vjm3Vqpiv95hhuzdg2NCZPtJ7PA6ggjSGYk4TxY
	 UVV1IxWKqqc/4AiWJ1CZYmVU+JXocHyHBTBirdkOQbr054ameautid9pfB05b2jUhk7s+
	 5Reazc9b+ExvCGdYusRls1vy0sShaCRHF22wibbEbUiLAKqFt+NCG6njqJkR6ICPeeo1s
	 ZVR8w5J4WPDic3VLd6P97Ak+ivTleL5BcDEwy08BIAnKQTkwBtsuirzrVnKGnmqjWJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bw3GPSH5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBC560703DB;
	Wed,  4 Nov 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bw3GPSH5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815661;
	b=Fy4L8U2IBGgf/9sbCaRX4pNb9uCQgfAauwN6CS5SRXwRdcTzQ3kGRS67jaR7faAz6hXI
	 tRpIaja/cIjuYdelNVeEIjuuIgEQYlEdAfAIzTKU9YMCi4EM85UpaUOBXypGvSrVekjx/
	 fQrkXgpOe7d5R/awAzG1lIakYaN2oBrELEFMHy/Bsq6hEi5LxOFV91PT8U3+dKm2wRUJW
	 HpO5X85s3rzdmukAgP9fsfevK6zXXLxSJ63AXnhaKw5URkcsI0s1D96ftr5eCLjDiTwev
	 VjpSjECA0BktErpPtoDpFZRh/IrLce0RiWfHEea2oN5pOasZVYiP7pV1oSCDcIGUcLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YaUwMTzCfNzLT2P2nK/ChOVNcF1qCUoCauFG4VMwHxg=;
	b=itLT/0Jl4Xy1BbYSRiwbHiqJzd3jQ2wxnbP52F8b8U66DJM9PE5n6ZDFlViRcKMblRiD
	 fjoL54T6Laq257TV8ZOluSNQa2tT163mBhXvQEv4oHzh+5ZWLOi+oCB8pR89iKh11wYvp
	 PKUZst1hYH3NxFBlguTIwrEB9t4f3HvNNpli7tEU4yaiIuRkRtnzYGTDKWxN2kwNG7HU1
	 5AjQmqN30SlqhOYhHjS97AJh7jxEbXQ76l21SoMyUwZyBULqMmvql0NhgroCnjzh04cyz
	 NzvCNWgZ6mVaakpbdKsDYvG7cfTq5bHsSIJufSIcgSMq3dd+GgfAd2aS+vxfaboj55Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98E3F1F00A18;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815661;
	bh=YaUwMTzCfNzLT2P2nK/ChOVNcF1qCUoCauFG4VMwHxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bw3GPSH5vln40Qwy/uehmeIYIfFuObEV+czSFJxygaPmZM/yzNfVNH+b4ggD5Ln3J
	 THH68zlDoNaahWhID247tB9UkPfCaHzdc9//CBjSEGdhjfwGMK1PqPz+6HtmEDVeA2
	 EDPR6XVzyBF86p903rQwiYx6aCkYJ3g4caOPY4f0txKhk/Wpi6RSVfb0Uy0cnWVWRd
	 fLsjWLQPfGRggujAhC+Q+SHD1c+g7F5zSw5dWrwDzoe6cvvDCUqLLnxHp/4sKjJq3p
	 m+uQkO0fRZogv47zNnX12jzhkGxM4VNv2JrknpXmqeBAsR/yPJ6ZmLHYAgwIL1Rz90
	 oyja8P1G4IZEQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 22A5E46F1D;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:14 +0000
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350: Add SoundWire and LPASS
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
Message-Id: <20261104-b4-sm8350-sound-v1-6-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
In-Reply-To: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=7788;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=wZRG95RPzUUF6iyHxfghj5GjeFMPB70R5kBvjSEAYsg=;
 b=IV+jOTGcR6ixhJfzsPhnkjQ3Ab0VXQIKg+7EQTflyegIuzrnUBFo4Xikuwd+sjHbuBCrMgrVa
 xqO/22b6LGsC719K33Mb2/C4cBNFyr1TBIA5dhj3NprPxixiuUDdyO2
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

Add the LPASS RX, TX and VA macros, the RX and TX SoundWire controllers
with their audio CSR resets, and the LPI pin states for SoundWire and
the DMICs.

The port tables have an entry for each port the controllers report in
SWRM_COMP_PARAMS (RX: 6 out, 1 in; TX: 4 in). The RX parameters are
those of the downstream SM8350 table (lahaina-port-config.h), which match
SM8250 for the WCD938x ports and SM8450 for the PCM output port; the TX
ones are those of SM8450, which has the same TX macro and three TX data
lanes. As on SM8250, the macros are clocked from the TX core clock.

As on SM8450 and later, the SoundWire pin states are on the SoundWire
controllers; the pin settings are those of SM8550 and of the downstream
SM8350 boards.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 196 +++++++++++++++++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050c..85476a04e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
+#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2022,6 +2023,133 @@ compute-cb@5 {
 			};
 		};
 
+		rxmacro: codec@3200000 {
+			compatible = "qcom,sm8350-lpass-rx-macro",
+				     "qcom,sm8250-lpass-rx-macro";
+			reg = <0 0x03200000 0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr1: soundwire@3210000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0 0x03210000 0 0x2000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core";
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x00 0x18f 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		txmacro: codec@3220000 {
+			compatible = "qcom,sm8350-lpass-tx-macro",
+				     "qcom,sm8450-lpass-tx-macro";
+			reg = <0 0x03220000 0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr2: soundwire@3230000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0 0x03230000 0 0x2000>;
+			interrupts-extended = <&intc GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&txmacro>;
+			clock-names = "iface";
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
+			reset-names = "swr_audio_cgcr";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_audiocc: clock-controller@32a9000 {
+			compatible = "qcom,sm8350-lpassaudiocc";
+			reg = <0 0x032a9000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@3370000 {
+			compatible = "qcom,sm8350-lpass-va-macro",
+				     "qcom,sc7280-lpass-va-macro";
+			reg = <0 0x03370000 0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk", "macro", "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_tlmm: pinctrl@33c0000 {
 			compatible = "qcom,sm8350-lpass-lpi-pinctrl";
 			reg = <0 0x033c0000 0 0x20000>,
@@ -2034,6 +2162,74 @@ lpass_tlmm: pinctrl@33c0000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2", "gpio14";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gpu: gpu@3d00000 {

-- 
2.53.0


