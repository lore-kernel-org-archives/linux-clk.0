Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C4230C612;
	Tue,  9 Sep 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409367; cv=none; b=jhD9Kqumxp75txPuSJe1JcofINFOL9E2N35BD+iVP6ZWGDDBgb+5iDZU2SXGpu5ivI5ICVKdCZKbSELPSmCgJl+yEVkc3545NoMyNjLm8WHa7yfRKdybUVYr5qcvsmJKqfFPgkIU9wnVB37bY6xhTpCxZk79V2PkDmrSWTvLY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409367; c=relaxed/simple;
	bh=485XNuI54PJdW24CwzsEtf73nh7rBUP22Zhj2LaCji8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XoLOIAjAURY4Ta8rwSb5312/AHWewqfmiazgJYFJ59XwkpnF0iotOeMHwmWJZ8jYSei0B2NMxAyeBVxufBdFMTPiA3a60rqpZqoFvWbgBeg3VbALMBlVkP3wwPavyS6AmHiPUIesuAb7HZ92NF7VoegN7au8hkYVSMLNwNUIxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A9D90340F50;
	Tue, 09 Sep 2025 09:16:01 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Alex Elder <elder@riscstar.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v6.18
Date: Tue,  9 Sep 2025 17:15:03 +0800
Message-ID: <20250909171321-GYC7803064@gentoo.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Stephen,

   Please pull SpacemiT's clock changes for v6.18

Yixun Lan

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.18-1

for you to fetch changes up to d02c71cba7bba453d233a49497412ddbf2d44871:

  clk: spacemit: ccu_pll: convert from round_rate() to determine_rate() (2025-08-26 06:07:45 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.18

- Convert to use determine_rate()
- Fix clocks of SSPA

----------------------------------------------------------------
Brian Masney (3):
      clk: spacemit: ccu_ddn: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_mix: convert from round_rate() to determine_rate()
      clk: spacemit: ccu_pll: convert from round_rate() to determine_rate()

Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
 drivers/clk/spacemit/ccu_ddn.c                 | 11 ++++++----
 drivers/clk/spacemit/ccu_mix.c                 | 12 ++++++-----
 drivers/clk/spacemit/ccu_pll.c                 | 10 +++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 5 files changed, 47 insertions(+), 17 deletions(-)
