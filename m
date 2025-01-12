Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F3114B96E;
	Sun, 12 Jan 2025 21:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736717994; cv=none; b=cghPHcnNeuWsp5Xl087ujs7Ho+tVRMJdiHUa5Geb4o6px1BCN2bYpuYRlUHm/muxW1HJ9sd1oWlrDg43cSDVJMWFVQIN3g7ngV/owsIVeSuL+805xreboscBm1avsspa94PAB05Vs+CMoR1QVXWo4ccK4IYG/lT05e3XzhBBQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736717994; c=relaxed/simple;
	bh=mFdjjbWGUCKF/tomzarw1lYWzqiOvK428B3wtrYFo2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W1QHygVwnnLzYxNYsJcdoCp8nGPyzGAuGQxqVbKJRlTWwabWX7w0z/8xN2zz2ARi2t8KiXzvtG0sIzQuKE9mBugOm0khjGr15It+7EpT0Dx8RPNWeJ3keDKXuF3osmTo1jeD/4zeZg5awXmXGsZIJ21+B/p2x2oBdpIH7N9La+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZINzIox; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZINzIox"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2009912f8f.1;
        Sun, 12 Jan 2025 13:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736717991; x=1737322791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1QLt9s+zP7rcQyhkyJBlf2MB81VnrFZkithnJlGG1X4=;
        b=SZINzIoxSps2jjKO1tZP04zy/W52eBp3PfaOSrjap4LytRqrQCwVJveECV6QrTmv29
         r3b+CFOtSJKNQ5yotbKOCdACOAYFc/3PQUT7Mu7k1sldZ5qrjFFceUcTRan+nFmH/7dp
         uZNtw5kPELphgj0rOQldhZ0+7XR1Rtavfgc4mAtj/ffnWRvcXzEfvFGgJuD88DOFkGkr
         Jqrk8wbNwK66PDfbKD3s67V/fJBkpbm8nlyro4Sz2+kPKnxb7tD3shpmdvubhZNaQoZy
         eTAhATlt84nIQvS4kyIz8PgEcqDnmKD9L4nW4E1ZPSsWxCvCtD6r7moj4Vlm59i41042
         IXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736717991; x=1737322791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QLt9s+zP7rcQyhkyJBlf2MB81VnrFZkithnJlGG1X4=;
        b=D+n9omEo/Np4xAjw//L1NaXqW1qkr01EQfomaDfGhAR1wg7PhheCk7P/YdEaDYvr1y
         5Lu5jDDvtA5KuRtexhWUYx8xc6eKO5twAxzSDHsrIWADiZuA3C2Zi8PpTN3sPOZvaT3L
         jrn3MIPPqx1MEwtIuUePQAIEU3Dz2UIAWLo3gk6o+fPhG6PsNVsq+mpEd/ao6Qygnl1T
         k9WXNd6JK39onCQOXMKp6mWFB11hzNamGXunQXUyd+cYLEg6NauD7VofD8Pfvl8UsM1U
         MvgTJeKiYu7U3H+aeXH87cubErw8WtJ90Tq6uOgv6BHBDw4oE4KokDfWoK8m7pSHHBEp
         6zzA==
X-Forwarded-Encrypted: i=1; AJvYcCUZIeHjLPUm8aLnFYlgnHuGRr981TWp/cz4OyuxJTPMfRtSlUK/+M15j4w6TwpUbzwK1fvL2E6g6sc=@vger.kernel.org, AJvYcCWFUhjXUUEQCgBIHGUW0Rnh4CkXH0PCAHxz46HmQaTY5jC6++dmtBjZuMf14D7q0sg6k9/MF4IiAcP/k6ah@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4ErN2DNgtTuzDNGRB+wjZgiGiwJwO5vMvVZH0XbbxHL+by8p
	WgMrCaMeY15kz6pwISj48kZUXslQhY/eAvW9gEHHjNBtFWSpi3c7
X-Gm-Gg: ASbGncsyPSYDUkMqAEZ7F42YLUGxl0wQau3nOZXPxtzURrHSWVB523pvELgh3X47ooM
	/5ddtGN8l34+CiFofDjuEdEPkDM0iPkCaMmf6cQfeTn44tZ6orbD99mck8iCNBByXQ55kjyrFYn
	eHYd6/j72o517Coco8tplA0Lp9bx8Lq1LZWkCSPDC0UTy+1HNOoVUGp0Aa0cK7qFrlMfsX0iua6
	MCusx7Qg0iCsHWcUlrJOJ/Nt9DUFWvfS8+ZMv6pBPcn71Kc/zrlKlkQWA==
X-Google-Smtp-Source: AGHT+IEk1Eqa+9Dem5I1quDZ63cclXmtqObIW9f8dsm241vNqV4DMXLFl+xYgWu1iKRwCO9lDDQ2Wg==
X-Received: by 2002:a05:6000:1a8c:b0:385:f677:8594 with SMTP id ffacd0b85a97d-38a87336b29mr17199600f8f.43.1736717990523;
        Sun, 12 Jan 2025 13:39:50 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm10684180f8f.94.2025.01.12.13.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 13:39:50 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: ep93xx: make const read-only arrays static
Date: Sun, 12 Jan 2025 21:39:47 +0000
Message-ID: <20250112213947.8524-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the const read-only arrays on the stack at run time,
instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/clk-ep93xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
index f888aed79b11..4bd8d6ecf6a2 100644
--- a/drivers/clk/clk-ep93xx.c
+++ b/drivers/clk/clk-ep93xx.c
@@ -586,9 +586,9 @@ static unsigned long calc_pll_rate(u64 rate, u32 config_word)
 
 static int ep93xx_plls_init(struct ep93xx_clk_priv *priv)
 {
-	const char fclk_divisors[] = { 1, 2, 4, 8, 16, 1, 1, 1 };
-	const char hclk_divisors[] = { 1, 2, 4, 5, 6, 8, 16, 32 };
-	const char pclk_divisors[] = { 1, 2, 4, 8 };
+	static const char fclk_divisors[] = { 1, 2, 4, 8, 16, 1, 1, 1 };
+	static const char hclk_divisors[] = { 1, 2, 4, 5, 6, 8, 16, 32 };
+	static const char pclk_divisors[] = { 1, 2, 4, 8 };
 	struct clk_parent_data xtali = { .index = 0 };
 	unsigned int clk_f_div, clk_h_div, clk_p_div;
 	unsigned long clk_pll1_rate, clk_pll2_rate;
-- 
2.47.1

