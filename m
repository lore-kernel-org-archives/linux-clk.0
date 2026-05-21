Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E647306779
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327753; cv=none; b=aVGoLYk3A0VN0NB8kz5QvWzAFoBckDAPrM1pbcSWjfVdbS3MIBjP2Ff4QrvS67QtzL8ybt8QWAAy2OHjCJv61W4a+3ZyH4W6bLp+lZIypTp6nRCXUwabTYQZKAVQr/vpk0kuYGJP9IM+6wIMamIt/LW3F9bgWkAgMQDGbWY822w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327753; c=relaxed/simple;
	bh=+R8FCYqZo8NMv8AAaOz+uoROWxb+egVxh9Yvn1SJnkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRgQ78zaYYhDyouJFN/NClgn9/LfGPV7SGWzjDI3oXdGuDK9B7arBxy7Y7sCbrkCNklbJm4OZRBxS7SBPjlwXZtWHWSwuZ+STunIjylNIrCLAqpTC+AkrWPu7D8i7XFiWDkJ+lV1fMfDB7PW/MMpHo8F8JIQaL2kCY6URpZm9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyRxzl1w; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyRxzl1w"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-839dc688d6cso2439326b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327746; x=1779932546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=;
        b=MyRxzl1wrRj7qfy1cr2NTwL+fJje2ASUfT3mn4Uv7uJQTNuA6toFNvJhb7Qk0Ys6mT
         MstJcdKZSYB3iB1hFxUvb2VbBuZ//SGBWcy2pxh7U5riPl1jtZR7UsNjJcZGKBmnxiJO
         sj/gY1Bw9E/DYQXyNhbmcAVKU7F3nvpZAmyFtkk3x3Kyz7aOCgaqHMlhBplIte3ZMqvj
         fHBShgyP0dc2AUVlpIInhmitCVXF+hUXVARcBtckH1gVhqvGHSknvdAFofiZZtMr/p/u
         lIVeZyO9XdyIFrJRXgFpy0JwLtmCdR6PiUygg7/mERlpTDOhAtPVYRzLoVIU5FTsghig
         MwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327746; x=1779932546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5er6mfd0B3WrB1UjZ8gvF3HfMm1LpaHZwTZd0KJDZs=;
        b=ARavV4Sk5fvEKJ1PhMsVuJrjqCIlQ+uKe80mWvavr6ZIFWtZ/dezjleCTqf4EfiS+m
         iolwXuQXWQs8o8RElaHq5fzvlJTtg6D2WqGp+PK8M2y9ETEu/mnJ+6QTHl7RZWvlw2rk
         WfOVX7D6QMr4jQEPZ0bjOPVhM52bGXCKmASGE/04JpLEXjm9YPCnqV9fr6OoWOyIIPq9
         cKbzfiSCHBfJd5AlurUNYk812BR8FrgNsVgWSDitEHC2eibt+G6mIhkyu1v2fFe37rPu
         abORw9qQaJB0QgmhEJ25A/0+KBj5A8Ft5hi7fMNZTnJUkD04PSkoruLrGXv7uWSbKG84
         OA1A==
X-Forwarded-Encrypted: i=1; AFNElJ83PZvZiCs3zs2lDetevv71ShFMLvwYdkILhmjQXJRh5oVzxacty5ophMLdv/UrGJQaIxtvHMDlM+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8AcjcasNEUvH7Ej62jqiwR57wKq3zBRSiTGE1yNMUj7MxRon
	ZE6VhWvkbj0kvNng047COp24oRGpkC5FKH5AWx+K3m2KK5HleCJ78B2Q
X-Gm-Gg: Acq92OFm8hPK4ralFepmjFz3zPV9NiKL61FIWqz4NGa1HodmRWGijYjTL7UZpACs/3R
	bzMFVLrcD82udLQvhzcYcmYG5CuV9IrSWnj8e+3gtVBmT7W1fcd7gBqT969pDbq2qe+TPIpx3ah
	mbOS8ue1KNmvxwH9zwjAzwQjfOykVGlIpOhuZIVss5TwkZTLDujosQHwpNJC3ja7AMrWlcbPA+j
	yRYYQSvbI1eekpfOzqX+UJ5ADG6FQdaaX3nLZtqEYPOD0SUtwibuS227SmZjvTdgUYb3ieniCga
	kBktYY1ZvSBBYpdtB+MV7mM4YcnpHDSWc7uh9AowMuD7DoM3lpeyLNzvBhyj02qIGprRLa+l9UN
	CIgduGhxsOuKCxuqD2Q5D1szyKfNi7zyYoCTrJYvZK14iu7HOC0VhtcRhWLLl3jauaqsQv9pCZd
	xxqsxtHbRKzIlqQ0EHfWOk/8HBpbWHJT3y7VLi+xcpS4cbvmTT7lHZIpJDtyXhoTXHDpMXJ8Cfg
	NGsb1iIyDLgPoGCMAOJRIU=
X-Received: by 2002:a05:6a00:bc83:b0:834:e15a:19f7 with SMTP id d2e1a72fcca58-8414ae9a135mr853001b3a.44.1779327746138;
        Wed, 20 May 2026 18:42:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:25 -0700 (PDT)
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
Subject: [PATCH v3 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Thu, 21 May 2026 09:42:17 +0800
Message-ID: <20260521014220.77955-1-a0987203069@gmail.com>
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

