Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFFC167DAB
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975318; cv=none; b=Nu5/0dy3KO6GFPea88yZHbBcPc6RSAmlbOAgiEsxqT7L7Gd2dGNxebK/G1HKUGJA0zPBAvDidDoT/oICYd/mgGNQA+tRTW/DK9FEbB8yAFDCOQo/nN23R8b72dXKVwdGXw7SL9uZ+Bhybg/w7kdFvC2a91mVUwKMaSlhH63qw0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975318; c=relaxed/simple;
	bh=+nWyWXcxlPbba8Z80O0ITtYS6jrHn9b2UjqM7MZQtCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLx2WkJrmZ7AD25lsS0RBnrzOFsY4rjfidGgFiuyMnRwqKMfss9QgXUokErG6qPZzg5PB4huNgmCeaO9R9B2XrZ7NrJRoX0YQ7SRRvADK4506vpu9IOG9Rn/zWvYsbbktlUTkP34KKJgX1p3glmqsis0/35ZghsE5cSJ8hKwxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id UxbE2C00X3VPV9V01xbEnH; Wed, 29 May 2024 11:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFhI-00GI2V-8c;
	Wed, 29 May 2024 11:35:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFiE-008wVn-Ew;
	Wed, 29 May 2024 11:35:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Lock initialization cleanups
Date: Wed, 29 May 2024 11:35:07 +0200
Message-Id: <cover.1716975021.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains a few spin lock initialization cleanups for
R-Car Gen2+ clock drivers. It has been tested on a variety of R-Car Gen2+
systems.

I plan to queued these in renesas-clk for v6.11.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a77970: Use common cpg_lock
  clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for global spinlock
  clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock

 drivers/clk/renesas/r8a77970-cpg-mssr.c | 5 +----
 drivers/clk/renesas/rcar-cpg-lib.c      | 2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c     | 4 +---
 drivers/clk/renesas/rcar-gen3-cpg.c     | 2 --
 drivers/clk/renesas/rcar-gen4-cpg.c     | 2 --
 5 files changed, 3 insertions(+), 12 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
