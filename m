Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6A1F4611;
	Thu, 22 Jan 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086907; cv=none; b=DzhbBf3kR4i6ERxtI8n2Jc/9sOuE5Px5aJY8jxIaDK+39jMkY+XFAe5F4Z9cwkK8jUW6osoy7LxjBV0OuHbnL7PtwfwkSFZNx23AJAgEeFIQ8kr/4wx940Bwe7XHVzEpAhOOP4ttc1b/HkjxJ44VxSvPDhBi0YYDGMw75CWLO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086907; c=relaxed/simple;
	bh=jR9cLPDLfPw7p5+20RCKu5iKiJsotvJuM8XhwT6hWcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Iw5GsTZ8wASv73RRA8HDmF+FqDcJGomUyyTpM2Xe7jM/HtslCG+ByE+ZZH5sxdp1dEBcdA/dL7UPIORSCA4Tn91NzU8pWGNrn2LrQKu/Pjr1wr4HWYamWnelvTTgtgXBrxJ+0rFf2wEUFHemH6zq/YcUC8CKnhOpjC+KuFXjmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NfOoJwje; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NfOoJwje"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C64CB10D75D;
	Thu, 22 Jan 2026 14:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769086899; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XaOCDpAR29PtBiruM7d2TP2PDQpRGAd9xik7mTkDre4=;
	b=NfOoJwjeRFnjwF5TU/DS8bspQmX2XefDEcZjItmzDxUDGkdIkYc1acJQpdYZGHaIp2lmRQ
	5oPaYdgs8LTPdfKU5xrDTlCwfVGKjTtqBOlIirqyCjCFBLY3gJY2lY6NeETKdgVNhCB88H
	ptmjsjCHTn10bHR2lfvnzBhbAiVJOcUuGGvGcRoEzBwXcnVDlAet7kwYa5yBV+OyTA67Pd
	VrSsj/m8Vo/EAPxBTKrhpf5wB575jhZi/JAW8Vpa85pXD3ICB4aaVAUTqSVM/MwnBNN0Qs
	ueFLipu4GiyI2WcDH4ib9BbBENC8hxxU9N1bxJ0/YjxDJgAhHh4JqNFi8L+mcw==
From: Lukasz Majewski <lukma@nabladev.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
Date: Thu, 22 Jan 2026 13:58:38 +0100
Message-Id: <20260122125838.4144700-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
macros definitions for L2 switch.

Those definitions describe clocks for MoreThanIP switch IP block;
the switch itself and the MAC address lookup table clocks.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
 include/dt-bindings/clock/vf610-clock.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 373644e46747..b6f7b1745cc2 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,6 +197,11 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
+#define VF610_CLK_ESW			191
+#define VF610_CLK_ESW_MAC_TAB0		192
+#define VF610_CLK_ESW_MAC_TAB1		193
+#define VF610_CLK_ESW_MAC_TAB2		194
+#define VF610_CLK_ESW_MAC_TAB3		195
+#define VF610_CLK_END			196
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5

