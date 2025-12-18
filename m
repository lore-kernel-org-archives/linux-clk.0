Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877471E32D6
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071317; cv=pass; b=gZw8C4hMpTYNToE37ihWHfsOoP5HkQH+akpSecBjqHFOvAE6V1f9gNE6c3aLgf1JJFWW1S91s8B42nejRvtLTv2kTospXmel5M7Oqor68FBo226gO6dWyiHbmj/3mWWixhel8i4RR6x9C7I5pSDR5VRfOp/2sYCUb0OX4xybskM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071317; c=relaxed/simple;
	bh=HFFh/0R1q/dM407ncnP63bQTvfvE8hZuOCGo9ES6MnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRLFVsKGsdoF5kPIK8SqPsPKco7qygAJiDKXEF2nkc/fCGZCVhLtC8YVE57ipWGAHdYBi82Cmm66+J90YwLkZZzfgMVgCm7kvp5v2ePvZOuORdpwbPfOgfEFCkMtRH55UB7OVXUUOkvYPfPtL6OCNoHWARsTokFF4LQR3ySHbQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lyYKQcXa; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lyYKQcXa"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071285;
 b=EGOxrtphoQQqcmqBQyzVf/16E0NrC7Z3kLpf+uu2nbE5NqWEcLjVKFbLr5EVFumfvzYgpoyp
 OUnRG+j1Vp+3TWzfoqIo7Adzza7N+W5/C8rrRvXGZwsF1sxGwcYDSZa3u1Dh5ncV24ZnASfqlY/
 fPXyuvc5HaILXfB0Oj4w+FseHk/7kgd7qgRDmMThb9Usgj+lcUwSJww3R5Vv9mXCHZil0wrHDU2
 RKrt2Nx5hMfu6N4SgBoZ64LBwZ59FqtARVHhDlrsXruPHodExpdj5awQX3aMh7iXnG9uaWX/dvQ
 Ek6LWmZczzAs84wTtZAtIxEGcCa+htoym0dp0Yx0iB4/A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071285;
 b=iFqzZCTq87rJ+DIA46Crpp4EHBuUA14NkvV2lhcumIHxLfLS1Zt7h78lG7i90cxPXybJ9dek
 BmoXYb5Qn9U6lGU+1lkIsMPhKuK3QQtilnVfkbJbsA+4T2laxXZnWDbMNdc1LvitpCtcmQWEWoJ
 Jzpt87T47dEjVi2KA6QTMVe3tnmuWXvz1AjWu5qDge/+daaG+zCrO2nQuI0Fuw8sGiss2KkRv48
 iP0qh75oGwS9sTs2U8QJYEd9IC2i09Yv0NswKv0bV4icUTa+TalgexB6QcAA6VI/AnF4oL/Kn2T
 NFzgwhthy9SIIZJZ5wuaiXxkbSyNtviTEyjrXJ5ssijpg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C1E2ECC0CC7;
	Thu, 18 Dec 2025 16:21:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Thu, 18 Dec 2025 16:20:48 +0100
Message-ID: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDry6fRMz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:79e50b13dc320d875aa9306a79dc5026
X-cloud-security:scantime:2.032
DKIM-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071285; v=1;
 b=lyYKQcXaqT+iXlG6nm28eylVNVrjTQ84n3HXMFB/lC/7yvQuiCSi6prCKihjOi3FNU4Wky1Y
 x2/fphwNcCDAklfgPBPwabj4PedQdI70rq8rznXWMR3wyJX7D7hx0l3CgnbkAOw3Qu4vbHaJb7A
 xfstsfeWaKE1bKjTrfiyXSg+8e1/CwHhUkLsgQYnY39aveQ4VvPOuZ0NW2nIczi9b8ZzdrG5jcU
 KhoDfB0eebq1Mex3d5n4B7sXHMQtrm8TsL7hnoKdJP3MeFfV7/m/wb9oiwdRwFWZWZrbFBdG3ds
 3yJMs2GBnyTY3+WCS+Gsax2p4J47KY+q+/vGt0smx146Q==

Add "clock-output-names" which is a standard property for clock
providers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/clock/renesas,9series.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..5590f04147612 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -52,6 +52,10 @@ properties:
     items:
       - description: XTal input clock
 
+  clock-output-names:
+    minItems: 1
+    maxItems: 8
+
   renesas,out-amplitude-microvolt:
     enum: [ 600000, 700000, 800000, 900000 ]
     description: Output clock signal amplitude
@@ -83,6 +87,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0241
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0441
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0841
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 8
+
 examples:
   - |
     /* 25MHz reference crystal */
@@ -101,6 +137,7 @@ examples:
             compatible = "renesas,9fgv0241";
             reg = <0x6a>;
             #clock-cells = <1>;
+            clock-output-names = "DIF0";
 
             clocks = <&ref25m>;
 
-- 
2.43.0

