Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF0280CF8
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281318; cv=none; b=jWnGqlI6/PzdITA9SD+3v42WdfIH5n27FhlfJs402WK2t1sul8ORahrvzoC/FdBbLMZSmaSfZ2qzCQPZy2EvJctS8SV1RJ0okIrc5KeUNuuzy5Wyzh/wp885mjHY4cOynJ8gxWretbm9VqsnzHv7RSswBj8hzVbXho29u2fDTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281318; c=relaxed/simple;
	bh=P6qo8qAHeJPS2kB9aX7XoqA5Cr9gFdS6Ku0Dtv4Opmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CtrrTq1bsQ8YlgBnMFvwQRVWiS2H7GyTe1JbXb/p/uCYbuLIdlFdhP+6xNYeLnNz67y6fr4MeONMs7MRGR9xDKy2XgLsGPqI96nDmyua0EgCwDGlpEYOYwSu21qmN42Qt2XkCt0sRCmqRtyB2rWncK6cqUdfndEVNACDG7UIios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFS-0004gX-AB; Thu, 10 Apr 2025 12:35:06 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFR-004Fts-2i;
	Thu, 10 Apr 2025 12:35:05 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u2pFR-002dX6-2R;
	Thu, 10 Apr 2025 12:35:05 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 0/3] clk: add support for TI CDCE6214
Date: Thu, 10 Apr 2025 12:34:55 +0200
Message-Id: <20250410-clk-cdce6214-v3-0-d73cf9ff3d80@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+e92cC/3XMQQ6CMBCF4auQrq2ZDoWKK+9hXNB2gEYDpMUGQ
 7i7hZXRuPxf8r6FBfKOAjtnC/MUXXBDnyI/ZMx0dd8SdzY1Q8ACJJy4edy5sYZKFJKDURJkbg2
 WiqXL6Klx885db6k7F6bBv3Y9im39A0XBgWsrSUGFdSWay0h9+5z80Lv5aIltWsRPofoSMAkSN
 BZaIZLRP8K6rm+XZG+I7wAAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744281305; l=2029;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=P6qo8qAHeJPS2kB9aX7XoqA5Cr9gFdS6Ku0Dtv4Opmo=;
 b=vu/q6ZvKaYA3RqE6e56y1bzkcwgb8VnZhbbrsRAIxkJ4OMuuBSC00Pb0b2uf04jdyL0AW6xsB
 HkrUCF8HgMIChe/9s/p6sWgLckWfvBEWyMgTt7Jsgvs+JvlgwELMkkR
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
Differential Outputs, Two Inputs, and Internal EEPROM.

This series adds a common clk framework driver for this chip along with
the dt-bindings document and a small fix needed for the common clk
framework.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v3:
- Use string properties instead of int for enums
- Use units from property-units in dtschema
- Link to v2: https://lore.kernel.org/r/20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de

Changes in v2:
- Use consistent quotes in binding document
- make clock-names an enum to make each clock fully optional
- drop '|' in binding description where not needed
- encode clock input mode into integer
- encode clock output mode into integer
- do not use defines for reg properties
- support setting load capacity for the oscillator via device tree
- support setting Bias current for the oscillator via device tree
- support setting polarities of CMOS outputs via device tree
- fix compatible string in driver
- remove unused struct cdce6214_config
- Link to v1: https://lore.kernel.org/r/20250408-clk-cdce6214-v1-0-bd4e7092a91f@pengutronix.de

---
Sascha Hauer (3):
      clk: make determine_rate optional for non reparenting clocks
      dt-bindings: clock: add TI CDCE6214 binding
      clk: add TI CDCE6214 clock driver

 .../devicetree/bindings/clock/ti,cdce6214.yaml     |  155 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-cdce6214.c                         | 1311 ++++++++++++++++++++
 drivers/clk/clk.c                                  |    3 +-
 include/dt-bindings/clock/ti,cdce6214.h            |   24 +
 6 files changed, 1500 insertions(+), 1 deletion(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-clk-cdce6214-0c74043dc267

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

