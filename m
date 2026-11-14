Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668129;
	b=eUPIaop8GY/H4VtdinYoDg+DFuyYXKvSbiKPC6t5a/9s5jJCSwfvTMUKMbWKrTpnJbTG
	 uQ+/VIaAFldQj1u8Qgfd3a0SEGDbAivhezjTRa24rmgURa+LF28xgh0brH40mEhDAVwpe
	 EBvvXe5I0v6Vyh+FbCgHd8HNkw17fTSSAbshoq5fvXZ0zixx1uqtk96NP8tnizqgVl5kM
	 cGPsAlDfDmKhkvkLGN/vIcnfgBHb34l6zHEM56NgZugic2ZHnmIgispKBp3c+VqsWwUGk
	 fr38oLMFGdDr0VU0SbT4wPdt3dExfAhFnSPdQUzHGDhBPRforDaRCA4e/RFB+7ldQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668129;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gz37XyZx72Rdv6G3EZXgKHiqk5BLFb3U4GXcq8oitTI=;
	b=YLGX0FCP1Y4Xt9JmGfqF0mg0hCfY8RvZKRMvd9qGm22cIA/8WTHMDeQzY05QbwE4/Naw
	 tI+1T23le+oyBqoWSwLlQ35OGwLeP42qrBz5BE7RWxCB5+WJbT/st/w/rqXiVfkNTNXpe
	 OZBS9DKlDYcPrQISfcbsnPFHnAAKtmqIugLvz+LkpGGgPmqyJ2NTUjgsEfzWYo2wmlRZQ
	 /bVAVCdixTblXMPk9tT2VmF2tJDO0cOVFTKDNadiSxQON/23ljOm++QcutxWFW7FWs+YI
	 yihU2uUH1kbxlyw0r3S5fMYvsfcCCM65/6zixURu8gG4Mh0034FcTfipPz7dtihyUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E1F606A336;
	Sat, 14 Nov 2026 14:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E1F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSFA1-000000005Il-07Wg;
	Sat, 14 Nov 2026 14:55:21 +0000
Date: Sat, 14 Nov 2026 14:55:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 6/6] ARM: dts: rockchip: Add RKVENC operating points to
 RV1126
Message-ID: <13212e28d26fde53f49c1838bb099f1f6b419dfd.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>

Add the four core clock rates of the encoder, 297, 396, 500 and 594
MHz, which the clock tree provides as GPLL/4, GPLL/3, CPLL and GPLL/2,
with the voltages of 725, 725, 750 and 825 mV that the vendor device
tree gives them. The voltages apply on boards that describe the supply
of the encoder as venc-supply. Make the encoder a cooling device so
that thermal zones can use it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 63705291dd3ce..7e37fd89609a7 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -104,6 +104,30 @@ xin24m: oscillator {
 		#clock-cells = <0>;
 	};
 
+	venc_opp_table: opp-table-venc {
+		compatible = "operating-points-v2";
+
+		opp-297000000 {
+			opp-hz = /bits/ 64 <297000000>;
+			opp-microvolt = <725000 725000 1000000>;
+		};
+
+		opp-396000000 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-microvolt = <725000 725000 1000000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <750000 750000 1000000>;
+		};
+
+		opp-594000000 {
+			opp-hz = /bits/ 64 <594000000>;
+			opp-microvolt = <825000 825000 1000000>;
+		};
+	};
+
 	grf: syscon@fe000000 {
 		compatible = "rockchip,rv1126-grf", "syscon", "simple-mfd";
 		reg = <0xfe000000 0x20000>;
@@ -665,6 +689,8 @@ venc: video-codec@ffbb0000 {
 		clock-names = "axi", "ahb", "core";
 		assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
 		assigned-clock-rates = <297000000>, <396000000>;
+		operating-points-v2 = <&venc_opp_table>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
 			 <&cru SRST_VENC_CORE>;
 		reset-names = "axi", "ahb", "core";
-- 
2.56.0
