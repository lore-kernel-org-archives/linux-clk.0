Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D91D3612F1;
	Sun, 10 May 2026 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425597; cv=none; b=sNNKRVIuWpFkoBgr7kqODpdY1ex2O/zba2onsbcZCUcaf/ejdAIrocpkNnSj0jDYDqrvrBvCJly7a5cxKMH5yKp/7uK4EM44xxZWcbPyDAd34ycqawu7qYgJeL6OVOiWcPf0FxGC31Lac10mKA/YEvlR7ijSWp4eJ+WD5t5NKb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425597; c=relaxed/simple;
	bh=/3DLv4Sedj2ihc066Y80XUkodfCt5lvzhtpnaavR3cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fin2QQgECqnG5WrjrQHvpO32FErwZUBekdhhe63uCayFmsStIUS6K3mYQE1sytC/aWGcqI43nF8ePwJB6v6dPj6pfS+q084ajQH9i9iIGUWD20Ngi8UfS+h6f/GsCH/EerrRAIWBYNOWdDe5uFiFTZN6FaN9RhC1jbWrpG7KI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxwyZm3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxwyZm3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E74C2BCB8;
	Sun, 10 May 2026 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778425597;
	bh=/3DLv4Sedj2ihc066Y80XUkodfCt5lvzhtpnaavR3cg=;
	h=From:To:Cc:Subject:Date:From;
	b=VxwyZm3sKLbC2dZdzfMeXCiCvzxZS+6BfasCGywv7jEdvCvt2yiXfHT7XVxEEnZf1
	 hy2c+ZTVz4CRBnqR/mlbxqRXR22oYs+rgZ+bsuyi8uvq3vS2LB2TcTEZdSIUig8XMK
	 z8tcJfUf0kn2FU+Mun/PK+TPXenbX/eGWwODJ1PdJO/zG0acLpYqSRfWQYSGFj7aD1
	 ePUS3VFEMV7F28Ue7jQgLkch7nxZEoRPz0dUlaSQGUVZm4N3H4+ygd/rSbKeqldS3R
	 161r+RB3hYbe3jwtKtEQ6v0d2vsk3ai/BtFU5dBkA7h1j47qq+2jDmpE0qYTjOENjc
	 iIYTK5mtlWRuw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v7.1-rc2
Date: Sun, 10 May 2026 08:06:34 -0700
Message-ID: <20260510150635.3330901-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to de019f203b0d472c98ead4081ad4f05d92c9b826:

  clk: rk808: fix OF node reference imbalance (2026-04-28 20:55:53 -0700)

----------------------------------------------------------------
Fixes for clk drivers:

 - Mark the DDR bus clk critical in the SpaceMiT driver so that
   boot doesn't fail
 - Fix boot on Mobile EyeQ by creating the auxiliary device for
   the ethernet PHY
 - Plug an OF node leak in Rockchip rk808 clk driver

----------------------------------------------------------------
Brian Masney (1):
      MAINTAINERS: add myself as a reviewer for the clk subsystem

Jerome Brunet (1):
      clk: eyeq: use the auxiliary device creation helper

Johan Hovold (1):
      clk: rk808: fix OF node reference imbalance

Théo Lebrun (2):
      clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

Troy Mitchell (1):
      clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL

 MAINTAINERS                   |  1 +
 drivers/clk/clk-eyeq.c        | 60 +++++++++++--------------------------------
 drivers/clk/clk-rk808.c       |  2 +-
 drivers/clk/spacemit/ccu-k3.c |  2 +-
 drivers/reset/reset-eyeq.c    | 24 ++---------------
 5 files changed, 20 insertions(+), 69 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
