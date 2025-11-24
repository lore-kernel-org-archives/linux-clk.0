Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C752F6921
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019228; cv=none; b=PK0+W1nDauakFuasYQeP49gY7CqBJrFLDigonxcGD9a67Ibtg3d6DbupjOFDlxMCxzi9Pb5NBMDVpppOw6u81TSg9CBsCcK4nXRGpZQQQ+gzmNObMPn0rZYiZbx/kihJXr1xVvp0r3RISUGxYXncLeE10/HXhhr/ezMjF4TS2GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019228; c=relaxed/simple;
	bh=yfpYCzYMlpDVkpaCEmrul9emFoZ7C7N5YW9SPhLPWHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFosGgrKbF7MqMyxQBKxPlrHcazyu4Dq6JLtyxCwxEEEi4MYnvD1y0ZZDooUffz2EpHE94Tak8EbKR2J7QCh/YLgJ9oq5F4/JQINt5toMO+/cor2r/EHGU+3U6Uc3iLI6jFFKhQJZcfQaXQ/NbiSgtpxzMznkG7FPSv9DjjNm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GflOPaMN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GflOPaMN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59474f1308cso446654e87.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019224; x=1764624024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM17JM17IsvfEPdE+PGl9IvMeRM1R81r5bb424J3ViY=;
        b=GflOPaMNnXXnkeaL0lpIqibWwBT/3XAcKUwYz1FX1JZu8vZOBDBgsUZm9O1grduDCo
         Upxkq1Sll/PywUA6SvK/BMXKOdcfM7K6cPEhZJZBGwu7CMzyhWnfIQUz8iKprGKtzyzo
         dStjnZnyHwPHb/U4geU7ui94T9yilKuUv+7vS6TrImEMZHuyJtL2dSOBBn77jGhcS0eK
         FLZIKuj0mLnq9xM8il3eKlBEMJ1N4t0AEH0oMo/PAKMWD0zWeoUJe40Oq+hoKcMM6PsT
         ZXik8rE/ULZfqwliTHDqH3aCWfvVcLwerVZeeqzuleOBUBsdftX6DKhrW0hns0I0DjvF
         LvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019224; x=1764624024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RM17JM17IsvfEPdE+PGl9IvMeRM1R81r5bb424J3ViY=;
        b=rDFYo5PXiYuMe1TwXUaYsEnoxChSweuleIsYB6Jq1cKO4CGCRjY+OYd773+1tLKq3m
         zKfmOUeQGYGtSdbRln/iP/mAfryUFyFVuFAFLbBFrNa2LmxgNQ+OtN41viJSeCGGllKr
         mhvMIKpYcAQBA/t10K/4qxni36hhPxiSVH3XVWd3qtvdQ0T3JuNTD+q6NWD/oCyhNuM4
         KIASqGhBv7KJouV5Dj0vScj0wZu4uJa9jkcKAfv6m8OzwWFF5DWgx2l/OKeEuj13qWHa
         1bnvjInnyvx0scTJ0Twc6IZ3c4Dzo/AiZDf5D98zTTNHQR9yhmBb4pERVrAQMnMWQ8Yh
         8eOg==
X-Forwarded-Encrypted: i=1; AJvYcCUozJ4ltnp4fh85KgmTnYu9rg2IGM+BgQ0kjUT4A0qtV+mOASxVi8wEIu8BznwgwKha6r5kBTwBNMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmN4T+Ox9NrzyGC6Wh3T59f0TlkO5Irwy4yMVnpz5FIMyQie1
	AWMvGnUlNm7QmuWF+fK8OZF6dCx0UjUkzGXiK6bwGNJibZhFORgIMQpfmL0iQu8qCuE=
X-Gm-Gg: ASbGncvT59UG18e0BuWkkfiAORA257bcuyRqYtRYHPX9V8acK+246I9evP+kce44S0K
	1lav3ViDVztHTwW951or5wzVVX9LM5eO1dgo/67gxuQTgJa6ww0HXutfLL/vkhArCiHdGmjPvTm
	x8WR3I4qfK6+s/sUIEycPGDu1ixqodHrt1Oawg6+ECeKTsqfjvYMQ6YQ7hlSaJnzXpUjG1E6UGN
	msVrRV00LrzRLnTzV8RPoXp+Fz3nAglcngXz+5ejkbG4KM61n3wl7zc9LoaVtRB0JHbPu58HRfx
	nXc5CpKrDoW2HfdnF2V1MmQdUDFJAOdW4tZA+TNbPx0Lbsg+5ns4epE+9GOfKMDwltD/9rPe86r
	T+Gj9GqfoTxcz41Ltjm54QkEF/oO/0P3QtAPRMGYGCvR/vB9wFY5gpQhAywoYkgFl3MFekIsd1m
	neghlnhVPwW/j8/dGdOdtsucupwGfZVwbxvUk/KcURNUWXrC6H87MUNg==
X-Google-Smtp-Source: AGHT+IHCZbm3Y6KtIoBh+AUucs+OuYTytTubjvQ+jSXNmcAV6v+qUXlEhTD84/pRoifIzHCFzKx4gw==
X-Received: by 2002:a05:651c:3053:b0:37a:9558:5bdd with SMTP id 38308e7fff4ca-37cdc367f8fmr16026271fa.3.1764019224427;
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:11 +0200
Message-ID: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8550.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 862a9bf73bcb..36a5b7de5b55 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
-- 
2.49.0

