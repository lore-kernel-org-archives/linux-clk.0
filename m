Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751440;
	b=JT3rKo6MB89xA0W+0TZCeXPHzOcRgqLtPTaY7yVX+nQ8v835vwo1rCcMsjEJ6o9/fPIb
	 igMlA+N4JUCrpIUnB75XZ8UQ7vzUuurc6uaA5QYIfNmgFMpuXronqtRYT3F1s9VsG6Dtr
	 Va17eOxkKRYIBduqTmEKdpiiX2Bc6okl6E6v2K4jY0ncGRCUpw6RHmYrbSk+QgocuKlnL
	 OlE8dG+KA9x+xDp8eS8WDodyD8f8eRwsKMyWhdDFhTHvAmkY3Le5KT3n6zGwtDAgHJ+OG
	 VdVD8G0ceR/IHLnxNdgCHigJk/XfMrQ37iAgSs1hkEm1T2BEe94f2NuMoXFdJ9mJZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751440;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eu7vj7TEO7fzaMTyTN7fSWGS25vu1alQtYQ9yEL/T1Y=;
	b=g7NzcEwnWtDpIl35sE9+u51walFsx92Q410JVsvYIZySSjoutA/8uy4ptzsE8h3WvG3R
	 NX1vYUznC6ypaGOp0ivUkLhpSOLl6kSxHfXNJYJIv4bLhd1zOVUyVlOww3dm9OLXFL8er
	 RuYYoRgPJtmHzEQqscK7j3GBSSKlhdhLCLgLoHf2Q9ctYOxxdgoHLaF5I7zPrSKdu6NO+
	 NyD+lfcGUKy+pyL3S6xmz+rTdtdQgRZOETfgBQZBQmVNAz9u3X8L+sErcjkqwk5qxgxkh
	 sH6zUzDnoVIJNAUrUWmA8vNBu2S0qAmig9LkOC+v//EM4yKf89clGv1C8l9zk6dL2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guzHdjr5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79324606A326;
	Wed,  4 Nov 2026 00:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guzHdjr5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588461F000C1;
	Wed,  4 Nov 2026 00:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793751440;
	bh=eu7vj7TEO7fzaMTyTN7fSWGS25vu1alQtYQ9yEL/T1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=guzHdjr5EV13zTa/QsFhxitPldzwWNPo8wXMEl6kxbPMJ8GAU1l8+mgDL5XEdAjFo
	 Xk5IaglmVp3LSskEOc7lxJIBW30t+cA3wBncQsQJGrx9cG8/9O/7013zJes7kt7PQA
	 EGwY8Cql+lvmHRmZ1pgoEqbKkApqp5VvqPl1GLt9peeapqgvG3iX9Kawvjwv8uMHKY
	 +OtoL24rqRVy6VmwLoBoAfdBR+15vXwZp0lXgxjxugXD5qsKGLtj11lH61/w+5KS1Q
	 ziv00CWu+txUOepW/0cHk8Xa7qnuCqR9kIbkdev+gvAvBKFXYuM+iKlIsiMdlGZX1e
	 gMUMHIbtaNI2g==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8350: Add camera clock controller
Date: Wed,  4 Nov 2026 02:17:04 +0200
Message-ID: <20261104001704.2744766-4-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261104001704.2744766-1-vz@kernel.org>
References: <20261104001704.2744766-1-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera clock controller device tree node to SM8350 SoC dtsi.

The camera clock controller PLLs are powered by MX rail, CAM_CC_PLL0
runs at 1200MHz, which requires SVS_L1 level of MX, while all other
camera clock controller PLLs can run at SVS level of MX or lower.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050ce9c..a51942c99f8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2830,6 +2830,21 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm8350-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_svs_l1>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.51.0

