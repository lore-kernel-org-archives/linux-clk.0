Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E53B3C06;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106823; cv=none; b=fk3qJFoFxErn+aB8V3LYJeJz0Z+kJf+sg/KQ+0hCSZOjytFs8qjG0Ki8mfNHA+cjh4x7F4Z5Hsx6tiFL1Hdl/6Gi2veRsEXhnDDxCB4yaEg17vmunEgs72xQkwf7lJ5dpUrkoG9bSjUi3e5uX7BlQ4U9pEZ3bZZK2QTa0JIaezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106823; c=relaxed/simple;
	bh=Pj5l7tTiog4fCEYSdMvwZUW55M70lkNDGuPKTLtE+eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPSD0ios6ssukwJ3QveADSlGXMxvgrwFYbwghMoW6MHtc39ToX7pqqNZRbgkdnu29GW3iM56EHdEH+D7x414nHyDbdYXC1pZPmqa7jRaiIrVmWfIAmGaPOp7PaLxMifSkbP83jWFd84yfMEYZZTF67VlZLFYDegxlSRJG5yiKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpzvUTpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpzvUTpP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94382C2BCB8;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=Pj5l7tTiog4fCEYSdMvwZUW55M70lkNDGuPKTLtE+eA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gpzvUTpPi2MkK8PufhiYEmtr31ohtR/IR3EEygOztgME2NfbnqQ0lLTFztMT6Qd+Y
	 Zjq+ASjomCcE8twl6aAEOeSp1QqFCVwvgh5nCVGa/ANns9cmDPhDPiINVVkuNccnG8
	 rOPf1jdJZT/SLxkYM26xPNdzBzy4p5CL5Dy9xZqsKv+BMXe/iwyp1SFewfezkkM4N6
	 But9g4P75YxwCh/5sE7NG6r+zsNMtQDgViqIsEkYJHXaByNcOtH8oBvGgk6iefzjAF
	 3iYzBo6LmL88gSK2789xAcm9Ronp/JpWGEjMawNpHv/EFpD6LaC+r/tTNPHP93JXmt
	 9ZvFhFyJ6NP9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB24F531CB;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:36 +0700
Subject: [PATCH 09/10] ARM: dts: qcom: msm8960: add Riva
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-9-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=3305;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=g906sv/GkHn83ShdiURpTqajjci9YbqImzDjwjkUuak=;
 b=zg6xWdt24C3e5N2+cWv+8tXGjoYaP4ZNk5lZyHasde1JyUxYpaI10JlVwpBFVqK9ypb5Q+5FA
 7cjyzTxJsVqBTSlf+jtpOIgUehqHZ51CEqJ8DpJ3i5U4oUJDPJAhKLC
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Riva Peripheral Image Loader node to support the Wireless
Connectivity and Networking Subsystem on MSM8960. This includes:

- Reserved memory region for WCNSS firmware
- WCN3660 iris radio controller
- Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
- Pinctrl states for Bluetooth and Wi-Fi power management

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 107c5613aa4a..6bf36f35e5e3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -100,6 +100,11 @@ smem_region: smem@80000000 {
 			reg = <0x80000000 0x200000>;
 			no-map;
 		};
+
+		wcnss_mem: wcnss@8f000000 {
+			reg = <0x8f000000 0x700000>;
+			no-map;
+		};
 	};
 
 	smem {
@@ -317,6 +322,34 @@ i2c12-pins {
 				};
 			};
 
+			riva_bt_default_state: riva-bt-active-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			riva_bt_sleep_state: riva-bt-sleep-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			riva_wlan_default_state: riva-wlan-active-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <6>;
+				bias-pull-down;
+			};
+
+			riva_wlan_sleep_state: riva-wlan-sleep-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdcc3_default_state: sdcc3-default-state {
 				clk-pins {
 					pins = "sdc3_clk";
@@ -456,6 +489,51 @@ saw1_vreg: regulator {
 			};
 		};
 
+		riva: riva-pil@3200800 {
+			compatible = "qcom,riva-pil";
+			reg = <0x03200800 0x1000>, <0x03202000 0x2000>, <0x03204000 0x100>;
+			reg-names = "ccu", "dxe", "pmu";
+			interrupts-extended = <&intc GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smsm 6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal";
+			memory-region = <&wcnss_mem>;
+
+			status = "disabled";
+
+			iris {
+				compatible = "qcom,wcn3660";
+				clocks = <&cxo_board>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+				label = "riva";
+				qcom,ipc = <&l2cc 8 25>;
+				qcom,smd-edge = <6>;
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+					qcom,mmio = <&riva>;
+
+					bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wifi {
+						compatible = "qcom,wcnss-wlan";
+						interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		clock-controller@4000000 {
 			compatible = "qcom,mmcc-msm8960";
 			reg = <0x4000000 0x1000>;

-- 
2.34.1


