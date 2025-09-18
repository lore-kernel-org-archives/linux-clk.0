Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC0030BBB2;
	Thu, 18 Sep 2025 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212111; cv=none; b=e4l/l2c0nOf/U7V1KCB+xcJmSLnaOK4KrYBKCppab/1nu0/9xRC68hblDDQPRLn9t4BBmBXBjTbunFGfw4XT7ZGd+Srcc0sf+rB0J+Sjj4qhO/DHxU7KjWSpmRLJpqPGTjaaU2va2GL4/zHYs19NX6V0GiYjHrwaFTGBsAVfrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212111; c=relaxed/simple;
	bh=NUmiPw09iI+MO0x6EdrHq4XKUr4BBz9df2qFPG/8Quc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWwd8QF11sRpp8038sd90v5kia+9IWxOcTuUwHWBErwcMkoMlmFk2k2Pa7yl5RaeDkSgTiOS0TgYn19dcrYWk/lVWjvjcMnOFa6H6zDm+mjcaX0UnVl+qMbJrI4nx3jYMkEss4r17f47xA7AOXw9qu0uMbhY2LkvZjYz3Z5yyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tW4woGZb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tW4woGZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FBFC4CEE7;
	Thu, 18 Sep 2025 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758212110;
	bh=NUmiPw09iI+MO0x6EdrHq4XKUr4BBz9df2qFPG/8Quc=;
	h=Date:From:To:Cc:Subject:From;
	b=tW4woGZb23aELC+Scntq/1zwGWdLICpBTyNbSycVDjmQ/sdiklfvhLVGGRLjLhqBa
	 Q0RBbq1Da5GRL3de5de5xQN1o/KgFQCVl0M9w8NeenWqHbBZrYgOdhh8YEu+KoVL1d
	 X+fXup15BMXPSmlciFl4aKB/9nlF6zOVhowIn9EmyZkYY5Oippe/FiysslAaFY9KIi
	 jku44GXwtQWS7Vr6w18gBvTCNqGw7Hro5fQw2SvH3Y2h0RikV3pCI38Ivs9xarQed5
	 dkEM3QwFnCLQbbdQ4DkxqWD7dOxirMwTk9QAUDq1lgYVaOZL58KTII3xRsrhUAnAS2
	 Ay9sQdZCyW0SA==
Received: by wens.tw (Postfix, from userid 1000)
	id 7525960427; Fri, 19 Sep 2025 00:15:08 +0800 (CST)
Date: Fri, 19 Sep 2025 00:15:08 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.18
Message-ID: <aMwwDAnj4QshEHdI@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.18

for you to fetch changes up to 598e4b6713b54267acc257b3c66a269079ee4d8f:

  clk: sunxi-ng: add support for the A523/T527 MCU CCU (2025-09-13 13:50:52 +0800)

----------------------------------------------------------------
Allwinner Clock changes for 6.18

This tag contains two commits that are shared with the soc tree.

In this cycle support for power-of-two single divider clocks was added.
This covers some of the clocks found in the A523 MCU PRCM clock and
reset controller, for which support was added as well.

Besides the new controller, a missing clock was added for the A523's
main clock controller. The RTC clock driver gained specifics for the
A523's RTC block for tweaking the clock rate of the internal oscillator
to get it closer to what the RTC needs.

----------------------------------------------------------------
Chen-Yu Tsai (7):
      clk: sunxi-ng: sun6i-rtc: Add A523 specifics
      dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
      dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
      Merge branch 'sunxi/shared-dt-headers-for-6.18' into sunxi/clk-for-6.18
      clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module clock
      clk: sunxi-ng: div: support power-of-two dividers
      clk: sunxi-ng: add support for the A523/T527 MCU CCU

 .../bindings/clock/allwinner,sun55i-a523-ccu.yaml  |  37 +-
 drivers/clk/sunxi-ng/Kconfig                       |   5 +
 drivers/clk/sunxi-ng/Makefile                      |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c         | 469 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c             |  21 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h             |  14 -
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               |  11 +
 drivers/clk/sunxi-ng/ccu_div.h                     |  18 +
 include/dt-bindings/clock/sun55i-a523-ccu.h        |   1 +
 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h    |  54 +++
 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h    |  30 ++
 11 files changed, 643 insertions(+), 19 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c
 delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h
