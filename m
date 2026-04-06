Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D964320A37;
	Mon,  6 Apr 2026 21:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512321; cv=none; b=NrrkBLRUHvwfFSX+N4w/EKYbGBsyRcanfxnsgqlw8QMVUpVKGWY1V+sEs++Z0pLthtiGKGQ+og8gI4sPE2ZLtBLkIyAJoW9HOBDDJi72KT1Nn4xHW9MAIRlBmHUYalQtXbv+ttAsYbbhXotaaE+ohiSLclWU6FAkeB0DP1psZec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512321; c=relaxed/simple;
	bh=FIz6OrwMx7DH7f5TC5b8SL0smMSBdDVKGKaXDl3V5Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCtFUhU8H36SoQTxn/hE4e0YAPlRlCim6ogcWSUNeP4J7iHrwydpMR31fsNQUBjodRGDYSx4k06Cyip7MiFJlH2LekM/EQPe7S48+MlrVBsZUTEePbbgUMREL/Kiz0jaOzIcEazTjnLV2C8plZeLgpUbSskiPt76/gUS1iNXVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=isWaPAI8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="isWaPAI8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4E23112DE8;
	Mon,  6 Apr 2026 23:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6E6Gsrvncngdf4YS3BtWn3ae07UX289+OQi1Ns6XGII=;
	b=isWaPAI8ylMlFBax3zI8Uv2UVfZd2sHJSomo7mYd34x/0xUQbGYa9gDsBkKvL4P+lbNkgT
	HYBC7kxqDY0GTvVi2I+FZzUmw8tsT4V8hyXeLK/bTULI+Otf45Y0cBNu6P5Yk90i7XbzdJ
	qKiOC59vUliIKL6Q3m+FPdFOsjRjECXHtmQS8ok00xuWrTykqlgevXjh1YbDcrMlPQhGb0
	6NlGPyfP7Tg1IagLQfeVQ5SeWmUqwrLRD0sArExB0eXmV9I4eY5853QuA8USFnbxx7HpLu
	nOozUV4xkxcKwD3NdF0sUHToe/6fNFOw4fD6LjJwbLm0FH3oA6Aen/DpjWKaOw==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: clock: fsl-sai: Document clock-cells = <1> support
Date: Mon,  6 Apr 2026 23:49:43 +0200
Message-ID: <20260406215150.176599-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406215150.176599-1-marex@nabladev.com>
References: <20260406215150.176599-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The driver now supports generation of both BCLK and MCLK, document
support for #clock-cells = <0> for legacy case and #clock-cells = <1>
for the new case which can differentiate between BCLK and MCLK.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: Update commit message, align it with the bindings one
V3: - Rebase on current next, update mail address
    - Pick ancient AB from Conor, although this may be outdated
      https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-3-marex@denx.de/
V4: No change
---
 Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
index 90799b3b505ee..041a63fa2d2b0 100644
--- a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michael Walle <michael@walle.cc>
 
 description: |
-  It is possible to use the BCLK pin of a SAI module as a generic
+  It is possible to use the BCLK or MCLK pin of a SAI module as a generic
   clock output. Some SoC are very constrained in their pin multiplexer
   configuration. E.g. pins can only be changed in groups. For example, on
   the LS1028A SoC you can only enable SAIs in pairs. If you use only one SAI,
@@ -47,7 +47,7 @@ properties:
       - const: mclk1
 
   '#clock-cells':
-    const: 0
+    maximum: 1
 
 allOf:
   - if:
-- 
2.53.0

