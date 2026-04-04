Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BCA2EA171;
	Sat,  4 Apr 2026 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775327671; cv=none; b=m1g4saP0dR8Z9eSNbdrLNw7gwfyQHmKo2phCatQQEzv3epYn28sRI5DgZEgGRPBnqzZgDW44V6+HrtDGAZ8eylAXuJ/qV27+o7J40+adci2uo8UyI8QHGs+q+j9VXxk1L615JORIG4LzJyl8/Vt8XGoXe0+XSwYmqC71OeYg0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775327671; c=relaxed/simple;
	bh=9UXmx+bnFYnkdAOiu70n/EKLk3Ai+lYEdGetuMTVUiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6pg6o+kCAb52i+QnJ+4K2lEbzblSBXElEALoLZE4P86h6bTIZkE8pGrPiG7EpSESlvyw9jlBdZLEj/rhOeNL3qL1EJ7fxD9FyuUSs/uHGr0gLffQ832EpJQDetEM1rfHiPKJhaoniZlmDa/XlBbxjJiuw99OdD2Ja52eVDhGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LM0XKDJ7; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="LM0XKDJ7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA0701131E3;
	Sat,  4 Apr 2026 20:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775327668; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=upOuofT5vg2HL9zWl6ryNNlQ+czBTk177uDuGZbmJwY=;
	b=LM0XKDJ7ZiMwrneekcA/QdWc9BopSU83ucmk6Ejz0XwrVvq62p3A08g1cKIxy/vTrwp1Km
	rRKMvwOLJVl1FIc89f2L37CMMZrOUN5rTQpSbrHgm6nr6lxKaal6ABnTtbu1E6JGJHD0e9
	NgEJDf7sMQAXPq0pZ41vIQffkHaxV4CvyVR5gK967tEUS2Mhfa4T9ee6tl/aKvl/D54PKF
	VxxoKKtaUX3UFsSeNZ1b8NwZDtrNI4mH9Htp2s3fMk7sKtDRxF8VOz4zwlSIGiz4bfVUkl
	4y8co1PmryH00WMROARPgKUQ4eaEQbf3J0y72/pYwWQJxsheSbPUn6sR94Hd4w==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: clock: fsl-sai: Document clock-cells = <1> support
Date: Sat,  4 Apr 2026 20:33:27 +0200
Message-ID: <20260404183419.46455-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404183419.46455-1-marex@nabladev.com>
References: <20260404183419.46455-1-marex@nabladev.com>
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

