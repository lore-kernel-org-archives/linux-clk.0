Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F823B3BEB;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=c0kFOwAeKvmmZ8a4D/lG7ZJekEKGvm8bZqQpoXepGl+ry0rphJdp23hDP06avWR0dPgZeP0MYYcoAhZj8sf05yFAzQhjCSkeBc8SV1Ues6q6GGcmLeagYpJChTCYS22XIZr6afJ4uI1CJ4QdFLVk3hJ/ifzjNaPsK1F3l0305do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=0Z6ccqRmdjTJx2Z+4mg+I2ZF/GBoytXAvH9UOYTicIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJmCCzOeLlmarvquDhfbsdO89NpwclNUIsUavFwu1NV92XqXiTE25lBUXAqgb0v9+911e80xxuGgGz6BIib4LgdUC+acPiDE2Qt7B5atOukkS12MgM+i+zTR4yz7DWqew1tdWTDwmwlqhqpsAO1Qsjeefq7vbzi2gmb7+GtD4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzXrpAnc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzXrpAnc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 829C8C2BCF5;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=0Z6ccqRmdjTJx2Z+4mg+I2ZF/GBoytXAvH9UOYTicIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EzXrpAnclDYSdxPcJZd2mjrRdbEsYuXkEIaF+XLEn4oyByf6q2dd9YAJ2hFACpa7T
	 WRm84LQSfFjg+HhG4UzaKBUtwGwE1FnmPS8Z0BSh0kZFyvYhA2l8IZPIVnoO+eYNm+
	 TEu0OVj9xdXUn3x+wPlxQ67u4+VJ/HVBbKl4bH0jpdZj4alNXTl9joacQUMe6n3tf8
	 40vNTMmcL6Npkr+wtyeNULA0supnqwkTyugVinfubxMkOQREYFjCa+7CkkUiktjKYz
	 shRqyqv7SbTpSCW1pyrXYPasTOb0hymwEJk8ermiwKQHhhWU6e8UR/3eTyRl0LWPxu
	 lM6QCRcUwfQAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77557F531C9;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:35 +0700
Subject: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1581;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=ice+E8N1iDj8MEaStPEqyOOo7hv3tIlMXLbTqIjaYDc=;
 b=Yk21W0k8zlL0/bYPP9NL87tyKVDPHqY4ksvVwXhmruxG1NZLhBnkh8EEOfHJ1cjSMZHqWhkx6
 0SLQh4gKf0NDTia6p9G83ovur+6Yay+FyNwOOXjp4hHrfpi8c3KKycQ
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Shared Memory State Machine node to coordinate state transitions
between the Applications processor and the Riva subsystem.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 218cf3158dfb..107c5613aa4a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -109,6 +109,31 @@ smem {
 		hwlocks = <&sfpb_mutex 3>;
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&l2cc 8 4>;
+		qcom,ipc-2 = <&l2cc 8 14>;
+		qcom,ipc-3 = <&l2cc 8 23>;
+		qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcnss_smsm: wcnss@3 {
+			reg = <3>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;
@@ -455,6 +480,11 @@ clock-controller@4000000 {
 				      "hdmipll";
 		};
 
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,msm8960-sps-sic", "syscon";
+			reg = <0x12100000 0x10000>;
+		};
+
 		sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x12180000 0x2000>;

-- 
2.34.1


