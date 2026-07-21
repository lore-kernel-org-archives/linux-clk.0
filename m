Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79913FF8B6
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 02:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600092; cv=none; b=aCG/2hJP+T6VZ2jZxaODYNRN+N1I4hSDTeQNe6DDggFde6lWAhW9LLGuWJiWXbuD4qUPyi/Q4COL5rOa9y1pmRg4Ij1CxljoswsptOtFg7MBWd2rrVsTPvzM7fYtBFf9+5frFdMCoTl9ZRUjHUyOlRkWcp6J/WHyS8Fmpb+2Am0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600092; c=relaxed/simple;
	bh=c+cvf+J/nKkXqq/PWsPwzAFOVwmvLuijIoN9bnHx/Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuGZ6vQFzfut3J+/KZuADnEhxTRlGMeTWsuCi++bT92tKJT1rClk210KVwpwMoA6WOj3/m665BS9kR6cdtOqg+g62dUjz6qA6L4bYt9wrnsJ4n0rVC4JFwMo7I0Hhnk9RW8QV9GXMPXc/Sr0jqgND/MTGqt+Wkv1eoO42Vfu4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQWv6xaN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQWv6xaN"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so10212320a91.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 19:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600091; x=1785204891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NUPIvRLKWSiPc+3XpkKDvMYecUDiomRS2Pf6sjZ7Uw=;
        b=gQWv6xaNa8MzQZn0wluxIomHhEuRD4hvMyY1/WMPRoZDveS77GGTo+vCCFbQUFH7YJ
         CMCvreKBGZb+ak96MO0nt73KVNazwyfCknmocsHI+uqKIqiD/M/xUj0VA2Ty3E6F53s3
         hUMpsvkS9Ut0cCEXg9P+mhAyoyy+PeMfo0/CfsZrCuIWbcKEVIRjTwt7wjn36dFJbqHu
         NLR5ICe/BEGUspGOoJOq0p+kv75hkKSSuU2bG8GO4X8RQOI8CqYN9Qsa1imMjdu8TC98
         R0z+mO1njV2UTfGTEnsVq0IUGCIFw/rs/tP9GizLMacnuS1iRI4WmrOmjRYAPJmKa7Fz
         Yq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600091; x=1785204891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NUPIvRLKWSiPc+3XpkKDvMYecUDiomRS2Pf6sjZ7Uw=;
        b=OBNHIg1sPOb1cRavLZT4Nj7aid/m2/+9jeEoSu0SU3pjuPtBJJ26ZgC3rQmRHiySZv
         hjJoM5jmzTlI+DmMnbOZaAtrp3eYrCm25hAfvtHTwbucK73KdQzSvfSR+RLDNc6QGSfT
         NPR/JEbjSZrcyz5JwGtWNXbw20AGXXoewtwwdDIvlK+0wm0RkciNQJzPKx/vXzsUQlGz
         gMdHwRh3PPozK4OgE7/AXCYQzJDk9z5paQgCV0zlFXyqkzC1Dg8/28YlYdsRiZLXBzUU
         DGCVd14T6Hrx46VhpgDu3MWUFgVQPrpm31bvPK3Gt3yxDEnkPuyxZGdBxTSx2NL3OW+M
         MbPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEt4Y60DpstBw0hE39V3PztI+07nFARSwsQ+MnfG8z8M9vUMHWnISbfTgqY3sQtKFevuOS38pR0qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uLaQm06faWM65RKodOTMhUjJS9r7cy2dM3QkFNU//wdlFq61
	eWWvhR82AbnkUelxQhabiCKUZIfJDCnW7nAejgTjWXaC2F3SG3otIqNe4cFwwQ==
X-Gm-Gg: AR+sD107qcaZU3T7pkkDDlo6qeTzECRCqiq2varOl4a2fkMNmCpBt2Ra/d9lLySl7Ie
	Rz3vBcWAXpIuJx0yau8ALISE2O+5uLacjcQ7kxUi8wkLuEaYj7VuSfLRiUx+LVJnbcVI4N7Huuc
	lEeqtWcrGmCSOT8IE6xl9ruVSAWAwJsN85w73fcbhydf8JLJ4q4iJN3st4BnDyxV0Xyz/+T2+2d
	yrsl7lrG7L27Rc5WHWAXP7dzuhrQBeasmyBOgdcdPma0hn9twsM8beM2NFGkQDIfAJZIttGKE1L
	KtDE7OUXnYXprwcHYPIdIVE5qWzYS8svDm/A1U45unBiYPoBqYRDaVlPOzOE3uIkRVG+C4wyZ9B
	JxUgpeOYbywDwAFueNEeKcDUO9GLYptlXYU6+4hUII6RRwGRh5mIIu0X055JXJ5e6FdmsJ50fb6
	lANLVJaIIRhnbx1vMwVfVN0h5caA2d4JjEljYtpK/QMJshYZEqeskQSVi/tHZybIY=
X-Received: by 2002:a17:90b:5905:b0:381:23d5:693f with SMTP id 98e67ed59e1d1-38e4b534bedmr16004770a91.28.1784600091023;
        Mon, 20 Jul 2026 19:14:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:50 -0700 (PDT)
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
Subject: [PATCH v4 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Tue, 21 Jul 2026 10:13:53 +0800
Message-ID: <20260721021356.288506-1-a0987203069@gmail.com>
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
        the configurable-PLL branch; unify read-only PLL handling

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

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

