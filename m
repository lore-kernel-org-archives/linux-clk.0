Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD418A6B6
	for <linux-clk@vger.kernel.org>; Wed, 18 Sep 2024 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726662762; cv=none; b=IFvQBMclsJIQinT1MTi+A1IBOt79HJai+4PEM/OaZyDRE3+a8n+6rBWGstHed+PXf9B/8bO79S9x7uOqyZlwRA/5Gn23XbpNUDB5aI6Jwc2BUU5vGv/JiDTGXeiYz7VUikcFq8B2bbBKJ3Tj86RDfRZnd8DvTX1dSDe0FkR60x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726662762; c=relaxed/simple;
	bh=kOxd9hIIzrOu+J19O/SGnOcMPFAhrQs2vHhAmEtEjpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LjCQM1mqUm1pcKBQ5iKFeZIOrkDrJ/NRYEddxIN+hXM+8eXhvQUqYFQhI/ik6sPPtRDLj2+vvfcDIvlin9tB1nmZH/CWNAEjCwiEGiBDZGaTVDJQ8H486rblHkkiDEDU3nB4c4vAsSF4fLYj8hun3iayvw5Gj1HWofek3qdptjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fmqGxc8M; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fmqGxc8M"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso145994066b.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Sep 2024 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726662759; x=1727267559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/FoiqPcoMPi8o1D9aYXEQxqaTmmjAQElRJaLfC5ZU8=;
        b=fmqGxc8MMukvScUPyjv4UnrOZ5w8NUpnzcw2SWaU4JNUyH4Ndpab5QXs+MFf6Mlx7n
         htEIhGHavFbb9uO85YrGbKWXum/rWKmTJ5b+Af1Pb/vPdrWxvjOE7JxV9o4FToNHxY+z
         zZFrSEFyqYVcDjUcFCiB8+oZpR5f1up74w/jmzil2UGV5gltLqDGxgMS7bXnpv04FiF4
         Evl5t9JA1kuFFT/QPlqJYiMMUBoGfJ5bg/kgj36T9rqq+QvprWI/UKg9Za1HaHhyXjPR
         Efk9Z9lQwLa41YbG5FJL8tmcm7NJYHFaw9dcS+f2ngA4YRKvFGiXZMUNtHWZpFdoySA4
         bR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726662759; x=1727267559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/FoiqPcoMPi8o1D9aYXEQxqaTmmjAQElRJaLfC5ZU8=;
        b=oULo5jbwUvPWG5mE/7WN4RbvsgdIu3G1cclm4XYdaTjiWm0C7eRtNIVOWhyAojom8U
         YGiK211QWOfAk6vIoeGs/51LTRW/h+KhqQOOqdL8prXv3gALYvrtUdSkmE4SzMAEHQnJ
         DTO2SMWj9ynhFtf0SC4G0Kw+6H95bfbUCO2k5SwcO2z5N+30l6ig6cx7dUtqF243B9BI
         7uT2eMSuUq7eIlDst2E5wQ3RVFL19wYWQgxg8I10m+vmN/HBNxVHU8Dk1P6A9bZXfsyu
         8aEzT35S8U0jznBt+/UmA0RvBWEoZ5+8D/IxdlvG08oS/p65HVc2oKgTerSLH4cXLP75
         nYfg==
X-Forwarded-Encrypted: i=1; AJvYcCXvmtEldw9AtP180C7aXl2E/EHDHgtyVzTKCQFFBMKUeqTd9k3lu6jyS/3+UgBeOaq6UerQCOm2dh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4Zd7H2bM+/NUf9U/bilwPtte3OmMSiuj2LEPxO71G22h2IuL
	Q7OmSfxwYaQ/sPyR0/kcR5PkL/VkAVdjbX37uEiWKrPskrS/rVJnSDRbR/SnaNM=
X-Google-Smtp-Source: AGHT+IE5Jxem8UHzHB+VP+MJx/8nOqZr7Uu7MQy/5IwXdfgOYZc1XDlhB2tBKk/HW3Jb8uOyGMxEVQ==
X-Received: by 2002:a17:907:72d1:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a8ffabc1d72mr3041383566b.18.1726662758730;
        Wed, 18 Sep 2024 05:32:38 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:a2bb:f619:b5e9:672f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9060f39a8fsm585047566b.0.2024.09.18.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:32:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 18 Sep 2024 14:31:51 +0200
Message-ID: <20240918123150.1540161-9-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=kOxd9hIIzrOu+J19O/SGnOcMPFAhrQs2vHhAmEtEjpM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm6shAr19LilaNvFAzfO8S0L/dGkK42FS6l4DJy z/2xkG3wG6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZurIQAAKCRCPgPtYfRL+ TksiB/9YD0/tcZ59j1vmS0BJK/DFdgSsCbJcLA1+5ue+VfD4rfoS907Qy1sGJx5WwaopQm19Olt cKNgNyhVqi6WYx4vsjCJoWNt7IBs8JjoJDnlnSNL3XffwkuHHkMqUGbOeaMpz98GQ4xmr0OvZ4t M5zFLjd5EJdYa2mJCAG5eIupmwPJKqNW3T4Um2RSO+pLU8SkiCJiTXMd6BnfjpMfZ71BrL1ksBE 7SK5dL8dS0Q1AETWcBEO7ClQrsHnlcu7wBw7NrauYNMhkzvr7QbFUbiue50oL4bPx7i+P3E0E5l KG7WfXhnu36rz6dJ88+oDRLFrJvYiu8uTnEuAOjwJk18v3Hp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-cdce706.c | 2 +-
 drivers/clk/clk-si514.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index dd3d42d9ad86..d0705bb03a2a 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -678,7 +678,7 @@ MODULE_DEVICE_TABLE(of, cdce706_dt_match);
 #endif
 
 static const struct i2c_device_id cdce706_id[] = {
-	{ "cdce706", 0 },
+	{ "cdce706" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cdce706_id);
diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index 6ee148e5469d..1127c35ce57d 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -371,7 +371,7 @@ static int si514_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si514_id[] = {
-	{ "si514", 0 },
+	{ "si514" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si514_id);

base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
-- 
2.45.2

