Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF8426680
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515282; cv=none; b=TNWOuPRogm22Z/PnOwBnxB4oIRgVWXFQXNkGo3ORXBAFA0S05c5sIRS3Y8gFVM339TgJTFCI5EdaayKMqgdJpR+Fsfqw9GBvaNMY14FfOUhaSf6wGeJWI7jIA1CsQuEAnqsJYiSQPC+jVIqalevi4Kqls1F/PKBiKwy4asW5jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515282; c=relaxed/simple;
	bh=ZaR3Okq+2s2Np8wkDtpHrIEgdLLFYTA6sznZ81NREBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dN22Ie8m/0F8H/1uyKAqp95yr1Ngco0pH+WphStH7egm58IOlinF8rZDV+EAovJfgO8uAt3xLWeEHWS+/n1VgnKSXzfuHHPKZ14QK6Mv/77f516bGRFj5Sp3DkO5/oqq9QRxuhDmveoxgk9hfOQgzzDEsmGgZPdcLKWKbVpp8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iTXtf1OI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iTXtf1OI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 722481A1DD5;
	Mon, 11 May 2026 16:01:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47B5060646;
	Mon, 11 May 2026 16:01:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AB2511AF9ED5;
	Mon, 11 May 2026 18:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8wwnEr4E6ErCNBSatPbGyq4FU6v9HeDDxzhNKNaPjNw=;
	b=iTXtf1OIqX/6/0fL7VGqwS1KgM2gSbZjGW+Itm0WhLKYx14bOFwaEfuPCwPAAnlPclyDCm
	zK3VCYyweSXNu6bjOSB8SK2hRIS2TeIiSbO5DVppYAoHdCrc4hsEs5x3Aiw7cbWEZpWOVO
	mcjKoFePsQShzNweVpj4W6rrbmAg2qEt5trcyoHX6rhTAmAZOBIHdAxwtaWdY8ZXT0Wb+2
	D+5fdqnVXqPjUO+f33w9rU7BmRn7xdvKHmAdQiWhfQTstuqAHVV2s4NFZeApgrU7RipXZX
	e9gqcZUPKpcIr72GDX++tFVCQR2TdUlg/WdGeF/1MKbhf9d3m7FqxbAFMDblsw==
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v7 0/1] lan966x pci device: Add support for SFPs, clock dependency part
Date: Mon, 11 May 2026 18:01:11 +0200
Message-ID: <20260511160113.34755-1-herve.codina@bootlin.com>
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

v6 -> v7

  Rebase on top v7.1-rc1

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

