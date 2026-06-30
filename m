Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440F830AAD8;
	Tue, 30 Jun 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809634; cv=none; b=ExEiNL42E1NL3qb4n4WHeF/XI12m9EyqW1QOTwj1hTAIi8AA4+63x7qa15Vhum7mw6Jidp7tBqTYTYH+B7/RWxISQoCBbhfQ41ar4ktgtrvG349V1a9q0dHW2THSGzTXWy7qfB1MO+cKwl3xMIeP1A4Ni6nE/g5XdInHiQluORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809634; c=relaxed/simple;
	bh=MjGhlwrMf6rAwEoM7MJMPKBf8giVSOjCTKFxZcjlQdM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mdyb8pSfk2SyQYMtsrbRhMmJN6GeoXEsPgcK+UZAPgqJyJcrp6/r1+pA/VGYqZS++RCAG7wavMfTH16QW4aSgvdOsGLjpHRzR1TcJ5pLpf9qByNOEs51RSsN2DEu8O5xEYpPlFCiHrmrQNJxQxpPi3uKHrTqMgQgM4NFfFRi3hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMCkZrk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMCkZrk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C921F000E9;
	Tue, 30 Jun 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782809632;
	bh=SEnLCfN3BLX37SaNDMuUiKxagO5YKWeLAoW/iqtR+Uk=;
	h=From:Subject:Date:To:Cc;
	b=oMCkZrk8hqHv822HEe2iSUISS9XiHn3hCxwPZao6u7xbQu2d5dNahVGMf+NePYBFL
	 GI2uHa45B/EbjvbHGsPk1gW0zSf9qFv7F7XtBjV5dX3IflR6tQomNBsxIj3mqwuM9x
	 7jLCBAxCpr9Av6UDRD+GPwCh7Os3j7K/cNoaG9sLPNBWVC9PEzgpVcNZQX8aRkvnlF
	 qU6PV+TY7D/gbUn3n2tNjoB8Y0BDSl153VZQ48GwxdUCvSkjzYvJiGpnFjZE9tue9m
	 nJyw/fh1RjCnRlot36Um/9jLEoNifGplddzq1JVp6juF2jCO0pdEpqzhJCKcJZcrcH
	 uO+97WBtrMEWg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] clk: spacemit: k3: set few clocks as critical
Date: Tue, 30 Jun 2026 08:53:18 +0000
Message-Id: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6DQ2oC/yXMTQqDMBBA4avIrB1IxI7Uq4iLJE51rH8kKoJ49
 8a6/BbvnRDYCwcokxM87xJkniJ0moDrzNQyShMNmcpIkdaoCN3wxa4ZDTovq5gBc/siY22h6K0
 hlovnjxz/a1U/Dpvt2a33Cq7rBwY67Kx3AAAA
X-Change-ID: 20260611-06-clk-hdma-critial-4b56abb70691
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=dlan@kernel.org;
 h=from:subject:message-id; bh=MjGhlwrMf6rAwEoM7MJMPKBf8giVSOjCTKFxZcjlQdM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ4QU/vBYJyw7nICHXT5s9zQy1d1Dzas9AB3of
 T773n8og/OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakOEFBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0vzA//T4XJpV//HntlX6hJWVAblVdjtMJFOVqqzwks/5PgbQJA78FW72d5k
 bq8ucYoxLyZRTNWWc8/0efZ/Hs3a1ffhiuVb+f0txLCWwJHyYHShoB9TzrPGYbEyV4YlzkdlDf6
 +XmuRiAy9EXk82ykmVrPZI1dRvxkTmdg3UgCNIYd1sM8LsM3GJHz2dzdlOUNMCYQOHLsbw1kq7n
 Uh+Dw/6emzjG6020kiW9FGnIymz3zbl5/TC3bwFhO0G5Nfn950RB9h6GLnJl+UZzbMx55/Ywxt3
 /KATNFEL0IjN8JASQ8c34LihbaZuGtiAafEjm67f7MmfMbFu3YaLvX5L0VGvt+z41fzw1TS8fMa
 4S2GdtM4FXJCILUfB/iYnaRey+g2s0EblHv0pRdVhb5bYN0X2suxyUf/KZYlEUj66bRDwgbxLBD
 xQrdYBEw/SA/TBmgY4HUgDAjLBStFKNDc0QqJ9f6LZB5PyuwQgYdpHmPeG3IpX99WXUejJvrfoW
 TbhPqIcEmfepGmMbSRjZxGhC8SfxJ0LKZ6QeR1QNPPkmHoI0P4cyAhUk5sDw2ljIf2S8ALx7oD7
 NluL01OFU+aMh8SceabLeYqHdwYWmx3uhtWUSSA5IGnEihl6DUkmkm1sW2Ojiz9tx6SOa360DCr
 YC0Oa2KRgsC52OGZhxOvhrEGmXQNzU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Some clocks in K3 SoC need to set the critical flag so it will never
get these clocks closed.
  The HDMA clock provides the clock source for internal TCM access path
of X100 RISC-V core, and from the real test case, shut down this clock
will cause whole Linux system hang in a quite minimal environment with
only ethernet, UFS modules enabled.
  The RCPU clock is needed for RCPUs which are two RT24 RISC-V cores and
it's responisble for running ESOS instance. ESOS should be always kept
running behind Linux, so set it as critical flag to prevent it from being
shut off.

  This issue was reported-by Han Gao off line, and I didn't discover this
due to 'clk_ignore_unused' kernel flag was enabled.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      clk: spacemit: k3: set hdma clock as critical
      clk: spacemit: k3: set rcpu clock as critical

 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260611-06-clk-hdma-critial-4b56abb70691

Best regards,
--  
Yixun Lan <dlan@kernel.org>

