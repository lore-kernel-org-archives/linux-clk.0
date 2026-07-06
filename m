Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FF3E63A4;
	Mon,  6 Jul 2026 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370178; cv=none; b=lO2zue7VH01a1Y8yXbggq6p7hBlJY02iyES0kWJ3xvC2uY3KhOP9bXHWHSSKs6VnhBiqGWNA7C4c7Lb1/WXa09uu7bw+fuyKuxeIbIvthvHRRfnrQA22gTMI4yPm4LpARg+LE/o3it3bbqBmNJZzup2iyMv6NvM1LmHJQ+6s9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370178; c=relaxed/simple;
	bh=h+ZeJN80uyduAca8j1bETSDuUAFukgrb8PVBxu+USiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SlphxZhF/1T6Or+DZPdVWVwrr006LyJID6kEq0Tfsd5kf3XDqF0B00dqcykemEyb8bBMoln39H9na8EwVPKy+gtLH1Uw11A5Zz+H/hVyH0zWKru5W2k+m0DEppmxYOBIwN/PCuA0CHfVyq8oBs/HH6wxVcqW7lJ5ubvw1tX0Q8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIjo6xi+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIjo6xi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D271F000E9;
	Mon,  6 Jul 2026 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783370177;
	bh=CnbXOCT1WGn9UITK2bontSHU7zyzH+gzQkCjzXQv3ak=;
	h=From:To:Cc:Subject:Date;
	b=TIjo6xi+XLf0kYcvC0OzsTFrqzySzXNJ1ijbCQJtmjAicMEp//vyCIs2EeiWsGsOC
	 vbMz+yU+kE14z8yHbvuAopR2XqTnAy6vHhnck+CW0g/cEy5HImJcBfS29JEXCodzyN
	 g9wfpyJZC/nZ7lgJ9fYfct8vybJ/QZyyiqxI0FG19glQDqG7HBHsOLy4h3vG2A+hVd
	 MeFktm8tmDsGiL9GcH11Z2AVL4RYWntqoDklrTUC8R1Bseh/s2AgwfHvmH5aLkec5y
	 VipVjPIuIJQ3KheRQr/ahZIOtAAcGFfKp6pvVgxJrrWnwS4LAfLv8eybJIIUEXUYVw
	 6J52Xd77iDb6w==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: fixes for v7.2-1
Date: Mon,  6 Jul 2026 20:35:51 +0000
Message-ID: <20260706203425-KYC2957292@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Stephen,

   Please pull two small SpacemiT's clock fixes for v7.2
First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
Second patch fixes a system hang due to HDMA clock being shut off.
   Thank you

Yixun Lan

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.2-1

for you to fetch changes up to eb525edd48907795c0d4e498ff57ad168070b289:

  clk: spacemit: k3: set hdma clock as critical (2026-07-06 19:45:17 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock fixes for v7.2

- Fix USB2 bus clock
- Fix HDMA clock

----------------------------------------------------------------
Yixun Lan (2):
      clk: spacemit: k3: fix USB2 bus clock
      clk: spacemit: k3: set hdma clock as critical

 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
