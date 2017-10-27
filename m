Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:51359 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752503AbdJ0PJ1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Oct 2017 11:09:27 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 04/10] dt-bindings: simplefb-sunxi: add pipelines for DE2
Date: Fri, 27 Oct 2017 23:06:52 +0800
Message-Id: <20171027150658.18509-5-icenowy@aosc.io>
In-Reply-To: <20171027150658.18509-1-icenowy@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As we're going to add simplefb support for Allwinner SoCs with DE2, add
suitable pipeline strings in the device tree binding.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Adds Rob's ACK.

 .../devicetree/bindings/display/simple-framebuffer-sunxi.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
index a9168ae6946c..d693b8dc9a62 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
@@ -15,6 +15,10 @@ Required properties:
   "de_be1-lcd1"
   "de_be0-lcd0-hdmi"
   "de_be1-lcd1-hdmi"
+  "mixer0-lcd0"
+  "mixer0-lcd0-hdmi"
+  "mixer1-lcd1-hdmi"
+  "mixer1-lcd1-tve"
 
 Example:
 
-- 
2.13.6

