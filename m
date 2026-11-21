Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795246862;
	b=m0FlJu2ZLTuLoJ+1wEk6VY7BF7Jsy/3zA47DACDgiYBhb2Rh7lMDH/LBfIAJ+RmEu+vO
	 l41gr5vzIXAufD/X849Y78M7PlK2q8L8OziRYqfZarAxEe2KfN0X+HI1KPjpNbpvCDdI9
	 MPT4gbU/zFuBv/nRNWePQ2722j4wQ0ARZCKRKcrZCJICsr3/pzfQHmc05k/LursUW0sbw
	 Tp/SJUEMuydsDDCFTkgD08IJVZM4iuasILfswTWBvbDg95B9uHY5GzB1m5Q5Pyqp4QCaH
	 NU3fMBBF9uocVHpIk4R1eKSNYQtNVWwN5Qlh8OB64aoMSx4F7N3OGZ5r2lAqJnc7l1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246862;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=knBV86Q5FiXjXVG2W+ZEgSUEQlgIpJm2XykazWaZvzY=;
	b=0+ztdZkFjrsccu5+ImQKB8zHRuW3lVBX25gCi5LiOhIdbt+gILYxxS9QKeCT5rfovIEb
	 1QCSoXjUWwf73KBE/yTrf+LmEw0LFZ/qkZaBaen7a5DHDbWomxyhn/Vp9LC1MQUVGjpzI
	 IpbT0TX4zOjWk4xMinZF8nnFpQGk9mOFsbPtz8TjynqLqVKaYZT+qjvgN8S9fsm2i3HSf
	 DYftUAVDojzIq23tnbBGtnCGyKVSkElLjHxfSe4nolBEnj2heBBfugDruLi8FJJ+wU/Ez
	 GfI5EEjwCfVVXO7yvqOFtJL8LS+4gDbU3/Y0vtHu3DsqgCEqIFNxNHCa1oVYV8jMCpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAW5ntxr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8870606A680;
	Sat, 21 Nov 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAW5ntxr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246861;
	b=NKHwadUQ1dcymoFGjCAKW/YcaYGTADsJRsl/c+9F0Pbv77RJnpwAK6zv9tExvS/2U6Pw
	 1Tr5dpgTL3OrsLX+LYKyQzLlrcTqCNJkDi3NhwPMlUowkWNaLIlZYRN8XHgSzCQy/LzmZ
	 m9024udJfIKZClaHlipU1lMCLsk2hkeu/AXhTSmUGbXK9zsd86biidWMjGM5UbUyNCo9W
	 sCgQfsFoQLaw3VOSutQXmexV3yh+rRwPkW4LqKi2nROPhMnMLPS50mt/oDED26FtvrGA2
	 yvDPk9n1Q+WX99rJ3lJx8XvORBQ/1Qlp7YWyQALkfGfvd3Q8PWSjxXA+jQjWdcIqq7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=knBV86Q5FiXjXVG2W+ZEgSUEQlgIpJm2XykazWaZvzY=;
	b=tTb0PDtUwe28QgrlCUyf2/jani9UOHRShXsQJy8luGSMB02/vqMZJ4YUK42FQ42TOTto
	 QJcGWJo+uyuhnjRCDi3y57H5fxwlOFsPUKh17gNVqUgD86dR+2s0TKqeEQrZ0Lzjrtp7s
	 wyz/P997kDQr+I7KTB7oFzE1cpWrAeF4L1F5piOjOjHXylqIK6gWGIUKqfyCWt58wWPI7
	 ho31L0EQCCd8A3MOPAtYeGI8nlF/IZOO0At6CY8Usph1aOiz7aUTMJ1CW56jlen5wSIAO
	 4lPSzmqYp8WzK0+4aoReRg00zuGohP3muizz0AfoSNiOBm6MdTqPjt0dQEzjFHDl2jQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1318B1F00A03;
	Sat, 21 Nov 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246861;
	bh=knBV86Q5FiXjXVG2W+ZEgSUEQlgIpJm2XykazWaZvzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAW5ntxrJOUwGpzLIgx2G+o09j4tLmctXwK98DJFK1dMyWYeHYLEzSs7qBQc/SX6w
	 dylb1og4aZIQT/BhhdVDwSVGtLUd0ddsnQkE2lHGxWF/ZyV46XS/leg5tlFgMpa4rO
	 cg8EXGme4ooiD7IJDMa3vpWKRC8C+3V2X+wAJbxtoQOrgIFTlfemNPz4XazPbeYB/Q
	 PK8nOZdytr32pkBohPo1uO+LWf+Hl4Um0ajWqvfqKHj6sECWDJrwXvEL4JKmE3WkqY
	 TlPqqlNdeCqmigq3D3M+8fBn32eVy/dPxpn0flkLaRg1ClerM/RKsnafpRmGYbcbUD
	 jolYL5xH+SLvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1CAC54BB87;
	Sat, 21 Nov 2026 07:40:52 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:55 +0800
Subject: [PATCH v3 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-k3-display-v3-16-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=2262;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=E78ySXuc7cskakorLvfTKi4q+Aj5tLnVas7172iViS8=;
 b=+l50UcVZTidzyMw5IfVtxsgruvr+qucZeTZdrIakHSuASGpLlWMuz53votn1rMk41mdq+AJcS
 Tip6sDvTE3vAA6fbTQP9FnGI+FyOl3lltKHH3tbERd4D25Yn9IX64lU
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang@vsit.ai>

CoM260-IFX carries a single DisplayPort output. Enable the second DPU
and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- describe the HPD pad at the 1.8 V it runs at
- commit message: reworded
v2:
- describe the DP receptacle (dp-connector) and link it to dp1 port@1
  (Rob Herring, on patch 03)
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 27 ++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index fadcf28389be9..321715d455865 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -20,6 +21,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
+
 	reg_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_HUB";
@@ -129,3 +142,17 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_3_cfg>;
+	status = "okay";
+};
+
+&dp1_out {
+	remote-endpoint = <&dp1_connector_in>;
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index a3188ca0ceb36..ea88ec95b9136 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -22,6 +22,17 @@ dp1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dp1_3_cfg: dp1-3-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(72, 4)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0


