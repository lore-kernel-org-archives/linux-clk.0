Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AA2F0C7F
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774335; cv=none; b=JUxV7ZXlRGq5M7FxAB8nRMSYdPhPDAkLZfoP9QjeR1+Sd6LVjYto0N1xWC1rCnixmcA5Wf3ol6bZ6j5Z3yfkVczHRvaAC180ncKuaOBr8q8Tp0n2hN10f2pAq9xPW0LVbCGNMtF1OIFscpLwxhxoP/zHDhF72T+3v06aHu6+Ze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774335; c=relaxed/simple;
	bh=cbi8JJi0SO7YCQ4i7ZUO8e5i5/hE7NQb1CADWoXIQ7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjyvuIjZKSUhEkrG26VD7tauoyDqpoWDMZeRC504RO/X5tipbE84P0gzOKHNeFLRChGfLH4HAQPSIbL79RR0el79viMDoYJCQCmHRhU+0enk1l9KU3b6N9eqrrRgR8ajxWJVyWLXoKtdOg02GRoLAR4u+awXoUfy+AS1IdnbXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvmvt8UD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvmvt8UD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8837152db5so322737566b.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774332; x=1770379132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY8qjIxAVsMw/C198wU7j8/Ax7QR0zWZZ/ZBaLrr4ls=;
        b=Xvmvt8UDio1vFX8R3DbRFdjiaypMukV/aktzbaSWuA8PqjBGd1EjhUhHNUDxGuegri
         ltC2is8p7HPkpeQEGmLIrRkBDe+NcHiRR8IE+2StqYrMDmu5Dq0xN+ynO7ZKE7cgaLsB
         BHKZlkj6h97A5rJvSQRke9Ba/UvtDVlDuP7ORi8+W+5insxE1/pCip9HvzplzDv359zG
         5iHEIiMvl5bBjI9A/ouJApr1CQljcNVjkCr4FQ28UsHFpPOEtXFHOuDGCyEu4n71qqZu
         4hDxbbfPamoC+Exf2T6yTog8vHbJZnvRbexyeqitSMYEqwSer99damyTNJIPKkGpGrTt
         irhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774332; x=1770379132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY8qjIxAVsMw/C198wU7j8/Ax7QR0zWZZ/ZBaLrr4ls=;
        b=qqH04AbqtxNjf79MGkY0mrBk6m7LeImO4sstieZDviCj+AlbUA54pAdVcQRxWUxnV6
         qmRuzXZJ0kk50GH2GCLB7kbZfWSJHKbdA833EsvsWWR2KFx6gd7W2oK6Xc+Uco9aDzoJ
         sB3shwmY5bNiuwgKqxOt4nNkxduCVjEZ1rTawAh7QFDxujvlpXyR357kA1/laG0pEyaC
         kvfrMp4K2NcZUmq2lNh31F6Bk1RKEoYsMqU/wDfoigfH08GI4TKu4PUGGXD1+yuOgdJV
         PccNsAbBbPMMbo5TmY5MU+IuXmdN6VYj6YRegr+ClncsPX3Y28oOKdL7rq5eT4CX1yMR
         OdWg==
X-Forwarded-Encrypted: i=1; AJvYcCX/oT+vqVE/0RPfNUSlFEXXQYHLKtNvH9hOYrOjItyZfGm9xPNMATNKpAaO4S+LVuJky8VmI55sO0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMmIjGgt420t2sJj+IguxIqzTbjMWRx9r9XEd0mzEU4Q0vL/P
	Re3OS3Y+tRZ8iUS3R7N0JbFr92/aZRLLhofx4UVM0Shu1VQ2HufzzOlU
X-Gm-Gg: AZuq6aLy1v59EO4on0fqPRGy5TX/nwQr7Cx3ZDKFjnKNla/Kny26MLZWs91xLWuq9tX
	NLK65SgT5Cj4f6d4jZzRt4jLIRjypXXQURLwZ7U5hP2tyy17EktD6HuHFumXtFpAzB665q2MPxr
	WuYhLuaE4wvqZZnzyxTe7mHAhjWHkL+hpdx0St9YCu9UuVX7AV7IqJsk8ifVgKGvxevq/JDr+rR
	U7au9BFVfbMgmFt+a16JXZOyMNKiodJhbt1bY7oDgpWb/uMWnIBR29l09n6aPJYbrF2r3F19BBl
	0jsvDDEA9JL8Vz7pYzphDWSuD1w5fMVUWxHsLrK0e/KhJVrNiu2olYwBptoIoZ07L88O0fKWd9O
	1ghYU0Eu4XH0FvSNtJvebHrZeOLogqjmMvqCm5sI9MOWUZzWgh8eeYEPagZ1HWKKFcU5A2OLILo
	i+U/sKL22EJIlyiqN5U4JMJB8mjalr0TcyKcc=
X-Received: by 2002:a17:907:1b1c:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8dff722adbmr170659166b.33.1769774332290;
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
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
Subject: [PATCH v2 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Fri, 30 Jan 2026 11:58:41 +0000
Message-ID: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
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

v1->v2:
 * Separated ethernet patches from series [1]

This patch series is depend upon [2]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260128113032.337231-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 120 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 +++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 +++
 3 files changed, 197 insertions(+), 3 deletions(-)

-- 
2.43.0

