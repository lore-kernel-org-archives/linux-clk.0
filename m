Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB3372B31
	for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795946; cv=none; b=MCqvUKQQ85G11dl/6fTKOISg659zRgY/wcqBVaZQWPzHGGFE0Z9oqlK6k2HW2xLCq1xjanyy0LhurPE2wbmN77YNYiBjtQ7kVzHTqtS722TOeJYvaWjkQxfIu29dQcJacvXsmRDkU1vq3BrAKBWtXCVe7Ba18kLPYYfVtvxrUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795946; c=relaxed/simple;
	bh=OA2SAtaM5GAvnUQuOtRhKQBah2SboZxba9T1vZgAQwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dJQxwqemZc8VE0DwMvkDpHOoTIXkTvPk/zzPiYaEiU5DCeQjI00WUVpt6WkFvZ7cgZlmH/anjd5eOAPzQ99dyfa5nayUQPaAliUbiXQHYob/nGfhXNn3IJmJZM4/+QZKtPowz4stZKOFStGb0FH3NdAHD5iAnaA6CturCkfugzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX9T7VRP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX9T7VRP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso24098875e9.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795933; x=1777400733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/UCG/jF/YNQeaerqFNPsBM4UfLMpOjeQUlbgyuTr1M=;
        b=aX9T7VRPtx6HfETIr09Wv8E9mXQp57P9UY1l044irLE4I71+Psu2XIjAamJoNpxOVf
         yhB30q6i3lt4gC1+NdYirpG9vb07x4/BNucpLPhMDtm0TRecQ49Jl4DczjrwXgQtOmob
         Tkq0BD2ICIxyoXATaeUsDYW8tHiJK6y4zXuqpubGl/e/GLDW4bcSwl8lRhNKsyY+hiKx
         q8/cCAkuEkbnU9JQf3TvOPNPb3wyOUSYdJwv5+JtBcs04GTcbQqGj8rDkK6rtgpREbn7
         0Lji703Lov0aaSPwGqQj9nPHCaddfaAVj3rItSVp6mYoZjKLDtre/7IVucSJMJa9Bwf4
         ULPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795933; x=1777400733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/UCG/jF/YNQeaerqFNPsBM4UfLMpOjeQUlbgyuTr1M=;
        b=cHeVhAexSV0W9TLT/ozXEBltZ53jSlxqTnt1uaERJoox42B6R5hJXLyxFn3FOX1HAM
         z9PWxpcsTmPCFRS3rhvrxWslZIM1sGAH9aNpA1tepibxy9+ZESzLw1RrHIa71dlpFjET
         n4BNG6e7Q8KbqNcoOWftvDnWUBiEBLnTROBtJmkPs8o+Fy11DA1wtTztQbwnMz1+vPJi
         jpj6vLFHiXmDQqK6cOLvvADuksGOB//vVEpdvNA/dD6RooLemzkrnCQGZuwhD+YFTbhc
         DYMQqegH1MJi8K2vEOQtJjpiNaRwjCHAqkLeVJ7jIF1Nr81cl9ipoYuRf5bLSZdSsiyj
         2IwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tMj1KhQgBzP1TWQNwaaNXAtzRNlbONzVirMc/mXhXm7eSf2j5QfEJHKlHymJr3mKzpsxSNanmQJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjn26d/NdWhNVYmVg/+oJF1m6Qz702qSN3tVALJg51b5lumBQa
	sfNYQ+RJwwG1/npvYUjzS9BBrCKkgS+SUuzBX7E2fgnOR7tytQtjBadF
