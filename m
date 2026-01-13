Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790BD38F25B
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307360; cv=none; b=Lki7kkUS9Wqt9wpoCdrnJvCKUN5Q2sLY/gTefuR4EkwdsPj6fLAG3BefAhiZDfPP2dZvcRN5OUp1u33pJ0sHUQVVtRxFJRihqCyh7SsLiIAiv06kjDG1e3ZHnvTn3ckrrXeTojwlgb2v3jK5d/X3Wd5jinM9fOY8Dsk+QyWTSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307360; c=relaxed/simple;
	bh=4WgVDe//8rzPFp5NLDlYjUTWk2AW45EZT2LONWqoBa8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f9nEGVZWboua1A89agkRMs8P45+6sHl6VblYZnjYYhY46cQLkRN8F+bkS4oqPCNn3SyzV6APPjZ7HQ1QS34zE1+izto4j1kVNxW05yRlLyYzR8jZzBWkPc3Re1mMPcQZd9WNr5teZwvp+PzFklR51Y0Y4I4Bqsk8spzOFaZOxJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfdWG-000338-9Y; Tue, 13 Jan 2026 13:29:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Date: Tue, 13 Jan 2026 13:29:05 +0100
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJE6ZmkC/x3MwQqDMAwA0F+RnA2YRsrYr4wdJEs1WGppRQTx3
 y07vsu7oGoxrfDuLih6WLUtNVDfgSxTmhXt1wxucH4gYjw80gv3LZugxBVDmSThnHOM6APxyOJ
 4FIY25KLBzv/++d73Ax3QSVxtAAAA
X-Change-ID: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi,

this adds two new PLL frequencies for the i.MX FRACN GPLL.

Patch-1 was previously part of [1]. The new version of [1] will drop the
the patch which is now part of this patchset.
 
[1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/

Regard,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

 drivers/clk/imx/clk-fracn-gppll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

