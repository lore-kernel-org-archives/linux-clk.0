Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46FB39CD00;
	Sat,  3 Oct 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048738; cv=none; b=VGbIxUI5LF5duSZCoY/JXbDY5wJnDgkEIV5mXTSpVCLGcVsarefBs+epaGYmuIDwSGFFiJCXv9bpmgCkrdDgZlmA67idrZLPRphSqfKZ3OjdH8PzfB5IEKA6ip1P+KxFVPhZScB7w0OxMbd2leN7Dpg6iRLgHK2IwUXpm1Zt2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048738; c=relaxed/simple;
	bh=cYpBwFzOTgR7FK3DD7waDjHJZXMz6B6h6aPVOCIbxBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktxreyOWJYSYJrzD73EiOotkvxArL0j9ccudMFqI1H50bcvNJ/RD0LRWH+w5hpj0vYqiZbg85Eed4yAB/YQad2liadzr7OHvuED0ieynOh7mgVn/jHj0gCQtMGGzeaTAir0Vx6IKgZ/eMbNGQtVkDJKikkIqt+aALVhvmL69E6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCSXwFUl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCSXwFUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694B81F0089B;
	Sat,  3 Oct 2026 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791048729;
	bh=96Xlt30MyTAmiQCYGy3OoSsuK8PB2w+LEoX+nji351E=;
	h=Date:From:To:Cc:Subject;
	b=gCSXwFUlyz78f6WTHTEKnn3toM+8ey0lGzQgvK90k1jCxp8DPbbs+KSwyMP8PUwYX
	 ZpWA0UlTd2sh3zLqQYUlsHOpbLnyZZlnbPiKPzUWn1/rkXIdtowABAMogMX29roj2M
	 ucACEewJJUXx/rPrAKQRjsic36sOh4cNjJKTvADhtv0ijWnxeHsb47ffwYYdwMaGFH
	 byjv3ZIsXbgzsfBH7budCqfiNg7u1hgSpTjfal4csPO+5aVhY6XYoG2yAzSk1Y7Ri1
	 Hj9kEFYCSVv6sZ96qv39MQ+0A7AxIg2RCcQ7RTcWQ7PiB6+0izGByYnHm7w/hdNG9D
	 eOhnv+INLZEhA==
Date: Sat, 3 Oct 2026 13:32:03 -0400
From: Brian Masney <masneyb@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v7.3-rc6
Message-ID: <asE8E2kpcUoysqyJ@x1g10>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Linus,

Here's two small fixes for v7.3 that have been in linux-next for a few
weeks with no reported issues. Details are in the signed tag. Please
pull.

Thanks,
Brian


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus-v7.3

for you to fetch changes up to 81493c1dd1b1ebecb2843a7815973a5bd9a37e5a:

  Merge tag 'tags/spacemit-clk-fixes-for-7.3-1' into clk-fixes (2026-09-18 13:38:11 -0400)

----------------------------------------------------------------
Two small clk driver fixes:

- spacemit: k3: Fix an issue that will trigger a system hang due to
  unavailable frequency.
- ti: composite: Reverts a commit that breaks OMAP3.

----------------------------------------------------------------
Andreas Kemnade (1):
      clk: ti: composite: resolve parent clocks by name again

Brian Masney (1):
      Merge tag 'tags/spacemit-clk-fixes-for-7.3-1' into clk-fixes

Troy Mitchell (1):
      clk: spacemit: k3: add CPU PLL rate tables

 drivers/clk/spacemit/ccu-k3.c | 92 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/ti/composite.c    | 26 ++++++------
 2 files changed, 104 insertions(+), 14 deletions(-)