X-Gm-Gg: AeBDievWYr7QEgmeYh0n5fAlwlgckvmPsbORw94w5o757tfzdeHHTdk1I1IJRLf5/P2
	HypZOIib+oxzqHHm1PXp3SKztd/HiEZmQBFFKLcucu6tLsXgVcdmlh2+YmnO99LFN/qJ9Hjsfzt
	XEyvcKM2Opq/SBF1BYyJ3V1UyiKuDFVoENYCDYTnyJ/6rQGRR0WMhxOvxL1afF/A+CVe8i0Pznp
	k9V+0m7rh62frf99NCdX2EsVS8ddJVaEixL/TWoSiroXeOBMi5rM5XmgZLMc7EcwdHbdVl3aGFC
	fXTxAwY0nTZin6ccEqcSuQxRzjYHATA5oyXG3p/j4Y66hVbwxULW4gGpX/gv2AZf84f0C3qvgyj
	h1vqAkNpWla9awWEjlcl1Sv3GL39Tqeoh3N/ATMcfTtH2XCF0/2jHdf4sIb/YZUfi/3Bx5pGqqe
	bpuBeIw9Ff7t0C8LK41aO4xFuVT79qJ1+Y6NkZ9w7HT49mfi/JZNyiLLXX8WWiB551NG4GXdLcK
	WFx6LIf02A9zg+662uB4X2m6k+ZZWBVUyvPk91gTEHOd50x
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr223852205e9.1.1776795932825;
        Tue, 21 Apr 2026 11:25:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d3da:32d9:3f08:c6f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891941e05bsm66621565e9.36.2026.04.21.11.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 11:25:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add some kunit test suites
Date: Tue, 21 Apr 2026 19:25:24 +0100
Message-ID: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v2->v3:
- Added Rb tag
- Swapped the order of the patches
- Added the expected value in the fixup patch

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

# case 1: Without the fix
-------------------------
root@rzn2h-evk:~# modprobe clk-divider_test;modprobe -r clk-divider_test
[   28.584792] KTAP version 1
[   28.591070] 1..1
[   28.595258]     KTAP version 1
[   28.602327]     # Subtest: clk_divider_bestdiv
[   28.612609]     # module: clk_divider_test
[   28.612618]     1..2
[   28.627986]     ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate​
[   28.628793]     ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   28.643341] # clk_divider_bestdiv: pass:2 fail:0 skip:0 total:2
[   28.658389] # Totals: pass:2 fail:0 skip:0 total:2
[   28.672085] ok 1 clk_divider_bestdiv

# case 2: With the fix and no changes to Kunit test case
--------------------------------------------------------
root@rzn2h-evk:~# modprobe clk-divider_test;modprobe -r clk-divider_test
[   43.105680] KTAP version 1
[   43.108854] 1..1
[   43.110998]     KTAP version 1
[   43.114449]     # Subtest: clk_divider_bestdiv
[   43.119601]     # module: clk_divider_test
[   43.119609]     1..2
[   43.127192]     # clk_divider_bestdiv_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:71
[   43.127192]     Expected rate == 1000000000UL / 8, but
[   43.127192]         rate == 500000000 (0x1dcd6500)
[   43.127192]         1000000000UL / 8 == 125000000 (0x7735940)
[   43.127578]     not ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   43.158547]     # clk_divider_bestdiv_mux_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:141
[   43.158547]     Expected rate == 0, but
[   43.158547]         rate == 2000000000 (0x77359400)
[   43.189942]     not ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   43.189953] # clk_divider_bestdiv: pass:0 fail:2 skip:0 total:2
[   43.197828] # Totals: pass:0 fail:2 skip:0 total:2
[   43.204592] not ok 1 clk_divider_bestdiv
root@rzn2h-evk:~#

# Case 3: With the fixes to core and Kunit test case
----------------------------------------------------
root@rzn2h-evk:~# modprobe clk-divider_test;modprobe -r clk-divider_test
[   21.006247] KTAP version 1
[   21.009423] 1..1
[   21.011565]     KTAP version 1
[   21.015135]     # Subtest: clk_divider_bestdiv
[   21.020189]     # module: clk_divider_test
[   21.020197]     1..2
[   21.028241]     ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   21.029020]     ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   21.036313] # clk_divider_bestdiv: pass:2 fail:0 skip:0 total:2
[   21.043976] # Totals: pass:2 fail:0 skip:0 total:2
[   21.050732] ok 1 clk_divider_bestdiv

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
    handling
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests

 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 158 +++++++++++++++++++++++++++++++++
 4 files changed, 184 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.53.0

