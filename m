Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308813F871B;
	Tue, 26 May 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798315; cv=none; b=C3NN9yN/lnQvZQoEWNPEMvWA8kpDk7yo52Mad6Hodxq96pWOLkq5vIXaaZL2+/Ihnmb1J/2qnoCoDyF9g5MGAoAGs+55x7Fwg0jYeCUedGk2DPotgI5WAG521YUx6bInovqFejwgcx56xC9VyEHLxh5rGXiRwE8RGo8rNZ+m4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798315; c=relaxed/simple;
	bh=2+GUZvU8O/ZnxE6xlsaDLh0+cqugj5wfkmbgnSRBemk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUw9qCh8A15bPrbwHoQ2CSakJrGxoxvr+uFVe1CS6u2Dj7i3a9ruyrADBH1RvfBs52yQUkrnkSlwDfrzEjWzNVsHsCLmFZNkt2ntaSBWBMcYE0N8w2jzaAuMPhsvrqKZqY4o7hMr3G7SMHU2LGYNs1/cXsKTCQjFn0/UWJz07fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a775RESh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a775RESh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0001F00A3F;
	Tue, 26 May 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779798313;
	bh=Jc9Tci3qzrz+fLTeUNfHlJfvuKClpR1dg9W8TjBjlb8=;
	h=From:To:Cc:Subject:Date;
	b=a775REShAajCCOes1+zsFbMjj/xuaGdeEw1BWAW9WBK1ZticU6jg9Xn/m06C7RMc8
	 kx1o9Ilqw6ztUGKrnytBPP3W86qvPH/IUW3DSkEbZ5rGKX/QE6dX5NpvFoMqo1yq7G
	 24rkcsSRmeBFjtl85WQlySEQNz07ZbZsFjploy1DurONxDf9iBE6WvJ3t7jInDRIN8
	 QbAwP+nCXRi1f51S1ceDTnoZ6XrgtGoApdAYgFmPGXU/dqJ2nxjofvvaz0MwItZL8n
	 BlO6V6Wkchj+DC9KFX3EXeh99+iKESLLp5kccwR5Oa8EOERdvvujsMOKw+GYQ4FNe7
	 wbajvY665QTHQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dinguyen@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: socfpga: update for v7.2
Date: Tue, 26 May 2026 07:25:12 -0500
Message-ID: <20260526122512.3841150-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_clk_update_for_v7.2

for you to fetch changes up to 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548:

  clk: socfpga: agilex: implement l3_main_free_clk (2026-05-25 21:46:56 -0500)

----------------------------------------------------------------
SoCFPGA Clock update for v7.2
- implement the l3_main_free_clk

----------------------------------------------------------------
Adrian Ng Ho Yin (1):
      clk: socfpga: agilex: implement l3_main_free_clk

 drivers/clk/socfpga/clk-agilex.c | 2 ++
 1 file changed, 2 insertions(+)
