Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073036;
	b=kBASKwhTSbpkt6h/l0Gb4Zg1CQogYuHI1Sr8RqmOXn9O1eySUQD7wgEJynpIEE84MhM7
	 45v+6Aor+qNcxxvi28Q+BcWb+w/xaSJD+3vZ7STcbCtTx0a/2OTh9dfb9dBJIlut2UHnf
	 DFtBeBRGQaW/st/YgLdmgJuVZ7PxZmcLGmAomwXgJCifcxgZPuWaA2XlmgITEsIDltfqA
	 ZlpdjmJrJ3jKbrtfQJz9iCjGWppL47cRuTz8A8RzYC4DZlKiJVttGYA/2UioVgeTcM2Td
	 ApHa/s7K8z8oTTBBHLsc/9xrTWCuZnqui+cpdq0uOVdeYNeavLWzJKrt99JXQbVLCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073036;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eu7vj7TEO7fzaMTyTN7fSWGS25vu1alQtYQ9yEL/T1Y=;
	b=znZh3FajBXRmcgjF3S8iCO24U7eCsAf0rFKnpqKEVAonUYlwtTMu0aGDL20qXDtkA0o6
	 f3Y3nmQCajRbae1vLZaZHkSihfPSlJKkG60fSk2Iot1lgjyLjcdhuSUBKHk2LRNEJ+NMc
	 JnkICw4MiGM8LVVVLkHGphJpQU8U82R5+MkMlViu6rIZJZhhJdoUJO1/v1YUTJgaDZea3
	 3BWlmKBCszPISWD4SUxvC3ot2w6tvIQLIKR8ad8HRtHeejN34g8hc+8NHpV8TG3B7pGV7
	 SAVqp0+hqjzzuAxYKF3PR6777wLbqe0onpZW2cSqojHRqehb/Bu882q1INh6cq0Xcxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czmzyNu3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79937606A32C;
	Sat,  7 Nov 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czmzyNu3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926521F008A1;
	Sat,  7 Nov 2026 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073036;
	bh=eu7vj7TEO7fzaMTyTN7fSWGS25vu1alQtYQ9yEL/T1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=czmzyNu33LqWtwTfa8XP5goTZfQe/Sb51WL9gDZlI1v9nPMcsVfWGh4k3jGAVrKXi
	 rm55Gp8sPvtvXEjjF93b+XH0drMhu9F1mdhf0pMXm6wlUKiHGfk/iZHPWtvZ5BEafc
	 o4v9n8ZndB14x0fRjxKlwkhx7mkHDDZpHFUo0T9Gi381aV8+oQ/tP+CtDljn5/Sc05
	 F1DDwJ5Ky8g6bPFMEGIp2rWE34fKeI1oSN0RJ1VJVgtVy4FBDKg1muDcpszyh41AVg
	 C+I8870YaBUkn/o5UrWkR/flvKbqJGs8gBhANXbjEUB2qtYafvMtQEdby+DQL0y6DZ
	 MsptXnTvTqtBg==
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8350: Add camera clock controller
Date: Sat,  7 Nov 2026 19:36:21 +0200
Message-ID: <20261107173621.3538964-5-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261107173621.3538964-1-vz@kernel.org>
References: <20261107173621.3538964-1-vz@kernel.org>
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

