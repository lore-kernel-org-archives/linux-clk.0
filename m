Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC223DE
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721629997; cv=none; b=rLuXt885uJ1lDSEspfwanfRJXo3bY1FncqMi8enaAeMJzkQvwKUE175s8IzM4it+klsXj5h7SGeGplKffdRVBNmXqaPAEy1c7PS/o+nZxrzSYAMp1BEsES3Od+2mDB4GMx7TMzcjVlkOI5v4y43UbvnaY0fjxYwbZhI04Bum4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721629997; c=relaxed/simple;
	bh=PN1n9CaTCL1HxBSjtyOCIXUtDYrf4lCA00khcB/7w3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAFljb/lsGeakR3X4ZZFGaopRj3rX0FWUmUBwuOC7zojh6ghV5Cm7Q8zXX/JxCJDzKsaTfKv8EGzpjcqPKU1kDhhyWjwEtOOimwf5KbMB6gQapbYnJmP96TckfNH8KlFS5JpGGzvKWPqQTMPA1ADL4cdf9kstMPKa7YmHc+RA4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUsowPXU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUsowPXU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34722so4620898a12.0
        for <linux-clk@vger.kernel.org>; Sun, 21 Jul 2024 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721629993; x=1722234793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xj+wDOWyCzvjTCTUDA0Y6iSTZh2VAEBUpnU4/tK6YAQ=;
        b=wUsowPXUagBJ12OFgMUSU5mPxKiturgnOj7jXKFuAT6uDHbA5h419IIYYXdCaHucV/
         e4koGNChj3y7HzMlsnF80WSFVbueRrRzD+kbM6zzl+Lusn6EQaXp6a7Itdft0xhhzns+
         8G+9oYFqIMKjG/BgumiUleIFJZOxAgjAzasp5mY08MiTa4TbfEqlDib61iUdB8LdSAzs
         3+TLAQ10iDLzlv2oCAjbVzQYatDKVtUwiaWRsA4YlW5/apw63S4HF0rPB0zQjbWKEA9E
         WVLfieW7LJQ5Vqg+8443A/TPHkcA8XNcZFPH4f8uZOqINzn8su1IwC1/9M7QVjKDbqT+
         meAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721629993; x=1722234793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xj+wDOWyCzvjTCTUDA0Y6iSTZh2VAEBUpnU4/tK6YAQ=;
        b=NpPwEkTd+u2yWII63EGEE2sBd96P1fMqzvIluJHn7/yX47VEZiSvHzpCUxa9HXW4rX
         KnSddoxRqGCbABSASbChiy2AnN+Ba6jrONMIBERbSfQP71vXcqBO9YUVjVIgSa+DZbWX
         z+Fz3O1oNXFNwEw0FNERS92so/eNHUSU7XEhHpCXole+oo0Me+dBxuOqZSr8jb49Vjre
         I7UWxvnb2nX7FrQbZn+t84dE6BTL7pMEZBjcEUYopAnqOYNoRnbgrMFy4u7PWKxLzpwK
         UCKF3yJWRyrDkfNtOt3aCjOhCu39zFxfl+m7cJCH7kwDvWh5Rh8GvrIE4I9uOAXlWyFW
         39jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBhJ5oY9pNsEK3ylNnDH3K1xKwhGOpUWmYanJZhwLAOmcj505f10ahDKogY9ozlgOGTlXkPXD3ufzxzeGaUautj79HWMWtGU9R
X-Gm-Message-State: AOJu0YwAntBDW2msy9hv6zJKPaOzQSTvbtiBXU1K09Kr/mVXsj9wgJIz
	XyjfbPmeB/vyBWiWGloYVdAjL9czmXMKGumLamhP8bA4E5UNPf0u8yhx6aZ2B28=
X-Google-Smtp-Source: AGHT+IFZgwQ8kBjg7wQirGUAy1IQokyWZyFwi8jSTwEZ3OWVxp38Ndo890Qs2NlTwlbxjDVAmkOW7A==
X-Received: by 2002:a50:c05b:0:b0:57d:455:d395 with SMTP id 4fb4d7f45d1cf-5a2caf4e97fmr9818292a12.7.1721629992621;
        Sun, 21 Jul 2024 23:33:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a4c7e67af1sm3319217a12.56.2024.07.21.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:33:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Artur Weber <aweber.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: samsung: fix getting Exynos4 fin_pll rate from external clocks
Date: Mon, 22 Jul 2024 08:33:09 +0200
Message-ID: <20240722063309.60054-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0dc83ad8bfc9 ("clk: samsung: Don't register clkdev lookup for the
fixed rate clocks") claimed registering clkdev lookup is not necessary
anymore, but that was not entirely true: Exynos4210/4212/4412 clock code
still relied on it to get the clock rate of xxti or xusbxti external
clocks.

Drop that requirement by accessing already registered clk_hw when
looking up the xxti/xusbxti rate.

Reported-by: Artur Weber <aweber.kernel@gmail.com>
Closes: https://lore.kernel.org/all/6227c1fb-d769-462a-b79b-abcc15d3db8e@gmail.com/
Fixes: 0dc83ad8bfc9 ("clk: samsung: Don't register clkdev lookup for the fixed rate clocks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos4.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index a026ccca7315..28945b6b0ee1 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1040,19 +1040,20 @@ static unsigned long __init exynos4_get_xom(void)
 static void __init exynos4_clk_register_finpll(struct samsung_clk_provider *ctx)
 {
 	struct samsung_fixed_rate_clock fclk;
-	struct clk *clk;
-	unsigned long finpll_f = 24000000;
+	unsigned long finpll_f;
+	unsigned int parent;
 	char *parent_name;
 	unsigned int xom = exynos4_get_xom();
 
 	parent_name = xom & 1 ? "xusbxti" : "xxti";
-	clk = clk_get(NULL, parent_name);
-	if (IS_ERR(clk)) {
+	parent = xom & 1 ? CLK_XUSBXTI : CLK_XXTI;
+
+	finpll_f = clk_hw_get_rate(ctx->clk_data.hws[parent]);
+	if (!finpll_f) {
 		pr_err("%s: failed to lookup parent clock %s, assuming "
 			"fin_pll clock frequency is 24MHz\n", __func__,
 			parent_name);
-	} else {
-		finpll_f = clk_get_rate(clk);
+		finpll_f = 24000000;
 	}
 
 	fclk.id = CLK_FIN_PLL;
-- 
2.43.0

