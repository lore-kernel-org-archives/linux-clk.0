Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3828686;
	Sun,  2 Aug 2026 01:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785634993; cv=none; b=n0I+cPxKkPe9axifoQ3dJAnIcn7UoyJPz43zSKuoO0OfJOGTtowsw8UuGHVNImYC4df+Qb6W6Lh1R3cdaZcoyOduPykv6nsHuDgDUxZx/om3d/LLfBCrx5/fgYq8Ceu6yMV6eZjJpB8xyfDTW6hNbw/GPdVuQq9m4qCi5rZrgEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785634993; c=relaxed/simple;
	bh=HaWFhT8Ycq1COrp1bZ1U6c2Trpf6TKbJW54GyqpJRsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oqnJg6pe8TN5cQwTibiZspS0c/EdbOoOWsDv5CpANhauUJKqlbUhJaUrYlRuI8Iw7M0rLVINFhk5kAKwamRkIxi/EK9o9iytmM+xce+3GrQiMB2ZIzuSrMr2aOBnci4Ic/j7rYp/emHxNtEUnwl8253DN9XJ8PEfO5/LMbkBN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP8pRBQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP8pRBQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455451F00AC4;
	Sun,  2 Aug 2026 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785634992;
	bh=JvY/mdB5yRnOKiw25wWjtLwiyFo46PBV6J701GGT7eE=;
	h=From:To:Cc:Subject:Date;
	b=kP8pRBQH5TLwzf+z11OwISdnx5KlEf++B1+4K0WKkGPrHug6dbS2VhO4lfbTvv1EW
	 qTCmvWZFZMF6RGUtflF1Y89E5nvj/a5RNoS/mdHQCKBMFQvpwkR8mVZYmVY1LihNA4
	 M5xezKqlPFjmIJVwCl58WwBLtmFMvYdlaF2KzkeHHV3gyW8WEuGFddh27VQ92KDrIx
	 7jZpfq8h1YYo5YqWe9T/5Ycc6bHoIAt+39sSUoWTZROuhJUQKpd7G/HNmGS6QzPqdC
	 nEArEbIlVffp6fjQu3kTyloWNsPxcqubZA0FaWiv3koIWIILeJmsN6UIIBsUDbPAI/
	 nZNDic5QhGFHA==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v7.3
Date: Sun,  2 Aug 2026 01:42:52 +0000
Message-ID: <20260802014217-KYC2734409@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Stephen,

   Please pull SpacemiT's clock changes for v7.3

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-for-7.3-1

for you to fetch changes up to 8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485:

  clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers (2026-07-29 02:42:06 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 7.3

- Add clock for UFS controller
- Add new I2S clock and fixes

----------------------------------------------------------------
Troy Mitchell (3):
      dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      clk: spacemit: k3: fix i2s clock topology
      clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

Yixun Lan (3):
      clk: spacemit: k3: fix parent clock of UFS aclk
      dt-bindings: soc: spacemit: k3: Add clock ID for UFS refclk
      clk: spacemit: k3: Add UFS refclk clock

 drivers/clk/spacemit/ccu-k3.c                  | 41 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  4 +++
 include/soc/spacemit/k3-syscon.h               |  3 +-
 3 files changed, 33 insertions(+), 15 deletions(-)
