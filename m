Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76756332623
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515707; cv=none; b=Bx2gEQx/1yGo7oSOeTF/XHN2Pz4C/moB+mBERHXB++iOFe1C2ieqfVbnkQ9Z17heaUteWajSr+zfa/Y+llWeAd1Vosl6cLE7FJ6KqfJvU69WNarWS5VvrEZ1qpP9m/kgJiUazVScM5Vr42LywBcEGLC+rKopoWYGMNd7dWBbk9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515707; c=relaxed/simple;
	bh=V+S8efAPt6FpBFGZabqJVST5GfnaijdGddD4QPNKHV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSgwGAjpDndUcsEyQwXBWeLfOg1Eqg0/JIeRIJhsfkxtD3+CHsoN/pw7Gosdj+lQpEhT2i4O6n+3gqS2QJzDKCX7Mqkde/Q6uWQ5dY9deynaiZCvcskD5IGKAltEJBeB6f4pOK6i6QIO5HIrFN4l40emQuvuKmrPLoO/XQZ2Cpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811771F000E9;
	Wed, 12 Aug 2026 06:21:44 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v7.3
Date: Wed, 12 Aug 2026 09:21:43 +0300
Message-ID: <20260812062143.1285702-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-7.3

for you to fetch changes up to da3abd0445245077a1ac45b97ee0a59f8d300d31:

  clk: at91: Read "reg" with helper (2026-08-12 09:02:57 +0300)

----------------------------------------------------------------
Microchip clock updates for v7.3

This update includes:
- use of_property_read_reg() instead of of_property_read_u8() to
  properly parse the reg DT property

----------------------------------------------------------------
Rob Herring (Arm) (1):
      clk: at91: Read "reg" with helper

 drivers/clk/at91/dt-compat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
