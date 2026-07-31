Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48382377AA7;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528649; cv=none; b=EorzgfJWGC5OnLG4Kgct7UoEAL1ybq6PiZgktl75/tmTLJK1NW93dAha9WbDdEZrUxIVelKA3P7XQ+kEf5FVNu8C8WyDOWTK+3JVpcbi1Yx9VHUHLyBBb4gXOULDwuBsgLJuCuR5kqWvi+YVy5rGAVW2Qm10ptL/Q4dRPMWM0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528649; c=relaxed/simple;
	bh=eZfuwBD9iqXI2lJzDk2yst4/dzSccLA2j4f/g95em+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaNbO7vLxe/7G8XpSUJFoVINz21YSMnwCb+9qcZTssnwnqFvtsmhxbhAqF1qbRkU4rDtwE91zmNZciCyBCDdFj3yAhg7gysVtG0QyimAcjmbWqIxmlPmBEZrOJyN52wY2R+N8WmqubVpX0YBhHpXKZ+sSOInQugdt7liP1zqtoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b39nAjuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b39nAjuw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 031B0C2BCFA;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785528649;
	bh=eZfuwBD9iqXI2lJzDk2yst4/dzSccLA2j4f/g95em+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b39nAjuwLju1QGt1B1++IF6jk+dr85jipfr5WHe7jltdUFRMAQ9eRHu1s5tnxDmTe
	 FdAqr4UCaIcNOoEmLkOed3qn+lgepU8hiCZLJ48ss2do102DqpBK5gyuxBiduTNJse
	 GctH5v5jYlPFgSJ+R9F1Z5ZtOsDnzzn1fY6aj2kvX8zXmBoslxNrW8ZuCKR9WmQM/i
	 z9HR+qkWjrDQ/AfkA2qZOcfm+LW7HNrF8UwVaeu2Lfkl6JEMAdvNkOQbDHewyDEssm
	 UrkPSYmpNIKvm9tSxgxt5j3vNDNWJh0bvBTLHpTB0Sk9MJZ91L5J+k4PpRPpvWckEo
	 VsfwJKL0kIqDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F86C5516F;
	Fri, 31 Jul 2026 20:10:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 31 Jul 2026 22:08:21 +0200
Subject: [PATCH v10 2/4] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-msm8939-venus-rfc-v10-2-9ac503250fc7@apitzsch.eu>
References: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
In-Reply-To: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785528647; l=1576;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=PCuxrbY6KVfFfwQ1BsgMQlG7wrXIyJzKLju6sp2a0/4=;
 b=aykDoAMs0jzMss4IY9k/Qwqh+GGGgWERUY145QhtVVcU1vxXQHD/bbg8bjuFIVV4JUicXUlme
 jycHoC2azrcB6QaYYxNEd7uiP419uReMCW/yyeKDjtD0MJWpWKr47+L
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..013e6a87f44b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,32 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.55.0


