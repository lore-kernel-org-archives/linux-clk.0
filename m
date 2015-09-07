Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sanchayan Maity <maitysanchayan@gmail.com>
To: srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org
Cc: maxime.ripard@free-electrons.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stefan@agner.ch, shawnguo@kernel.org,
	kernel@pengutronix.de, Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v10 4/4] nvmem: Add DT binding documentation for Vybrid OCOTP driver
Date: Mon,  7 Sep 2015 13:51:38 +0530
Message-Id: <1cec2239c020d4519aad38f42f09bf26b3d2854a.1441609625.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1441609625.git.maitysanchayan@gmail.com>
References: <cover.1441609625.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1441609625.git.maitysanchayan@gmail.com>
References: <cover.1441609625.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the devicetree bindings for the Freescale Vybrid On-Chip
OTP driver.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/nvmem/vf610-ocotp.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
new file mode 100644
index 0000000..56ed481
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
@@ -0,0 +1,19 @@
+On-Chip OTP Memory for Freescale Vybrid
+
+Required Properties:
+  compatible:
+  - "fsl,vf610-ocotp" for VF5xx/VF6xx
+  #address-cells : Should be 1
+  #size-cells : Should be 1
+  reg : Address and length of OTP controller and fuse map registers
+  clocks : ipg clock we associate with the OCOTP peripheral
+
+Example for Vybrid VF5xx/VF6xx:
+
+	ocotp: ocotp@400a5000 {
+		compatible = "fsl,vf610-ocotp";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x400a5000 0xCF0>;
+		clocks = <&clks VF610_CLK_OCOTP>;
+	};
-- 
2.5.1

