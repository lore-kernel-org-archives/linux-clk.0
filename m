Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795246855;
	b=nYBcuaDq5tVnIRH2Ohlap3l91rP+9pZM1O8NyUCl2mNtIYi95IrfeUSn3+F0L8Nui9ob
	 ZCPQ+nisEHJVdSgYZ3LGBMRhqXGLOSpnlKS/YSgkorLqtjaNJqQqeaIZFLkpJN8FLtz85
	 STKuPmUKu35P4oBdPzLFw/epoGGOmOH8yqPfICCEMnjESX3QsoT4D6dVoQGVuhd+4G07j
	 qo7Hg3xcn4pdXIQ1dwbP5NcH1vJ54u7gM+kXZSwrtGV/P56HlBQ/isGs+YlKKbJVeVx2K
	 zgSp/vwmL+5jFQQB7+plzjvjrBnRas1Zsd7eDKw/MXHJZd1qUDjuvjDcK6Dm8Z29xeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246855;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lEAa2WtrVlXW3TmhUYVg7fmfOxBkIJ+zQKioTv+Ou3U=;
	b=4x94sehiBetDpmW/ciTfyrvzEomxgglDD7ZLUiW8/oVulD9qj9nnxWnMp9GKYIpUzix6
	 eeRxdtCg8Q1cPeeDEzQaHYFxLA9PsSL18pKKEEsjwr5O2xLEQdxEUlk4FTeHi2o+NjmpG
	 Ytn9wP5UdK/xc/Yeoqh7EAdN739zwYMaP7P8gqTBGV5gnPorg6lawjWFNdjk5DmP5mplZ
	 SYRASw+MxIDSZZU9Kku1v9Ju9ESkys7q6v6A3ocj/o9/1LIxWAJXLJ6waAlIBeP1IWgdR
	 rF8AyFRBpcESeqNplS5vXA29xl/+DrARWWRW9YKGVDfZ9RhdcoLb7X1BOE+JhYw/WEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJGWgqJj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F41606A695;
	Sat, 21 Nov 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJGWgqJj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246855;
	b=itD+n8Y0I+DpP0AHoR+XoFcvj9Ue1GpklN4iuB7hJ+SMd7Ho3NXxvYSyZo2AQR3An/1L
	 kDOwtAnGNJ22tmFAV7pcSpWZJYPEoiD2gLKFUNcEByIgh7uZluPwucuyanCKNG1e/YyVh
	 5dRKMslEHMSPp9L3V2a7onnIrBPxoQ4r9pGimOXFUit30PJnyDyWDUuInvxSHJVpeA86l
	 tC9XdNCLprYrL1lcBivkrVo/0lTykMlsyUGzcLWJxBArvJSKKmnFCWsqOZ3r12Qr04IXT
	 w1IgMsTq4Zbqk2zxjwta5nA+aKw/TgFERrOLP6CEMC7u1VKhwiwYSIlbnz+Pe8ZEu7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246855;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lEAa2WtrVlXW3TmhUYVg7fmfOxBkIJ+zQKioTv+Ou3U=;
	b=V+3ZUJ5iEcUtWRx+HOglaBYU1LYUPo6zzTAy75JkwQYWOW5SW6OX+yfi1TmO+f1CtU9A
	 XnpFEJ60407AlkQZ1D6jSrqi74zjyXpPAl2vIHjGlhjAPSB7LshO+/IXQp7pAcA9IgbX0
	 J9V96T47QDbv4i8CGxLcPZ47RSA1YccNtDdo/s46/706JjxhRBEDCsEqUntZ3nfzisFKB
	 K+N1/CSeIYGzogfKixAuaSy+LQtE3wBP2JjsJD1xHy77fJ3stjm7vm8gGLHC4g18m4B3S
	 5zJ7UBmOfRPQhcDZ+k2BlZUXWHoEQmTwsvQ7kRqmCDemaXZVVRnlyjV02NRX7KmPJtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 252531F000CF;
	Sat, 21 Nov 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246855;
	bh=lEAa2WtrVlXW3TmhUYVg7fmfOxBkIJ+zQKioTv+Ou3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MJGWgqJjfEbHmM1xsDQO0Ebrgd5OKy2ab5bkbZFHJ8gCVc3Q2EBiIXjG6o4ghkGY6
	 LN0R7QqMmUKZzejk6h2r4cPZb8oqK7PvBz2OjabopA9ebNQKSkHQMBmH2CTE8l2As2
	 UJF/eC7/uWdjmBKhZEOh8VfxgXWJcb1gzXyUTHxaNeQZBllzHJL0Cwkk5V+nubvWXw
	 XWXCBBrZw/ZH9TVBeDT5tKIvyh00qaOrrO6Qnb48K1TvNHVXGS0Pj6SUt2dW+rVGaA
	 jT4Ivw7XsBzGd+MgzVO13YPKvR9yZTl9NsZqhYhcZYE08XydQLDuzHVl85fdnPQxJe
	 wkFOAnmBAjAiQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A0E694BB54;
	Sat, 21 Nov 2026 07:40:50 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:42 +0800
