Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B14238179
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566320; cv=none; b=uFcS41jYBBnKW/qGA2hnZE172e3UTbXLWUg+3y4rEwQ9luAEa5EWt2lVdlBWdcV97TF/IifFY0tki5hHemPdswguuveR04asUVXiU1ygxYGTgM1Lvq+z/5YSYygPglG1fTtdtZ2rdzJOBRi4Zq9NOd21loAJct7I/ciuUL672Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566320; c=relaxed/simple;
	bh=9CKYbhGNwTYbDbUfruVG+2PT+6X9WHH0jTltm0XiPbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tVYcElQXqb6kEpm8HKOUn9rkLXvH6T9ARJ012zky3BPkt0QpAP7iYJE/2ezdL2g5jrtQGDCw8UOscc33VP2QGA1dC/SLL/e7xrvgcM74oLG9Y66HyuqigipkOzyjwVTMjCcE7dUgn4D79HIPstdBxEInZUxmBNhUp01V/58Z1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2141BA8;
	Wed, 26 Feb 2025 02:38:53 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 601753F6A8;
	Wed, 26 Feb 2025 02:38:35 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] clk: sunxi-ng: d1: Fix halved MMC frequency
Date: Wed, 26 Feb 2025 10:37:32 +0000
Message-Id: <20250226103734.1252013-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

as Kuba reported, on an Allwinner T113-s3 based board the SD card
performance is only half of what we expect: ~11 MB/s instead of the
usual 23 MB/s.
Looking at our MMC mod clock definition, this seems to be due to a
missing fixed (and hidden) divider of 2, a "feature" of every other
Allwinner SoC from the last 10 years.

Patch 2/2 changes the MMC mod clock definition to carry this post_div
of 2, in line with the A64, H6, A100, and H616 SoCs.
Since the D1 clock driver describes clock parents using an array of
pointers, we need to use a new macro that allows both parent_data and
post_div to be specified. This is also needed by the new A523 clocks,
so I lifted the patch from there[1]. Chen-Yu reviewed that one already,
but I made some changes to make the macro more flexible, so I dropped
his tag.

I couldn't test this on a D1 board, so I'd be grateful if someone could
confirm that the SD card performance is now as expected. I simply used
"hdparm -t" to get a ballpark number of read performance, but any other
benchmark or even a timed file copy should do.

Thanks to Kuba for the report!

Cheers,
Andre

[1]
https://lore.kernel.org/linux-sunxi/20250214125359.5204-1-andre.przywara@arm.com/T/#m9adaa1fcea09185c561f3fd01ba895fa67af456c

Andre Przywara (2):
  clk: sunxi-ng: mp: provide wrapper for setting feature flags
  clk: sunxi-ng: d1: Add missing divider for MMC mod clocks

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 43 ++++++++++++++++------------
 drivers/clk/sunxi-ng/ccu_mp.h        | 19 ++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

-- 
2.25.1

