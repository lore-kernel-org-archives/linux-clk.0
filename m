Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F3EEC0;
	Sun, 26 Apr 2026 17:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777225052; cv=none; b=DOY3Ta4g1cSc4GfIS2nr8HpkYXDkZfr7nLgC2QEz8O1REisFcBdXs5nDABxm5eYUf1zCP43SLSdCnvq8P2eaExeQQFDqyzTyU1DBo2cCMH3tu1Tuow15sib7rMTRdCyQxCGZGwqrGsdncmj+5lXXNstJzbl7yYuXjFOpwQAGDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777225052; c=relaxed/simple;
	bh=hpG5hQEcoiBkes7VnQm0yc83iaCYVUAAZ5+qLfSy+7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KuYdN8EGoEuWc2+Au1pBggHEka2a9qAZll3pV62yUGpzFsQz4fZHK19eZN9pqN2sEIy81CEjQ6U2Jp9y6cmt5Vu3lVRq6pa/Ic4wYTOxrPznHMmtw5ODDGRSsYu8A5Mno0rcFWSy0/8HaiRdK9h8amPPianPBvhLlM1rTIObqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVhqv8/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVhqv8/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7022C2BCAF;
	Sun, 26 Apr 2026 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777225051;
	bh=hpG5hQEcoiBkes7VnQm0yc83iaCYVUAAZ5+qLfSy+7I=;
	h=From:To:Cc:Subject:Date:From;
	b=cVhqv8/Uz7sGucixw0UuahMVmzBEa9v39j/ZtbsmACduM/69nD04ZrGT1uyiFY5rF
	 DcLTmLRUPlR+SKdyIW0+qTkUhwXe8u8UG3q9GeqgNrf5ySlQ8clCLJ9i7tcMhvVlwT
	 MLV08DItK2b/uXGwpg/NrDEej0M1FhVbj/7wOyjN95ihAIIS2eLrIXrbP2/wc41k2a
	 qeYk3JOyysQr5h6u+2RCacuUFmFqqeRiMjUDPHfXlXM79HjpnnuiChSIEDDQCU3kyd
	 LDguNuwdG/al7zRlUR2VQ7rYup9+PELbYhyiDZ/EB63YZQP8SNkfP8ZDNaJypqA6OA
	 tQJP0ms+SX8eg==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] One more clk change for the merge window
Date: Sun, 26 Apr 2026 10:37:29 -0700
Message-ID: <20260426173730.2296370-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6b701fde9b31f085f39fc2a371cb33212fab6f68:

  Merge branches 'clk-samsung', 'clk-qcom', 'clk-round', 'clk-sai' and 'clk-cleanup' into clk-next (2026-04-16 10:12:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 522567362b634015ca85b5460482ee0843feb105:

  clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED (2026-04-25 10:51:23 -0700)

----------------------------------------------------------------
One more fix for the merge window to avoid a boot hang on
Raspberry Pi 3B by marking the VEC clk critical so it doesn't get
turned off and hang the bus.

----------------------------------------------------------------
Maíra Canal (1):
      clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED

 drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
