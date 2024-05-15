Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D886757E0;
	Wed, 15 May 2024 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777953; cv=none; b=hixCWGMZWYIxzYh2ZfrMwhPzczjbTF8heGzCkxCeUbwHHfrg8+cUq6oIGdo4TTIMz8jH79czEahZevfYe6YLp0eqn2DMRoswWM665lvXzpg3ay4+c40U3crfpH2Rc40rMgerQbyTUc+WvCVEKXFo19rsQdqFi3xNpOjTBhdeAG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777953; c=relaxed/simple;
	bh=epj2XTyHV0DM4jDls6ECBOh89BAXVZ99Xrhk4jkYb+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9KjvIEWt2toRuKuzy6jOu7Zy+2D9F4a5sPXzXmlhsdBuYvTNV+8K4+ggi+v7DVzVYK7d3CiH5BbqTPqlH3D+jmCucA4MT1Jw+54FlmA2jrYRMp+MZ6MnQfUw9SXXcIGDL0Xh+ihBj9f16Th1iiL+UhAnNxAtqzMm7IcCXEay20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQBM0ynz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQBM0ynz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B4FC32782;
	Wed, 15 May 2024 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777952;
	bh=epj2XTyHV0DM4jDls6ECBOh89BAXVZ99Xrhk4jkYb+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQBM0ynzMTcS7seNAXo/ysDIRpiyMuJNQoVcmzdIg3fnqhUA4xYFwNRd2Z5iOU9pA
	 u/xZFeLc5Jie+orK0zFWFdzIu9FYjRgUdPm3n872mX0POvVb8P0DefaKj6cJgdlYjF
	 2CxZrYxSB+okXkPhWeZxJtkDHr/JuMp5CRq5E98GFI+jTMkWFhFiJ+1cD7vC5f/CYT
	 lXnKhlqsv6H8vwWBr9x5wISVIXbmAjlzL3/hASs56AcDtuYZMKhtc71AMHDuWgCYwP
	 GR2j8sDu+OLdEXqBEFEgETAoXTLbkxN4ppbpXZjOribiRR7WEiCe/vvlCQealuZUyX
	 4AY3FiDu+A9yA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 3/5] arm64: dts: airoha: Add reset-controller support to EN7581 clock node
Date: Wed, 15 May 2024 14:58:49 +0200
Message-ID: <7c3cff0bb3fd93efc53500c51e5e28b645e56710.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715777643.git.lorenzo@kernel.org>
References: <cover.1715777643.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset capability to scuclk clock-controller device-tree node
for EN7581 SoC.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 77fd37222a6a..f4d41b22e505 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7581-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -158,6 +159,7 @@ scuclk: clock-controller@1fa20000 {
 			      <0x0 0x1fb00000 0x0 0x1000>,
 			      <0x0 0x1fbe3400 0x0 0xfc>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		snfi: spi@1fa10000 {
-- 
2.45.0

