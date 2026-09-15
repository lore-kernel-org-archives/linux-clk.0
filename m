Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053E2E737F;
	Tue, 15 Sep 2026 00:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433709; cv=none; b=dx7R9ofuZWayS/KEVP8KJ32I1pZkhsRDzSprHFow4QtH5JjZszFc6nsWV5EcngsjuiObtkJL4h7/Xm7iPbUa+gDWoalggnEbvpgxqXE+lIN7KNREcBrpPflKuYkPE++KCx0fQrRiYp98qz1atVV+mV0FZOm9cVRWPOktGlMDO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433709; c=relaxed/simple;
	bh=YSdgJ63+emGxwUz43KT4shdDvC2l63XLgqJYNPvGGao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TZtI+NW6ngKS2924h2IturTw19lGKVlIUPpDYUIm7vARvkri0Leb5cMoXd1doig67zUxMAWXmuNHaD1o6UyBbO5rjUIrr4y4zk/C3vG6go7KP774lBXwW0oaKibEAaVFsBkD+HLya2UwDhGt0gvsEZQOkLorjCubWoNH2fZTf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFzD2BL0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFzD2BL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4BD1F000FF;
	Tue, 15 Sep 2026 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433707;
	bh=Tf8gpeOGXwytQI4icz7EmnHY2nhPKKBH8/ezYoe6tNw=;
	h=From:To:Cc:Subject:Date;
	b=OFzD2BL05c4u59hKoBA5Vj54zoI0X3pLunCcyW8gaJl2EZDKj2LLleo3adLx1gRKS
	 FXxs5yeNrhZenizw0ybOAjIV/60ePOD9F+1/hSQL3wXCyInQcQ2FIwcMAaCE8eoZ4R
	 r5l3c1OR5kvq+HDn0JqKtk/YeuDzZ20haGfutUAMOb+VEhmSJqiLwgXmCe6pyU1Tle
	 cDHSJZpYHnEzJWwAAOttwv8Eav09XL1VsHD5fC5yUwn2krlaZ0TOrN+fKQcaRmRYwY
	 NeW4yN5EKhT+TRxFhdmDhfMaOsfOI8SAfvzDsLpN+p/3HViXU7erAz2UUecocR7x/c
	 J2ZfscTty7jrw==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Fixes for v7.3
Date: Tue, 15 Sep 2026 00:54:54 +0000
Message-ID: <20260915004456-KYC0593228@kernel.org>
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

   Please pull SpacemiT's clock Fixes for v7.3. This solve an issue
that will trigger PLL clock closed due to the frequency not available
in kernel side, a shutdown of PLL will cause the system hang.


Yixun Lan

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.3-1

for you to fetch changes up to d558af8ee0bb1b2e88e696be84adb93cf2b7be6f:

  clk: spacemit: k3: add CPU PLL rate tables (2026-09-15 00:09:55 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock fixes for v7.3

- Add CPU PLL rate tables

----------------------------------------------------------------
Troy Mitchell (1):
      clk: spacemit: k3: add CPU PLL rate tables

 drivers/clk/spacemit/ccu-k3.c | 92 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
