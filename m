Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258751;
	b=MNQXR74bzalTKAwYYHPHPeVwWDxpfFYOkwQbnxymBtE/1V2T9PUjCpsQ80ause2h8cRw
	 rx4Mhc8tZKk8qjUJEpmkc+QGkA3PNh3lTV9fiblS4Ui2TL8YWkdulywlxFOFMIOWnLSE9
	 jROCqM3OR3htQPXGRv1Lpek291+ldpJ434ok4PeMu7Fne+rH3w3IsRVRXWnznaknuC6K3
	 mA+as69kVupRCh79YEzMKv2pnN+Fx/o2G6zjUBdCB0Gbusqak+gk6Yg2pG7P2dJfcFQEW
	 ugcpP/KhXAe9KehxYs0rM9FBuXxcpUXcHCAJOztr+Zbs4IAWN4VOPav4kzM4AwBEbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258751;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aGX/622BLcEUD7STQZB7h5g1EsoIPpXceYZcwodljQ8=;
	b=PkMTHQKftb099mpsrkanc1+EABafQX+weTReGRXuK+CUOGYFOCpazQ08n2dI2L1gdvpK
	 3cFW3ppU9KL5dh5Wv3De2kL/WSCHSqMIc1K0f8z6HPIyOZebHwO20+2uEt8WtTMnyCpxj
	 WE+K3A4avvFS+YmrPeWKCLklmd/TRpNv1sqoxNu+zFgjxwD6EXrdXOEBeFXBhIz1x6ZDZ
	 6n8wRRmk0AvH3Ep0yK2fqoehSyOqRSid+R+wXIHZLV8xvJi9p6b8Nh+wZFhgIRr9+ZVDX
	 J+H8Na7YdX0u80C0hDmYoShrFx1KhVgNU6+3XGsOUc3JCj9AVm2920RtL9J9SXKWWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ApvIgA7p;
	arc=none smtp.remote-ip=43.163.128.52
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898D606A682
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3898D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ApvIgA7p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795258741; bh=aGX/622BLcEUD7STQZB7h5g1EsoIPpXceYZcwodljQ8=;
	h=From:To:Cc:Subject:Date;
	b=ApvIgA7pRlHLWlCD61Cqsgkd1XAu21U6HEpfnhJ3n0zf/dTorZroIBa5n3cX1JCDD
	 Mde57uPNmsgTcAdwAiPp2OUWcgoPPPUI8pSSZlbJZDFk1+5qr8tXJaqHndMPQ9hVv5
	 H05mYMOjSbjcMAWtQ1gxkzGnDTXPOVIIFDptYHIQ=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id EBA89487; Sat, 21 Nov 2026 18:58:58 +0800
X-QQ-mid: xmsmtpt1795258738tog0ojgbw
Message-ID: <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLgVnKCHPq4TJMLrJsypE6Qo40ozViJR71TS3Rr5PZXax0WLYJQQ
	 wsN5lH0sfI2ww8GsJuYP9MvREmVdkYFAYUqAVidf7DH03HXepozXc936IqEVlUbtupVL6VKLPec5
	 3BanyHHL0/2FebIvbA9kdpq48WBDXST5bhNxhhhesJaOctePRELF/c+2AQdt3h2935RqDXTiVEID
	 0rmiaRFlUOGkbCBjcOdOPxrR4Pir59L6HkLD1H7D76gnG5KwCOyAv0hQnoLMyQxkd/E0WcZ/5+SO
	 jKcJvfv2xPT6ZAOq0IfbCRUOCaqmT8hDSfnf2pTEFjXCpGVginVmooJ9pzU0pHZcMcKsk4Np++A+
	 e4fuNgy+TgE/9y0bo2mgVgkHz/FeOc6vy0GKhjmCwwOUW4oT3gNZV2snV7JdnuYQibcFh51lI/Th
	 QkWwvIhZiV2PDl9ng5mFjMU+6qVHNd+mHnhQv8Z1+RCH/8nyZcIhwL7NeNo44kNb1LeWmSgKA1Rx
	 Z9Em4smSvdi5433IyQ/90/DbmtQrOZiYvl2a7A4XtNrORy2CTdV4cwUptnSVBJngHUq7k0YpqroZ
	 hmNM3pibG3Sdy88O0I/c/6yDOCbI+Gq28F7ujWNdbnP+eVDi9RwQhF2X5VxaidcS1BLYD7q6i/0r
	 q2Dv8+k2zr+PhKDRZlyd819/CmGB6BCFdA2XAd7wrjy3aF1qT+JBZuMXXMxF8RIYH484Z/nOEExr
	 I/2lSb+kOl+5/cjGn4LZjp8Tiyiejb9I+JA1aGzwxyX5z7UI3zquOL5osFvpyYQhEySzuxT8zuJv
	 Z5d9skrCWYe887mEyzyXZmvNvBoF6CKsbBg3XnfOZSZJ7tV69OTL2KQmVofUVv49IuJltlkDC9v+
	 JTCriJh4nMySdRt6RpQf0wZefXtS7YsP2dEV0URzJjRR7E7gGP+5RDFJoP6DnIkYKiYrtABkd6f2
	 eZ4oW7xPouEx6Wz+OINGD2Bulif2Bi6mvt86KBO7wNTrWYlSRMnLUcu7bKuQCSqA9CDOKYSHT2CH
	 c5xgphM6oz59GlQZ1wZV9OwkBSlxUPg8C3IrSxPQkYzj/FvyFyqI+rkMsQDjHmO+7SvotBX+Jtzd
	 aiA/Qp74516r3YWs2lLaW1XdMjSMPbwsAM6GlKJDW/wgD3DXLCzaF8uEolug34RCaMNIFq
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] dt-bindings: clock: rockchip: add clk-out
Date: Sat, 21 Nov 2026 18:58:55 +0800
X-OQ-MSGID: <20261121105856.1414984-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
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

Document the Rockchip clock output/input switch, a single GRF-
controlled gate used for signals such as the SAI MCLK output.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/clock/rockchip,clk-out.yaml      | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
new file mode 100644
index 00000000..bf2a9b8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,clk-out.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Clock Output/Input Switch
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  Some Rockchip SoCs route a clock between an internal clock and a pin
+  through a GRF bit, for example the SAI MCLK input/output switch. This
+  driver exposes that single bit as a gate clock.
+
+properties:
+  compatible:
+    const: rockchip,clk-out
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+    description: Parent clock.
+
+  power-domains:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  rockchip,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Bit position of the output enable in the register.
+
+  rockchip,bit-set-to-disable:
+    type: boolean
+    description: |
+      By default the clock is enabled by setting the bit at
+      rockchip,bit-shift. When this property is present the polarity is
+      inverted: setting the bit disables the clock and clearing it
+      enables the clock.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - clock-output-names
+  - rockchip,bit-shift
+
+additionalProperties: false
+
+examples:
+  - |
+    clkout_parent: clock {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <12288000>;
+    };
+
+    clkout: clock@ff910004 {
+        compatible = "rockchip,clk-out";
+        reg = <0xff910004 0x4>;
+        clocks = <&clkout_parent>;
+        #clock-cells = <0>;
+        clock-output-names = "mclk_sai0_to_io";
+        rockchip,bit-shift = <8>;
+    };
+
+    audio-codec {
+        clocks = <&clkout>;
+        clock-names = "mclk";
+    };
+
+...
-- 
2.47.3

