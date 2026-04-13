Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C873A7F5E;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=rcowo/asAmJSPZRiz9wRChLoYaYOQ5Ru+6N1r/KDaFdca+QSKSPe4IcbZNNv3/1Mk3nrVSri4jWUp8Patk5uyXoRS0kF6ojDsoTZjMEuJ7ipkvBujtoa0QDWcI0WL/Ok1+LJOvizF8Xl+tIcl4lwxgNVyMnzsPr75LEQMtSggTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=+BBQ2oxCg6aiOcvFX/rpEzC0UOv/D5xo6EEVMbvcSmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCRJre87q5DF0fyBhNrgg2clYDr8UAy9gylJMaPmPYsgRQd8klaHT1WYFTq/eHldXZQn5NC9iPeHGmSRHCPjVihRgDEw1JizYxndYdxLHyqLkHufXOnPCGaOtElfGBWie/k4tVNMgrQZ5uZWFZPfSAzmEN8x0glNwwk/yj5i3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8thokaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8thokaq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FA4DC4AF1B;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=+BBQ2oxCg6aiOcvFX/rpEzC0UOv/D5xo6EEVMbvcSmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n8thokaqOpB+XfV59wD5I0kNBoyGk6jbjcFe1BNuNCXVdCuvyeqLD5pE5jfectQPs
	 YnxG2xE9d7p4rO8U+iBA40aWdBPpxRC81xqlL+hVyFje6RKRJ6Ogm2K2QlKDXcKey6
	 Q1JJmbm18vZzH/187hVv/ic9EDO8Ibipzvws5FFDTtHO9teDlf2ZWlPCYOP0cwtQCl
	 Vjj3YHQc8asPKPnns5G8Tvkh3ZiRu8ua+0bJOzVLWG4uCnBaqukwQokdqMjde39KZe
	 UXBtYdNdIgYsYyfMdEQWYpPjAK6+zDf4+T8a4B0W+tUpc5ReodVo1b8Tr/7Ra7lFUF
	 ogVNt5DiDhNCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BFBF531C4;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:34 +0700
Subject: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1397;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=AjIX3ewEwYh2JKu8J5IA4dpO37T8G3oHZR2vJfgvMSM=;
 b=/QYSc0ZwVobIoK3Iz8unuq5uZOzQrVOvGw7CCdhujTGTe9+qhND6LcsEQn0e1eXPZ36SMjN9P
 pFrnk6G2l6yAe72fwolQ9HaRHtCZByWkGBcR3L4ovGOa8GQeoG3FNXU
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Enable shared memory communication and add the SFPB mutex for MSM8960.
These provide the foundation for inter-processor communication with the
Riva (BT + Wi-Fi) subsystem.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index bc3fd55e524a..218cf3158dfb 100644
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
@@ -340,6 +358,12 @@ tsens: thermal-sensor {
 			};
 		};
 
+		sfpb_mutex: hwmutex@1200600 {
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


