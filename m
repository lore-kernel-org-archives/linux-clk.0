Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9931A55B;
	Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791012249; cv=none; b=VQistmxb3OA7aSWyonh8ZJ+zrfkDcy6+N3ojQBd8QpSMTUlCTFMSywB7Vz7BCi99AFtxrLYOoX33fynLQnCgbjDG/Olfz0xLUqGdGHxwPSFJi5ATxEjZaGSNv2kFWKlkWgQjlH5V1o8MGwvkWydalv+HlrfIRwB6Igl3s9KrzIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791012249; c=relaxed/simple;
	bh=ls0ZO43+ma3iDStM+kFjd5qaNWsSy3CfIS/OqIMT+oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k67ERshBg4nGlqyCQI8w2g5vDf4zywXdLGYcYszLEEzwsWrE4golKsO7pOVi24oogQ6NbinO8FoEznGyTVUMT9WcXIfQYt+iee2g4ubhsl58vldh22ln/duCs+2WbvpxdH+1b0mqou91UWLj7o/Yfjg5VSeTO4RBVzK139ft/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2E4KbC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2E4KbC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6696E1F0089B;
	Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791012247;
	bh=qBQhcpU3YPW+HWB5pcDxjmSRN+TDMaWncOCUHprWPBw=;
	h=Date:From:To:Cc:Subject;
	b=M2E4KbC4DsJGkedsGQASuMGBrsvXMXnl7nAXUmXIx4Pb/+T44JwGYWWkoPN/sJ8Pc
	 DteCblJ5UXL6YjPVxuF0NMDMGbeujlNspdl29rDmYcf8wpMKXw+l9O2W9js+iURjUU
	 vhT50OeFGhLr4nLZV4UYZYoVYr0PwDjDt/VVSSHKJ2QB81YET/2BOGqLPq16KnphyZ
	 IEaAFiKt3rr2tcPe7+tPtuKCartysbyf+FS8RUy3S3lGeMcGn8DMurW2ENzHgY+w/K
	 p7rKQoz1zPOa0FvJ1kxW4uMV6fVWM/r3AU88OJzPuvAQpLK6morxLo6Q1Ip5hPXeEj
	 hfuzGmJIkWSfg==
Date: Sat, 3 Oct 2026 00:24:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Peng Fan <peng.fan@nxp.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: tenstorrent: Atlantis PRCM fixes for v7.4
Message-ID: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.4

for you to fetch changes up to c64b54ddb692c30b8fb139a2ead32eb4db7faef5:

  MAINTAINERS: Update RISC-V Tenstorrent SoC entry (2026-09-29 12:06:41 -0700)

----------------------------------------------------------------
clk: tenstorrent: Atlantis PRCM fixes for v7.4

Minor cleanups for the Atlantis PRCM driver:
- Set the onecell .num before the first store into .hws[]
- Only bump the shared gate refcount once the enable has taken effect
- Use regmap_assign_bits() in the plain gate op

Also update MAINTAINERS: add Anirudh as M: and change T: to kernel.org

----------------------------------------------------------------
Aamir Ahmed (1):
      clk: tenstorrent: Assign .num before accessing .hws

Anirudh Srinivasan (1):
      clk: tenstorrent: Fix refcount leak on shared gate clk enable failure

Drew Fustini (Tenstorrent) (1):
      MAINTAINERS: Update RISC-V Tenstorrent SoC entry

Peng Fan (1):
      clk: tenstorrent: use regmap_assign_bits() for conditional set/clear

 MAINTAINERS                             |  5 +++--
 drivers/clk/tenstorrent/atlantis-prcm.c | 35 +++++++++++++--------------------
 2 files changed, 17 insertions(+), 23 deletions(-)
