Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38D1272E56
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027252; cv=none; b=Cf5q/NDqAekVM+k2KA38YYBmGIabXblDAhUuNsw3czGb4e1h5P+R6BKBBQbirZwRfV6oeEP4+qaQgCR520YSMEsWu3oANKW1gGKxCJLQTcHAUXuj+RFxepX2at2ttkppx6gPw7a45GFVVAlIph0ERssRxbyCmGHNQV2sjSbgEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027252; c=relaxed/simple;
	bh=J1TWtwjyathQVzLOqlPAy45y/P9JtYt8NSeJ7wfuJ1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4CFcYTiyCiwN3ROjD/eriPS0eORCGrgamTg8U7QgH+o0jB4tXZp+I/S6x4CR0s70wYKNV3U2uzKYjMy4K8ii4L7FrcBGp/cumiX9rJgRTg2hc1MQ/0YTHackfHYGq8kWyplcJUy3gpZeWnG03kzjHpZUldoYVy2Ba4nBPNZ3yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJKpm2Zt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJKpm2Zt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-834f1075805so1099685b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027251; x=1779632051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=HJKpm2ZtmV1pwI86ClhB00RBHacTqccJ2b9+GtobSqeuzT1tjQZQuQB+UFw/FkFusg
         JLSUrNg/5akI6zeuhNq+xjSk4HcPNkSR3hPOdFVCOwErRdnWJK4cxNXE3HaFo0AAf2ln
         eRxp1NoOmtX1fYMib3CS/Qgm2HqbfJjoXN+2mzdfoq4YOYQ1F/rLUCPwPqhN+Y1gyqQ5
         MUI7loOYn9skbTOE8F3A2US2hyvM1LW0iZD3zsKdY7DRS3uhYo60a8bWMcOdpz+69jr0
         ZAzlX1h5SlYfNAXm54J3OQ+zOV5Wtj6yVX3Epoq47V9CWhzXAVBlIlyXgVGEWbR4Kuu9
         HcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027251; x=1779632051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=H5rF5cRiw3Dw5o4oLGejWtiv2Fmf4AM2RzRcunRZwu0xgBtDDTp1bLUzsxvvSAG63C
         Vh3fqmZrmpC9SqjgKiORIXWd5GL4+xgZXySpa5VuN/pyLUYFT+neAtpY/D/nxnnSjGF0
         DTOSMDJ138Lp/SF8dnXl8DWAba47IToNLcYPGtlLxlQp08o2eAVnc96sTtySWDmBRAzj
         aialhtI35wjIuuNiBekQ6YcaHznDUK2SK8I5qSApsGlnkZD8CSdg/++54Kz3El3X5ERV
         t3lfVNss34Rl8j40LbA5winN9w83Ano3+qwM5VeirhfDzrUMJpvnAXj1MUf1SHNPhlig
         y0yg==
X-Forwarded-Encrypted: i=1; AFNElJ+Nbm8R2OBDYRbtaP2qUBvsnY2puISoUm2hqsFDuwV2uK/zwrFQ6vsPXhi2nkxrFv7vczxtwW4vqEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3fgdk2QIlnYnMRy2FIkRWzc17pNBubxapB+GjsTQygWG1PTo
	YvgRrbqlUeocVrr6ooAOfT97U4bgJMqQNOkFRV2po9Ftcwo2cfzJY1AD
X-Gm-Gg: Acq92OGuPkEXyvB5Hq6Pqgz9CM7CY7XlXT3qH4jqAkofUH8giB5Oobq9UV7IvSZCU7/
	rW7ZcoPhPQijnSECMv59y1KwgA3E7dwrcxMnP5oZAtMsvcXpuX3uRd5HVdDBjnWvKvnx5Q/61cT
	e5opVFhWe1hL2IIc+UhYk2te0lmJBb0a22M/7rKqQ+YI7LyWai+5AsNqCqoNFz191Sq/xpV2IEg
	RG3zD/kxuZ0HOEQYjuJqbhpSHz89P4C41XQR0rBgOHf1x0GpbqPsck4aRzSJ/ptOarb8BJ97l6h
	Qozq36gT/EoyIGT3f5bEQudz+7vWD1BCV0XMdylIAj3HCpwqqaRA41WOOy+cQCCMRAHlsBu6R9J
	cg0e7zI+PIjp8z6sfxQmb4GoaTUJa+U1LTorkxfqCRiFh3/WQ8g4HPjHO0uX43awiAgMZpgALkW
	blatBcYbxtagSMQu9LaPgu2lu/VCnP
X-Received: by 2002:a05:6a00:a221:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83f33d9dc56mr11055934b3a.30.1779027251056;
        Sun, 17 May 2026 07:14:11 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:57 +0800
Subject: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Add a binding doc for the top clock and reset module found on Siflower
SF21 SoCs. This block provides the main PLLs, high-level clock
controls, and some reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..a013d48841f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks and resets are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin25m
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    / {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        xin25m: clock-25000000 {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&xin25m>;
+            clock-names = "xin25m";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };

-- 
2.54.0

