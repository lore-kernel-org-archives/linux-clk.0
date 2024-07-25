Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55AA6AD7;
	Thu, 25 Jul 2024 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901361; cv=none; b=ZYPQvXSAmFjmy3tjUQ+5WV+Lo5FYyqwgIj45KomkUwzjLraSPnEjBTaIa2Q1PzZga/l54zGPsnCKyuPlSgjpUjzaCMI0cWSKNDLCP4qjHrLMEDWvNOcw5rE3wG6FMAYc/bgRzbMUp2BEO1h/+a6xdi9Aqt+vIy0L8RMlxN7IqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901361; c=relaxed/simple;
	bh=TPiAY9Ko7XFN5uc5iQYLbnea9o2qm1P5Jv/Qi5qs39o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U18NL4PPrOVrNZMskUWj8pWTAc/P7Uusznq4XIw0HwXB36+d0CQ04JccJ0sRIhMt9tim+U8kYum4tjuZ/h4jBCU9tINsjNNcRa7COLP5PotGNF/wR2dP42dx7+5/TXK5BuXGBWeDC9o4N8SzjiyAvEFLNkfgCC7Aj/zvUx1f/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216707515"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 18:55:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4AAE84000C79;
	Thu, 25 Jul 2024 18:55:53 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V2 3/6] dt-bindings: clock: renesas: Document RZ/G2M v3.0 (r8a774a3) clock
Date: Thu, 25 Jul 2024 10:55:27 +0100
Message-Id: <20240725095530.5199-4-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
References: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
Pulse Generator driver. The r8a774a3 cpg is similar to the r8a774a1 cpg
however, it lacks some modules such as the FCPCI.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v1 resend->v2:
* Updated the commit description detailing the difference between the
  r9a774a3 cpg and the r8a774a1 cpg.
v1->v1 resend:
* No change.
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 084259d30232..77ce3615c65a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -31,6 +31,7 @@ properties:
       - renesas,r8a7745-cpg-mssr  # RZ/G1E
       - renesas,r8a77470-cpg-mssr # RZ/G1C
       - renesas,r8a774a1-cpg-mssr # RZ/G2M
+      - renesas,r8a774a3-cpg-mssr # RZ/G2M v3.0
       - renesas,r8a774b1-cpg-mssr # RZ/G2N
       - renesas,r8a774c0-cpg-mssr # RZ/G2E
       - renesas,r8a774e1-cpg-mssr # RZ/G2H
-- 
2.34.1

