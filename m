Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C115E8B;
	Sun, 23 Nov 2025 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763923901; cv=none; b=ESJ74rEzn1L4EXOhulvrzdE972BUsDhXBGBE9XdHNnoB2QxFIxh7hzILasjOuFkC3yoo2VYCcSHB60qND1ExU6ZAIr97niBslRFPf5iKqPM/diHbLxlBrDGfTKOUCuKx7ldPX0hcgVgKeP5Pa/ZSWAYUugqJ3Mj/OikNgSqOy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763923901; c=relaxed/simple;
	bh=66xhuIcUEKc1uvrbtQ3Fkp5B/yESTaZtUfYPJ0i7RGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDCFDAI5WMjKFRyXLHSUg5AU0xVO/xt5qGn3lKbF6pBERAfS38GCHjD1RQGhLf5Ec4i+g+1fPC3HX1erB17YidJaz07UVmxeeaT+6EQVTUJfOk82y2yr3wBB5KgFX7rvI5Uxmzc1KmW0aFKZuIDzS/XNumhLJtsHUvRoIR09X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjQ2CYVK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjQ2CYVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3C2C113D0;
	Sun, 23 Nov 2025 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763923901;
	bh=66xhuIcUEKc1uvrbtQ3Fkp5B/yESTaZtUfYPJ0i7RGg=;
	h=From:To:Cc:Subject:Date:From;
	b=LjQ2CYVK7Axatb7Fu+NJwq0XBQzf47YT11HrngpTaU+CX53LChnKg42ikjwRxKas4
	 oH+fEB0h8Bev3LxAPaP/GqDajsHoolH2l4g9W8ZdlbNPRbY1BmiN2fPNM9jd7rt9XO
	 UqHwmKOL5VfWd+q4cxOl+PLvwu+cstVWeukEdiom2ra5HiLY9SueitKL6H0vuMZ7jM
	 qUemDxGjlNHeS/MvZPrLK4GHFc/7eVVA+E9jLbqnmffN621tBc+/a3LKwKJlzf9CBw
	 35IFeBx6Wdq/bASmZQ5YwiJJHV+/Cav5hiygbjlEf6PTCR34DE9sm9ug9MDAGqZlKc
	 /BGOd0nYuYfsw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v6.18-rc6
Date: Sun, 23 Nov 2025 10:51:38 -0800
Message-ID: <20251123185139.1058099-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 3c493b524ffdb3fae7f0d9dc6b887359ce13cd34:

  Merge tag 'sunxi-clk-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2025-11-19 10:59:21 -0700)

----------------------------------------------------------------
Fixes for the Allwinner clk driver:

 - Lower the minimum rate for the A523 audio PLL to support
   frequencies required by audio devices
 - Mark a couple clks critical on A523 so that Linux doesn't turn
   them off when they're used by other code like TF-A

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
      clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate

Jernej Skrabec (1):
      clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical

Stephen Boyd (1):
      Merge tag 'sunxi-clk-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 4 ++--
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
