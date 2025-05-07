Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985B79E1
	for <linux-clk@vger.kernel.org>; Wed,  7 May 2025 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746581434; cv=none; b=Hn2sLg0ik7z0jx0BuYfbq+aNHM7xQtBIG4aw9aSoEtuYU9hZajjjC9bqz9HhuAPOqvIAFpOqbe9gSBY90xyGhBhGyCOQf5bEta+cmJ0insmqU80F7u2gzaz8snsNvOBoxivArdOwwX7j/Ulus3y/qNHNHdKuZgzGgrwkYvg/ook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746581434; c=relaxed/simple;
	bh=AsN22ZC9eVLTahW9dvWLvSrrKmagGwlHGKm25vHhaig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3aGshCBDPDP1eL/8T5jiD0vW7m5kF+OgtH1rB6PT5+lwzF+z8Z2cMHD631FRJwZdT6OHYWsU1lLaztsBlIU2E49NGTugl28jranJxvBxDx96C+rafe6zroxa74cp5cK12f+rI8THOuwnlZFaBmj04t1GOsyN1tU9pVfKr/+1bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I348o7Fv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I348o7Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4622BC4CEE4;
	Wed,  7 May 2025 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746581433;
	bh=AsN22ZC9eVLTahW9dvWLvSrrKmagGwlHGKm25vHhaig=;
	h=From:To:Cc:Subject:Date:From;
	b=I348o7FvujHRK1rxW8LNP3PVjc8hC/tw/g20JUXYslt5pE+CPneD5wWt1S9s0x4c5
	 2JXGUVV1I213fv+A+agdgqfBmAaSKqGQkpMsEmYB6s7O0V3pRSjJRKjxEa4vvvXgGY
	 8tFi2oDiz2i9BZ5zgPgjLjP7MvOb973Ah1u5x41jzD1GV23xhHTmlclqPp3lJQFy3p
	 kuxSx52jV5pleLh0dot1f/9naem5GD85o03EQ7L7nZlsu8IfW4DpkNXIcHIKijWs0a
	 raBfpgWpB3UoYUAjQry4w1vdiwmFEDX5+bI506rYdv+yQJgue3rWIEi90zYvBhXUBc
	 y6yjthlXiJjfg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: socfpga: update for v6.16, version 2
Date: Tue,  6 May 2025 20:30:30 -0500
Message-ID: <20250507013030.217818-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_clk_updates_for_6.16_v2

for you to fetch changes up to 0248bfb2557932b27d3e1375a3dc6902127b42bc:

  clk: socfpga: stratix10: Optimize local variables (2025-04-24 17:38:07 -0500)

----------------------------------------------------------------
SoCFPGA Clock updates for v6.16, version 2
- Optimize local variables for clocks

----------------------------------------------------------------
Thorsten Blum (2):
      clk: socfpga: clk-pll: Optimize local variables
      clk: socfpga: stratix10: Optimize local variables

 drivers/clk/socfpga/clk-pll-s10.c | 6 +++---
 drivers/clk/socfpga/clk-pll.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
