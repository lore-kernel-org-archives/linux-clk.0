Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0E378828
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284718; cv=none; b=hJJP1Bq0palWE11pZI0jabt0i8y/RdxmiVgTdCoM+UkCUTJf2aL4+XGtSTnpc+6assMB33d7gT1QE8GaR5ACQQ+tLkUe0bUEtnEgaUdqMKDDMg7lgyfVVJS+vsWy/1N9YczDnZWHXZe2oO9x3vMqqYXANmofYfrPMm5TsXYfOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284718; c=relaxed/simple;
	bh=xFxnRqrRJGHu+kpzHXNX007froimS4Mf6K1EqMERvfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBg5L0kFLIoD9FX4ZEzBBBajk5Ark91rrL/DMgPEJTtESBD/AFUWfO/HViriULbcINIXKSptdmladW1oyz+5GX9MSrofNxL6RvO9/NAwmFiBZ3QU81mxnyd2m8AdeWlRXqx8XQOWCEcwFbEKlNuGNI82mlqPLUYK1PU9MF51bDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdG5k64i; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdG5k64i"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so698667a91.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284717; x=1791889517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czQOWa8cjt56wAmW94IPDCWghKrkTEoBCmv6pzxyFfc=;
        b=qdG5k64izNDnRwNLAaKtbiV7HNKuZhk2z/9E2xCNJD4Tp41uw0okB2aHM0aeriWRKc
         WqukmlMDjjijjct6Xp2PCF7PEgHY52xZB4GovKEIyuvZdouunJ6xC9iwi8JRXW8wGI2m
         WBPCEOkBNa+5ysrBSVDoGVK5t0xSVDqBn+N+nXnDZkT44b/Wp+0fs29c2QvrMwIrevUN
         0iR9MrcZIP2XOpdJNblBwx5KEiQDwPMGz6cHhztUb/XF2i+6NEkyP6Krkz23GzbJRiOq
         Rx3rudIC0vn4hr+dzQVeSNtdO/tDFl+3nYLr6zy9Fkmr9WFQJ+DnmZhHXyebUOCiGPaO
         G0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284717; x=1791889517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czQOWa8cjt56wAmW94IPDCWghKrkTEoBCmv6pzxyFfc=;
        b=Yqxa5yf9iFkqCdIScdFSOkxX93IYlH4CJtkB246+YQoqjICo6VTABHb/tSRl5eDtNz
         M3G03xdnl0u7+7yzQJVJA98i4y1DdHc7qyXCZuhO9lhM9bmuw00Urv3w0TckQ45iDeXD
         hIwkzo46GC5bi0N1ZNH+mvZp2CzsRzzOYDYPp2X5kvrmn+yrk3cKKYzg0yBt7quQawCr
         BOcQFRroSKf8Z3GaiHOqoNFRMOm0P71aauOh7A8shM3QT+Xct6BoqNWj85QHRFJdmRGI
         YCM5mApEseMFH0JwtiCddpHhtJjOGtMXkF8rclseY1zzxCSL71RaH97Ktj9WdJdthEm8
         QomQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtmBt2g6EZ8z7B5+biEKlp3pO+BAV0U+2qgD8O0kbSuAK0GM0uqjyXQ+pcF5s5RH31Z+TwlD0XjBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq5BNpptEmxSzVE+xIT0XpAbsnkQsWXccjFCaalaL4okcP2+35
	5Q9u1UHRSyA6BRdNPrRrCZ6cCN/P/a+ItsO6ifvA/JJ7LrlktM8d7stp
X-Gm-Gg: AYBFou06mFJXrAhB6zDdzz/ib85E4BdLhwm05IOdQ4hnvTNZB8Hq+ivdUhRacp6y+Nf
	OZiygOlzN/yIUPn/2Gx9gj17Jv1A1A+6qna9ECly3d2q3HiM3wujaK61LHaS1M4Oy530XDE8zO6
	jSPbZ4nX1r3efpPgB4zmBDUq6GtyPWyTeqAm+wHLABD4bSKy4+uQgG860Fq3wCrZs3+at+0HMSE
	685mv0mFrqQRe3YC52nMJGJwOvTsK1Mx5D5udU/cvNyHs9gmH8FvLx/nZiI63Hef/dBJzoOmGNA
	VjPN5yEZ+oMuprDbJWGcXy/soli13eNKQLsz7R9mXJSkg1EKJOBxHVELuCQFheBwA5NJFY8w+t2
	mXNAEbG0bwMGyuqbXDfTVE3MtX9grsEQCoNWW2SAjwqOJhWnDj1BWXQ30Suzq+B96Q8hc5zJRFv
	UK3x4vjgmRZTR/hFMZON0uT0kZMy8AG85M8/YvH2chQ+T81AxXq3RJFhSc2MTgQ32E43DNmrOD+
	TsaLuI8S/2fz3LeplwIJaXjs+yOvROY3uXrOpGmVpz3qiKAoEznoOXxrb+lbMRtAx9ByyvUpwTt
	Ufj5YJd/uocSTQ==
X-Received: by 2002:a17:90b:4b8f:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3a87379dcccmr668796a91.54.1791284716811;
        Tue, 06 Oct 2026 04:05:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm3668351a91.12.2026.10.06.04.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:05:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Liam Beguin <lvb@xiphos.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: lmk04832: Handle reset GPIO lookup errors
Date: Tue,  6 Oct 2026 18:05:01 +0700
Message-ID: <20261006110501.57051-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but lmk04832_probe() currently ignores them.

Check the return value and propagate errors from the reset GPIO lookup.

Fixes: 3bc61cfd6f4a ("clk: add support for the lmk04832")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/clk-lmk04832.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index f9a0684d2628..81801ccb2675 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1410,6 +1410,9 @@ static int lmk04832_probe(struct spi_device *spi)
 
 	lmk->reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset",
 						  GPIOD_OUT_LOW);
+	if (IS_ERR(lmk->reset_gpio))
+		return dev_err_probe(lmk->dev, PTR_ERR(lmk->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	lmk->dclk = devm_kcalloc(lmk->dev, info->num_channels >> 1,
 				 sizeof(struct lmk_dclk), GFP_KERNEL);
-- 
2.43.0

