Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB142049
	for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723308; cv=none; b=Q4d9mQ+U0SxbTzV3lU6J5GRKJpY5qJ1xSLpZYJsKRNtueY63wXnxKZz6EW2RFbdwoUISka2I8WhbASG8viyac8eRbDD2D9Z8Ya8wFpyipwKNODPaPErnCvaEeOxP7EWjQw5qeY8Hw6oEjkl6x/QVNm9mj7dRVcbndDPCm+vF8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723308; c=relaxed/simple;
	bh=i0TnZ1aoXb0Ga8elfzyeLZOHdqQbgEsJIWTTxkAsI4I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BOG5maned8RWOCWyzrkAhG3A5F08ZW+LNX8BY13hM/rJYngPsB56yL9njsXpfzyxG9XyEFAbkwzGQyS/Yfa0ruvgnJfN5DcwAC+8Zs9LrOEJBKsmh/REof/2LYk752Jz7qpd5JnC8Inb5+5Q2/K62yTwp3qq2riyKuXMrUurQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGwSWaI/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGwSWaI/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f57cd471so1676445f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723305; x=1769328105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/l59X7gw84IvvPUFApyUS2QxbtG2L8cFXaBBO6JtN+4=;
        b=JGwSWaI/e99QAWwk0a1rp8oJUtJvAjTU/wdBnYdrrxaeLwM3pW8mlOqCK0VpMAELTM
         Y6tEkdLOh+IdCowY/DF2Ovs6CIby81m2SUeEfhbb30kno4w3IOEEVGN1bLJI51PqXnXS
         +kZ6/x3LPDIbWEOGlxG+L85ycoYqVD59qBTQLPJqt3hOkWmzi+I/lnOLV0d+bbidULJQ
         a36QOD90wPvDnnBz8dyrPVNh4qk7K9zcacA1U6XWhQka8cPTyQViW5CTBbWI8A8BKH1A
         g2bf88B/lP9m5C53dla7Tjdk2dwBGeh2dkkFRAmIKvV0ftLYnFmFeFcH7GqEsTPXAq87
         euIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723305; x=1769328105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l59X7gw84IvvPUFApyUS2QxbtG2L8cFXaBBO6JtN+4=;
        b=wbV6sxWS/BD+d2SUIZW8cU0iETqJhoioDIIdUY+zaReIyaxLeUxBWlX3Hv6yO80M/z
         hP3DwcLddv4FjXZ//dQ5m1B4uv6z54ZcacJBzVNlBDhq2Ty7DERvwVeHXEQkwo2RDAst
         u1pxrSHyZPK5iFoG688hLvQwCH8WTZ751xJwdmJ0+Fr7m+X5sGnxupPLeYKsxisiJzj+
         fITDkmaAOo3z85mzEznjOWJXaYp9TbMRZFw5CjgX2ZBDEOEvbURHyQexJmUAXQL8qb7W
         p0bCAh/L5+j+3/h8BDKn4Fy7tMYBbco1j1x/jwixMVSJ4NHYJMVTSlc2ihp9iG2eaRSm
         Yh1Q==
X-Gm-Message-State: AOJu0Yy78UAB5T8tPQgbeM0f69/MpY8hVePD8mYg6sELUw1CdFzdY7nm
	ZY/RomanS5dFg81tSRBveo6ireCt1EAyKryXZTSZO6YdlmSo2Mkr0XQH
X-Gm-Gg: AY/fxX6AQIqrJTr+p9DVkvL7HXC8Nei1ZOIIGSxML9KB37KD610ggMW00nPHBEHI5TE
	r6g2RsoibLBZLUnTzBu7HM2A6YA5LtVLBXDqydcg9ohwXWOPgNAvxhVAA+ivg4ZN7ZmN0Njwn3u
	U5NDX2WCrqBu78akCpWfxLjW4IN5PMzVjJoYrl4WUSs5QpYx56n38O7m9+MjWgNTpA0SH35W/Tq
	x8qN8+KywaWs5gnLktNMFfRr2EMFe5/1Vs6T6M3r4OlqAp5Jot1B7cCvPSl5+/5r4BcKHeLfraG
	YA4FyqagsPppZaasr3RPDToFiGihtTlMOxKwbT07xp2ftIClhp0DBgiROXfOE34OdsRN35UbCBP
	U4FMTFYyn1YOrd+CNZ8jk7lyKxjzdSAQAhBNKARhkP8ccvUwgR1rW0lFxEx0pQejFWX62C8o/Kv
	CD7kn16JFBf17AKLL4eOXs0+Gl8HuHpKUxcwRVwfH//xPg8XN91dYlUpZhcjfILW1cWaiim1VAW
	CNboOg=
X-Received: by 2002:a05:6000:25c7:b0:430:fafd:f1d8 with SMTP id ffacd0b85a97d-4356a024c88mr8955054f8f.1.1768723304722;
        Sun, 18 Jan 2026 00:01:44 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm15463299f8f.18.2026.01.18.00.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:01:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:01:40 +0100
Message-ID: <20260118080142.2632077-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike, Stephen,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-6.20-clk

for you to fetch changes up to e897e86711b28f815fbbe542fe87a66b39123d1e:

  clk: tegra30: Add CSI pad clock gates (2026-01-17 01:33:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v6.20-rc1

This series updates the Tegra clock driver to improve hardware support
and code correctness. Key changes include fixing camera and display
clock hierarchies for Tegra20/30 (adding CSI pad gates, reparenting
DSI/CSUS), resolving a memory leak in the Tegra124 EMC driver, and
optimizing system suspend/resume callbacks to remove redundant runtime
PM overhead.

----------------------------------------------------------------
Haoxiang Li (1):
      clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()

Krzysztof Kozlowski (1):
      clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop

Rafael J. Wysocki (1):
      clk: tegra: Adjust callbacks in tegra_clock_pm

Svyatoslav Ryhel (3):
      clk: tegra20: Reparent dsi clock to pll_d_out0
      clk: tegra: Set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
      clk: tegra30: Add CSI pad clock gates

 drivers/clk/tegra/clk-device.c       | 13 ++++++++++++-
 drivers/clk/tegra/clk-tegra114.c     |  7 ++++++-
 drivers/clk/tegra/clk-tegra124-emc.c |  8 ++++----
 drivers/clk/tegra/clk-tegra20.c      | 26 ++++++++++++++++----------
 drivers/clk/tegra/clk-tegra30.c      | 20 ++++++++++++++++++--
 5 files changed, 56 insertions(+), 18 deletions(-)
