Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586468;
	b=NwwRhQXZAsqQDTOjW9gJTTj2UxWosbolD25dQbBAWF4Y6/GbhzEHdUIjctTs5q/W2w0i
	 id9+Kn9yrY/ycZ2WQhacDD8KgwLt0bob8JLxJopQaOMEUz8ZHbdujSjjS2Jqa/WBH8FIk
	 cQeyspWB0wtlTrzUGsnsYGsNs/mrLqbma+GHkESJ2Gt8F6WSvruflyPlevISVTUEaTwd+
	 fjqxrHUuWDdVH5R6xGMA7fHjokaGt7YmMUj+KLcaIJdi39ewDlv9UVALQfJu/J82iAMUt
	 tLbBTqAV3b096UuOVvjss+eZ5WYRSaRddHyZkk+h1NmgCQt4XiPjCcLqvMFjkDM4irg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586468;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=JbOP+NytntTkLkVoqa5PA56FxoK71n2sdDtEGCzcrMo=;
	b=fNbmoETUyNY+lrrDBSjLEg+12ja70+LZdSF64/uW1Qiv/yJJfTjS7LLskVPfbHXJB1iL
	 YhyyUaALcuT+MEcTMM+INrljjDhtjvpvyTzfCtUB1Bt8yAiASoqJ1PT2sNXjlKuZH1xF1
	 N+URzLQvL8XldK7mZkKplu0yRX33S7f2ChP0OQj1ShRBb0+0LfjnuRElXa6R+F4AsEBt+
	 BUmFm1qZsk3aZG57XLfy/ylXeuoGFhs6XPh4vKzXoFhE54uI0/Y1+ElBExYO0burpDFTP
	 ZvK2RsPqoqpSSTQrCu4bV1y+NgrEcUfZ9mkEe2Fob0vAtB4DlNOcllYMne0nxPTiiEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=K1ugWyWu;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF8606A330;
	Wed, 25 Nov 2026 06:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FF8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=K1ugWyWu
X-UUID: 92c6afd0e89511f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=JbOP+NytntTkLkVoqa5PA56FxoK71n2sdDtEGCzcrMo=;
	b=K1ugWyWuh1Gu93Q7TXrmKU1rc45eKs+/LT9zBVRnDI37TIPun5BkT9vz8GaIKyr53rGLqVgGnyWBg6yoCSw4+e+Gbr0Fvp91igW00EUhz1UNmuJVYUUkpZuQ6OihMf763FICIqKUixbZNt3VTk9zntbnnEhZaI8KzdUT8phiD74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b8a88716-d100-43e9-9375-d5cde45fd7c3,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:b0318ac,CLOUDID:0e98081a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:11|97|99|93|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 92c6afd0e89511f1b1788b6acf885367-20261125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 181735365; Wed, 25 Nov 2026 14:00:53 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:51 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
Date: Wed, 25 Nov 2026 14:00:07 +0800
Message-ID: <20261125060037.649659-3-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125060037.649659-1-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Describe the MMDVFS clock provider and its connection to VCP firmware
in a common binding. Document the optional MMUP shared memory and IPI
settings used by the firmware backend.

Add an MT8196 binding for the HWCCF syscon and seven mux OPP tables so
the driver can map clock rate requests to hardware votes.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 .../soc/mediatek/mediatek,mmdvfs.yaml         | 60 +++++++++++++
 .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  | 87 +++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
new file mode 100644
index 000000000000..d65f4c9084cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mmdvfs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Multimedia Dynamic Voltage and Frequency Scaling (MMDVFS)
+
+maintainers:
+  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>
+
+description:
+  MediaTek MMDVFS provides dynamic voltage and frequency scaling for multimedia
+  hardware accelerators. The controller exposes virtual clocks that multimedia
+  consumers use through the common clock framework. The driver aggregates
+  consumer rate requests and sends the resulting DVFS votes to the multimedia
+  hardware voter and VCP firmware.
+
+select: false
+
+properties:
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the MediaTek VCP remote processor used for MMDVFS shared
+      memory, feature registration, notifier, and IPI operations.
+
+  mediatek,mmup-sram:
+    type: boolean
+    description:
+      Use the MMUP SRAM window for MMDVFS callback records and status data.
+
+  mediatek,mmup-enable:
+    type: boolean
+    description:
+      Enable the MMUP path for MMDVFS shared memory and IPI handling.
+
+  mediatek,vcp-ipi-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VCP IPI channel id for MMDVFS. If omitted, the driver uses the platform
+      default.
+
+  mediatek,mmup-ipi-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      MMUP IPI channel id for MMDVFS. If omitted, the driver uses the platform
+      default.
+
+  "#clock-cells":
+    const: 1
+    description:
+      MMDVFS clock specifier. Consumers pass an SoC-specific MMDVFS clock
+      index.
+
+required:
+  - mediatek,vcp
+  - "#clock-cells"
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
new file mode 100644
index 000000000000..13381c78dbd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-mmdvfs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 Multimedia Dynamic Voltage and Frequency Scaling
+
+maintainers:
+  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>
+
+allOf:
+  - $ref: mediatek,mmdvfs.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt8196-mmdvfs
+  required:
+    - compatible
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-mmdvfs
+
+  mediatek,hwccf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the MT8196 multimedia hardware clock control fabric syscon
+      used for AP-side hardware votes.
+
+  mediatek,mux-opp-tables:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 7
+    maxItems: 7
+    description: |
+      OPP tables for the seven MT8196 MMDVFS muxes, in this order:
+      display, MDP, SMI, VENC, VDEC, IMG, CAM. MDP and MML share
+      the MDP mux. Each OPP entry must have opp-hz and opp-level.
+
+required:
+  - compatible
+  - mediatek,hwccf
+  - mediatek,mux-opp-tables
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-mmdvfs.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vcp: remoteproc@31800000 {
+            compatible = "mediatek,mt8196-vcp";
+            reg = <0 0x31800000 0 0x100000>;
+        };
+
+        mm_hwv: syscon@31b00000 {
+            compatible = "mediatek,mt8196-mm-hwv", "syscon";
+            reg = <0 0x31b00000 0 0x6000>;
+        };
+
+        mmdvfs_opp: opp-table {
+            compatible = "operating-points-v2";
+            opp-0 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-level = <0>;
+            };
+        };
+
+        mmdvfs: mmdvfs-mux {
+            compatible = "mediatek,mt8196-mmdvfs";
+            mediatek,vcp = <&vcp>;
+            mediatek,hwccf = <&mm_hwv>;
+            mediatek,mux-opp-tables = <&mmdvfs_opp>, <&mmdvfs_opp>,
+                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
+                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
+                                      <&mmdvfs_opp>;
+            #clock-cells = <1>;
+        };
+    };
-- 
2.45.2

