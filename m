Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052732DA76A
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754915; cv=none; b=UrJGSkTk/0Q9nPh6HmW5H/Wu1EjXNkeO/hRosZ9rZTRt0LupdyjX9vfoitKg747Bvz6W+bjAQVjY4oCfUzpivshg4QzQuuAg+wA+yDnycpnhimm3m3Kx3xe5fDUF8g1kku367nd7aEDTONdkDaOMmhhUqDda5yet2HLzfFTT8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754915; c=relaxed/simple;
	bh=yssZF7K0Fbv9cwQQlBewlNdZddWwBq2PpzjY6jra8Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHb81XM2O3NvrjrLhDRC06ARY9bNT0ZPA+mgecO9jd39HOnkcwBO9tGM57LvHqkLJgJnJLb9aC3qGpBVoySw2rh6/Jq/U/ltkQ+Z/1dNbvyEwEJYjW+z4clnKsgH6v8fdrcWD6VfZ9RsbGXILz3eJHTR1ZcPlWSmgA3OBBPGIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDbDAgP7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDbDAgP7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a1c28778so74834395e9.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764754912; x=1765359712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KjAbD9vfYKFGC9wpIjH2Dlz0vt8hyP7o1r5A0opOOA=;
        b=mDbDAgP7eoO5fQZBOnvTtlCPFEnrLFE0cRNB3AW4CpUL+UJExEV9no+uUWcXzS5RGP
         PHoXYIoryWMr0PnXUqygJrZpQVh4bDw3iSlsuXdR6r77GSKjljUyC9lk94rMTBm/YVYc
         ZHXpkT5+sl52YN7ksC3G4QDW1w1Sb8IRXHQ2ESW6A2SyvQN6Y1dWlrfEdVnz8v3sXN4D
         NPSuBD0hTQFV4Cz/nosLodC0V8NOS3ccxFrluC9tdL/pyCj8p1N+rI+jreV6YxpUVfVd
         c6M+Ww1vvAf9p/VHNpdafDKyzzJF94BzRRs5IeKxQjM5NyRpvuocwrO1evB0PLP9V/hy
         KW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754912; x=1765359712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KjAbD9vfYKFGC9wpIjH2Dlz0vt8hyP7o1r5A0opOOA=;
        b=YhYl1XzpUUSvKczhQjO3Q1FOlXUbagjSoOTR0eWX1WPPSvvaKcyhIuzkQVbbHBbour
         H/ka7hqbCfORhobfudHSnxP6Uz8+IjQt1MvVdeKx+QQYf1Lp7Tb6TwyU9l9iStNMLeQl
         OCZe9Q0L10mttHl9ttcqRPR20NBZWKdwRwiEL8ytpmXG2a1c1rw9Q848z6HNvsAG4JR9
         j5rQqCawyh3Ex15sC6XVUBsJcEtFZJg0buojHpBeUxY0Q3UsP+i29X41/Qw0wru2KQY8
         f5OO0PCTbXaO8gJpcaSfR6jNxYR9i16D7IT4gHB55cwyufOxvdV5bjTUKpSrUzk+Hf1v
         H00A==
X-Forwarded-Encrypted: i=1; AJvYcCWv4iI5dqspqW/4C+ApJ8A9gWpVDNtj043W6xTar/M0FhWwsieSYWevGj47kW9/GiaCT9h+jjgC//8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVu/oWmH2Y8x/zIBORliNWbugaprjXQYWcl06z+60dGAr4ceY
	jzUXXAH9Ydz3oHgEmwG8rVtZGpT/pPvDOT0N1RdovCDa1MfoCvKo+xFP
X-Gm-Gg: ASbGncsC8+MDL96yjRVPNwsgV0VXEg2HkE0MRuUM8Y1MSxvhEJK5uq5vv+DL29tarVD
	E/HabSUB8vhjSurPUyMrAOOpNTVGWIPwFa7jt6/GzhSoRZPFX9xSFWuOepFh6aH+LGkgGBtld+0
	lCHMVJ0K0w5eVKixZh7/FnJJrifxOmXfw9ZURzPaIm97Wx9iHxG58O90dYXTufx+SUCDH5OOe6b
	QDTdwxSl9lMVeHQI8a7IxU+KIA57WJ4mtEwJ2ayJ0JO/zHRPx5l7AS3v/JLF5iK7aw2TTwZmyST
	0CbHmg0V6n8zUdisBLk3ITZsurTZQi7T7ZdowU1yP0utqo7ETZhygQmPtljK5TNKJzhLcrOJ2jL
	t0XlYQSstLA30oyRL4OHX4+XPvpaV787yOcJntHDEkhYP1MEzWWYD92BZVaEb9CwMHHz4GuS2QW
	272UD822xvqhyS0AwCi8s75XMwjM8cbKn9Q1KIBb1PmLUj0g==
X-Google-Smtp-Source: AGHT+IFOKWCtBrW/auo2VdwhYd5bSuu/9kFVql+wt6gQtOyEU3WrjtFtQvCmx37Ot4A/J3ttSP39xQ==
X-Received: by 2002:a05:600c:3592:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-4792aedfbbcmr21374945e9.3.1764754912185;
        Wed, 03 Dec 2025 01:41:52 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7655:4344:c8be:eb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a87f8sm38632815e9.12.2025.12.03.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:41:51 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RSCI clock entries for RZ/V2N and RZ/V2H(P)
Date: Wed,  3 Dec 2025 09:41:45 +0000
Message-ID: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds clock and reset entries for the RSCI IPs in
RZ/V2N and RZ/V2H(P) SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g056: Add entries for RSCIs
  clk: renesas: r9a09g057: Add entries for RSCIs

 drivers/clk/renesas/r9a09g056-cpg.c | 126 ++++++++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 126 ++++++++++++++++++++++++++++
 2 files changed, 252 insertions(+)

-- 
2.52.0

