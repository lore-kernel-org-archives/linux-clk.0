Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F93FBEA4;
	Tue, 30 Jun 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815460; cv=none; b=ZZ72y5hnc3J7vFslUve+JnQBBF4Ih9gyJBvEv9owny6nJepW7o8ARZpucb6YVo3axNNKZPAW4zAJ93YvE3JcbyHXx9X8mA+B6LPuubDcUPWRYBCDK7WxJOvHd7wyXCfkAiivEo2EXVHbobi+be1t6qp9CMX64A/bz45Y9xFt4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815460; c=relaxed/simple;
	bh=JJ3DXx0+9/Twf4gIgSIEAk4wpZQ/p4+3k6sMmO3lMA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SAa1+cr+Cmh/6qo2E7RmMo4MHIZmp0/14oI+Ezy4fKXILqwdPDSt0qo2Dm3mdD7Bbw/MHA8D3FywmnWiApJjH1KdE+77o59V956aS7TxBRaPQdY6axPh20NJ9Z23NA/JgWFYLsR6kxHA+ZJ5GHEsfYnvu3IlnMKdPA1k0X5F1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=va+GMw/v; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="va+GMw/v"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A2476C5CD47;
	Tue, 30 Jun 2026 10:31:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B7FF6025A;
	Tue, 30 Jun 2026 10:30:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEF17106F1D67;
	Tue, 30 Jun 2026 12:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782815457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gFnxMac0C2ZvRteDcvpudUWk8CbVXxK8RjN63NAzpEw=;
	b=va+GMw/vvvNfy3fYjD6CDsIQ2Ctv8Lm40x3F8bi7jEFe5ASHv8T37oIwU2zXhQ5IIPMYQ+
	2LrOoWGPDlJnM4f0UgpUPa9q7bUkoEIEnkJL5oT+tVgq39gzHxmUrbISTBnRxZEP4GgXvD
	kFcisKlI1HtJiZtM3MxWvj1OKWwKj6XykiC0b39DHFJ6r8WuCZIg/eJiagD+8S3chVQI77
	bVI6lTr+GRM+gLaHpEFcbQ5AivOnjdArI19IK9DvUhvtUfmeOyiT07Ot11M7BXmO2FCVFh
	r5z/ksQlHu6d8GG4jsqRvffCQSEG78B/+jlB0XNOW5Yf+QrNLTi2ryeZ/1QW8A==
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v8 0/1] lan966x pci device: Add support for SFPs, clock dependency part
Date: Tue, 30 Jun 2026 12:30:49 +0200
Message-ID: <20260630103052.413750-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Previously, I sent a big picture series adding support for SFP ports
available on the LAN966x PCI device [0].

In this series patches touch several parts and sub-system in the kernel.
Reviews have be done and it makes sense to split the series and send
parts separately.

This current series is the extraction of a patch related to a clock
build dependency issues.

[0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes:

v7 -> v8
  v7: https://lore.kernel.org/all/20260511160128.34786-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1
  No other changes

v6 -> v7

  Rebase on top of v7.1-rc1

  - Patch 1
    No changes

Older iterations:
  Patches 18 in the big picture series
  https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Herve Codina (1):
  clk: lan966x: Add MCHP_LAN966X_PCI dependency

 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.54.0

