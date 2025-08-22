Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0646A48
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 00:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822130; cv=none; b=OYU6zeQIveplZ7JfV1e28Ta9YbxkGpRktx3+tnfBUyDU9gQ+iHaXD7Ybt+2E+Rd+0AyY8slkKrTmGP6KnVVvtJeroPsvgXZjB2RBinWXWJmjBHe2L+lbO6neD4MIiPCxzmoqA0ba1tn81EGFOHjGAxYjapNprm9Bq5+MNuj0+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822130; c=relaxed/simple;
	bh=DDbB1RO8B/3ntGMIfiJsz6eiLqLaXTDzheESMXj7ZtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFHi97GHvKKIwo5RCD5hcUXMb9RcWnpRGJtA3/ooyCggys0JvzQYtI1lrxfkNkrY9Pu7n6OgsVIfzVKEkF9XZdizh3lc67MYU0sofg8f84JIzQ1DIg4IeNJOywU44KkAPccH7eOmyWEyJ8+0BcvqbOeUxzYxUkJKahE24jqIMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=U0FITsEU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="U0FITsEU"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e87068760bso181551285a.3
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755822128; x=1756426928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=U0FITsEUyXdPs1xv7N7tF/R/dYWWZpWusMtKjnxXTehJjz6iwsScqtUxj74mAa1vSj
         xaDg3vY82nXpkSdVdz13qNOjZyX0HWnMRxbL+jgyR3sQQEgIN8oocDNCNYZZJmRNWPRG
         aW2YU/tRU25r0QE9VuFijC/BRhJNcAPGWkm/ee94DFDMn9lQRO+F1wQXAm/h+OBqxhJg
         xPpnqKZ4O+RxDuLfNGJLSlc0e/Au4/NZwuh7sSCwL9m3AiciLVXSRTHERIPZ+HNXgYbD
         CQtJSURNiclsrvsS08PkJ76pAYWZbtPbYL1HJUy2JdehZ2XP+7dxak54pdoslU+B72UZ
         A3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755822128; x=1756426928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=CDmwUq03iKUZqHaQS5UvjGuH7cVkog6QMGN0lYkxuYZSeguEuLmQJFKTBHE7DxxPPP
         2WoqoyRYOOCDByIqinYsgIBYNkByb/Hod4q8qEMkgYgDYCl28HZyFfpQfI+BUz2tz9vd
         nD7+05G63bgBTMSneyF+RjDxf3Ndf/ZjnxuSCTqKh+6gY9xaisXvmeuPiMfqd6q2jAf0
         Y2yRG2F+lAHVJXey+KwgGLrqQUkDBZb8Hbhw4zQ7c7jQ9tvUsQHXtO+1sLxOBk7w0gJO
         EkC+al07BsVZ1OSO6aOFjmnOPsHk9/j/IvwuccgYhnrETjETUvfc63vUW+mIR1bi54mE
         oh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx4ZFIyHxBoEpBIUIBvEHTWLjo48Gw3kyRj5nIVjsfbSUSZUI8G5lGjeHyJggJc6Uuhm0DNt0vFGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKU9ON5UcbPCTLdIuaU+WXRGGE8mxL6GAQ4LE9IVh+Zai3k04/
	YsLky08JZPlwMk33V7K4G2d/oCCnWpqyEXVoxJH19GnO+u5DwuECYK+L2thF5iaKRA==
X-Gm-Gg: ASbGncterLCSGaVyABnAhHw4thMWO2xVh1okCeQ1qIWyzGbiwvCwAgmPwiadf4dPhNh
	GXfWOhiAnybdMGpge/ffKbPr5tWKglkxE601eOc9ZYbBbc05XwO62Z2K2yT9pPXC6IZj5rtaHFO
	jrDVhOoQOydJ/YiUA6BLtW1zSZBKGV0+PDmi2w1xctMUd2lk/S/Hl7TJrI6gKxuThR6cUfDwCZT
	RTh+wk8fiifobZhvV6i1N7R7sSoiIN0MJAanLhS6lMTMlE+xAWceHX+qEBlY+sEUh2Ty+uRbKyl
	VKE1Fm2OPhdkyNfSFbb5ArAe90R7ggRvL5iAiOoob0pxixvN5t0wAp2n9+MwJ97W0oQTfQYSV5U
	vb5RmgzKGNMuPbelEPQXPl3GlEH6HHoN8VpysIpjl
X-Google-Smtp-Source: AGHT+IGHm6rZ2RaOlXfMgFSf4U8z7KV1Q+DwlLKsqiFCn1DG+L7TJ0TPCwJKMIb2sZIk+AiQv0UV3A==
X-Received: by 2002:a05:620a:3195:b0:7e8:2989:1149 with SMTP id af79cd13be357-7ea1103a64fmr184064785a.49.1755822127818;
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e075df5sm1228228685a.30.2025.08.21.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 21 Aug 2025 20:22:02 -0400
Message-ID: <20250822002203.1979235-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.

The frac field is missing for sys pll so add that as well.

Patched:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
996999
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        3999999985
       sys_pll                       0       0        0        499999999
          sys_pll_div16_en           0       0        0        499999999
             sys_pll_div16           0       0        0        31249999
    fixed_pll_dco                    1       1        1        3987999985
       fixed_pll                     3       3        1        1993999993

Unpatch:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
1000000
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        4800000000
       sys_pll                       0       0        0        1200000000
          sys_pll_div16_en           0       0        0        1200000000
             sys_pll_div16           0       0        0        75000000
    fixed_pll_dco                    1       1        1        3999999939
       fixed_pll                     3       3        1        1999999970

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2

