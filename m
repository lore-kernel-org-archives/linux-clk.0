Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A91D5CEE;
	Sat,  4 Jan 2025 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024158; cv=none; b=ei+ZMPS6uOFqXGtqhavoWlJ7Hw8j/89+UN0nWa1MUEl3uJzNrujAyvXduHYqE/MqPn4i6P4+oh+AsFdlopvcyMUi4ZtgtGYgBwwE+MKXak7qILQxQRSUqOJsYZ2JPM7Bg3H0caYzzjkRXqngxTBLOZGv1/KL/LpWQlTXsOcFFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024158; c=relaxed/simple;
	bh=fFSTAd/bgfpyVUCvlbcb+/KJ4aqvX44T+omqFyCaEKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWxq9fqKCoffYlwr2Aib06t926TRZuTrn3ndaMYd/beD/xvnCEaa4h0i+WlpMgAWIfiKL1qxCm8eC47Olu/SMbOjD5thI480xuybDjsYsjw9KmSKQ6yHugkKUeo5RGoiJkNb5kTGOBbHtRZKwwihIkw+mOQ/350qCQnBL2+vP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+8vJ+l9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+8vJ+l9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4B5C4CED1;
	Sat,  4 Jan 2025 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736024158;
	bh=fFSTAd/bgfpyVUCvlbcb+/KJ4aqvX44T+omqFyCaEKs=;
	h=From:To:Cc:Subject:Date:From;
	b=Q+8vJ+l9zomNJ0M0XiQ5YZ774M0dqAm8MDy96drhEr6GHcd92nQtH4qfuvT7HNQWK
	 iqUsZZbdqAjMV/AOjAnl311XZh3ScODygyvuu+RN0NECY7XK9yzhTljLopmY+bdt7w
	 BrKgZaaAuZyZ7bR7kCssBB/xU6AkXSY52nu7fnLwIc3cRkDfChFpJKp/ZrNN5Y1qPO
	 0hlC0Yt9lZJ0UgyDk6wKx+0gBBsYINzNWieqeLDNHv8CqPRNvztGrWyQNU+FZ6SR2I
	 35Zoq6wgWnbSI81IAit1pX9KMXxUOsFiyqxVIU4FdoMAudU+Jy7R/clQmQzxPOqMwx
	 UoXOLHj8Wct6A==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v6.13-rc5
Date: Sat,  4 Jan 2025 12:55:56 -0800
Message-ID: <20250104205557.116554-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 52fd1709e41d3a85b48bcfe2404a024ebaf30c3b:

  clk: en7523: Initialize num before accessing hws in en7523_register_clocks() (2024-12-03 14:54:12 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to c384481006476ac65478fa3584c7245782e52f34:

  clk: clk-imx8mp-audiomix: fix function signature (2024-12-20 15:43:41 -0800)

----------------------------------------------------------------
A randconfig build fix and a performance fix:

 - Fix the CONFIG_RESET_CONTROLLER=n path signature of
   clk_imx8mp_audiomix_reset_controller_register() to appease randconfig

 - Speed up the sdhci clk on TH1520 by a factor of 4 by adding a fixed
   factor clk

----------------------------------------------------------------
Maksim Kiselev (1):
      clk: thead: Fix TH1520 emmc and shdci clock rate

Nikolaus Voss (1):
      clk: clk-imx8mp-audiomix: fix function signature

 drivers/clk/imx/clk-imx8mp-audiomix.c |  3 ++-
 drivers/clk/thead/clk-th1520-ap.c     | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
