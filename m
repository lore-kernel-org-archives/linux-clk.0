Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774103;
	b=H8LVZiEk1Y8SGLNWYf7jMI7/6dJn+ATgrMzd6hHluGQjG6LBPSDcFfuSeI+FSa7ceCAz
	 FM3XYhiFbFnshpSz0c7WRNrK1JihAMSsuQTZt7Cj4ID+tIWkog9Me+Er8dtgclKasv/g+
	 TECfOZSa9tMVXfzkn3GXcNo26jPidt8366lAdADJ0Jtb0m9d/s1L3b199gHknw7uHPrr0
	 5RZDv3XgHqYk51tcjqugeEG1KW+ZWMKjWIuaEF4GuAAneG54HDRTrd2Sr+4fBJGZgWGXw
	 uM5anJfZ3Pqxjqkv6zLinhoMNs2wFH6HHKx0OXXJla6d0xZrlnP7JnF9CBAT4ao0Bnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774103;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TeJd+vwhmTLCgDsuofMV5WXACzIkKKBVhaJxf8JRaIo=;
	b=cAMoVktGHmjXFkh2vOs28Tegz4x+6XYFv9rKQ51/v0fYpf6jedXPH0Fv2xQtjd28KVSn
	 pFEicMXVXXdD3JbwHB09OAYvr6a8jjgVNHZaGX8v/1hL8lXCSUJKntUJPqrxJDW1aknIJ
	 1DbzF1thPKKZPCRFGp5CUGb4PJYiddnPLW+9aazyxwMoGojJTdH7oehDaE/o3rgbJxL46
	 /vLZKD+ZAb/Sv+zdQyvrvVh5IhEvChBzRDukvWAo4mpg7lj8wp6aGQFC9kf1E1VjVAIp0
	 tNCAv4/hBLIqAYGn3reNpTVYaoA4BCKhx0gDCbTTTop+ylXoJHDfogUt9zw4FmofEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=uK5FUJ0u;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CC606A31E;
	Fri, 27 Nov 2026 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=uK5FUJ0u
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 112724C97C;
	Fri, 27 Nov 2026 21:08:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeJd+vwhmTLCgDsuofMV5WXACzIkKKBVhaJxf8JRaIo=;
	b=uK5FUJ0u0C2fHqW2Lyc3xF93LRwkRm3fAYhgg1ZC4HLOMYQrAQVoSIm08yOxUEyWXzq1NL
	JUx0eJ74BhY4X7ONCy4FcS6S16VOeoN9YRPQz4D4+6FwlGeKcywh7NsJD0aXeHRFBQsmrR
	UiIzzLguNCswXfFCCKNSDc9R7BFcjX/HdRpLW2lXYoHkPr3MMcs1zs/33MxB/gX9VEaJX4
	neq7ycZnVh6b0lVj2A6RzoTcrbVpy4CrHoF9rKAZlTig/SQB7rPNXHEILwZclKLB7hHcTb
	f26tbjl+aPxgKqEeC52+S2JInB3QLma8ucn1liDg4XibPexY8x6G10ZBozOLOA==
X-GPT-Reason: This is a legitimate technical communication, specifically
	a kernel patch or system driver update. The content is a professional
	software change request regarding "dt-bindings: phy" and "Allwinner A733," which
	aligns perfectly with the personal/professional mailbox of "alastair@d-silva.org." The
	sender identity (From: alastair@d-silva.org) matches the mailbox
	owner, there are no phishing indicators or marketing elements, and
	the lack of URLs is consistent with a standard git-style patch
	submission.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/6] dt-bindings: phy: allwinner,sun50i-a64-usb-phy: Add Allwinner A733
Date: Fri, 27 Nov 2026 21:08:03 +1100
Message-ID: <20261127100808.2292229-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
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

Add the Allwinner A733 (sun60i-a733) USB 2.0 PHY compatible string.

The A733 USB PHY requires the OTG/PHY register bus clock (bus) in addition
to the two PHY reference clocks.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..4892c1766182 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun20i-d1-usb-phy
           - allwinner,sun50i-a64-usb-phy
+          - allwinner,sun60i-a733-usb-phy
       - items:
           - enum:
               - allwinner,sun50i-a100-usb-phy
@@ -38,14 +39,18 @@ properties:
       - const: pmu1
 
   clocks:
+    minItems: 2
     items:
       - description: USB OTG PHY bus clock
       - description: USB Host 0 PHY bus clock
+      - description: USB OTG/PHY register bus clock
 
   clock-names:
+    minItems: 2
     items:
       - const: usb0_phy
       - const: usb1_phy
+      - const: bus
 
   resets:
     items:
@@ -84,6 +89,25 @@ required:
   - resets
   - reset-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-usb-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

