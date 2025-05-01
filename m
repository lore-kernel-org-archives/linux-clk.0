Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015919A
	for <linux-clk@vger.kernel.org>; Thu,  1 May 2025 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099570; cv=none; b=B8F9L0xc24FhlFx9L24edkzXWibbjL3ZZYJFDWXGI9cHW99NaEI6nCQiaxvJ2E10u0mOlBMG4ewMKj2lBep9zKl6xJ0D5BF5inpgC+d8RJokYX/FSu2KF6cuPaoG+LwESpYueTe24eU1joaqWTkqIaThPXQ6o97KwafV8D9vfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099570; c=relaxed/simple;
	bh=LKJm8DdMuQQGy0YtmCDzdDLQxP42pS5GWq+xvauihW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvB9dSUvRk0TN6QuyLWga5gdHUH9Jm//lU7nsitIhgXqZ+w4S27c2obx36AAPFp6UpIJ2h/JQMwso+fTu7wzKOcMS4xMAZGguRPL5Hsc1M6kXOVaL5OEdHosi1iGfK/I7b0o/UzLf3l4OsuI3FNibZsxfsgKmcI2iEDIpxgnFjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niuI0MBw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niuI0MBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF22C4CEE3;
	Thu,  1 May 2025 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099569;
	bh=LKJm8DdMuQQGy0YtmCDzdDLQxP42pS5GWq+xvauihW8=;
	h=From:To:Cc:Subject:Date:From;
	b=niuI0MBwcdusSz7bYAeOes2ew3/7T9V42GLqZJXoVPLnILtfQbfcvQ+s/nUz4rI8Q
	 RihecFDZubjBM/7zGHSkAqwWTW23FIk2zfSBLeW6Hyt7EnPzt2ih9S1EzbQWXQ47e4
	 0Oxgni6uQztbl/U/i9FCbDI4mw8Bsja1p/l9I1IwKl0LjKSjwqstbOGUGJfXxZ2ci9
	 mKT/0V/OfTDlbfiiqOnlT0wjm+dMDSmEkCFy9BqYyIBzMnTtStkO2aKwwcY/4BXEY5
	 UjTKzfsxMShWByGOEEmwlBitJcIivXPacNMCucbQpRw+9+9auBS3ff8DYT8Q63GO8h
	 hV8EnoJus3fDQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: socfpga: update for v6.16
Date: Thu,  1 May 2025 06:39:27 -0500
Message-Id: <20250501113927.2008316-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_clk_updates_for_6.16

for you to fetch changes up to a5f390059970adcff4ad69a169b5cae3db0eacea:

  clk: socfpga: agilex: add support for the Intel Agilex5 (2025-04-30 07:00:33 -0500)

----------------------------------------------------------------
SoCFPGA Clock updates for v6.16
- Optimize local variables for clocks
- Add clock support fo Agilex5

----------------------------------------------------------------
Niravkumar L Rabara (1):
      clk: socfpga: agilex: add support for the Intel Agilex5

Thorsten Blum (2):
      clk: socfpga: clk-pll: Optimize local variables
      clk: socfpga: stratix10: Optimize local variables

 drivers/clk/socfpga/clk-agilex.c  | 413 +++++++++++++++++++++++++++++++++++++-
 drivers/clk/socfpga/clk-pll-s10.c |   6 +-
 drivers/clk/socfpga/clk-pll.c     |   4 +-
 3 files changed, 417 insertions(+), 6 deletions(-)
