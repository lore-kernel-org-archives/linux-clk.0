Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485EB38911B
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523215; cv=none; b=Z6Vsu/PAai6GuflqufFEaBjRTqv2w1QP3p/YQfwRE8lPbLeGPFuPrruInFeYf9a0HFxPBOqmMa7jMjC0oUheHqNx6mkfdjWUpAAZdLMknBqXgQJejJEoJo/3qER5Zt/9Es9viYR83Z6/YK47MAIaoeGWkImLzWGO5YaZk2p4unA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523215; c=relaxed/simple;
	bh=G+Y/G4ELK2p87HSpdmbvoW3DTLKvxeWbhDl98ZF1aZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpOLXIC30eds29iRS9VeLySg9M+pb34/45xgzqoqaRQTJXZww10RoNE5m7Y5VdMV845/xV4fR1cIPDMvbNhjdZyG8zt2L7p5prZdwKq8lTSr1rlG/p2aBL+Qw+RYYvuyzMNguDqG0iebmLMIgB0vxV8BJY2vK0eJPp/xbMIJT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvDJ41f8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvDJ41f8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b87970468so789332f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523212; x=1775128012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ywyE0xSmTWKuu332KX+kt1wb7US9niERfVx6FOIzGg=;
        b=AvDJ41f8Yz6Ad5bDAWV9+7ReQpoxhmQbNMUl6+3TMyv2MTpmpSyaHZODZ7UyLz3vho
         Hlgp6xY7EZPtcadaIy1UQRymd60SepE6NxuFCVi6mJc6gW//NdI2dHJ0g40m9Ub4Sp0N
         ZZX7+efw1d13b2TUttHTIN8aIQxqkN808GrFmNmY6UvXcrbbyDQ37n9JDx0iqTO7n2mw
         edEzeGuNlp9otzGCuSKSZDUXTpizMkEbKq1rSx29y7xjVsYxkwvCkoon8JVDpWV91QAU
         aoX/0RcY922GS7hwET3PHK4QHvLlxwSE+aW7Z9zvjPsDTst3UgVGIQJ7LqJIRLOkJHhB
         RJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523212; x=1775128012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ywyE0xSmTWKuu332KX+kt1wb7US9niERfVx6FOIzGg=;
        b=AJnw7aqx0BwIlkedQV10MnpaJDMmccGG0wxMqTZnbIXRTJpfF9PyYtJ3dG0xXXMULS
         dfJ+Ud56SsmhJuq6imhnf0QmMYtQ7YqAtVSkD3Das6QYoPxZCcAfk1LD+IEgDZZdb9UP
         Ab1nEitkFD1eKc805UzxQcdK2bNTvVDD7BPngbifbqFnH8xtRwcA0XHSBwdQsCk15+jT
         Y0eH83xwzZtrvzTTx3PMOmSFyPyv2zE5pwqDOtAKX4ZdkewrfQCoYJPU5qtwU4w/PqZm
         Lvs0shfRnYQZU4sojN/Zau80VtiySx2Oya9AQR1fksU9/lWvIZzXjHYbLhONCSZhejMZ
         9S9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoaGUOWrEuMFQAAIC8ziTiM4Vd029rp3JARiiRlwVXI/j0iY+GUY09+emrEtFFNLk9Aew2Qb14z9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/0nULnRWYHP8mqcKHngZcR5qdqxZ60gwzo5/jvk298v5qtinR
	7W6+2xgjYyx+lN9j/AUliyKV9g1FepI+4vY+ZCKHdShb6P4bdDplrdbTKRSv7w==
X-Gm-Gg: ATEYQzyDPBy6Mp/ZsxkVFq6nTExkt6snyGnLKbu+b2gJtxYQcPH6k05BaBPjNbOL2dJ
	/1N1EAwbZuzhA2A8sFUnk/3vxEnEk6YxWkYIve0uYMY5KW6hxDsWN9d5obXoiypAssgDuTpVc1i
	Gkvkdz9BzvZDaSdOIO1f4DwqkP1GqldGwq/gvEitzv+KaBKMOBMdXEWegWiXjU14XMe3HeS2BA1
	I7nQH+q/BQcBarZu8gesUN5nL4KjLR8PEYDmJKDTOfu8xEKj/cISS/nDnOgOdtgyo9+vGZsa3fh
	KZOuQ+s8vG5vRz6QgIJFKinZV3g/dBJwtFA5Gw9ZoXSzp5B/FxQj776CuRs1CmsgD3ebPlThs4y
	s/+nu0CmLHrXOgG+1x2o7hr2k0yUeB/+KZmgxclb3gaXW8BDCC7/XciKg+TLOYo0hEJOWZW1uDV
	NZjfkPbzYGV1icwi+Pj4e9j63OMkiN2Oc4WKGrAhQmhcn+JlMh
X-Received: by 2002:adf:f210:0:b0:43b:8f56:1e1d with SMTP id ffacd0b85a97d-43b8f561e71mr5352221f8f.13.1774523211372;
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Thu, 26 Mar 2026 11:06:34 +0000
Message-ID: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v4->v5:
 * Rebased to boot series [2]
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
 * Collected tag for patch#1
v1->v2:
 * Separated ethernet patches from series [1]

This patch series is depend upon [2]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260324114329.268249-8-biju.das.jz@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 153 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 ++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 ++
 3 files changed, 230 insertions(+), 3 deletions(-)

-- 
2.43.0

