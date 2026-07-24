Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96D1A681C
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 01:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784857301; cv=none; b=K8UXVfRanieKGr+BCtrimQ75f3abhx/yzSY9vCDSO5V0L1dBN/8HQmYfAbeTiw1602lAz1NrjSB/PndqY2CtMiguDppbkEwIF1F4YR1UuZWK2JPoGBn7GIMY1fvqXy8dvkk5cJQo6cTjPq5gA5MMS5/wYobAeS9Gy+YCUGzSTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784857301; c=relaxed/simple;
	bh=4NaP9cfRSTKLZyDm4ACLPj5o2sD1Ee8mMPZO3XtfSq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddgNbYah1b4lmF5CZyehb8HFcwSPghSVERTgKr0jXQMMbBDnejIm1y0vTezkFKm5esBMv2tQFcVOUuJJO20vkkJvuzI0GJSpcVj9ucCR/yj3HJPIpZbfNCG9BYFmK87PcNlbNscb5IHFHq6em0KuK6itFp409J2KaDpwK3k0YS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR6hGb2A; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR6hGb2A"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1219903a91.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 18:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857299; x=1785462099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PhdusKrCZ0G+z+XVMqs0STmYqBCbFnffrEyg5UHGzo=;
        b=NR6hGb2ANcxL0fx8KvZrGyfmmd+O/O1hBocDiamVruyAfsk5uvRuBxVnO4+8RDbs+K
         SZWxuq9vJzI0FDiEN5eTAarX2Y20zg6TUUmt1s1ehruWxV7DC4rBIc4WZJRYrska2QSd
         g1HD75HPC5+RHoqtJiUPy0dWUT7uA5BtjqoCRK47q/O4o3INYmu+Iez4/ECHhsskkyzJ
         XHd6HjnB/KJnvnJv0Zix88rcSfBBl86+eBQ4GoJZle8oPH6E76JZb8pzKy5BahkZ7oO3
         giIgi+MXbltH7w5vduOV4McbbJHeIrpRIpY0RtWvQ9c0ThJruTHEGfgJP0v4sDJSHpHg
         hFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857299; x=1785462099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PhdusKrCZ0G+z+XVMqs0STmYqBCbFnffrEyg5UHGzo=;
        b=BdjmdWkwCSbuZWPafg9lVhOuDtVQP9Q6kgCpa8d1PJuDTpahEVPoIrA1tdDZrsT1Lt
         17HXesEsGRDbD3M6sW9xCQzUt2HF9EWFzsrfSTw+WSB3v988A19xw3nfX17S1P/mxbmF
         Ga1KoND+L0Aoj8Npr8Mzbgaqk7UJdJXYLImdszXcSPvnd+/XVnmJK3HS/NZB9/iiG6BI
         6hy0oEror7uiD2mkkBWIzYH6SfsQ3P/rtwiXcjNiD98E3xDNEjWWhWPf7yfeSuidBNCM
         Qvi8xpco/htiDR5OSTBfs12oodYHdD5OCvxwBvAPGr9NAOfEpeeg6lfocXDUkr+QcHTW
         Oojg==
X-Forwarded-Encrypted: i=1; AHgh+RocqIr5iZTPIJoVq63HWGT2WvKmyQ8X6mNShP4Ns5VgUdvfpayGQkCo6HpsMGQQJpCaLBH14JGOyCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWdEqw+MInyyTIAnqRLOh077QYUKOlCsgQEKu67ggyTSuoHgu
	wh/jVphYA0gteiZoDwukOrrRD7jtjuFUoTNEvyaEh4Lit4JwHBNYcPUQ
X-Gm-Gg: AR+sD10olp9HZ0cP8UvtuU2TV2vfPJkC2YRG45tynT1kAjhvEBn1BK7I4qaqc4BQg8R
	FCTNQnwQ8fo7IpzmvdmlFg66TJNl8nJqL3eYZAp7flsVnTPVLyh0POXayT02FNyTtWzmjEoUOX1
	o+UiuEFFd+tNqsQv78F/opk326FU414zKapy34kt2O/cjkQQVonFKm/dn2k6iEtwM/4AtnBzaag
	no4prGWx7lykpqvu4b9i9XrRenq3mBivFv32pxhwil8sN6A/jkjyWmosiXu/9AqFWTI2Ws6+Cu2
	HySNvpPyZO9gHN861fzEIPh7e0mwQarWa0vVdU3SiGKH02Z669OksMoj+JsM/K+75yR1szsyF2f
	MUp/31Gaw+X7Lfv0qcr5Ye3ZT4pFEI4DeUDcbcIdxjnWwCXPEXTtVSdixlwq3rUHSTw3kk3ueBW
	dqrziR99dh+Q9J0Ng2jvBNO74uHkofbe5NmKPa6yQ+/xNRSd6WoU2jWeiP7KS3yMM=
X-Received: by 2002:a17:90b:1802:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-38ec697e80fmr5448230a91.17.1784857299536;
        Thu, 23 Jul 2026 18:41:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:39 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Fri, 24 Jul 2026 09:40:36 +0800
Message-ID: <20260724014039.1239552-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

v1 combined all fixes into a single commit.  At reviewer request,
split into one patch per logical fix:

  1/3 - fix div_u64 return value being discarded (affects both
        ma35d1_calc_smic_pll_freq and ma35d1_calc_pll_freq INT mode)

  2/3 - fix PLL_CTL1_FRAC mask width (8-bit -> 24-bit) and update
        the fractional-mode arithmetic accordingly

  3/3 - fix ma35d1_clk_pll_determine_rate: move find_closest() into
        the configurable-PLL branch; split CAPLL and DDRPLL into
        separate case labels mirroring recalc_rate()

Changes in v5 (vs v4):
  - 3/3: split CAPLL and DDRPLL back into separate case labels so
    that determine_rate() is structurally parallel with recalc_rate();
    add explicit default label; share single req->rate = pll_freq tail
    (readability suggestion by Alexandre Mergnat)
  - 3/3: add Reviewed-by tag

Changes in v4 (vs v3):
  - 2/3: add Reviewed-by tag

Changes in v3 (vs v2):
  - 2/3: replace the manual round-to-nearest expression
    "(u32)(((u64)x * 1000 + 500) >> 24)" with the kernel helper
    DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24); the result
    is mathematically identical but more readable and idiomatic

Joey Lu (3):
  clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq
    calculation
  clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional
    calc
  clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 43 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

-- 
2.43.0

