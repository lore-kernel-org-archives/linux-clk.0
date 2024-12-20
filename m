Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217DF21C171
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715075; cv=none; b=K4KB35bHwj++9uRDEnBgXeI7+9TcTndmrtJ/HGF49J+aFkMUyZzA4UAQQoyOAFlK/pjT1ADy766oo+2cQPAJPxSgGqL1GZwICN9W7Vv8hp+aqDUrkpVupEPnfmFL8JPO9UAZkTcaXtIwhrJn52fz8d8pSu1SoJZP9GI/H0XjUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715075; c=relaxed/simple;
	bh=lzI6hgL1Uto5BUE1A5yvsC6KtlJXJ2Z6oRUTIPtisw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmgeMGcMGI5BgyIlfjpkkJmF3uvqfsLWMAiXqL73VZiGbfg1VG5M5k6mA5bwbp0VSgeNSRvuVsGaFgiy15+9G6K598itSzkpsKvhBgUau/W4Yv7EX/K8Xrncyj5t503/slwVcWJlXo3olqLzWmojOo/ho+yxYhItjAe5WqPMKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xvmAW53N; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xvmAW53N"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1901051f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715071; x=1735319871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBrk8IHiCPUAUjirIi3a2N/h2yY5LVz9whBiDVWucEc=;
        b=xvmAW53NcAuf/MSpZ03cMmbQVKdceur+gJVvBeatfanpmeL/h/xu5gRcG3KIrl2VGn
         URIeaNTI2vXqDn+rk1ry3NNhiRTFj+KOOnj1Du2HfJh/qXyZHkq2uyzSzu9dDYoN8T43
         07cGxNjilgAbMPewoB0uGQ0/BEaPVytfCOS3WAQgXKWMJjOA2PiyzD8R22qy4K1WyvA7
         E2/Dz7h7E1kMyb4BNQly4d2T+TTynvQLFIvI6aW7Bexqby7VETDMxoagGJrSPJ+conMk
         NnMUOpC3d3T8lI6nLytGr6zm9wVbH+8ChLAkuRR7CgzAUa20LI0G+jbMPdaJtgOQU/wm
         YYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715071; x=1735319871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBrk8IHiCPUAUjirIi3a2N/h2yY5LVz9whBiDVWucEc=;
        b=uq/+5NMOOkULGFzshriumOSToT/C1Ly3AEbKok81AeBG4GuY6LTgl/1y896CTGtQLQ
         Tfxb7VV67m9skRBPoewdG4BQNGSaqfx4QV6m8h/MDNOZoyeyPZi8vb6fN3zWkUFzYe/b
         jkkblI1EU7jtZJUY97WuqAwyZhqyXqxzHI1WnAm8GIkVDG0OLcabyYG+KvlKg9JG3DHJ
         Ea1rw0HijjDvN1ZfCVjJzA1nb/VoOiyVME35zBF5/qcGjKR9KZhZQXkBFKI9OO3mbm0S
         MWIhOiBgel1SH4ZgvgTa7wcWnqCncQCOCzGWuX1BSZH/VHcJz4jYGJARqMIsDUrT2MVp
         eomQ==
X-Gm-Message-State: AOJu0YzLT4ZsNIl8JnBT+goDX5SORIEzAK2kW3yNdA8OOxLwoIcgqmei
	NFSgViKfiLxJGbgZckTl1mn71X0mNQiVIzKCkBH5TcqiEdJIqMi4lpKua+Q5I29HD41mDrRXMUh
	X
X-Gm-Gg: ASbGncvYnUMBKxkICL/I+kRkClFOTcWNyHN5kNmMjgaxbWZFWxYOMCCQ/axRoZErMKz
	wl+nbbVosK840p/fR5WpEIJNqHI348uCH5Q4hGghC8jWNnimu+96z2FX1IhpFd4LSaeqmAv/zWu
	oKp/SUeAAArBegLWJzNmBvocnd2tirSxh2LmpyKV6ObCSzjAawOU/2GhZjJtrMaFx6PD0GksnA0
	eXjuCc6wqLHZCUvaL3QI5NX9wMjos5dcNMRgSzIHHpjM1ghgI/007ybk763lAibCg/iNPg=
X-Google-Smtp-Source: AGHT+IGYjIQWS975xDwK6uARayIsF+UuvzRGZ0ACwFZ7y0KZUKYksnNLhFqF0wvPuasDTYVMf4jEjw==
X-Received: by 2002:a05:6000:78d:b0:386:31a9:31ea with SMTP id ffacd0b85a97d-38a221faa71mr4933719f8f.33.1734715071561;
        Fri, 20 Dec 2024 09:17:51 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 18:17:42 +0100
Subject: [PATCH 1/3] clk: add a clk_hw helper to get the associate device
 structure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lzI6hgL1Uto5BUE1A5yvsC6KtlJXJ2Z6oRUTIPtisw4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa7wUNcjmvWe7ugM4KUNzU9JqGgsDgAGcF28
 Ubg1wb0XhqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmuwAKCRDm/A8cN/La
 hUvpD/41vPeL2vy9n9wB3yHNzP/lOE6YCfj6USZRqALCjhWtxSbswP8WZCyBuUIXKdG07CRxR5d
 paOxLsunCkYbhW7KSaCfpJMygtwE3DEfub5JufG8ga7DUa+275WRN/c4LfncMx69NBFf0rORpyx
 chnAJpZVgJ7/5ZCQ5+wFuUqOwTAEucgYAHigQhuZRzVV87u7AV7pblaov709S8DBLYNAXlicu00
 ew+n+ztIFXtNeZDmTlOGvCiAAsBloAIP4+o0DkFqEBvjFANliLxfsqgj1lpOrFKX6CwpwsL92bs
 ogLSJtIpkqDS8NSrTDXzbeYQa9nFG3pOjlLuDVIdoaMC1Ep5o9mgIiIpZzkUYMXorv4wz26ESpW
 TihG0xXFARXKABPiOG7HhyWWNWjtMcmKwK+i6fcay3Zzi4eEWIrqPaI67wI1CMmVyeS4vQx8bww
 GtC0JI8SFLRXaky9FEprQ7cZOUXHmWFrEJLyYJCWPpgKCJ//TLvko5QSyINOxI7ksNqb4yuQF71
 NIjzjUjaYO5ocsfRAcvTUeGQ+zknlBoZelumy8x2vQkQM+eDsFA0GKN0lm54KZIqX9Hfb99yKnH
 j/9BM94Vx/txhYZ5A8FQ/xa7gSgNAXFIi50ORgPYBsM98oyGgvPj6O03/Y3WZy2UVeX4FvaAjye
 ek8VxEQIotKHbrg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add an helper function to get the 'struct device' associated with
an a 'clk_hw'. This can be used by clock drivers to access various
device related functionnalities such as devres, dev_ prints, etc ...

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b45fa005030f56e1478b9742715ebcde898133f..7e734d2955978cafd77d911562a26f1646684ec2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..e5f111dce6ae26c1103f5ff60bebbdb2fa230060 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1360,6 +1360,7 @@ void clk_hw_unregister(struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
 #ifdef CONFIG_COMMON_CLK
 struct clk_hw *__clk_get_hw(struct clk *clk);
 #else

-- 
2.45.2

