Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369E274B3B;
	Thu,  9 Apr 2026 00:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694601; cv=none; b=Ui7x+IYXsy3o+00ZBzyVUKl263I5NzL3u9WX5EDrskczbFhXtlZ0cOrAy+XioG9tnytPaqaeQJTBOfYb66mWn4fjbp2wpIc026siFYOCWE8f0zlSJtwnTSsKOMIkuLp7VLC9kyz1BwhmxoLAkCuVnek3uk/sWk/JU6HwMBE1ZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694601; c=relaxed/simple;
	bh=/bA8h8VCRzRlY+PK4K5F7wze2y5aI+zwlBf5wX0l3To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsOGl2mKmhn4O4mWaevg+uFRF5s88xDheFNc3x5X80ncuh4SjoZNXnk16hVw4qEJViLkghLLqkN7PrpMXc6065ckVa3L1Z/85kOPMsR1Go2aT1KBj6xoNHcZzlsrPUwkmEEzvImzaobi+uMU1J+S3diU73HQbi9am2JW6NtMZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Yipgui56; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Yipgui56"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FB3511352B;
	Thu,  9 Apr 2026 02:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775694598; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RV61ZuVoCv9Zajh6Xz/gdgIF2UVvq07B2ECMNlovnIw=;
	b=Yipgui56YbLjnvo3Y98V8hxpINSZwgd2MNB4vl+5ZnXCFYiRq5nHVaLE+rV8kZhlEzOsOj
	XN7WDrYYLub3TNQKbrx7Yc2Yewy2QXTI2cDyhHTRPjVLwbbMOUe+zX8pM40NGHCun3bvQ6
	AOi/pMraJgnxhmDxUvgclLaaAqXYL3adlfj35/e5Bsab1E44Zu/u6FsPGe9i4/im0tuN7J
	BE+FqzGxnGMRkFYfr2FNAPuXQiXaXKBGfh0Fi9mJ9eahrFgZyR/dkLsv0nnrEnVCD026SV
	9ZLP3Bqi2lzhgbaDWLMhIbBrQDEm6vVOi8UHbePMsfc7qnJhtQ7PoG8MLEXTCQ==
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
Subject: [PATCH v6 4/6] dt-bindings: clock: fsl-sai: Document clock-cells = <1> support
Date: Thu,  9 Apr 2026 02:29:04 +0200
Message-ID: <20260409002952.319668-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409002952.319668-1-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com>
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
V5: No change
V6: No change
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

