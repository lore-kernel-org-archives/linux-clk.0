Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7F387364;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=TpW7nRN9QaumsiWizD0zma91mzcLeHgMv5KZcGDMZ0m+3L0OsaYr/6mB9aNbLZmEP1x6QjIt8nvtRFpcuu/IcmDcj6Yy8eTHul2r/fQwcgFkFaBTbvwVU+vdVawJv/waSDXWQloqAemaRP6nn09vSbQFFMsEvhLznBL/l+UGX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=MkpPKPVy+9GLtYKxadNdxdYllxLqMFGKUqVOpBhYxyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIJ5vmq9VqGTiarK/Dm0JGtwuBonqntbqOG0UJL1dW9PzsQbFcbdNneOA3XlPKyG7QTCyOTs6Wmi7uO0/Gl48JSONTyOU/MzDYcmUpFPUmQ3MrSHLMXhGkcm+6KS8za4zsdFfZ/CiI0K/N2FDwCDViLU99R+CAKyWp8FpR3r0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoIibdtT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoIibdtT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81797C2BD04;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=MkpPKPVy+9GLtYKxadNdxdYllxLqMFGKUqVOpBhYxyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qoIibdtTcDWMiYkJqkgkbsiGQ6Zu707pdQLmaZyG0qPdQgAyz1VNbk30Is4rdwabY
	 FCMn9rELyQZyRlGNLNuHlNGnYGyNd1WYAOXrCYnYtD/dO6QyxGztpA8PTPEK1SpoyH
	 vPoze81xTSkgxWK7wFNAINIdJUCLxIiFEsOvsL1WDgAE/53e76HJ4+JcLBUgyu7Ggt
	 NjOZTjvt/MWPDKHu6MZTO79oLmRLXIhEFzbdcVjN4G83NCsrbf9dxdaxY8kBQ9BOTX
	 72cNMe4bD3R+9yqYcEr68GBNNFUPQ+BOs4Nknz2uAzGDEMDmQHqIuPUFDlLoQINIye
	 B6B3Vu8Wh7igQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE0ACD6E61;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:20 +0700
Subject: [PATCH v3 07/10] ARM: dts: qcom: msm8960: add SMEM & hwlock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-7-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=1523;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Oht/cFl6U3V6NzWGOX7GKn9DSQ6ZGNZg8IzNcNz1o6A=;
 b=nnIamnuAmt9aV0KPVHQQN/J2+DEjC3baj5RwCdg4w7RzI5GxIDICimKA/JhNoiNnlqz6aU0Z1
 epXMqTq55u7CFAIQYF8UsB7JXB2apBAXVlmjATS36wp6PbjBbgzHn2V
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
index 3c1640188982..cb7199d0366e 100644
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


