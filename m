Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9544E2BDC23;
	Sun,  9 Aug 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281324; cv=none; b=RWcGr509fqHIT/7DByu6b87eCTSySuICLhZWCps2Hgme0a8TXlOO/BLJZitBa7imUN3YvhRqOb5i3TWmJ69t4Y1ljVvPvrL5AhS9KVeH04RdV7IFuNxTxamiapDVDhWX2fwapFqTODKwfU3c23kyDpMEv6uY125FHZgy06l9sNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281324; c=relaxed/simple;
	bh=TJKB9gAU8hAV/dp4YGZIrl98K3SXxpdpaQ+kxnNhMsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1oyg5FqLigEbtrPf3WM/IklTpu0tIMAhsfcTumhRr/9E20XKEGVozV1B8XMtaKpVgWg+7+vmT/KfQiqdH9WYx2ab27ZkG2pSzp43c/2Ibt4uuElBVD4XRSKFxoZUzDMZJTHDLawJ0jN0HdjVsGFn0Y+VJX+tOoWHruWJoEGjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFTBZBIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFTBZBIe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 219BBC2BCF5;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786281322;
	bh=TJKB9gAU8hAV/dp4YGZIrl98K3SXxpdpaQ+kxnNhMsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bFTBZBIe3rg1Q4Enak9VZP5g939pWRHlTWxgUQgLGl0GTpmMbI7Vf1NHiPIlzhwtu
	 Dmc9GMiYE7Ol84WtrdGRFAsDEPERyZyna1wRvrNhQwesBOykQdG0ZuQ0dxD7rOxiur
	 mUHN8eyAT0eRNjKmcr3CIhFzWYIEfetEtnzWm6HwgONG413E59PJYH3cOzHEx7ZDrk
	 ffvWTiscVD7WkURxIZphbBckmc7srAE+nxdcGqGP4vYg6oknuGPzT/aslx3q6ljvWJ
	 I6mvJeezcqsbUHxKZOl2UhDTJIIRXTT/TdZXpN73ECjfCuFPTkkVhT4RorCSpYXs0x
	 6w1T1EPaVbNZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D34AC5AD4E;
	Sun,  9 Aug 2026 13:15:22 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sun, 09 Aug 2026 21:14:25 +0800
Subject: [PATCH v2 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-k3-display-v2-16-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786281298; l=1996;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=bDzCEbg4Ro8zSSgw6S6oLDaHK3U8ySxkW2QdyX9XeEQ=;
 b=PxUeBROVtI/bhvyeufA2ol0EOCQM47kl/BlTY0uhkjcmZ2NM5vq743ZQSfSmVnGnGt5qx5RbG
 pESN31dKvBPApSkV8r8qTHMr0Wwiv4nTD3haNUT9lUFD6lkP5LG9nNj
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

CoM260-IFX carries a single DisplayPort output, so the second DPU and
the DisplayPort controller it feeds are enabled.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>

---
v2:
- describe the DP receptacle (dp-connector) and link it to dp1 port@1
  (Rob Herring, on patch 03)
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 27 ++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e2..ec87c281e02c6 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -18,4 +19,30 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
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
+};
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
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1ee..dbe8db4a8b764 100644
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
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0


