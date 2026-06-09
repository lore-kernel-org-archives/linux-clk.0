Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504F3BFE4A;
	Tue,  9 Jun 2026 05:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982896; cv=none; b=uLSd2xtRyP4iY21grWhCJsdouW7SXvnmXoOuCoYhRb7g9p961xKwhm18IeuhutYooF87y8SMiSsWpji+/f6bLj8CFbULPO1QAJfaFEhovmc8QdndOModamBskVhnT82LWKZEpqCoo5hVFDsWTjPsds0lLD3aPtYXwngKdepbgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982896; c=relaxed/simple;
	bh=9A/angL4yrWXqqn+Zfn1MQj8+mpz72gGN5RPavNS3XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Suq/+rzfOMo7kUt3YT6EnllRstDm9wHWp/8UmUzHh7/RjzjTsP8RmVDJ2d/5xdXoW7DksVOWRwTMB7tfXoStgjo+R0oCB51lcuSRboFL9IrD214lDW09sk+468K1MKH7scSxLJghKFR0ptSsK2C1yv8vTcS5EYwG1rfJZnS3gPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lk2ZNslH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lk2ZNslH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41301F00893;
	Tue,  9 Jun 2026 05:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780982895;
	bh=pWm1PQaUMUu2vYKwEIHJbUmNHXUOxaLWmpXmVmHx+1w=;
	h=From:To:Cc:Subject:Date;
	b=lk2ZNslH4On4YST7so7b0SIDEVSio8kaBlWk3qlMejvv57HauWBeXtrvz2uiqoq6F
	 8SrfCX5eFNsbu9SC8hSIPn4KCp1lRHWclQir7BnsVkmS/uSmFtGcF1aa7zKzh732kr
	 ondmSQIqAghzzYSFUiyUbDKQlkYBllqY1QuDmFduaCUKVHNFsitExKRGx8W1vYA6HN
	 cOJKjwak8hR2IWsmU6mvtoJG3RZwaWqNow7nqYLvtj82bkTQ7O6dTFWdxmcyDgaEDE
	 shYBPkSpOLzUlcTmkLoilIXGlMJdbqxAQ/dDBkaBvD/MvWcSkd0U9hxj6EBqzlmqfp
	 lbAgU88aMwGzw==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Updates for v7.2
Date: Tue,  9 Jun 2026 05:28:09 +0000
Message-ID: <20260609052422-KYC4837748@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Yixun Lan <dlan@gentoo.org>

Hi Stephen,

   Please pull SpacemiT's clock changes for v7.2
All clock changes are related to PCIe for K3 SoC.
   Hope this isn't too late..

Yixun Lan

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-clk-for-7.2-1

for you to fetch changes up to a37c75d7b5bb7f3344b0e639b313ac5ace6244ff:

  clk: spacemit: k3: Add PCIe DBI clock (2026-06-02 07:16:59 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 7.2

- Switch parent clock of PCIe
- Fix PCIe clock register offset
- Add PCIe DBI clock

----------------------------------------------------------------
Yixun Lan (4):
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock

 drivers/clk/spacemit/ccu-k3.c                  | 30 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  5 +++++
 include/soc/spacemit/k3-syscon.h               |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)
