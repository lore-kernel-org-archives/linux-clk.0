Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0428DDA;
	Sat,  6 Apr 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712400245; cv=none; b=bAZ7N0HjhIGXppzICjHfiWfr5dB87125nsOql9KB2jVrzu7iH87idw0RwHH+1vzzBaQ3M1oFHUQqXgp7NPSBZYDNRT9r8kAojY5DZyCkVlTVUiiSTTw5pg31hp6rBvvCV38s+0JYP6+l7GI86FrP9tPFjc7biohPS9I1piDkpK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712400245; c=relaxed/simple;
	bh=ZYGijoPNLE1z7XLdtGrXhilLPEuFFM6tKmNuh6tx5qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUCJpbC4s+iM3/22lFHIFGb0D4hPemIyL6zfia2X1wUyfg07YoG0E35CHuVriw/oRo1ML9qQ1gJCAqsztHI0qBa3kFXzQlBCpbcIkyHlFB22ouzSy7NDXXmi9zKHXs5a1QrTtCLaIcsn8y9Yojlecx0KduxpZ/LMUiwm6U/ahm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwsaScgK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwsaScgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C4FC433F1;
	Sat,  6 Apr 2024 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712400245;
	bh=ZYGijoPNLE1z7XLdtGrXhilLPEuFFM6tKmNuh6tx5qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwsaScgKPDmHszrmhMopGHyKIP7oZIqpm4AqW9r9hkrhhNkjLupJeG32w1sriWN19
	 Qbriq9LormjGnpibTxVAgrUXdJw0QthlJc6bWN7pfoqQOmyRGRFj60VDN0KoEeGLRD
	 HEU94ejbpSRUH9bwqKXYAR6h+RyhQKTsqmg/9bVHTi4VBT/NWA2v6YfRgiEb9bl5lb
	 CcrKr629ek1vysrtLt4r5X7xd+W5it1l0D3UqQwd39pETlajdtY2lOn+4hNp5og5aD
	 pyif97gaI00o+j5mD65qYpvT5FVJkoikiZZcDD0Zh0xKRo4TLdKZ6PmuTp3X54qsW3
	 mJ74U7ZT9gtyg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 2/4] arm64: dts: airoha: Add EN7581 clock node
Date: Sat,  6 Apr 2024 12:43:42 +0200
Message-ID: <c256afe41991085969a6f29399b20fe7ffb91ba7.1712399981.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712399980.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the Airoha EN7581 clock node in Airoha EN7581 dtsi

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 55eb1762fb11..5c4bfe3e1e5a 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -150,5 +151,13 @@ uart1: serial@1fbf0000 {
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <1843200>;
 		};
+
+		scuclk: clock-controller@1fa20000 {
+			compatible = "airoha,en7581-scu";
+			reg = <0x0 0x1fa20000 0x0 0x400>,
+			      <0x0 0x1fb00000 0x0 0x1000>,
+			      <0x0 0x1fbe3400 0x0 0xfc>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.44.0

