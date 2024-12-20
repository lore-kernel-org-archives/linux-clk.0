Received: from mail-m12774.qiye.163.com (mail-m12774.qiye.163.com [115.236.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A72C859;
	Fri, 20 Dec 2024 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691125; cv=none; b=hcUdXmhi005qM+2aL6GkpWFoxlgjU2pv6gPaj3+6W3swHcvUvmLOfSL19Pbplz2mfu4Jtp82GFEqYpUkwKOcUQ9XrTBSUgQMUkH6pSA5mYFTbHC6V9vnHedKNUGsTWrvLxkD+MWUK4VmbMB8J2i4hBxOWrom6/pf1eo3MiIggRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691125; c=relaxed/simple;
	bh=5hFla9wyqyPOwX7MeI4+4iB+k+rpV2WnRhdA0Cf2Nw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bg/nyaSzj5r6WGNS+TtvC/apirUez506rUccLrx6YC0uQ2NwV+/h+yzcvxXUrrl8mHxPFyIwp3msoolxIwvW2f1PjOrXRkgdCGpCx0nNEaTfg3I5tRhygCQtV3xNbDcx4P30LDhmruIWhT8Tj5d9l5AwPVxJAaTzmz1NXW+omAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UEtdaQss; arc=none smtp.client-ip=115.236.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UEtdaQss"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 656997fe;
	Fri, 20 Dec 2024 18:38:31 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/38] dt-bindings: clock: add rk3562 cru bindings
Date: Fri, 20 Dec 2024 18:37:47 +0800
Message-Id: <20241220103825.3509421-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103825.3509421-1-kever.yang@rock-chips.com>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgdTVYfS0weSBlCHk0ZHklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e3a5c3d903afkunm656997fe
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PT46Pjo4FDITPggZCRIVMRkf
	GhowCxdVSlVKTEhPTUJKSkpISElLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSk5CNwY+
DKIM-Signature:a=rsa-sha256;
	b=UEtdaQssyAka2rcdKQJIYeI454h4mwBv5CKU4SOjEfSqaBGu5s+PaSvYzoTEU5DGXw4QvIq/9Wgt3DocoymKrUOwFgwaCo/+kb0A2y3tH8cfAQY4MKb1yvUcZYgoeBilw4HnNoAh6G/mRjjbXWZz0WsOgD0NblQkmbJ8RV3dMxc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=drVtBxzeIIn8Gs2gznAY2adX7dQkapgwQIGcixUQGQY=;
	h=date:mime-version:subject:message-id:from;

Document the device tree bindings of the rockchip rk3562 SoC
clock and reset unit.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 .../bindings/clock/rockchip,rk3562-cru.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
new file mode 100644
index 000000000000..aa8dedf2bfce
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rk3562-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3562 Clock and Reset Control Module
+
+maintainers:
+  - Elaine Zhang <zhangqing@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The RK3562 clock controller generates the clock and also implements a reset
+  controller for SoC peripherals. For example it provides SCLK_UART2 and
+  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UART
+  module.
+
+properties:
+  compatible:
+    const: rockchip,rk3562-cru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xin24m
+      - const: xin32k
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF),
+      if missing pll rates are not changeable, due to the missing pll
+      lock status.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ff100000 {
+      compatible = "rockchip,rk3562-cru";
+      reg = <0xff100000 0x40000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.25.1

