Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678761E7C2E
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782057235; cv=none; b=aGxUSJ4Irg5I1N1SDCs0egxxF4SqG5isHulkc6qTZ4Nd0QQtvZiTWubxxlin1h/cLe4ndZ7IgaDlni/jdDPky+uba2KSP28CcWf7YAsg04RUaBpBD63QjH9sNf9Xrwr4mjeBLmXmpngqXdXcHJVWnCM/YAHJfP8oDKoN8t7B7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782057235; c=relaxed/simple;
	bh=zqnwCyvJE3P6oV2ZzE6OJ2FfBeXwMfD9eQ+Z6yA8vtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jMUJ+TiN3NgAc11xnT5Lx3QYyD312z58pmnqfb2WGBuT9wI+db7hJBsXymlF2E8SS5cDBINWEWzYax8w+SuxrCNJfd/0i/mlfgJZXvMlXK0dUYl613cFBo6NFnCgK9BmTopdEUz0/wG8Bs2+Es9l3bDoFnJrmWtni9CXI1w4nZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5u+3BMx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5u+3BMx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8422a816c89so468549b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782057233; x=1782662033; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfqUJIOT7B/Bx7wyPrZcM1KMHHklJXD/KZwpRhMyOUY=;
        b=q5u+3BMxEFuVGH1o2N6bN0gytVpy3wOQmJ1wmv7jiBvB1zZEMJb7vT7ERhPXkjcc0O
         mTOajNQ2u2msXQC+E6ef98gR/iCrPIjhgYsnJtJDmXjoBpYMJ9j2zg9HiEOwK5Cu/W4y
         R2azMc3EKwAfBe6rAJUzstGziPvYR7bDiD7jhDR009qOnVJvfbyEctjGC/kDhqd1DhEd
         qtHeyZ4KJ+yAIYxzVk3cdjX3EH8XQmfKH5WW4tWPARIEG7MCOL2V3CyBr/42y+HO9ua+
         6Aa0It2lzKMgQR8OTNrLT5O5G1HfLOG8OOewqhFJfqLWcEpktYc5X35ezQEqEiFtnYaF
         wl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782057233; x=1782662033;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfqUJIOT7B/Bx7wyPrZcM1KMHHklJXD/KZwpRhMyOUY=;
        b=cbCnJRwT5Yb6z3g4SrF60OxaKZomkmI5zeT9VAOmL1R4ShpIHz0q88ZkYUNaQ5vx6G
         /zQfgU6WvchdmKtxnzJtA05lXLf942AnxRofxil7kVMldwlye0NrO5I81T0F2gAfimKh
         vg5pDg1k0yNf24UIv8nqhd5Jo7wH8W6sorMmlwt6SFSwubvhZzdqRcjD1Qgn1nMasS7U
         elKBt2hkY6MV0uZeqsKncHq7WjZPx2zN0yx1kNgSwJ+7IjZI/TDhZw/AZ7rhaz1M7gwX
         Q5uhmUcXAg+gfVDPN2CDZ/16jD4iN3hmzcGoNYTQv9mfrVvHeT4gDzA4bNZ894bZemYX
         8+Pg==
X-Gm-Message-State: AOJu0YxEBBaUdGZMfXWF8jRzwWO/q//0x+M0yoBB4pxAGNYDSJGHa4PJ
	P3Usryz8FuNCWdBwD/wanXGRmyM2dckXq2DuCmdga0fBHHYeMkaUbbyd
X-Gm-Gg: AfdE7cmC50/Jo/tgNPoL+0bWDPDMBSbMT1xkvh5ItEEEtRkq8LYFGeCYsn03TkxZJAv
	x/v+USF5oSKwxWmH2ZClgxee0tHE7+CT6keDtnDBwV2d4lhX1LFgEBdx5HujcKIhl9LRaF8O+mU
	HXpMDSdv//WXp+GrOAgBPAFjJVXWTcR6Z6oNFXaLCEVTEcpk/RnMnNLVb4NfC5v5AQp2/xwDGUt
	WKOpVAkdfQu3JrW2OMxgtQO32n3L5rYDjWqIyu/hRZDAQFCrRUE3jsJYSnJNFBPq22tW09ywRQa
	tFiJturDwv4Wb/V9cH5SZhUDBkPqs+woNDou8thA3T8li7N7S4weBdfctXBXKyIZ+YAhLKihHU4
	8T5CwARE9Z53dH8LOdohjbaNk+6rDT7Z7Jt3IESTQHFPAkXTY/hi8mgdOisAM1jcKbAiLFRnZI2
	jhoZGhec4UYE+ex6gsW18=
X-Received: by 2002:a05:6a20:4304:b0:3b4:b258:cdb6 with SMTP id adf61e73a8af0-3bb34c77713mr5439519637.6.1782057232560;
        Sun, 21 Jun 2026 08:53:52 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881f:a6e1:3dce:e376:b231:e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea7e22sm5511434b3a.42.2026.06.21.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 08:53:52 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 21 Jun 2026 21:23:35 +0530
Subject: [PATCH] dt-bindings: clock: ti,clockdomain: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBNUqKCrRIvBmWqoNDQiEO+et
 HyL/zMkjsIJxiZD5EeSBF9h2gbchn5lJVQNVtte90arW5Q7gtspnCheoR2I9IIGqYMaXZEXef/
 hNJfyAZSndbpgAAAA
X-Change-ID: 20260610-ti-clockdomain-a27dd0fa1ad5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782057227; l=3294;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=zqnwCyvJE3P6oV2ZzE6OJ2FfBeXwMfD9eQ+Z6yA8vtQ=;
 b=hy33dBy5eFhI2atsL0DkBm5ge5pszYJpOOBYHgQ/WEYV4U9Vo9t0c1HAGeC4LMofmOrMFkPrs
 2CFKcVLDXspDJfqvB4QMUgDzT/fLxgLhmwAOLXPq0UrgqqsGHX7Ghkl
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
required list as this binding doesn't define a new clock binding type,
it is used to group existing clock nodes under hardware hierarchy. Most
existing dts omit '#clock-cells'.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 -------------
 .../bindings/clock/ti/ti,clockdomain.yaml          | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
deleted file mode 100644
index edf0b5d42768..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Binding for Texas Instruments clockdomain.
-
-This binding uses the common clock binding[1] in consumer role.
-Every clock on TI SoC belongs to one clockdomain, but software
-only needs this information for specific clocks which require
-their parent clockdomain to be controlled when the clock is
-enabled/disabled. This binding doesn't define a new clock
-binding type, it is used to group existing clock nodes under
-hardware hierarchy.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,clockdomain"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of clocks within this domain
-
-Optional properties:
-- clock-output-names : from common clock binding.
-
-Examples:
-	dss_clkdm: dss_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
new file mode 100644
index 000000000000..9494cbb1a942
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments clockdomain
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  This binding uses the common clock binding in consumer role. Every clock on TI
+  SoC belongs to one clockdomain, but software only needs this information for
+  specific clocks which require their parent clockdomain to be controlled when
+  the clock is enabled/disabled. This binding doesn't define a new clock binding
+  type, it is used to group existing clock nodes under hardware hierarchy.
+
+properties:
+  compatible:
+    const: ti,clockdomain
+
+  "#clock-cells":
+    const: 0
+
+  clocks: true
+
+  clock-output-names: true
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dss_clkdm {
+        compatible = "ti,clockdomain";
+        clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
+    };

---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-ti-clockdomain-a27dd0fa1ad5

Best regards,
-- 
Bhargav

