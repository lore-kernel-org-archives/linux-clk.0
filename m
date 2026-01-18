Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8C3093A0;
	Sun, 18 Jan 2026 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768772428; cv=none; b=RYYmrzeS5/6Q/0SiGkuhMNgdY/GE5t5KUesm7xu72ZBLF37S03E1i8bMLD3IMz+UFgCS7kDtEwGZIhNb8oKuxKmTwzaH4Vxc5uJrYIWGv+WHM3QdGJ9WCwp6AMqWGwrFsKAJPWdszIIEIZz+d/opmKDXuqvItPbGvt4NpzxWfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768772428; c=relaxed/simple;
	bh=3KcJA5y3aDda85HQ9x24E/tcaEKX+wmZBDGQdJygmqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhT9AGPq2zMNFuhlNJ1JHmnI0f0zZWxPzEKeMf3upt9ve66X7D1m/pAG/U8jMs8GQW8ilJadPOlZoQhieumyQnHsQ8jMsqe+3ZO11vPiZUZFSrNMqHra5t1bMO3VzskiR/WV71CT9eomLumMSCDUiohLJKYEUC51Ch/jfNzIHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAhYBeE/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAhYBeE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8119CC19423;
	Sun, 18 Jan 2026 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768772427;
	bh=3KcJA5y3aDda85HQ9x24E/tcaEKX+wmZBDGQdJygmqI=;
	h=Date:From:To:Cc:Subject:From;
	b=iAhYBeE/551WEbJ9qfQYpp2YmJTbU6Ky+Y3T1ZsYbj1pddNjjMA7caWnaRmoq6nul
	 HZargsEH8DoXSqicVQspw0G3rFwMOm+WTb3hW91sc1nE6vpZncilPRRbECV6F3eBHn
	 7M4kstJsXkuC9zyVnXjlN3ZYuz6tTKfJixMQbaQIRfMMXfZpC9XNBPIUE6Bo9czQ1e
	 3bflq/gIjH1bb6GjBvtA4WY+D74nj5qXMDkVhZ1f43bHViEN60rTUV4IxEHHSAr7UB
	 U0c53+gDb6R1vD6FHxXcpehM55+RvTZL5yskf0cHxXr0Aox4Zst6+Dm/ZofyjMsQ/A
	 Oxy39WG9kewHg==
Date: Sun, 18 Jan 2026 13:40:25 -0800
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yao Zi <me@ziyao.cc>
Subject: [GIT PULL] clk: thead: Updates for v6.20
Message-ID: <aW1TSYOA0KgYN4rw@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen, sorry for not sending this sooner. There are not many
changes for this cycle.

Thanks,
Drew

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.20

for you to fetch changes up to baf4fc7c03bd0f68c768cfe27829674bd060c6b4:

  clk: thead: th1520-ap: Support CPU frequency scaling (2026-01-14 17:26:47 -0800)

----------------------------------------------------------------
T-HEAD clock changes for v6.20

There is just one set of changes for thead this cycle. They add support
for CPU scaling on the T-HEAD TH1520 by allowing the PLL rate used for
the CPU cluster to be reconfigured. The changes have been tested in
linux-next.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Yao Zi (6):
      dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
      clk: thead: th1520-ap: Poll for PLL lock and wait for stability
      clk: thead: th1520-ap: Add C910 bus clock
      clk: thead: th1520-ap: Support setting PLL rates
      clk: thead: th1520-ap: Add macro to define multiplexers with flags
      clk: thead: th1520-ap: Support CPU frequency scaling

 drivers/clk/thead/clk-th1520-ap.c               | 350 +++++++++++++++++++++++-
 include/dt-bindings/clock/thead,th1520-clk-ap.h |   1 +
 2 files changed, 344 insertions(+), 7 deletions(-)
