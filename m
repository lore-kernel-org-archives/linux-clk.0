Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59118892D
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239057; cv=none; b=tse5CYLSVNUnjHi4yX49dWJSApDsYJbskFDyV5VGhXnDeI+PpeRA90kIus1ygr/HvM7hdpAUBJyZKYIesdX67HPaPSO+jzJhZ8IBqr+ARlEUphi+/qt1NER3ZlZCZRJuJrGa9rx56N+6lMfdilpeYhbf/jK5nlqnlhwg1n3BAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239057; c=relaxed/simple;
	bh=576Z3BdIFkrUpPRj2zAupcaLoZyj+oKEt767R9W6uYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2F4SjaFil4h3VnL7K0sHKttiXej09OiCo0Q/FOypSHwtMgjZA7hqcLo9P3oJPQfivVVeWdBxGetGw7MPTFYMRbpTESOW7H0879+WJVwvzLH9ALXdgLjvEjorpN3Prlbg/PMmu3JburSyYpkHD4aHTTrcDVYYyfI8Od2eyZ41O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by albert.telenet-ops.be with cmsmtp
	id y8dW2D00U3AZZFy068dWCD; Tue, 07 Jan 2025 09:37:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV55b-00000008ZYn-0Ray;
	Tue, 07 Jan 2025 09:37:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV55e-00000004lLB-2iLH;
	Tue, 07 Jan 2025 09:37:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard
Date: Tue,  7 Jan 2025 09:37:29 +0100
Message-ID: <34953d1e9f472e4f29533ed06cf092dd3c0d1178.1736238939.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing "RENESAS" part to the include guard.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.14.

 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
index 67774eafad06268c..4cc8fc34b23ca336 100644
--- a/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
+++ b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
@@ -2,12 +2,12 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
-#ifndef __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
-#define __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__
 
 #define VBATTB_XC		0
 #define VBATTB_XBYP		1
 #define VBATTB_MUX		2
 #define VBATTB_VBATTCLK		3
 
-#endif /* __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__ */
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__ */
-- 
2.43.0

