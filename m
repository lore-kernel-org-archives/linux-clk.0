Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DFD40F8C6;
	Thu, 14 May 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767766; cv=none; b=HvlXaB8ONEZaPqEgRCNf5n2YoxOxyqIosGT5RQjKOO/h8IekD50RcSQpAXPfyx2cRHqSchcrkmbaDGc4u8h/8K60pzg0boS0GivZQJJZ0/jgZMNsNBf11+BH/+lNFHar0vH+vFnrtV+XDr0YTq9VXv1C7xSJexB4+8wcndcDTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767766; c=relaxed/simple;
	bh=1MoZvKq/dTZ9qQJUHJ++sVaw8XpH0ENUPYVNMVUTL+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxZdrs9Q4CpCY/KU7fKHrb+KYMgZQuvYQxgnJCO8malwbvGAdvjk6gOo56cwpQhqFDscJpe4kHVvSHb1MKZLiwkRVoYjbHU26N41g3iV87kU3swVwli/yjwc3qYGcF5vx8lfa0+46C1qq7YT0A7vzshNoJmrITdksT0bwAxBwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmFTsPEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmFTsPEB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C874C2BCB3;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767765;
	bh=1MoZvKq/dTZ9qQJUHJ++sVaw8XpH0ENUPYVNMVUTL+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UmFTsPEBVh8wHP0ooyxrHUUf8gPMfzRGRB7rLYo2m63CkvnjTNgXTI4PtPR36jxn2
	 S+OgaH9EuoE7vUbOKnjfYtxwVJs5sg1vtY85fNjup9BPNt9h2VBnGmqiDZOOZF0YCD
	 WXzy9ajE1Fs4E5oNIfSjZ0LkAUdUPR1LRRzDUwrFrCP4xjyhZs2eBXeGnEduiYh7+Q
	 1J0KL9TCZV4G/kbffc42pIXDjiuNE+jTlIi+fp8Mj6TIc7hQ97vm6VEDAeW25pBkCt
	 6WN78WSp16/jgRPJkPDlMkUGSc6QBWgDeW+eJ7L4PoNsgxc49wOTzkkXvxe5kMdnKA
	 yfBcsmWRPGPKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9E2CD4F25;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:36 +0700
Subject: [PATCH v2 07/10] ARM: dts: qcom: msm8960: add SMEM & hwlock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-7-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=1523;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=BCUBxCRIxzsqTrPzor/atygVZH9RsoMSC0niusSLETo=;
 b=DtuGVFIBGTBoK/gSLuhRl2/2InskqXOBKRZT7kKYyr2uu3T2QLWyyxY1fdroanxCfTJ/OI7OS
 Oe91+9aomReA5q+UaCF3khhBzmwwO/HT5Ezcp21z0+eg/4tkTXfELLD
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Enable shared memory communication and add the SFPB lock for MSM8960.
These provide the foundation for inter-processor communication with the
Riva (BT + Wi-Fi) subsystem.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fb23c950fecb..e215d8809f28 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -91,6 +91,24 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		smem_region: smem@80000000 {
+			reg = <0x80000000 0x200000>;
+			no-map;
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_region>;
+
+		hwlocks = <&sfpb_mutex 3>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;
@@ -344,6 +362,12 @@ tsens: thermal-sensor {
 			};
 		};
 
+		sfpb_mutex: hwlock@1200600 {
+			compatible = "qcom,sfpb-mutex";
+			reg = <0x01200600 0x100>;
+			#hwlock-cells = <1>;
+		};
+
 		intc: interrupt-controller@2000000 {
 			compatible = "qcom,msm-qgic2";
 			reg = <0x02000000 0x1000>,

-- 
2.34.1


