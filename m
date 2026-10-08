Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AB1B4F0A
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 06:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441810; cv=none; b=axl2R4w4lDp+f9NR73YDYoo+BzA3DSWHqqbktKzragVZOBnofEypbOlm0AWVVF2raHgOEOXTVH17nKv4nC1veyMvk3K8E8BM8Lyne8unxUj0LMIm/Gw/ClNyIHr6r5m5PvBV0tef69xSW6sKQ0I6xqMyTQHwwFHSkdcayUMZ4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441810; c=relaxed/simple;
	bh=4KsUfaH0mpfFuhNkFNZouNlDk84uGW2J1t0zRsLPJVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6lwl30Ve43mrGDyee7ddlB21COqdrJEHkewDAHPugt9UC2CL7UE44iK+z47aLhR3aYjZqsq8VsoxO9NJhoWZtMgH2yIbpwTyS8zJkrpMjlMOJUqCE3gxEduWsZ5/zI3uBzxF5EWUzfKfn7wKXG453Zb6H6J2YkYZULdOHohWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecbcxESf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecbcxESf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e618db81c0so10726035ad.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441809; x=1792046609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=ecbcxESfYgr+f84z5pPmKca2nHSOGvw2SOKlX9vYn0QsYYwLiDH09yswji1xdaT9DC
         +KOGAZLqbttlvBt8hCEntcfzH+zrAPXs3QUBd4jW/9iFSM4XQKzXEWoNT6G18IkeQnAC
         sb7MiJdBrYpVY1I7uNC2U/JcCjZDc6GeQd0zBUu4HNKFVkcxW2+AXBZjAJYQE/c1xwBL
         f9AoPJdANVjBgTfxjizMfpKPYZkhKHjCDTzMoDGxkG3pMw0IRDA7gIeANDOIxK2fgjqU
         YyoBa//5LXsanpuBeOFHOwhm7JR26vFIs/qNVebeTtRf304ueng1EQt4rapQZx5uBt8s
         mDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441809; x=1792046609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=INKpblDDypLbqG3971NJXr/ZBo2mNFp1ios6YaqpdK0B8o6rgKKDQpbtGbfSPO4bgf
         2Y6Opid+CRIE6DxWmkYLUW4A6XTmuZlNAms0IrlWNnzc/ZTmIjotV2FlxaUkPxQeNQM8
         vjxDe7tifoxLGypitPpc6sExAo4CS7C6x7hjix2ILkwGwlJjtAX6PMH1RXr8gPPvbYk4
         cALMBJHQEKoEku6/icN4yp9X5nNCHju1egULDEnGvGxLDVW/5YFPytucuz8ftIMMbSlk
         PmRAr4HoZnjK2iF/lYv2srBdtcVRQmzoGkBBn8ZJg5l3YxwG6PdqIf60TgzULxGPCic0
         ZuNg==
X-Forwarded-Encrypted: i=1; AKwUvBzcYMOh5iun1qARTem4yCMNS7R0NahWLle2f69iympX1tQQISGcz4gC9Ky6N9dwja/JvIJQPYhbJ08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE3zvfBnDJ4a1vUnhYLny9TxlzNpqwVEIkwiZklh3Fx3Dp++4U
	6Ao1QOExfedEB7Hhd3ZvBvbq0W+yaV4Iej1/7uqLQWhriYJw0/P5bTvw
X-Gm-Gg: AYBFou239gdEkkd06ZzhyBxwHEKyJK4mbOnyJTIvdkTF2nBOG24HZqiPEBk4CTfuoS5
	ymdu6aFaIgbzZVeV/G2iUTRgxzstT5Ae0jW4L2ZF2j59mORtXHZiugQSMdzHkZ2gZQjbpH2wnoa
	h1qV3liLXFkDKI+lVCP6gxr9eZ8xWCGk9p376cbdZVX+22i9pUYFVS/cMqDx1z7+nUcq+tV1P8C
	RkjYuh5H71JKO9iEgJjl++vofBzpluK/G1rwLUP5TAGreA4/njVP1cK11T7qV0mG1MEbS+rEFMR
	5PQ/1stoX+OunvkSqFI/9v3f5g0kCeijy28RtK4MoJzxM7AI6y4/tqtG+iK+UKck1gYAMJm2sZI
	njfgmv3+Pc9y/EgnOyEAP8nyfSTY97NNTsAkS3G0vaHWARppqHGlGq9nce/ujhlwqgI55tZaawF
	ogWnztiFzu0Vz2JoYPt5X7EnlVTxHDOiU0zb/z/AmNU5kPj5vWWbwV8Qn37iBTwEIixz9TlDPSy
	2SWKPuA05Eq9rRaGGN3wO5pnbdP5nwYNlwr8YwATpf7n+x7ObFVSse7IKvwvDG8rhGJrq16Bw==
X-Received: by 2002:a17:902:ce07:b0:2df:9eb0:761a with SMTP id d9443c01a7336-2e60024af5amr39693995ad.25.1791441808967;
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:06 +0800
Message-ID: <20261008064307.2757324-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 ADC clock divider register implements a simple closed-form
relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
by building a clk_div_table with one entry per possible divider value
(up to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
set_rate(), and drop the unused mask_bit mechanism, whose only call site
passed a bitmask instead of a bit index, causing an out-of-range BIT()
shift.

Changes in v2 (addressing the Sashiko AI review of v1):
- Fix a possible division by zero: 2 * rate in determine_rate() and
  set_rate() could overflow for very large requested rates, making the
  divisor zero. Rates above parent_rate / 2 now short-circuit to a
  divider of 1 before the multiplication.
- Fix the mismatch between determine_rate() and set_rate(): both used
  a ceiling to pick the divider, yet determine_rate() reported a
  closest-rounded rate, so set_rate() could program a different divider
  than the one promised. Both now use closest rounding, as the original
  CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
  (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
  range.
- Not changed: min_rate/max_rate are not checked in the driver, since
  the clk core already applies them and the previous
  divider_determine_rate() based code did not either.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.43.0

