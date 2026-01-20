Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E294219E3;
	Tue, 20 Jan 2026 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908001; cv=none; b=HMK/cDKWZCbN4djZYpBAiC6LwK0lffCwGOzl0dwa0FwBPfdVL4MgTwASjc5ReMsPjImk/d5ZmdU2/dEY9zLzi1qL6jX1NUOH2qrXgNK86WVuxX35MD9oC4nL6OG3HHQDdlA6vyxFbq9iaQGB4A9CfvtL+HGrk0/nkzoa5Vc0+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908001; c=relaxed/simple;
	bh=lXA7xXuvlXD/gm2j6AzGoRANYcJpsALguHdGsdxgbr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orxw3ZPsimRzQvq2oa9JG9RceSyR1neLRi6Eo1xdGG0rvI3rplt8jFY8fG/rdzuFFrsQvbxbo9rEE9M2JrEssF/e51mM5/xNslVuW25qVsFEsRDgZDefHZoGGUB0yAt6vGJx3Y+EyAi1/hMRIXPjS9X6EpNNymBr5g6yZKvNHU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbnFej/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbnFej/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3308AC19421;
	Tue, 20 Jan 2026 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768908001;
	bh=lXA7xXuvlXD/gm2j6AzGoRANYcJpsALguHdGsdxgbr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lbnFej/qP5JCu9kfvaDXL80HYnJDqnMvFP8BPBuzA8fVFlK++F1VUZ7WKraKIyoIJ
	 IM2f9KeTbNcmZ6/H9562eRpu+N856RRJNgCSHCquZcZUJpcBqIj52iJdwhkt1UPMOt
	 8mkLu/ASxQxJZX4K1T3NvW3i54SplCU82uFv+RCckEBUOR1QtwhRVnDoEEG7b+JJTR
	 dN2Oq+Cw25QGHZKzCAEfy1VphayrJI2HvjvroCj8i5JWjFjgKcmWdt9uFz3KqeCmbG
	 RDrKIlS+OjQHslaiuQTcEmKpkqdoN2xpQyXZluW8O0ujxMWFKWcXTJKYnj9NKQmmJP
	 uQLHD0LPsC6pA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Jan 2026 12:19:27 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768907983; l=955;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2dPiGu+ReEYYtC3VfBXo5TkLCObP/kpIYgcp9+6W0CY=;
 b=8m45au3DfCytfz4q/h/ct8eXpl+zTmaFd3jee3fUxwb2ygnA2ZWdgHgTB90TO1xXD16M0pENe
 etrAmbi6yeJDL/V4gf0h2PQKcvcc5G/zJupSWyvh7e9v4HcUL+3YSzb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To make sure the core starts in a predictable state, it's useful to
first reset it.

Wire up the reset to fulfill that missing part of the HW description.

Reported-by: Val Packett <val@packett.cool>
Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..f7937fa88536 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3221,6 +3221,8 @@ mdss: display-subsystem@ae00000 {
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface", "ahb", "core";
 
+			resets = <&dispcc DISPCC_MDSS_CORE_BCR>;
+
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;

-- 
2.52.0

