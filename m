Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43333332629;
	Wed, 11 Mar 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241581; cv=none; b=NKWlO2Q41uHZ1d7QR8rEAkCN64glPjS0rCAILcgvLkZ94wUV8YlBea8rgANUk6sIDVvISekgfdjfMhUUEG8/YF6txlolL7IbDvB2p01EYw1Rg+n+l0mgCLTinpZY7m2Kb+wwMjEhX/xV+d+uJQ54P52QbwhTDOY3NH9b3K++i04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241581; c=relaxed/simple;
	bh=FzNu4vgGuUrtD9XTpj5mbDMz6UOnaXf9tGIx7qaU2qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kC+UuJCjH0tVh2Yudxhp/xbOGq9Hqzd1eJZkeNmGKaOhrXyfzOrjqUbaC7mhahQo3UW8xrn3Xt4Uc4NlKEoOsHVGsRf+nV3LoIhF0VQ/alk3Yv0s2qcafmx8SmcBTKlShbh69otm6xMnJ8Ppx7t+z3Wv9pYCWVldJBWeYk0aRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5847EC4CEF7;
	Wed, 11 Mar 2026 15:06:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/2] clk: rs9: Fix and of_clk_hw_onecell_get() conversion
Date: Wed, 11 Mar 2026 16:06:09 +0100
Message-ID: <cover.1773241119.git.geert+renesas@glider.be>
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

Thanks for your comments!

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
