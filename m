Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9431A0BE0
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627987; cv=none; b=Oz0ymlEf8uqb9YnnpDXAOivXb5Du6K7qyJHrOF608pHz8lxZXkHJ0dBGD9Z+p4fI2to+TGWYB3DwMnx7hHfanprMfdwoNgndBSv31aiNkleAusXTTSp3Mn6GfC1NPjxIOa/7VjNt2777NhOR7uUsFbiJwASXdw0ILDrrjSyEcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627987; c=relaxed/simple;
	bh=/wgC+NHq/nzzkDPHhueUE/N+3sAmW007Yfol1bJTxLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PaRj1W1nLIUzHZxqaqg45dvLumzI4JG0JPWkvxz+WK6xmglhHBpnyzjjpB5py/xdQh4TDGk6QzSQH3+snWtm0qpfIImaOUheyVjEEBWGZueDNbMHA+kT8ogAQ02pHHVR3uG1AW+AQ5RQdxq9rI79ugKxIehS2i0zyIn3lH1KBHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQvQCBIv; arc=none smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQvQCBIv"
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-5ebc5b4190eso1253877eaf.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729627985; x=1730232785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdVJP38G7wy7hsX+2NW983eNZ4SNnV1CA3+wjd6jOEc=;
        b=FQvQCBIv7E9oBiFrZ1JnPK9k2fjN73wrWS3uUGnFvOWJ7tMOZz9YBY4E8aSz2EWfAb
         n7uFgfHU5tfyMqM0saw/SYBTmiaFopDerzZipUF3fm9b6E9mDZ3zsx/xpAsLpvA0uetq
         VwDktkgLVRyQD8m2W8Yh4kYkWxRTOjQTDsYHDNFWkLJ6yXuClTBingJNkjKZbBHRY3Lq
         i7IPgO0qSPKr51UekYLL8hujLxvWlW5sxmv6LQk8WgMMlAU9FkH52SSko94wooybkK7F
         ftaaTSvJsGVMM8NzVP6O7C++4LJYzQw7WFqjuF3/+gOaAwbTWRqqdrbFxEevcBy2aw6F
         7QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729627985; x=1730232785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdVJP38G7wy7hsX+2NW983eNZ4SNnV1CA3+wjd6jOEc=;
        b=kc+Ey71Ss1mDykbPF++BeJuew1sgcz1G9TlGuXXW6Ahrr3wYa2WSfAPmk2oR2fjG+G
         iYG89hWeI26pSPXEunuRfLEDGdRjnRCNaJrEZ5U28VWefbkSG8yRX/7R0vUr7GktJ2r8
         m4iXamOk7H3Omfc8+p2Wdf6SYVtsEzNF15KA502w9ctsqT9gLcXQcC+/5issmw57sigQ
         x/gs09mXqUsWwn1hm8Y7q11YVr1s0EuBvu6YuwzxYXctC5BB40g2S8aYSEpQCPV5pA6y
         XVT++3Y6RZ5V0VN4LGl1d6NZ6ejE9eph6/ud+uAbAkDTsspc8ldRbc9IOG6SAi0AwKyP
         qO1Q==
X-Gm-Message-State: AOJu0YyumwmkJJ7I/kac1VGNZ4yRo6tSbgEc/4hZYiYtIPnrva4WXWdO
	K95YFBKH+0qCl0ggNNSU0mGagnYBju6jieXCxe+ZWe4T7s3srlcU
X-Google-Smtp-Source: AGHT+IGlO8CMmzK60nGOo1wMFsZh5jKFMrOsWgcRMekkYnmNI4GZjOb72ZhhWa320P6A81PmOUa9GA==
X-Received: by 2002:a05:6358:7184:b0:1ba:4d06:34ca with SMTP id e5c5f4694b2df-1c3d81b2ceamr8466155d.27.1729627984885;
        Tue, 22 Oct 2024 13:13:04 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659dff41sm316229285a.30.2024.10.22.13.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:13:04 -0700 (PDT)
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
Subject: [PATCH v3] clk: sophgo: Cast an operand to u64 to prevent potential unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
Date: Tue, 22 Oct 2024 15:12:45 -0500
Message-Id: <20241022201244.8992-1-zichenxie0106@gmail.com>
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
We recommended that we cast the denominator as well but
Dan Carpenter said that it was a max of 3087 and was not even
vaguely close to the 4 billion mark needed to overflow a u32.
So, we only cast the numerator here.

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
v2: modified patch to numerator casting only.
v3: modified wrapping to make it clear.
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

