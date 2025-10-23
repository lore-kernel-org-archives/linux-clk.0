Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AE29BDB4
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219937; cv=none; b=b0053+7CbHnNTDd+WrFaVJycsjAgkpjJxdAXeTfrZZRX14wMoZU7YXKja0hmKBC/H9LeBMcjyfMzPugBf+SCOaVNvK5VK/+D+0n6ZLh5ncU0DIfwTno16R8yr5RBgSKAU2ydXhZWN7b36wvKVCGMkMCRCcH3LYAHtaGa1Mi4Gsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219937; c=relaxed/simple;
	bh=5uygY22KUTdZdiN65pp4UQum1fHvnpjkG+p1M2cJD0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOZOHwHQcMA719qHghK9lqwNs7JOCb12cCKeSUrv9E0bJvnU8Uwcgz0d/sgxp+vuqC44GROlsVjHzXddYFWTguLdWKlFfb6bOlCZC5XW9I/NDzUwdnzB4NLWVGK3jyUs+ZjUbO13MI22q+iP8+VJMrbSIVQbCqYKNSlAAMONSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbfJGleN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbfJGleN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF818C4CEE7;
	Thu, 23 Oct 2025 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761219937;
	bh=5uygY22KUTdZdiN65pp4UQum1fHvnpjkG+p1M2cJD0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=qbfJGleNaVh01eKvyM/WefugpuArewFaYqNN9ryhzNDMDu0kzW5DDs5x/U4NikY0q
	 7gPOiicyDk2x2SaIIJAjJ3N2SITMaVK6SXWfpz0JFSslYvRx14BDmyMiEn8kPSRlhV
	 N6LSNmBXDwB5r46F1b+1UF9YDqmDOnyNyehrkkUpLEx5gcF2/usJ2VL6aXns5MCX2X
	 v1Xs08QrylD91c59X4K4eavgCJLxMqeapCzdnqV04g3dU8YkLKhjSekqUcy4GcfGGF
	 pPgtMhPowtKCW750OHM1QJ7EDJobtcB8qnbNu4jRWc3XrPEXX71DQ6JVmXNUdsj4w/
	 Ws0B7AeKr2U4Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dinguyen@kernel.org,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: socfpga: update for v6.19
Date: Thu, 23 Oct 2025 06:45:35 -0500
Message-ID: <20251023114535.262305-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_clk_for_v6.19

for you to fetch changes up to 2050b57ecda040010ec797fb07713889372c5041:

  clk: socfpga: agilex5: add clock driver for Agilex5 (2025-10-22 22:52:58 -0500)

----------------------------------------------------------------
SoCFPGA Clock updates for v6.19
- Add the Agilex5 clock driver

----------------------------------------------------------------
Khairul Anuar Romli (1):
      clk: socfpga: agilex5: add clock driver for Agilex5

 drivers/clk/socfpga/Kconfig          |   2 +-
 drivers/clk/socfpga/Makefile         |   2 +-
 drivers/clk/socfpga/clk-agilex5.c    | 561 +++++++++++++++++++++++++++++++++++
 drivers/clk/socfpga/clk-gate-s10.c   |  53 ++++
 drivers/clk/socfpga/clk-periph-s10.c |  41 +++
 drivers/clk/socfpga/clk-pll-s10.c    |  36 +++
 drivers/clk/socfpga/stratix10-clk.h  |  43 +++
 7 files changed, 736 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/socfpga/clk-agilex5.c
