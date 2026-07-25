Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714E399375;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955085; cv=none; b=BcB1TO4reQfgicEnv0LIAkuD1CfmYEn8IrY8S8lSIxI6SlaP2lAZ6fJmxQPGHU7Z/e6Q7e09ZYDsIhipUw0HZpzRh6vzmegQhooV9vAbDDnCen6QUbJvalmftKm0AIlpwcuxI7rn4jcEyWyWFGeMat0FajqkVshZDFYhaXC22cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955085; c=relaxed/simple;
	bh=lS9ZHO5cU1PIgcluobW44ILgdd41TC3FoJ2uJmzxlZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNo1kuxxsUJ2SlOQqn8yVpr6AUss25KYlPTDwvQWsl6tHmm1iKj8kNiLsPxvLO2HTwxGTWE2MKTnKamlWnGq9vYkAxaJqvMFZ9GovU0nPkgwP5Oky3yl1pFva2dq48DswKze9UjHoz4X3P/54ZNMsM57Sluh0WKOKLG4t3UrHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCfYhLcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCfYhLcG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35739C4AF62;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=lS9ZHO5cU1PIgcluobW44ILgdd41TC3FoJ2uJmzxlZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OCfYhLcGTWSu0OGpNjadtm8op1mPLTctO2pSILFrQ2L3j2MFumVB3xJnvdVnZdKMy
	 ShwgXb5VXXqeDlcTzWymuL9BTlJsC/Zca4lSiCFaooESHyp3eSmzmd55Yt8qUiFBnc
	 LwBXypkzOAQKELiaDBL0Q6zIxQf0D61m515ZUfCgXqRZs087O+QxsHnWwV8ZzDa9wI
	 Cw81qB2GoQ3JLtZRue92DueGgeJdVYQl81kCsIE2bvOFnPFuBx/i2exHNAUWOd/o0w
	 jMfykA3Ynv4Wm0PLUnwyfzIV10+wEhyCs2fGgqtygblXw2tRfo5G2FD3pOjw9P/ilq
	 klQWNQlmh8MsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F702C5321B;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:25 -0400
Subject: [PATCH RESEND 16/17] riscv: dts: spacemit: k3-com260-ifx: enable
 the DisplayPort output
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-16-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
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
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=1589;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=Ich4f6q4tajR0qNR1lNUbENzsTq+U+zWcM4jg4iHZLI=;
 b=svT50cqkUT9tdXpDqDr8V4BCs5YfVqOAVZzNMJjzwWS+MDxblUOIeTkUanQD2/zeXYdqDIDCB
 879Z9RzlqsCAxiurj9ssQLux8/nRm6Sx4LLBYT5iRHCVAXS2c+o8rjy
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
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..114d0e02fed9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -19,3 +20,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
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
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1e..dbe8db4a8b76 100644
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


