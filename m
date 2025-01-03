Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2A3BBF2
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 02:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735870106; cv=none; b=p6UDvg1uYEFb+fmiahPAW0m7z2kgjQPkTWBMJCVeKqbE+tDIOZpSWOD7b9EdWxrZYfoOypC/piIuxOCcqhPU8tbq0jMz/SR1dG4KlMNk+8eslQHACNKFmEeSWdEw6wgoeY5pcF02tt85TXlAcDZ9ZIdFHyw+Axn+I2GVN90QzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735870106; c=relaxed/simple;
	bh=6MuugsdfpCupsi9BWCKXG1CafFwnLIUxmVF5hIyd5BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DN5lw7tRN2ckKe4Hw8qf9c3OhIpXgaNsD8fx7t6MUUtWVQnOF5hskd92nyHM68ystZmBP0TaafPnZMBCzwiEx13LbPd2TUGJ9Bn3EepgdM9xfhNyRpmzJ5n4CYMHax4I3QMnMtixHu+nuSH/mYJVN6I+Zz0ChXp2zNIRSrvfQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peEn+mZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peEn+mZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0921C4CED0;
	Fri,  3 Jan 2025 02:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735870106;
	bh=6MuugsdfpCupsi9BWCKXG1CafFwnLIUxmVF5hIyd5BQ=;
	h=From:To:Cc:Subject:Date:From;
	b=peEn+mZxPfmbt4J3+8+Pu3cq6ofyrEQc/C5mrperlY8xNilzsLOgnITn2RA8bG3WT
	 77z15Bf8wKqHEtb1rcfh8hNAzIkvShy7nXB1vK+ANJ55ZO3YNiDKngqySerFJJkkzh
	 XIvXnD1DG9mNel5DS/RDs72eixM6lb1Hw2UYhnqM+pn9fwSLA4i6HtmbzHr/i3aAGA
	 mW3tcFwFPonWhi6y6IRj4FPunbLecKLItHSFysjSz3bmlwxrn8OO57diB6wJEjKDA/
	 fuvPjvuZptbXooZMqTUxmhOSaWqiJ4KpGRwDJcDPYRrTAVHWyDFmcT7LVMWkcgAU+7
	 wA+kVa0gr22OQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: mturquette@baylibre.com
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: socfpga: update for v6.14
Date: Thu,  2 Jan 2025 20:08:24 -0600
Message-Id: <20250103020824.1267484-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_clk_update_for_v6.14

for you to fetch changes up to ee46245564a8d74ae96394269f173f8306669c04:

  clk: socfpga: arria10: Optimize local variables in clk_pll_recalc_rate() (2024-12-16 18:22:00 -0600)

----------------------------------------------------------------
SoCFPGA clk update for v6.14
- Optimize local variables in clk_pll_recalc_rate() for Arria10

----------------------------------------------------------------
Thorsten Blum (1):
      clk: socfpga: arria10: Optimize local variables in clk_pll_recalc_rate()

 drivers/clk/socfpga/clk-pll-a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
