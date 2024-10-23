Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3271B4F17
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695136; cv=none; b=cv2kkSplJ8bGiVb3hIAhemNIHU1wDhkSW4kdyQmcY4ykmPNP71sEYOYeo5k+VFXiuWhgXpFCXXQNEP5RcfbRXL/8QsuKNm3ZdZBhRFgsQFtHq42rwv6tU/dO4aPyGadqcPMH+tW6a2+5hDI+g6M38hTNU9DKgczubsefSNTAzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695136; c=relaxed/simple;
	bh=abZaX61WbfQeB4km945tCwxunPgKcCHdxbHDBPHQxqU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ns+xd6lKdmZov/WS/K88EgAcvf594V9cnsUKZUrMuaiOJIMPc7WKBLbhMHVLg+oMOFWRo28dlOxFJqUPwPn80oAwgNLSHpPm4esTGebKfNy5+ILP113jnUqb0kyEDfxniqj7CRboPaKniAFBNFHAD6lxnHkMeqayuqpx3EeeDfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/X/+Rd4; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/X/+Rd4"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7b14443a71eso584916985a.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729695133; x=1730299933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIRd3PXpSz5BDOFcaAZ/hm9Mqu1PKuZYOGtrGMhALLE=;
        b=Y/X/+Rd4Dep70fCyLfFMuObrmK1fZDGRvClJ8t3BiP0QjUOLTB/t4O47mKKEPnEoRb
         DARQeDVR0WMRrN5jFhcy7zISbpAvhq3IKvYKSmU1L6mpqzLPVVqdEyggKLBvBQxadoR0
         p5m/46iUIuTt30Lluolwzk0tT7zgTQVh4Jpd/w4JbswI6Zw8DxhcpiTRX74GeZ9xGuL5
         oulbj+sOkNVomkex/Ij5hi0RdZ/TeDmuyu5RBjyGaOJhjtJOC33Ju/mb/yf2la+kHdOM
         qgVSlyuKtwsuNjmsZ+9FTKJBxkdQPaRTJ8d9cwuY14OHllzLLuUjlCcfdPWhUdDJ+sXY
         //ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695133; x=1730299933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIRd3PXpSz5BDOFcaAZ/hm9Mqu1PKuZYOGtrGMhALLE=;
        b=vySocJQx5D+dOwAKKtem338IRJATA2xiKe1W/MRhKOVAaBsWjscmb8umsOIsajJbJN
         nmQIUxUawmnOGPjPDa0OTIiLcVhFLx7po9MTjPFXZ+2wMtiyF2LCaJxqotvcj3qz12Fa
         Tu8seysXlwZcJ4iGDdLP6dRaLj8voPdC2YJDOLkc3QrRebWAJgoGLRgcu1LEXFcmZz3h
         yjNMuYBBKo6DkFyMdUhkOW1RlVwiWT7TpdLAzgyhzJS2z0YDBnYh1F4GruIqfY5Wsjhj
         oKgQnEi2mY5oy+O3FdLnxUD2NPT14VagxtwpsNFbPo3G6KosqdqAXrSwLIZAhqj+ZFlY
         ++eA==
X-Gm-Message-State: AOJu0YwWtW6Q6RAgbHK8l6AfUujwAWXf8Yqfx0pIVqNidS0vV+oihN88
	9muKZ9aa+84uw0B1XHnzpM9ScKgh1emEr0/JC9oqCbMik5o7XIKc
X-Google-Smtp-Source: AGHT+IGAdu1qFFy2ijEDUlLPby4/KXVLfkVJQVFxtVYw0rTj6wgYiJMk7SHTy5GWm1yUC+mhQplPRw==
X-Received: by 2002:a05:6214:3d0f:b0:6cc:1f0:d38a with SMTP id 6a1803df08f44-6ce3416d4c8mr43531846d6.14.1729695133556;
        Wed, 23 Oct 2024 07:52:13 -0700 (PDT)
Received: from localhost.localdomain (host-36-28.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce00999c52sm40141756d6.95.2024.10.23.07.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:52:12 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	nathan@kernel.org,
	dan.carpenter@linaro.org
Cc: linux-clk@vger.kernel.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v3] clk: sophgo: avoid integer overflow in sg2042_pll_recalc_rate()
Date: Wed, 23 Oct 2024 09:51:47 -0500
Message-Id: <20241023145146.13130-1-zichenxie0106@gmail.com>
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

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
v2: Modified patch to numerator casting only.
v3: Shorted subject and wrapping.
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index ff9deeef509b..1537f4f05860 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -153,7 +153,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
 
 	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
 
-	numerator = parent_rate * ctrl_table.fbdiv;
+	numerator = (u64)parent_rate * ctrl_table.fbdiv;
 	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
 	do_div(numerator, denominator);
 	return numerator;
-- 
2.34.1

