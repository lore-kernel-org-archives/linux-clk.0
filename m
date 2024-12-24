Received: from mail-m12747.qiye.163.com (mail-m12747.qiye.163.com [115.236.127.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD8190072;
	Tue, 24 Dec 2024 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033115; cv=none; b=PSi1cj+n/yz5E17XatR8KIVl4A669j8aJkSBBRHTdpzBrMkFNRSsUiOCfYWg7VUcMVaH4HlpuqY8+gmzoVpmcyieBufsWMXbh13JxxapOL+VoLTC0OjRnq8gUNDN+tIHIn2Eu9XQOhQrVWEsOID3oqFuDVujEVuox9xYQtZwXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033115; c=relaxed/simple;
	bh=gTlAWwqH9b0n5vyX9lOfBbiT14CPIVnVHsf3Zr9XsWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aPywcPJQb+4eSWN9YnCZ41COU52ouhZbVRtjAs0KvUrZLF+vUJjNMMK8YtyMXNTxb1/S10KNxZCT6ZwcFCYq19w/7F2RMABmkiLOdoELhl+IH+3yzV7gJNjEd0MSm1I/abqE8gPnH2Jtvi4I3Y9OvThWX5WO85xzb+m6I3PKy+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=F2iem+W4; arc=none smtp.client-ip=115.236.127.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="F2iem+W4"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6a9f43dc;
	Tue, 24 Dec 2024 17:23:11 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/3] dt-bindings: clock: add rk3562 cru bindings
Date: Tue, 24 Dec 2024 17:23:08 +0800
Message-Id: <20241224092310.3814460-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtLHlZOSklDGE5KHhlNGkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f7fa3c0503afkunm6a9f43dc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ok06PSo4HTIRLko8LjU0OhBI
	Sg0aCRJVSlVKTEhOS0hJSkJISU9MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQk9PNwY+
DKIM-Signature:a=rsa-sha256;
	b=F2iem+W49rFXYqgwlnEAbHjg6aaTxwLv/0X3iPHuv4Rf0BBGUcHk7Ww7FfF48wTa+JbjzS0jWCVyqcJ0iLhb40+G/RsDB/y9qBFo6awQN5EzjDWi4nOaARUoH9YWlULr3POobiA05hZUrCAmnfWJkfRn+8Txh/v1bzz+qjpil1M=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=nr09POi+HWiP9ruYChbTF4hwj3FN+w41mKJvJl5Dv50=;
	h=date:mime-version:subject:message-id:from;

Document the device tree bindings of the rockchip rk3562 SoC
clock and reset unit.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- remove rockchip,grf info

 .../bindings/clock/rockchip,rk3562-cru.yaml   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
new file mode 100644
index 000000000000..36a353f5c42a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
@@ -0,0 +1,55 @@
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

