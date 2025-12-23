Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6EA1531C8;
	Tue, 23 Dec 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494077; cv=none; b=Y/eel5SOb5uF5n7zaWO6KE4QeCYiOVGRl4xnNzZVRsS9f+EGOoS/JqoAqhPlVxoRhMJsdBCe7VKvZARlFCc84SdY+XtnOVrB9QB35l9Ggq4He8pYI54W690IKZqQKIu8ARFzXfgzOHd5twG5Wkuo1PHxVvNHquHOpB6UhjphlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494077; c=relaxed/simple;
	bh=WXvLUt0Z4RKCNcS99dOC/TE9RwivHFDhbm9iqtxU6lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfXCsThG1fbCtttHEMIjJAu6TjudJePIVADKOjPlFiOB/M/M7cdxt+p5YTQIbvVZytCzk1tIH9sV3Tdg/YfOYTFDzI8//6gqqwrrP4PxP1ds9bLJgl1sTojJKLHmjbbn5ZlNzwccdIQ7hPsYqAJQQwij3DugyQdBRmxO2WywxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVkaDxA3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVkaDxA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788F3C116C6;
	Tue, 23 Dec 2025 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494077;
	bh=WXvLUt0Z4RKCNcS99dOC/TE9RwivHFDhbm9iqtxU6lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVkaDxA3FQ+242CPw9Nk3qyl6ju3owT7uVtIWKZwdNSeXEe1CYIUzK3BXk7U9MjrK
	 arUl9yXvURxfDeMoY6R/WsHSxOYqELoBj17bIGOXZeSGff2VY+2CTG113VuoHY7fym
	 0LIMDdgSvqGgwClsQuLb1ho//8eqrIx8j5lhMRRbUHYwfQSyuTySKvoNrQj9Sox85H
	 NcdcUg+HUED3thRKNCHinPVr5USJNFMA2xTb5BNkvIlBOftbMxzTpX9L/lK6hFSWZk
	 /A4gE99eQoL2W2a0HnZkhTo9db4WLu/U7MM1WaG1sasiE/9qFX1MGFS8DxM5oFUnFq
	 rU0meQQEZrisg==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: ti: add GPU node
Date: Tue, 23 Dec 2025 13:47:15 +0100
Message-ID: <20251223124729.2482877-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The J722S features a BXS-4 GPU. Add the node for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3cf7c2b3ce2d..a55e5108e7b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1110,6 +1110,17 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;
-- 
2.47.3

