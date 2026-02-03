Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A83314A7A
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116546; cv=none; b=n66VERpxdmiIPxWUIhrOp7ZhjEwJOUAazQGR9OAewuYZcdvy8/hYdT6JJIkz76Iug0lgo6aRgIYFWYbQQdc+mNm2XOtrPKk1WzL8DbBwJTU6v3+1h9KmKEzZY4Gee+tqomNaAry6D45cVQaLYBnpbe4O983qsQQYGokSHb4IVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116546; c=relaxed/simple;
	bh=uZGwCyR8TaBRIavVs9R9g5MQv26Vz+AVAIrRexh9L1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6/fHRaSAS0e79DQek283twMmW01tz+HkS6FItoCHyaVAfIfUNH0OVDsOGyX+nXEinItpxfWAkZE7LgK6q7MYT7sCC/jGdPzEvphLjf2klO/o33J5OJCp6Y6Y+DjfGZBN/T7zX6ZbYD9m7dxeBbPRsvoZtyC2J2ijVVqC3tkIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9YyjFqu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9YyjFqu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48068127f00so46847075e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116543; x=1770721343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75bzqaTpN3IF/Dik9fopBoi2Oeugf3y24iWYj8B42gA=;
        b=b9YyjFquQIo8bD6ZiAvhv2X7XI/YoS2mtG3ximvuXxwhxjXV5djHVQwoIPHFuWmDS7
         JrWFXpfFPpYfJlFU/tRqm0WfLP5rVF9/XaZe19UGeoz4GuLnGEWzZr/fJY5bvGySe7lf
         ePZdAxevVGRx7OTZ3DMVYl4ZHzGMVdBtr8wdy0VF7BdbdsBRLmeWn+nndXZcniUVv5wS
         p8vrERbLBE6hBG7Jy4t/MpGg/ogQuKrZGy4FaQWBg1SAc/Awhd15RkNM/8+s35v/G/HJ
         NH/YGIYbPbCAkf9c5aCAuWY9J0lCifjUToGpTmF3HUij4UCeGv+2k7P6X09KylYeFiGH
         0+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116543; x=1770721343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75bzqaTpN3IF/Dik9fopBoi2Oeugf3y24iWYj8B42gA=;
        b=Y8RAgfxL3IteTucHvx1k4S26i7D3JYfJxA5qaIfCCpHdu3UDfklNz0FKVk5FSYxz9A
         tyIIF/+HKUJs9XqL37BBDtmEU0VyUw2XRSQ9omH1qxhh8Z18IigAaMzIpUK+zfQXWDcZ
         7FrXqeuF8nl/KXHZRqqjwX5J/UEWeTpysvih66kF4IJaI5WVu++qEOoicFM6PciFSrRo
         6UNHGuTUBm5xt/rn34um952lTwEuMd6Bvn4JbiEtrdre3V7bVgcIR9baPBMUEYmeXHIi
         yG/2BliH7MVLAmFnpgXQ2kOWx18W96NkwuywsT9PwyDoflCKCGXAzk1ceaMZQPqHNQ+v
         yruA==
X-Forwarded-Encrypted: i=1; AJvYcCXrs0Gt4Zau9pZ0VhgHMkaQQ6K0q7f7dIk6G1VTWPGa2SRSC+uxnBvzgiDNRtiPnJclZZj5H1jiCYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqBFWVvHTGQ7u04j//CH7nad0e1tmef0i6jMAWmWRXXpCEuFQ
	rOWiuSpyqI2ZF32JR2AB2/scy8cidOX/igcD72PKFrBFIcSUMbsf2zRp
X-Gm-Gg: AZuq6aIKpYt71O9FE+63h3OybTGk/PJPKhdNX7UYuhY7vUFufjgwyxqugRxAsu8zcyN
	K7RbC2ubPqbZ0wqbuwBMCE1dRfzTM06iIQPuOGQhEN5nEodIIbq56oDLaxt2Bn5AXjtGgrEujvR
	nMyRPwRWEmqAdcZ6m6qPPLldetjhuSnEOei33+xbDcHbgFsbnop/6mSw4GiHFZ1L1DG0ge3iccN
	clvswWK/LL86Ukw9GnHepEIe2BtRWz7oDa0h5CoNyXlJzoVAJpsz3rbr1BWuBAZdrqiiPgi/Qgh
	pB5pu2uhh+Pl+eWT3IErOpdjSdGzwrLX7D1a6VgMMcTTiDXTtdRJcJwefgdK793FvoN1kuRAr0w
	nau1xPgKK9Kmu2QeYQZrov/qVLXm7z341wIhe2I5FlZ5dSd6MslBSKdICZNNATT6ngKKYhtycJq
	sGjY0cAuzQ+vkrh6A5RQ==
X-Received: by 2002:a5d:5848:0:b0:431:35a:4a7d with SMTP id ffacd0b85a97d-435f3ab35bdmr22564999f8f.58.1770116542969;
        Tue, 03 Feb 2026 03:02:22 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:21 -0800 (PST)
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
Subject: [PATCH v3 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Tue,  3 Feb 2026 11:02:11 +0000
Message-ID: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
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

 drivers/clk/renesas/r9a08g046-cpg.c | 128 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 ++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 +++
 3 files changed, 205 insertions(+), 3 deletions(-)

-- 
2.43.0

