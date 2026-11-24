Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541352;
	b=cTNkkA+RsUEo85ZxUiqTjnIrGn34DNEwoQw0r88iUqfLCX+zG+1Swjjx8JGSsHfKQCDZ
	 tcKVKWpS1P/UEG+bVZDdiP5eCalbBkxC4eCGq130sh7WROgq/HzjwDONhD+xE8xlAqmIs
	 E9+xZTBvnTI3XtmeumG75KOzyj4x9AD7AYkgQ5Wm8PQXDr2dWYbS1DJYhPLOPwz7nVcVE
	 2poySAL6hgPsx3vHi/NU25j5zowEhcJa2jNqrtCX/6c93y9ls9Nz0Hg+cAB1LWUxGsHSQ
	 0y4zYKCnt2TYzTHeIGInDdUr0GfdcFMq51VGOp+J+2EvSvFVrPcZogV1QahzPnOsgDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541352;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MrucgsDpPn2OrcUaH6ydOefLE6V7NkpjkT9+yDtH+UQ=;
	b=0/qIV+ZQlJlI/30dT6UfHp21VrAUkabl3YBArHjqfjBdZ2hc0sJAXPoO3pp+Uz5QRStr
	 AMUkFy6GKDwCLdXOB+vrpXjDxyoWAEjsazNCFqmSPZTaC8rL1/tEWQEItervVb8ZyuA7q
	 KYaYQ+VyIkdfCYusmaB0/34sw2y1aAtSuO7c7EQ43ntUu/FQyPkNpvlL7eQiSLLPzrVZE
	 cl6XluwleymmtFZ1nni9FDa3VLZ3Z8sjnDJxPFezoQD1+5lmr6VIaNu0CaKIhIif6L+5Q
	 416UCxC5gS14rsFpSQxH1ByMUD8nYw+q+VXwZ89+VX4TB7sdlmeltpa5cyW9cQTWJHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8f0Bkip;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA27606A31E;
	Tue, 24 Nov 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8f0Bkip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6011F000C4;
	Tue, 24 Nov 2026 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541352;
	bh=MrucgsDpPn2OrcUaH6ydOefLE6V7NkpjkT9+yDtH+UQ=;
	h=From:To:Cc:Subject:Date;
	b=P8f0BkippUxKViCQSpGQ+hYk5lby434zn4fVWWhySgbFkVHIxIYr7WOqOStyJurVX
	 HwcqirC8i0sQEh6O7L1uDb+zXYFtqyMO43PtY6y8g7KnVQIz4o1Uib1pVLcn3DObs+
	 f6QDLJSl+B+63o0WheufKQfCxpF1if4F6OQ+xrKQ5G0RKQ4d7IcKgO7h/jF4Y+hsCD
	 kgjIvClrqY0c2cPJEg8p2+hgCcSTyCjcjnR7g0UDj9zcP/4eBeXuvAQxtxUepsqh0Z
	 6RjthLL7kemwDOAWPu2tE7F/ozlalI5Gm6GcSHobWdFqPv+df+VR8ororKmiRkZLw0
	 WV0KZnjG7xr5g==
From: Geert Uytterhoeven <geert@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v7.5
Date: Tue, 24 Nov 2026 18:29:03 +0100
Message-ID: <cover.1795540869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Stephen, Brian, Jérome,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.5-tag1

for you to fetch changes up to bec018a5d8f37ac890ce0b4eb6c46a919b2f6388:

  clk: renesas: r9a09g056: Add ADC clocks and reset (2026-11-16 09:40:39 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v7.5

  - Add I3C clocks and resets on RZ/G3L,
  - Add ADC clocks and resets on RZ/V2H and RZ/V2N,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: rzg2l: Use str_enable_disable() helper

Diogo Ivo (1):
      clk: renesas: r9a08g046: Add I3C clocks and resets

Lad Prabhakar (2):
      clk: renesas: r9a09g057: Add ADC clocks and reset
      clk: renesas: r9a09g056: Add ADC clocks and reset

Tommaso Merciai (2):
      clk: renesas: rzv2h: Forward PLLDSI mux rate requests to the parent
      clk: renesas: rzv2h: Report the DSI duty cycle from the LVDS divider

 drivers/clk/renesas/r9a08g046-cpg.c |   7 ++
 drivers/clk/renesas/r9a09g047-cpg.c |   4 +-
 drivers/clk/renesas/r9a09g056-cpg.c |  22 ++++
 drivers/clk/renesas/r9a09g057-cpg.c |  22 ++++
 drivers/clk/renesas/rzg2l-cpg.c     |   4 +-
 drivers/clk/renesas/rzv2h-cpg.c     | 195 ++++++++++++++++++------------------
 drivers/clk/renesas/rzv2h-cpg.h     |   8 +-
 7 files changed, 162 insertions(+), 100 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
