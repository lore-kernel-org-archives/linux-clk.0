Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8747ECC7;
	Thu,  3 Sep 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430179; cv=none; b=ivUFkGWDDXaXWjb6kXxpwISuvOt+Cki6apHvC0m6J8PgpWktnpdFM2AmE8OduSlb2ZrEwPtWELw9S4h8tVvDKgInzBkVCZTnrJm43qmyd+kLTWPx5SObm/wM/eDohO8li9vhQQCa7ll+yg1tf8LfvUpeUUH5JMkra2+5vyc3Vxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430179; c=relaxed/simple;
	bh=eHyxEDveUJTvMpfggET9Bhsf8fTbZi9UqhWy1h+Oekw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftFH8/BbDXrDQZdc8IALhMI7y2cM0MuyPhfaqGn3k9piZuGGVTgOBDMc3vD75qVEMcrrbf53zRBe2OsmcdzIcyptUg+tJOZQGBNw/lJ3W7dATUr8jOgfJAaZ8QsC8FtCp9drW0VLj5s2Mck2/8OhSXae7/NLyRMW3itsNHBtXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DB51F000E9;
	Thu,  3 Sep 2026 10:09:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 0/2] clk: rs9: Fix and of_clk_hw_onecell_get() conversion
Date: Thu,  3 Sep 2026 12:09:24 +0200
Message-ID: <cover.1788429994.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains a fix and further development for the Renesas
9-series PCIe clock generator driver, which were submitted before as
separate patches  As the fix hasn't been picked up yet, and the further
development depends on the fix, I am resending them as a series.

Changes compared to v4[1]:
  - Add Reviewed-by.

Thanks for your comments!

[1] "[PATCH v4 0/2] clk: rs9: Fix and of_clk_hw_onecell_get() conversion"
    https://lore.kernel.org/r/cover.1773241119.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  clk: rs9: Add clock index range check to rs9_of_clk_get()
  clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()

 drivers/clk/clk-renesas-pcie.c | 39 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
