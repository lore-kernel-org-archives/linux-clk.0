Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD5A38F24C
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375196; cv=none; b=qLFVXo+wu04fF1rKZsynQN6my04+0A6FRcTg7OcbZs+THcZTdMo0cMvApufcyWVVYqHU6kDONmGnK63SzGdmjyk142JpPGsFUYXkoSK7ggIaRVrISdBFnSxdlMcNmMm+gAyg+WESYpBXBwauulhiJidmPehDi8TjPJZtk0Ih8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375196; c=relaxed/simple;
	bh=0SECqUzwFuDOkuMRS/YSRrygzvaLp2b4fw2eaVqcQ2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eo9ZXh+XWTpIAMlzbbf/iQRB3wNR4kI6+4yD887zKRKDC4BztFwfjSgG9LHXq8vYDnoHhOF0rYSskTjsZZNVzAvR9n4rHsxykH5Ye7iN7M+0gkdRBFofjx8nWoaYomFo/4nPLtqVHhhRbtTM1TZ4DKiEVuIusi7YnG/Vlkov8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfyTNOjP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfyTNOjP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43621bf67ceso396667f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 02:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375194; x=1770979994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJU+Y/OHyOyzpNv7LFCtS3L2+xMqX8KTcSp2BWkvYKc=;
        b=AfyTNOjPOXn8v+6uy5kKM2TlH0qEmUabtQ5Xc1D9zJ7aQt2P3a0eX668ojwyisOjDn
         ZYJUnyXmkYqqPaqsxDiMAa+4eymundH3b7uXrN4t6k2NzyXdj12aqY8NsysgduUbAM7P
         j1GI9/sJfwEFarOaHKh29NSdxvzzM0C08YmtRCXxEQxpgeobNdrLuXSPOuh3TykZkDlG
         2Puh6952HM769/74otBS0OrWSU9qepc9EwQ6uKdsOC4fCEVZkdhYRtUE9HNln5zLRlHa
         29owyT7bKsef9HgVhXuwEBR0ine+gJmjoU6QmKWaXi0h+rs+YFMfYI3Km6u/UExnEnuO
         fkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375194; x=1770979994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJU+Y/OHyOyzpNv7LFCtS3L2+xMqX8KTcSp2BWkvYKc=;
        b=QySfu9hgtMZPygNq9SCGQhELeRsobeb/LaLO5BGQoEN7CgiHOLrCRnez1r9NGgfe+E
         p5ExK+2mnFM2HzfniXcYaXrBk8WSYaPe1eWsKrPbu7UD+HG7ZC6e2i9nYgqZELzyrkIl
         4cGQhXQpK5q4gYxka04oKLHEzLvnCcNM0Tq0gjxGlRWJFABktxnzMHYuii2vlHtqHQIg
         Juy6wjDbUfdWKvTHOsLTEx555u1Q+9tdssALjIWuFu25ZVJ/3/VtkKQRUaHo03h0G2aa
         JKQ6k9yoRchq2pwUpJM/vS85IDOm+HQuI0L3jEG8ozC/zuhXROYXfacYyHIAVHjSbVDt
         4mSg==
X-Forwarded-Encrypted: i=1; AJvYcCWFfvf+y7wHVuAHPfrAZyAyIitBd10lzxUOe7Do6vhi0JTf0PheWd9PhxEptA6730QFmWWUCkxcZF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Y6JLUSxhU1CIphPxJ0BHfDAY/BjxOAe1Un0H21Ac/j/QMO4W
	wcjB9HqM2NlYdlTMt4eF/0MEikUPUTSt8BLX9jKCh5ZMCPv1xzaVRxjA
X-Gm-Gg: AZuq6aIsLamqI6f2zx2NQcqUrh83MS77bzpcytFh5n9A00Hf9fv86tCBbGI3urcIyGC
	jDMrqFXeqQNCcEVZMcpdmo11OZOvkdexS0aP2BfNQwwMD/BS5wAjurA77vNkheiNOsjEYNkj3m6
	hOhXSZsnrU/dal9q507TSv/cX8GqNF7TfrEBJ8uuWHOqkbF9BLMt48G0v8bKb4TiEpYj/oU+nvD
	D6mtig7bPaNkiRWgBAwkssX6/b7zDXb7aFrfIMxbZXNWoF7YfRgvfH78TivE2WUrW6o/brQGiDt
	6p5OMIPvlnfI1AxdHYWJ9vxkKbLU1gEvomaR3ETN86iTX5aYvd/k9vMIrIP7tucqXxKpSzMb0Ae
	EXkOV+3RuPsvX6Ow3JFVBT8S3FBDeX7c0gpneccwAyf5MAMeZ4ZgPrAlKQpZ9RC3XYcmAo6BTSA
	oU6vk7dcMmemroOHoZ3ow8+oUfxqgE
X-Received: by 2002:a05:6000:2585:b0:436:1a2e:9f1c with SMTP id ffacd0b85a97d-4362937847emr3452623f8f.19.1770375193993;
        Fri, 06 Feb 2026 02:53:13 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:13 -0800 (PST)
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
Subject: [PATCH v4 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Fri,  6 Feb 2026 10:53:00 +0000
Message-ID: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
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
[2] https://lore.kernel.org/all/20260203103031.247435-1-biju.das.jz@bp.renesas.com/

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

