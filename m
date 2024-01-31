Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C669D0B
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696983; cv=none; b=qxm9Uz+sXOGj+LlltxrjIwgLbeAokypB582AxB2ptydwPtFDiFEh/AaN6OqFj7qNyQAW1oeQs8YTBnOjiS++qqEE//4cchmULk/O1G8jfJbBnzvrMPZKG3G9zAvGWZ1kkEZ581h0YrqfKam4bsz5iU1UyMY7uk32lZJu6LfLQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696983; c=relaxed/simple;
	bh=4F7pRSeLHkCCQhjqVZv4OCZ2YJL4wtrbUADgwRekjc4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hAaqv/7oVgPmUagDyKjXTg5N3PNrtI20MB0HgojSqThYJMcW86GbZcgrdnICeQ5WiviDe9JhXjLQzjvh5t5XMdm6uEWpFdOBpveovFFRz3MQlPAMye1qG7eRY3E6bK74EUfZxdhehAmlm6X4P11semOyRj0tgSb0pQ3max+Ysm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NZ+bdKwq; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NZ+bdKwq"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf595d5b4aso43058831fa.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696978; x=1707301778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAPsb7wv9ncMZqGhKLbsOzYzbM14KqWAhQQvx6jMrWQ=;
        b=NZ+bdKwqoEBkVvCeucEeccV4yu0mKzHKyDSSLFGuYLN5Wa6iNGaW+XoaNgcI/06iqX
         G2SW00+49LEZ0h4IISy7Oti6tRWAJifd1UeP46gE/CEk5TzdUdDzETzsv9I7wDBqUVp8
         LLoMgfUtoUMpevZ/Ar31I+hDEPKp2+P1Of18oZfzTm7sRVX4MDJ+LuBbtWJl5hThlaUN
         fJmPtwfeou10TulVeUN5Eez16D5GTx6OsPGfPTlRYUgCnPgkY6cr1jAQ6JygxqR70n4e
         ZBJcO2dhChwewM+/HiGu9z6ebqg1VRFskjVsQJHwm2uTO4/MzxEM7UADUgjsZUcanZVD
         MUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696978; x=1707301778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAPsb7wv9ncMZqGhKLbsOzYzbM14KqWAhQQvx6jMrWQ=;
        b=lR95oJSbaq68wX0vDSwzpfaLIdB291n9UwcKBEiF4c6mstqukvM7bELkJJvq3KzP3x
         ETJqSDZeHzovLzAnHexvjfSgIF8U5G5QOKOv8LhvdFDJ/NDOU89kgvyL4VtMft8Fh9lR
         Srl8gCZL2QBI/lY07JNGicrHgQ3I697fNuZitjqBBFDkLM9YA9ZycF/8SIZ7SJRBamgC
         g5lwZI0eNHX5QGezpyy3ngG3P7KYjDsvWSnv/qIrERrV3L0SY3oTunU+4H3AARgCbYyx
         lATIA8Ac+TKImQOw/vMqbP1IVRowx9uwpbZTDjooNgjtWCEgwYAWyZxJRxfq9obGSrSU
         wo6Q==
X-Gm-Message-State: AOJu0Yy8U05fJutgRIbkQVgGCPoOIPcx2qM40gZi9CpKS9NMeivtnm8/
	awPcYPE2TJS2JEhQfYerd3jcPpYyQzHAa9SYoRF91GWTFKWFkL2jAukWw/PXvYg=
X-Google-Smtp-Source: AGHT+IGm6vO1gDmeaNdgHV1ERLXyt6Fs95AO6Yk/NY9nclQlphcKvM6vYTvFfJDa17nLMgBL9NsvLg==
X-Received: by 2002:a2e:a285:0:b0:2d0:6473:6286 with SMTP id k5-20020a2ea285000000b002d064736286mr809799lja.41.1706696978502;
        Wed, 31 Jan 2024 02:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCURVfGVV/fgoZz/y96LwsWL8mjFEQI7eN5zwYPcYO+P+ror2taAymowKrBLq3tNR41XqJyjbI1XiX5zQtzqx49mZKa0N2ANmRIursqaKWYaXNNlHzPcr4KZzeZRCnFNYg2SUyh2U0Q0b77SKW8GI+IiVl48n8YGsnhFG5Z0g2W3PtvxA5W6gfjtaj9xBBft6zG1YC5RGdt+HTtNKz8f8F9OgNmRn3mZB1v87wB57PjJhEM65SezwhspLmV1+Yj8IUfn589/F35Su8/q5uVhYA==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7d310000000b0055f3b11d0adsm1618989edq.55.2024.01.31.02.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:29:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] clk: renesas: r9a08g04{3,4}: Fix typos
Date: Wed, 31 Jan 2024 12:29:28 +0200
Message-Id: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series addresses few typos identified in r9a08g04{3,4} clock drivers.

Thank you,
Claudiu Beznea

Claudiu Beznea (2):
  clk: renesas: r9a08g04{3,4}: Use SEL_SDHI1_STS status configuration
    for SD1 mux
  clk: renesas: r9a07g04{3,4}: Fix typo for sel_shdi variable

 drivers/clk/renesas/r9a07g043-cpg.c | 6 +++---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.2

