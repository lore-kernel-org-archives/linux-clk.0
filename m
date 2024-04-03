Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AD947E;
	Wed,  3 Apr 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161281; cv=none; b=Umt9CT70Vkhdud6E81oMrDyaGxwl2t79WShhgDrOeN84jSSALZM3Tx7MxKkk4AKEXHGd7aY7JEqAyyX0oDaYYmB/jIv41Dxgnt5DDwmpEhiYY04lpz9IUYmHRPgaNJz11WSwKeemYJSiRPDQNLQlm6gIE92S+e0w2sQ0zoxRnaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161281; c=relaxed/simple;
	bh=fFQ5N7sQmAGLoUlKNPhtk3TelSVQODwMWd8NRadJgl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV2haKswYcXHIhiQ1pfTVVkENhVTjE41AmKc5jjN3NAbJ7Vxf0uvzP60Rn7PyXAF6p4fXVdaNTeCfEwC/Imkb9I1u/uYQ+15eXi6/aCpdeVWRAx7RdFjX+u05DCgIINEQpZKQETKXQJUoDewUO5EnIrgG1cf78GIZ9x9jw/Luu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovHzYE6N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovHzYE6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C5EC433C7;
	Wed,  3 Apr 2024 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712161280;
	bh=fFQ5N7sQmAGLoUlKNPhtk3TelSVQODwMWd8NRadJgl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovHzYE6N4nDorlE7ReQUDB6UC5n0MUaEUEbRqyF7r+MGxOcZGzp/5pshnsga/kM4E
	 prDqz54QaoWGodpFIPmDo/5d81+jSQpPCnapOhuqxU1wbsHD0+QVRUCx+G2zmrAayT
	 KUK00tpUS+tMUe7RoJRCC3dVXkdX8unDD/SJVPzAKiPtrOVjLVBPQaU3GqxDN/rG84
	 rdS++01cTOdw1PN8A3eTDk141Twlt9Dpp335XbyP72AXRP7lhbcrziXmQbaJPwFkcD
	 j1oFQp5LUAgaSNNVgo5nKSLjnZ/DC7SXqCsB7AXCah3Lu8nkUfP463H9ItZq/HdrFP
	 zAcY/JsFNNQ7Q==
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
Subject: [PATCH 2/4] arm64: dts: airoha: Add EN7581 clock node
Date: Wed,  3 Apr 2024 18:20:43 +0200
Message-ID: <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712160869.git.lorenzo@kernel.org>
References: <cover.1712160869.git.lorenzo@kernel.org>
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
index 55eb1762fb11..a1daaaef0de0 100644
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
+		scu: system-controller@1fa20000 {
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