Subject: [PATCH v3 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-k3-display-v3-3-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=4815;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=n5FJMj8I57ff5CfZcJyLEqv1mYFFsFHi5mMkoW3HXOM=;
 b=ZTTL13nlI7DYFcTGTm7m3wCcURniCaj9EIGDKMMyWGMAZQUfaqDhOIfwhv7YvdaiUH24/SUgQ
 rqeHzmAFdopDGpFMIz7DbclzzW5DbsTmrylgmcBKUC3HhLOXL8YqYT4
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang@vsit.ai>

Both K3 instances are the same IP and share one compatible; which one
behaves as eDP is decided by what its downstream port is wired to, not by
which register window it sits in, so the binding does not distinguish them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- no change
v2:
- make port@1 required (Rob Herring)
- add Reviewed-by: Rob Herring (Arm)
---
 .../display/spacemit/spacemit,k3-inno-dp.yaml      | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
new file mode 100644
index 0000000000000..491d25730da9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
+  SoC. The K3 has two instances of the same block sharing one compatible;
+  each acts as embedded or external DisplayPort depending on whether its
+  output port drives a panel or a connector.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Link and hot-plug events.
+
+  clocks:
+    items:
+      - description: Pixel clock for the controller.
+      - description:
+          Pixel clock generated by the DP PHY PLL; the pixel clock above is
+          parented onto it in use.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: pll
+
+  resets:
+    maxItems: 1
+    description: Controller-wide reset signal.
+
+  phys:
+    maxItems: 1
+    description: Phandle to the K3 Innosilicon DP PHY.
+
+  phy-names:
+    items:
+      - const: dp
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video input from the DPU.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the panel or to the DisplayPort connector.
+
+    required:
+      - port@0
+      - port@1
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+    description:
+      The DisplayPort AUX bus. Present when the output drives an embedded
+      panel, which is described as a child of this node and identifies itself
+      over AUX. Absent when the output is a connector.
+
+  phy:
+    $ref: /schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+    description:
+      The DisplayPort PHY. Its registers live inside this controller's
+      register window, so it is described here as a child node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        edp@cac84000 {
+            compatible = "spacemit,k3-inno-dp";
+            reg = <0x0 0xcac84000 0x0 0x4000>;
+            interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+            clock-names = "pxclk", "pll";
+            resets = <&syscon_apmu RESET_APMU_EDP0>;
+            phys = <&edp0_phy>;
+            phy-names = "dp";
+
+            edp0_phy: phy {
+                compatible = "spacemit,k3-inno-dp-phy";
+                #phy-cells = <0>;
+                #clock-cells = <0>;
+                clock-output-names = "edp0_pll_pxclk";
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&dpu0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0


