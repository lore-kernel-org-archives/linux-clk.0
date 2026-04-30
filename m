Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B052D595B;
	Thu, 30 Apr 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562422; cv=none; b=iL4Kbveu7ewwwP3o0kg2cF8kczAJb/GqNxFAPquX2TDGzgoFCB6GFTQHI6CXJca5kANodwVR+too4+2jTMEdKV5HvixcM4y4K2E977EBSgYjreIP/xZIiVxcSYJse4qzKgfB8J/qZcIEWQa2MCS8zCY3o5udCLnpDyi0FLr3gJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562422; c=relaxed/simple;
	bh=qpK0mizsNpJjfbUHu3dMOFBMrZpjwfoJQfsB1MNKvxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxLDngvE8x2Al6jqfGPbCr+PtsjHvZiW3Lg6b63OU+A+4vvfjpxVZE23i2Ar+0FGuOjiehMP4JUsl3A4QYeKc4XowyQwePKKBvKpbKRdY28rmnc/yFkYevQX0yzrzv78banLTgmXRd6SeiDSgFYBiVLKqR/l9C17pcdkMCILI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336D9C2BCB3;
	Thu, 30 Apr 2026 15:20:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Miscellaneous fixes and cleanups
Date: Thu, 30 Apr 2026 17:20:15 +0200
Message-ID: <cover.1777562043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This boring patch series contains a few fixes and cleanups for Renesas
clock drivers.

I intend to queue these in renesas-clk for v7.2.
Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: cpg-mssr: Add number of clock cells check
  clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_MUX_FLAGS()
  clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endisable()

 drivers/clk/renesas/renesas-cpg-mssr.c |  3 +++
 drivers/clk/renesas/rzg2l-cpg.c        | 16 +++++++---------
 drivers/clk/renesas/rzg2l-cpg.h        | 13 +++++--------
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
