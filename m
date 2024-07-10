Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242F194AFC
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720630452; cv=none; b=qq+53HVZrJklgfugXiI0KRjsVPt25AIhS926ITSXzUyLnx9DEDTAFEJf1vDF3Djr1RTBLBD+GJWFS7bNg7XlYY1khaqyNUPm66X5eL8BnHO2RzPgJ+n8yHqElvkzLJ8+My8OGN0LzuJYPhauoynTzZlxzYNJ7GLiobQ2onuH1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720630452; c=relaxed/simple;
	bh=O7d7vj0cWa1medwMa1Up+XPFhCEcppKLwXkWtO7sIRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A8XUkqPmFMRaepkycTTonxgnR20YwMDq5qGrS3uS8k2nYGSuiguKrAiHG0/AfpY3RX/ZnPoJoOxwd/F9xcinWviQtn8tkD324asF8rKfaMyA7Aqmy7+gQu7Zvfem9ZZKN3AQgsFsFwsuE3IeNZ2mZzMPbeDs9ByJ6KBUuNETeOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzvPM4wW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzvPM4wW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e9944764fso7454997e87.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720630449; x=1721235249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ahkeI5pe5nI5C8b4YHdNxlMMoYZSpHe4ITBlVeHfQ6U=;
        b=RzvPM4wWfVDvX4SXAfapTqyS6ufJ48ZEI6NVJu3J5p2Lz6Gt2JZMXGtFbxMgnuvBs8
         20/PkIZnckgA3RFrex1NVwRkqNQ+M1HrCCWpGcdYfVuiR4+AAYdj9muyLLaY+5n2arOg
         tXWWuIip2ok84bPWbtBzUblGnYgFmcxtW8CmThOJvxm9l8HuZZEHOslqrwJuRbtUsbQ9
         WQFuFc26IjtGAZH9fsBpZycWKUGuH84xRfbF+8kD4bL5MBKQexf6OAx1xQ+l44wVedWW
         E18exziKCUZ3z83toMWpyVtVWzi8gOViZyWrJ/a3e0cP64l81QKpDarykT3i9q4yVhK4
         OhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720630449; x=1721235249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahkeI5pe5nI5C8b4YHdNxlMMoYZSpHe4ITBlVeHfQ6U=;
        b=WEsrUETMPmm+zWgvU7Sw7rFFUgt8ptQ29DHc134teSMhfMrzMe8dTOqytYMH5odY0N
         pzEygtWF1/J6PwOfDPDmM8M5u6UHCcyDO7dSfaP5VkXCuC1ZIjfT/BNmhuto1m/jY06G
         jPQ9ADK7scJIn33tToAMCTDnUc2Wu6jzyX4FJRv+9K6EoVJEV+7s5RJ33Vevfe4zDs1+
         0BeelX7KwM2a2blv7LwFQX1syxIAwx5a28bIGPTe8dFv6q9EtFJyb4myncFiHR5uoOgb
         cvKXzuKm5h/Ue+UXJs8UVkbZ8YakxzoD9r7dBO9qDfm7QFyICqyivHcDWSOmcC8fukJ0
         QDnw==
X-Forwarded-Encrypted: i=1; AJvYcCU1aiAObjUWPwMFPfD5zju4NpWQBDQrfLuxvLnZ1kvk3D5fknC14PTtJiY04gq8gHv64d+jG77YuD3ZtC0V4YRj1+Tx+so3aws8
X-Gm-Message-State: AOJu0Yx2qUlwcdclu3vpTmuHhgRO00SB2QORxI1GEF+a70Pv5S5nWuG4
	ZWtXhY0w3Wh54fZXeFy3JudQxLs0oa5vsiDd5/z3qThWK7YYJvJ9yaRSI8dTmOnglw==
X-Google-Smtp-Source: AGHT+IEajbdl4FT5qrhmmRB6BQbU0FfjqwFayr0atV/zCp78FbtWV3qlid4bhLaw/0aL4ILfg3e0Yw==
X-Received: by 2002:ac2:4565:0:b0:52e:9c26:5c0c with SMTP id 2adb3069b0e04-52eb999a650mr3417514e87.37.1720630448268;
        Wed, 10 Jul 2024 09:54:08 -0700 (PDT)
Received: from localhost.localdomain ([95.161.223.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb8e346bcsm655293e87.20.2024.07.10.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:54:07 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2] clk: rockchip: clk-rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p
Date: Wed, 10 Jul 2024 19:53:54 +0300
Message-Id: <20240710165354.1338287-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.38.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 32kHz input clock is named "xin32k" in the driver,
so the name "32k" appears to be a typo in this case. Lets fix this.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index b30279a96dc8..3027379f2fdd 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -526,7 +526,7 @@ PNAME(pmu_200m_100m_p)			= { "clk_pmu1_200m_src", "clk_pmu1_100m_src" };
 PNAME(pmu_300m_24m_p)			= { "clk_300m_src", "xin24m" };
 PNAME(pmu_400m_24m_p)			= { "clk_400m_src", "xin24m" };
 PNAME(pmu_100m_50m_24m_src_p)		= { "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
-PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "32k", "clk_pmu1_100m_src" };
+PNAME(pmu_24m_32k_100m_src_p)		= { "xin24m", "xin32k", "clk_pmu1_100m_src" };
 PNAME(hclk_pmu1_root_p)			= { "clk_pmu1_200m_src", "clk_pmu1_100m_src", "clk_pmu1_50m_src", "xin24m" };
 PNAME(hclk_pmu_cm0_root_p)		= { "clk_pmu1_400m_src", "clk_pmu1_200m_src", "clk_pmu1_100m_src", "xin24m" };
 PNAME(mclk_pdm0_p)			= { "clk_pmu1_300m_src", "clk_pmu1_200m_src" };
-- 
2.38.2

