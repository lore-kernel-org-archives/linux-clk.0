Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201D617B03A
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 17:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720547851; cv=none; b=VNrbQhwltQh1/6z6RAuJ7jt5NJcg0JDp3leQJjycrK7XP8OimLOzJ+83B5/VB+LFyqLsujr5RSLiSvkfQG7Ny4cKzVv3MqbiYJBvzsZqj8p3pldjayu5iEiFnk47x+Sb5IUiDRn75KfMbw2JYv3V8kWeinvUgEudkltHoveXtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720547851; c=relaxed/simple;
	bh=BBOZebtYx6qXNuh6/K/7Av9xo6OkDJw0ZP69Z969rb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I8sOzhLCcH/eeCow6H0vSpGPx0thQAPn1tZzWBcjw2LEteKwEJ6WXKxXFGynnOJSe37vhQKZMka/53AI/MzKCDq91hM9XTMD/5oeE2s2bKwHyHfPGWZ2uiooUOyU6cjVZ26FH/84MqmEjEs75gCOz7pQjQ1sbL3AVY9khWHoyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PziU3Op3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PziU3Op3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so4540826e87.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jul 2024 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720547848; x=1721152648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58D2VQFlq7w2XDg9T7aEdV/ndOTx9HRupIZYSOMHk/s=;
        b=PziU3Op3Apvqz6JE3bPvmd/RC+hfQ5XrO79NlMtbLaUX8BGxK3exDaZpoIl2sKBsQ/
         0jcKXSIP4zgGJ91xUpswztRqC22kbYH7Dz7Q0nRbveQX4tpRb/pBE2rFu+lGZVfSG7F/
         nFyk/fvBo7IBP/UQ+TKGNJFq2QXz/Y/Hpba3oO/qeV/kpg5xliYxJ8inp50OPIytq0aX
         zR65kQ+W2Re8FhHFzdMn63O8pvHw/IOnTN9BpUjxaxjMqV99Bl0ITctXYYXZk84gleGV
         NpquX6s5dek0d6OJxMzKt56rBkCSzuwT+mdrsm7OU1WkjfZ2IreHpukT3x/tkqeDrq2A
         mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720547848; x=1721152648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58D2VQFlq7w2XDg9T7aEdV/ndOTx9HRupIZYSOMHk/s=;
        b=Vcvs0ibYeheVLwvZM4d6uPn5DloYjtjG0EnET6otnNqFZmWqCi8QPWNJJ70Eil95oC
         eR6BKborTlj1RSAvurL2/8x6MSdZX6RblyM1Z4x9Z1muGhFNFlSlsMrYjIblKFi5CVVW
         5Q3w31ePD69X+3HCjPSQjVAkrNqLCQoWKGWuEmNqSOq017vw/GJ7C8gJuwpA2jHsOx7M
         06X5Szr5g8sN06Tp+lrdknvK2mnJozIhepvjzFLVecP9L8REJFJalhvSWH25PmvEjtH9
         9QeKvbBTgUuKVVrN/MHRPj6ySSu6HA5QS6ozf8IoUJ1url8GCfrJHJQTk/Vy4wYGOr9b
         p99w==
X-Forwarded-Encrypted: i=1; AJvYcCWNt2RuUnojQo/VegTn5CzQI3pUHnCu1f2YoUdGa26rqIOj+tFdJTz5jcslJ1tPao+tgYBFVWxPbl7GqdCrhOSzfpbRjk4HsoD1
X-Gm-Message-State: AOJu0Yz1l3XGe17iwGXfw8NWpEVGnxNKO8GA78dyQ2LgGn7PQQMNPkrT
	Nnw0/0W/GeSQOSNc7KETSlGbCNpuzMYt+Y186Tp8n0d90U9x3B8S
X-Google-Smtp-Source: AGHT+IFXS2oUx+nMCbywPCZG9PM+N1as0WxYVjJU/lsP1l7a94KPrwURJJ4wv/b1UT7mCjOyeRAlAQ==
X-Received: by 2002:a05:6512:104e:b0:52c:8a37:6cf4 with SMTP id 2adb3069b0e04-52eb9991276mr2442445e87.14.1720547847830;
        Tue, 09 Jul 2024 10:57:27 -0700 (PDT)
Received: from localhost.localdomain ([95.161.223.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb9061a37sm306482e87.141.2024.07.09.10.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:57:27 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] clk: rockchip: clk-rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p
Date: Tue,  9 Jul 2024 20:57:15 +0300
Message-Id: <20240709175715.1317538-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.38.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

