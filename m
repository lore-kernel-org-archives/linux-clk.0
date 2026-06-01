Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24541F0991
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314140; cv=none; b=uwtvfThZQiZ3IMJWRn3V9H7r+grKYHks2rKVDRoAtXiWN3xgNDIlE0cq7QMCB1DaBq9nRadlWhHJmCXVjx4xmNWodGJ9sLta6B/3X3bivda0yhSxPLAZoIyxhi5nansF8khr2DMyW4ti3JNbhnhStDyLEQ/p+CQlNTS6M2mqV2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314140; c=relaxed/simple;
	bh=BdNRVq2atRBZarTKl8e8ZcvM5PWuwjW3N5EwPhTTIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGeIqjbWtuxpYaRoeWlcQL1anVu4haEIeYs6prDJPV2gE/6WxZ6bdnl8eDr3+NuDX9DZa5czR1uXPRDSWhIlGkPncz2zVS0wVaBuH0vw0WV4VqfYPjC+zQgUZ0rO2st2YHir8rkNtSpFPoT/8n+IIorplPCLSxnAjG5WVUH5rLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AF21F00893;
	Mon,  1 Jun 2026 11:42:16 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock fixes for v7.1
Date: Mon,  1 Jun 2026 14:42:14 +0300
Message-ID: <20260601114214.2652969-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-7.1

for you to fetch changes up to 22fa1c39ba6fe726b547c877c924379b7fee260a:

  clk: at91: keep securam node alive while mapping it (2026-05-31 17:17:55 +0300)

----------------------------------------------------------------
Microchip clock fixes for v7.1

This update includes:
- fix the GMAC GCLK clock ID for the SAM9X7 SoC
- properly decrement the reference count of a struct device_node
  in pmc_register_ops() after it is no longer needed
- fix the MPFS peripheral driver registration failures by using the proper
  size and mapping for the output clocks array

----------------------------------------------------------------
Conor Dooley (1):
      clk: microchip: mpfs-ccc: fix peripheral driver registration failures after oob fix

Mihai Sain (1):
      clk: at91: sam9x7: Fix gmac_gclk clock definition

Yuho Choi (1):
      clk: at91: keep securam node alive while mapping it

 drivers/clk/at91/pmc.c               |  2 +-
 drivers/clk/at91/sam9x7.c            | 18 +++++++++---------
 drivers/clk/microchip/clk-mpfs-ccc.c | 15 ++++-----------
 3 files changed, 14 insertions(+), 21 deletions(-)
