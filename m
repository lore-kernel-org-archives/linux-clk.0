Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C47347FE2
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670320; cv=none; b=Pia8JQiHhyGLfZOqyvEb8kF1/+diso/57roXn2aBIwbj87yYA/d4lwEEGWhtPf6zsuTBGfYu80zvBhhlZird4EaN5W4L4HZopEsZjAggVZHB6UVbKpKD3xx7gs+7ilVHIH/LsXIEcsNH6zGJ2/7/aAX/NIFXdsF5Yk3PZo8X4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670320; c=relaxed/simple;
	bh=jm7MH9Ljx0cTCbjQdKH8TcdeIcQckUbKzdjt/I870Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6KXIRLi1iu1J5vMjPB0MfnuDXCyvPtcYyhV0JePVtjUSNnDVzHdR55/5UwCQFEBNfv71LwcWumH+AqJBN7W4wDultv3Ufk//bjja3CODXRysQN+ZksVv4UQAQrO+Z0RllyqjC5hQvPOiLwWO7vDphrmfskSbxqvhseNTcZ5qRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8PJobDZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8PJobDZ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a1603a098eso3758523b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670318; x=1762275118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbG5IF2Pyn4vpsrN2z3h5DzN90lM4Q3eJY7tH5/4ZlQ=;
        b=A8PJobDZwLOY3tEW3UMf70olb365xaHcXViLsLC+F0HZAqOzlvaH0NZPIDU6BY0U51
         UVJ2D75bqgf5wr0Erz7h4Ddytw8/320fJV4XxTMJjWESnFOWv2z4aZTR1sGFkfNDKF1Y
         JI+pc7aTqbiebQbXp2U9r6WGu/D25UMoULLJJ1wGqusnIuHuZv+GgbFa5Uf/AxeYPgjf
         91nJamJy52T5gdZd037KzX4EFN0bMgdt/FGqtdX2JvDRjRI3ew72h9KsZ1fO2cTvGVmf
         pim0Xp37tbrIKNUlqWkA/i9VYvE2bNtjIvSHv7cAYm9ZO2Sm/IGKY2HZTOQ5d/zJ/voe
         9J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670318; x=1762275118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbG5IF2Pyn4vpsrN2z3h5DzN90lM4Q3eJY7tH5/4ZlQ=;
        b=CtYatqSd0Otzk4fv+NwcKcwEFrYybH7MX4YOtsUKrg/CHjMrGIg6ZQryWkryjhC6ER
         6ISBycL7+yw3d263AdkpkeK+O3DZLYb4i2x2hSuPIYhtTSxt1VKHjz7fm/M9+YjIz0Ea
         PgJGTzysUqkry3IcLd+8psNuEIdAZ82/cHqm1bqSTB6sWsl5k4RLpwHoqZGTLiQYtNeu
         u2g8WbKtsSLmqE3EtVWY/NI6Mf/2GdNKIxDTmWdQzR+MLMzdDD7T0dRWW1ApMmojHb8X
         tbDSg+8P8/LKgevOOba3cPCVkiLvRItnvbCIZc7uWNOinebxXKDEU/aBf4FmOWKwKzTs
         Qw+A==
X-Forwarded-Encrypted: i=1; AJvYcCWOauWv0751g8rCAJIWn5lVqVPVrMPNOzaTcNKMgeGIBvbEIw95RGWy8I0xosDZfHbd30vuFphdedE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqogbSUnb5mnaZE+Vh4XkIHjLKE5iYuT1i6ARM0st0956bBrK
	/9dPf9LgTmO6aDr8XBpYtbKXVRiG5JmfYdTga/uglwGqD/bKt4AWZect
X-Gm-Gg: ASbGnctRquEs3Gsg4E91CH+UNnCyolxqgfZI2aO1VFJvCN6NU5wLhWnbadSjSpe0P+R
	tCMAa9fHkkP1iWhD8ulWdNHh7OPQc9EGzt4lewUX5sPG7D4UkPJ29Vu7lkwaIg3/nQDs7gFOoP5
	k6AeITblOJXJKSLwVKeh5HdfF7uvTi0JVKJjwCB/LUdtjnRwQGSHtivNA8FhBwo9qDl36S7dns5
	eM0LLRun0nn6ccgl534lAq/K9tGglr2VUMR30A/dFKRylM+rxo0cCxqHxEdJiYyc7YUIUFP61Sf
	0oU3rG5ext7nCHbyeIRKJN8cewvOk/obiV31fxHlc1u9t4ljW1QSoEG3dFu4Cu4ipEPF9Y90tm0
	NGlb0drGi+N5nlPRSIiKZ1TOjOYu3eA8Jf9GROWeDuobLRhg4/l9BTSilOGFmPZ0Pynwhr7glMo
	O6EoxRgLpdylQ90NB729fn0w==
X-Google-Smtp-Source: AGHT+IGLPUOqrtiYYL5ZsbQtjhr4Ba9uzVs5+UtmtyU5aBfpQMCGhti+qksrxXmMXxxHrhHcv4F1PQ==
X-Received: by 2002:a17:902:dac2:b0:290:c388:e6dd with SMTP id d9443c01a7336-294cb39572cmr51488595ad.7.1761670318095;
        Tue, 28 Oct 2025 09:51:58 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:51:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] clk: renesas: r9a09g077: Remove stray blank line
Date: Tue, 28 Oct 2025 16:51:24 +0000
Message-ID: <20251028165127.991351-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove an unnecessary blank line at the end of
r9a09g077_cpg_div_clk_register() to tidy up the code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-v2:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 1cb33c12234e..666fc16b9a81 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -240,7 +240,6 @@ r9a09g077_cpg_div_clk_register(struct device *dev,
 		return ERR_CAST(clk_hw);
 
 	return clk_hw->clk;
-
 }
 
 static struct clk * __init
-- 
2.43.0

