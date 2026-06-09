Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04E3793C3
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990987; cv=none; b=prSV6Ol8ADgj0S2lMbhkwc9QP92o7sF8bun36n9zI67zEyEdtYB8pFVgnnW3RHsjzKfBhNryjeY9/LWzJ4/GJ0SbFBW6BdWDtW1U9uTO1tOnbRGVCsZavFttLScf9USRYex6QIzNb20O29ztGNaQVbFackkkQsiBtka/MX4kkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990987; c=relaxed/simple;
	bh=1IAHozZBWgnrz3VCaVdm7bBxSuL59z7Vk5Ps2ByqWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0WiLAqCXSNmlKYkyD1/inOi1bkJLw73AiKKYUSvCRKu4sGNZadZQGsVcPVbUiB5P4Y5//BPohxQDsP1lme++ApM20co1mqjpGZl2+NjjGaG3/N7pwUDLJdS/OztuwnsxGblEqqd5cWl6/2S+rUmMEmV43dl7OKvCcg7zFi3ovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BBE1F00893;
	Tue,  9 Jun 2026 07:43:03 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v7.2
Date: Tue,  9 Jun 2026 10:43:02 +0300
Message-ID: <20260609074302.814617-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-7.2

for you to fetch changes up to 871cb269cd43b5d90f4e59d1458f8c09204759d4:

  clk: at91: sama7d65: add peripheral clock for I3C (2026-05-25 22:53:10 +0300)

----------------------------------------------------------------
Microchip clock updates for v7.2

This update includes:
- PIC32:
-- Rename the clk-core.c Microchip clock driver to clk-pic32.c to
   better reflect its usage.

- AT91:
-- Remove peripheral clock ID 67 (GMAC TSU) for the SAM9X7 SoC, as it
   does not exist according to the documentation.
-- Rename the macb_clk peripheral clock to gmac_clk to match the
   documentation.
-- Add the I3C clock for the SAMA7D65 SoC.

----------------------------------------------------------------
Conor Dooley (1):
      clk: microchip: rename clk-core to clk-pic32

Durai Manickam KR (1):
      clk: at91: sama7d65: add peripheral clock for I3C

Mihai Sain (2):
      clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
      clk: at91: sam9x7: Rename macb0_clk to gmac_clk

 drivers/clk/at91/sam9x7.c                         | 3 +--
 drivers/clk/at91/sama7d65.c                       | 1 +
 drivers/clk/microchip/Makefile                    | 2 +-
 drivers/clk/microchip/{clk-core.c => clk-pic32.c} | 2 +-
 drivers/clk/microchip/{clk-core.h => clk-pic32.h} | 0
 drivers/clk/microchip/clk-pic32mzda.c             | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/clk/microchip/{clk-core.c => clk-pic32.c} (99%)
 rename drivers/clk/microchip/{clk-core.h => clk-pic32.h} (100%)
