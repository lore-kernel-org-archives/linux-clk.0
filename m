Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAA5172FC
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750367; cv=none; b=bXrz4eFmRf/13qkpm46afIo2kF4z5ty85PUjFPCY3i/A9T6GWUrMgHDHOUhFaveSug8BggnMUoQxCMo5nNQ77cZekcaQfXGbVzql7H7TYYGhKDvuCfN+dqpw2XUogjyohUFPeBt1FFFI+m5El07Qh4PtOkOM0tzWrsZyV3ADYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750367; c=relaxed/simple;
	bh=ut9bu0ogvOe3LaZe7HaU4YRdS8uXZFfbEqCnduNcrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1jrR4acc8U+YQ4iatq9KdBW7JR6iYtiQpNnVoiOU2rzPu/Xt8d1Kc8Y1WV+y048M5P7pAtTrYwgz5PYPIgHHttT62NQuRIPFpjqKtARFxM7OtCh+nLmL62LEeXeU3e8p2LNB/OBqWct0YZG2I5J4WL2q6t57QxPzE3F/SIMozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E5JVYXGu; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E5JVYXGu"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadea0so63505685a.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750359; x=1790355159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=E5JVYXGu57Y/67BCAKxRz5yPwLfPxcgv6/MZt99eSldvuFl7BWxiWIO1RE4Y69QTK9
         UajLCGadRl40RX3VDBkonBYkX1Em3iai0tdjS8rNdfyYc/lXfOmGWqlfL/M10Eq/SePg
         y5L8zT7xvcKX1WcRIQRzukr/w3kx4nHxUNBmr2C9l/jF2D5dkPHGakBzVRPICV5jA9Wd
         wM7s1h03hHoPUrcTuQiNnb6q5+uBqCR07Oexy15x/Osz/3e478tMvJwJDjc6CB0T00RQ
         OkJcK1rjwlLDARKkNzi1/PYoGzdwg3TXYg42fVoPcZfZHl/7XAG2Nse/MIiSTXTbnCar
         wB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750359; x=1790355159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=xB86RvQYZF8dmfHagIN0AHDS/gUO8TqOC7LBP6orCclo3NMDwhXmgCV9cYh984T4//
         51DWqCsa6wQJgyR/1eCCfch7eqDV/Cxz2ZOz+vpiAxJp3n5Wm4bKPwvj4c0MBh5rTIrH
         Jqb1MPb/9NKKO8AqdQmtRoxXzoWbpgB4pX/Pc/pwL+Qx8STa8zoLZx9YnxidB+Gm31ZV
         scac7uEDHEwRWW4pHRlcJkUvteZr5CNvKoM9o7YEGRCbrgmlxsnwIaudulZnwecO9Omw
         Mukd+53h6rr1zaBC4aBh6rVqQBvSsoaspTXcyApm/FP1cTToI8Q52aCcD9/VWz1xYsoj
         D7Sw==
X-Forwarded-Encrypted: i=1; AKwUvBy3MLpxZNl8HDVRfSVWnHNSnyqhGxWYsRZqg69hnC/MpOpVJIA0Xg/xkqMjlk6DrYN0dI6a/6rcji4=@vger.kernel.org
X-Gm-Message-State: AFuF++k239cqY6NO3Nk4TG9hsfPQfwiB8mVDIzgkJaf1YVJZHfzllMbS
	iVFTqkb7peDpWsUBwOLXeWGCyjGzJjHvZVtQ4S9pLPBZLyUMxiz7/fjsxMkKNlHWqis=
X-Gm-Gg: AYBFou0uoNVjkj3BBaL/+Sp0aXwORD/+uSqcitmmR/gb38XaZKwDc+CSfVwpgr/ikwv
	22krsPMwjzf5uc/lL6CAzLzXXNNfHIOzPwlasvfGChl+daHCY+i1z9yAyyg1QFbIgqd60YMicQb
	ZjxJiPlPB+4+Qf2dMy8Vt1PDdRJjl4OqYBnIdm9dNePR5brXsHwEJ2H/5zgqXO1Ve9AV+kISQhg
	u6X8Oic6vjSIADPjnepGu3qMD7lxKJIUDG2bQfCRQjqUjty0n9sXPA2drerJgds7rHYk//5JeU0
	HGwPNc9x++AJ2tUVK6ZH25mS8BK/rKMZKLij0urOq+V+Qjp9S6cBCKiGq3xyZLx0zCwzEzuz4HG
	Go3UlRiqKhWfRPVxITLV3PJLVaa4YYez+kSgCuW799Su41CoCIGntX/BSNWQ7knH/hr++61WR0J
	/s/gDmU8eIrzkZmI3l3ajwBKKjihTfLiZkZBw/N0kHvWn9RP2FRdP1H19UrWUM8KdVyGtSZysqk
	8I=
X-Received: by 2002:a05:620a:4103:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93bdca3fb9cmr469299485a.73.1789750359512;
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Date: Fri, 18 Sep 2026 11:52:30 -0500
Message-ID: <20260918165234.687224-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for a system controller used in the Toshiba
TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml

diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
new file mode 100644
index 0000000000000..32e73a727c82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 System Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch includes
+  an embedded PCIe endpoint on one of its downstream ports that provides
+  access to various SoC peripherals (including a clock and reset controller)
+  via one of its BARs.  A system controller provides managed access to the
+  first two pages of this memory region to ensure accesses made by these
+  peripherals produce well-defined results.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-config
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "toshiba,tc9564-config",
+                     "syscon",
+                     "simple-mfd";
+        reg = <0x0 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf846853fdc79..b2d3257b8f892 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27674,6 +27674,7 @@ TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
-- 
2.53.0

