Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53973262A6;
	Sat, 13 Jun 2026 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781392282; cv=none; b=PJ+bU7FjSLtG4Z9msc2W5LOtzFs0zSNNTOvK7AWSbyEoqEtjXRB6US1l2eSJcl2/gO2cnGRFW/xf8jHfVz60yuhxfV5GUhNes26OXm7eRDAkzOMgjqB+117+6S5PVEqTb68eOzd6sBv55/LYEGiBwSY8r7lJCT8Fn+Z9qZKqQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781392282; c=relaxed/simple;
	bh=JwQhPoVopWjcWyaznIvzwwvt/99VUmD/Pw9N0k5JlPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zl31IszjaFX2e39QmyUmhIfT2HRWu1EaXvXYnRoe54l/tSept/xrCv5tIhz0/1L5oheoE4VDpKzv4Mlbj3Vz4n8uLzMy+jTkHxJYRvYsBmMZ3UG7jJWJt4f0Bw4bpPfCXfVe/CsX/F+af9LRZsdbvihmS7UUxikjpJQqFLFEjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6hzActJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6hzActJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ACB1F000E9;
	Sat, 13 Jun 2026 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781392280;
	bh=4FW6CkGtIfZsQcks011C6mEDGD5Nwd1UA/6WZSsi0DY=;
	h=From:To:Cc:Subject:Date;
	b=U6hzActJQ79BfmWTkv08JZu5gMG3hQHm613RI9AGZOgKLIUILTLScoqj19bLioqJA
	 m5ZRHkK1fFNCrX17bHSTOH9mYaLGTWo6U50ngJbIa7FZqtHQPGmtqLvSglhytkin9I
	 lvgZOJdhKoIh4RX5i4UJLjSd+YHerxTs/ys8HgY8AN7vSAt1BVEzTPG4OzPy5Gk1ZA
	 hnOjQR46xKE4g+6tCZXI3qsnFpKhjwXLzUX61dsNLQj6/qkMaLBlJPO+GkWgfjEsek
	 KM2Jhkm3vungW4Ww4MTpkhGsI/5hYcjou1W2nOmpY+I3KRQJUkbsK8vzXYwEVcr7wp
	 cap+IDgULo3XA==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v7.1-rc7
Date: Sat, 13 Jun 2026 16:11:18 -0700
Message-ID: <20260613231119.925018-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit de019f203b0d472c98ead4081ad4f05d92c9b826:

  clk: rk808: fix OF node reference imbalance (2026-04-28 20:55:53 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to f29a24c94705496254dd9ce7ea8a31efb6eb4358:

  Merge tag 'qcom-clk-fixes-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes (2026-05-28 18:21:54 -0700)

----------------------------------------------------------------
Fixes for the Qualcomm and Google GS101 clk drivers:

 - Skip parking clks on some Qualcomm platforms so that the
   recovery console keeps working
 - Fix Google GS101 resume by using the correct div register

----------------------------------------------------------------
Hans de Goede (1):
      clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked

Kuan-Wei Chiu (1):
      clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs

Pengyu Luo (1):
      clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time

Stephen Boyd (2):
      Merge tag 'samsung-clk-fixes-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-fixes
      Merge tag 'qcom-clk-fixes-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes

 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 drivers/clk/samsung/clk-gs101.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
