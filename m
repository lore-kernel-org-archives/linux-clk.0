Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ACF2D4800;
	Wed, 20 Aug 2025 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674850; cv=none; b=ueVXD//g20bTUTiBZxCubJD++IKNkeGCR3hXtyNm2G5ZntyluFa0RBoRxpGyvsGZYLyZnMVpkYNRdTZM+ufTvt0vQyH2R9/APlopq6EAz8ZurtLigZyeHQ8FgjNDXaHbiEd+MZbIO0aHv0NJ0sdN1HSMVSL0ohijzAebpVwzqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674850; c=relaxed/simple;
	bh=3YA0zlExOjLGVONLVWemSlzBOdmQGNkPpFwlDFO+184=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdzPgPcm6e2Qqm8qawYiiewLCEMlr1GLWzs72Ll3nt4SwnEGs/e+0guq327BJ+HiCjvYQwoRgSrfw5sQYQ9N7EBruSqsZolzg1ZIIaptHN3sAFxITJMvqbanEQ02c4nN5GFqHBmBVu267Q52WFGD0ec0tgyHFwa00OlEikrzFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8039C4CEEB;
	Wed, 20 Aug 2025 07:27:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Fixes for v6.17
Date: Wed, 20 Aug 2025 09:27:18 +0200
Message-ID: <f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1.1755674703.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-fixes-for-v6.17-tag1

for you to fetch changes up to f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1:

  clk: renesas: mstp: Add genpd OF provider at postcore_initcall() (2025-08-18 09:36:55 +0200)

----------------------------------------------------------------
clk: renesas: Fixes for v6.17

Fix a Clock Domain regression on R-Car M1A, R-Car H1, and RZ/A1.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: renesas: mstp: Add genpd OF provider at postcore_initcall()

 drivers/clk/renesas/clk-mstp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
