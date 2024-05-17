Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A5200CD;
	Fri, 17 May 2024 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715948930; cv=none; b=nWkeunf0i6+hDexlQrt7LefQH6eJy14Dbk8dIkopftaH98vYp59D3Weog2yZ7oyg0y+e1Ftk289/Y9oCvzfPm4EKpaUVbIPDJBmv+Rg5R6vYCdB51ZjaDDBe1a+SXj3xVKnXFt2px+ciT2cUR17z5dGfYzS7AQeyemAvzhKmAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715948930; c=relaxed/simple;
	bh=Cr7eE6LCzB5OvVdxvHfH94TA6kgF59BWn1v5DR65b/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oieMkGKhYzPjUzd11gyK6wwC+E55nbpWgqJfWMdSTmHoYdVlNT7QKOmmsq1vaS+wmmicEbXLIn9nQ2zqFwItILGphE7G07RdVH+jl6Ck3rFYNjS9vVJboloUGQMHBxX8+m+lyXQ7Eb+w2aVcB+xq/J0q27VMEHuo/p5dUgIT2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DviAZe4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DviAZe4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE49C2BD10;
	Fri, 17 May 2024 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715948930;
	bh=Cr7eE6LCzB5OvVdxvHfH94TA6kgF59BWn1v5DR65b/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DviAZe4n5y+wrV4fJ88FvN3Fk5NZb1MjeMLThYKSi9h+QrHX+nKKEoo7QdamDtOox
	 gv/zZm28A5CCzmX/zfPf3U8XZc0BMCH1nUyoXWBh8OLD5biTbGr0h7UQK1T001KScI
	 tLDlWMK/XnHiGPT2xIVyryUlPi+fSnsPEFzr9d3pRqBeKezVtVqm41bNqeqWBON3Rb
	 dLAKDVr9rl/LFwmD/fP2EkmBxWIaH8L0q8TEebhkA7Ju7hl3Uu/6RyILQMFHTXludd
	 U107CZGqKT3XGz2jEQ7FYjUyui5jT2g9V44GHlZh+1X/sOrow8nN8j0m/j7Z5U8pOg
	 VnhBVT8Hr+dgw==
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
Subject: [PATCH v2 2/4] arm64: dts: airoha: Add reset-controller support to EN7581 clock node
Date: Fri, 17 May 2024 14:28:12 +0200
Message-ID: <f4d0c98cc67cf6b299e685052e8737dc500c8b25.1715948628.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715948628.git.lorenzo@kernel.org>
References: <cover.1715948628.git.lorenzo@kernel.org>
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
index 95a9ec534cdf..ca9fb0888ff9 100644
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

