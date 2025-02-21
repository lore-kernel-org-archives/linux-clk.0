Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F920102F
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127499; cv=none; b=kthZ2ys2lPP341L1d+KphuSAibqlSFNUQ0IJX4+rcB9OTYQijcbi5cE1CgKPfj31AkXIBWldbScl69zfpPHWHKriE+4uuAfzwoceBWBkTpt9G909DUK9qrNdzalYKcLVoKYWu8Jid9TBZRqvBaeOm9/RA9d12e+ouEkrGJqrCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127499; c=relaxed/simple;
	bh=BtxQqFhf9HXwNUn/eX0I6DxIUjDhovz/XSNJob/slbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXrgs8PTNLCXZJretV864YA3voqLDqlL4s41A3GpIJnbgvo0sVFMjwxVM3U2DL77NIgwqCi3gGNQ2if6FITzvcjdJRv+827C4TP8sa5tCMJx16lhAUhPBxhxPHD2RNzNnPwBAKlQNpnyRMxH/VR3QYgnFqmFbmMIDaM0lFqOxrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by baptiste.telenet-ops.be with cmsmtp
	id G8kp2E0060y8aK5018kp1Q; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsZ-2wWG;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5Jy-0GgY;
	Fri, 21 Feb 2025 09:44:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Miscellaneous cleanups
Date: Fri, 21 Feb 2025 09:44:44 +0100
Message-ID: <cover.1740126560.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Here is a set of miscellaneous cleanups for Renesas clock drivers.
I intened to queue these in renesas-clk for v6.15.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: cpg-mssr: Remove obsolete nullify check
  clk: renesas: rzg2l: Remove unneeded nullify checks
  clk: renesas: r7s9210: Distinguish clocks by clock type

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/renesas-cpg-mssr.c |  5 -----
 drivers/clk/renesas/rzg2l-cpg.c        | 10 ----------
 3 files changed, 4 insertions(+), 21 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
