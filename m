Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E21FE0F2
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543909; cv=none; b=dw7MEnWkCkLhpp4QKu18GdlBPGTkb9MRWXlzvUS//KEmyN4EQVlWTwS4kOW+BUxsdBXfVwM25I/eZXWYfJFvrswtD+I6mef4VeKOxoXbMlRpHjI43QIFxJ9sMZS8PjIzQUiUs5zmowGVgtSWgj2em4Y794+hqv/OWyD6MtPbMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543909; c=relaxed/simple;
	bh=5oBZ0hHqy4Mk1zLAnlwEqM+EDlyzBlePcsWcOM3kC8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R3MCmCwzo5crllYx/HSe3tPEuiQzGtebNzKYwCjvCyrAbP/IsjODtkGTPUxXgh3JtVaH9BPlt23vz7sweuK8ggETiA9N/QTlV4ub4AqUAaltcV3epG1mz7tWv0oZAl8onQ2+oCrv5lUYVuiHlkL/nln+zzqAH1eggaGQW13q+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElHcktJz; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElHcktJz"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-460c0f9c13eso20267311cf.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729543907; x=1730148707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26tVx7IKFRskniFc0jJQXsu86KFei3cXEc0Ebgjo+Kc=;
        b=ElHcktJzuSwBrYLFCdTfh63tby+i8/CI56J8giGrOBAQf1BbNmWpPrQBG3eo5wG7k3
         UtXQNnpri3lMfQCKdccshZHu7MStZr5RtrTBR545R3kyw4pLhkuGixqgGLoyKbe8Q5Ob
         xKLHFRh/now2mYE5Y8uNrZVqyoATPsZFd3mYbvErZZy4u+nv9qXclK2dKECeH+VZCGUg
         JKSzLa8vE76poapz2jrib13STOHAwzAFc6HYYvitPvLUSV89Ezz+aZRIB1zWxlFTcrtR
         icrYXOzJ5km2grlBdq6dlub+SJU2cGYDHtT6w5mTmZfpYjqnTDw0+3qnhHw1zWID1Tv6
         I7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543907; x=1730148707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26tVx7IKFRskniFc0jJQXsu86KFei3cXEc0Ebgjo+Kc=;
        b=rMeYzQI8Vw8wF5s+AKpvIGtjnyXwl+8VB1OCeloU1CWeg7mxB7vkw5GCVHqPjCHtyA
         qtJrmbrnLvRVex6tFfxGs2AzEZPG6oP4tloPmh9f8Gd+w7T7rdqOmhYvLN0LkSuWJO2K
         /dqjOO62kKyQx/wvRTFe4I/audbNCAB0xTK/spNppFoDyZUqNtVQ/Zk9lV0w63YzLQF6
         FFayYflkQiE3IRpPj8hyi0wuocYjU3UCfInfWy250t9bhpX1RgQyvB6l8m/zTKeMNYj6
         y+SjtYAGE7FRJ/cCIk8KrrQxkOdnujmYzbqVG2RYjB4Bp4+V4J/mmJCfu1iaRGLw+Eai
         Uc/Q==
X-Gm-Message-State: AOJu0YwKjeE1ObVa2ex+6B82vjyCthlGiGikZYgjMqoatZDIqkfPFxdb
	G+7j5Hgde9eTUsLLS/D3aMzs1aMPS53wig6lyuuVzNGQGbVa+9+iIxsZ20wTu1ByO6uV4tQ=
X-Google-Smtp-Source: AGHT+IGD99+f/04+HhXuDdkZ1LyXU8o9IWTFM/wm0OOK+b2ZHKd5tD9njAzoPzw502sGhwd9mlaXsg==
X-Received: by 2002:ac8:60d7:0:b0:45d:8e3c:9c22 with SMTP id d75a77b69052e-460ff5d46b6mr12800861cf.30.1729543906739;
        Mon, 21 Oct 2024 13:51:46 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3db2861sm21645671cf.93.2024.10.21.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:51:45 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	dan.carpenter@linaro.org,
	nathan@kernel.org
Cc: linux-clk@vger.kernel.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] clk: sophgo: Cast an operand to u64 to prevent potential unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
Date: Mon, 21 Oct 2024 15:51:02 -0500
Message-Id: <20241021205101.13416-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be a potential integer overflow issue in
sg2042_pll_recalc_rate(). numerator is defined as u64 while
parent_rate is defined as unsigned long and ctrl_table.fbdiv
is defined as unsigned int. On 32-bit machine, the result of
the calculation will be limited to "u32" without correct casting.
Integer overflow may occur on high-performance systems.
For the same reason, adding a cast to denominator could be better.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index ff9deeef509b..e0f92f7a21bd 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -153,8 +153,8 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
 
 	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
 
-	numerator = parent_rate * ctrl_table.fbdiv;
-	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
+	numerator = (u64)parent_rate * ctrl_table.fbdiv;
+	denominator = (u64)ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
 	do_div(numerator, denominator);
 	return numerator;
 }
-- 
2.34.1

