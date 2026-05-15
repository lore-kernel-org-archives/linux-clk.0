Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F326ED3E
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857855; cv=none; b=nihwwSAdlLKfK3gUJUbVkNT/T6E1WDVKWbFKefT+OMjz5QoH0mCvESZyG5qTU2VSv939S7pvMduDySlR4L0AVwnrtmcHnu6LaqiVzVbhc9Gx5XQ0WfYTO4VfW/V7IhSdkfSij38pwU1WlytHlXG7a6BNtTj40DI58JAFypywlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857855; c=relaxed/simple;
	bh=I44V8v4LdukG1KjF6Ew+0lNFPo8VkU7lceFdTrM3Wdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MytU0xvdDuL4CpCSWIokWn1Dg6b0DOp2fRCyWJEEIq9OFqJyCKD8FVxxsIpix6GWvWB/5UypnnQ4iey4RY5/+gWAKxJ6Aj10jvxKiErwG3O21ljx/HOjZzItWo+yBobmXGBpFLGvNYjKiaoQAzww+GZlx4mnEqDkVrAEJXHsR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=p4TnYR1c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="p4TnYR1c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso81188105e9.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857852; x=1779462652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsd4LwQT2Bk7ii11W4N86fGXswzqcig8HFDype92nY4=;
        b=p4TnYR1ctQpBg9r4FVRJf5WrycTWTW45IZd0Yz6aVIjEcsmYpWqLKskhAa6BM3Fqz2
         BcRzli37ar6Hngwo4Ew2zMeU/AfK9uEWKxybkUr5WNThxVkuKi8a30122Y2gsicqW/RL
         apSEt9ikTfHpN0xQpRQwHkFI6pbmfvyewA4R14+ZMqQwfEv0a3SQXnqXVeZL5cQAaoEi
         NRIdanqgvmnSTbY1yZa1TdOEjmQYSelx1SIJaCiyB3Yk3k0+I9lZnnoqOBZavcLUxogm
         Cf2WW5fFxMSQxH7G0zYeiTKACHN8ZWDRxOXQvjIUh3kXWqo0GXpdjCb1VCtarG0OWNkU
         KxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857852; x=1779462652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsd4LwQT2Bk7ii11W4N86fGXswzqcig8HFDype92nY4=;
        b=nF8ryLQHNSew8Jer2QUuaFMD+oF1Nb9arqYC+lDMvSHfBnPVtrkQ++IsnV9OPPrWCD
         3x14gyJjyXwQxmZVKUuQt67LOKtJ4QbMjxvR/fBQkqDktKxyAUAw3qgn31xzngxU3yKv
         /twCLWGJSIM5e9YJNF3CjSDLcQ09X38CMIRBa6BJjtfyRGn8DJpJZBc3fRGdFio3Ub0/
         QziI2Zc/oUFL6lZcqKx0yn96B+wQAXDLbuAAq0sNqcxy/iTowYOg/k5Zz7iasoGfSN7i
         UK/SWmK25o6M81zw7oHAXB9/ge91ITnvj8RO4sWb+lsX+gTI7oDfr6G6DiiOppqlzkR+
         utPA==
X-Gm-Message-State: AOJu0Yys1gZcab7J0VAKLRyNxi9sdQQGlQu9O5vA2vugIce6NXLkalQR
	L5dXtgawU17Newee2XoT/8m6pKHP5T8GNjus3I0nYEYXaCm+IL214xoEdjsMqlPALFMgezP3DgG
	1loaT
X-Gm-Gg: Acq92OFK0sn4V3jTcO7pJBRtEI2MbIf/cRCQTYD4iU/F7ZA9UVTot3eN3tYX7XIAp7E
	gQCCZe8mfdQAUQUtOCSUflwuOEOcNaBDXxsm+qRhtxlsmfpdTu8o5pqFZJMie0jtDf74QeQTAjU
	2xZiedqlpO1x91Tsrc8SgOinaAMXB/p18t60DOJ8Q9hv86evdqy7lMnVJiQRt8DwyKHA2B0qi4g
	pWccaITK42Y86y+yIq/ZfPNOEboaBfDrgIl5taAVDmXwrM4mFZsPIzRhcBZ/1A7Ym/HFCRmy+uI
	oqEfxTYCc2Ya+w4qFZKD4vljBwjFLxipR/E8zG8rvJ2NfmM0GvVVE24pMqpNr7un3wvunhhztyh
	qglmnnRhG92sT+ogsCzCprGgFps2msVl+d0uBAKA+xRGh16BzrplxYpl1Hj9bbfHLffuo9/TFJl
	VO6Oi4lhPYfgFwtnDK4P+pnn7CcVRTkGEdbugY8h7ypYoDHN3jX0SJC3NABjmow7ZBC9e7Yqn5r
	9zhTr9Fk3zVjlVfepc8Q6RRMA==
X-Received: by 2002:a05:600c:4e87:b0:48a:93d2:60d2 with SMTP id 5b1f17b1804b1-48fe59ab8c8mr66550045e9.0.1778857852427;
        Fri, 15 May 2026 08:10:52 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe5694fbfsm122228135e9.6.2026.05.15.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:10:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] clk: si5341: Drop unused i2c driver_data
Date: Fri, 15 May 2026 17:10:39 +0200
Message-ID:  <0c5084534ad51a99447d9f4b7bb3a68185f4ba5d.1778857289.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=I44V8v4LdukG1KjF6Ew+0lNFPo8VkU7lceFdTrM3Wdw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBzdxETRFiCO/pM8k/bbXIV4PRG/rPuNF/DLkr y1QXsdU4IWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagc3cQAKCRCPgPtYfRL+ TksDCACJxP6/hSgRHjZXnE9lAWt2RaF9LD6IdGYQVTMvS+b072/UOGJI1vwhQPDn0B/ex540Q8l sfHJlATrg13GmDj6wWpukJ+/gpa04dtaxm4anNcrAZlifpEkM/JWUdeUr6T3YvuU2nb1PbuRlUy aR6A1O5EqcWiUMiTMVtpWXq7ces1SCPSBkoQo3EKW5QI2y3iR92WzLfn1GNTtc2XiSeMv7B+eOG /TsHyJx6JEDWd4qiiTloZEP07moM/KVcMj1xZCZN0Ma3NmmJpRk3Iy12Q9tFlbu5wSdowHTESJv +B8DZL4EvCYTbkRJ5ccE2Oil5ACNGXs977f/cYR5tKZjXHlA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver doesn't make use of the value that was explicitly assigned to
the .driver_data member. Drop the assignment.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-si5341.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 2499b771cd83..5311c23532b4 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1825,11 +1825,11 @@ static void si5341_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si5341_id[] = {
-	{ "si5340", 0 },
-	{ "si5341", 1 },
-	{ "si5342", 2 },
-	{ "si5344", 4 },
-	{ "si5345", 5 },
+	{ .name = "si5340" },
+	{ .name = "si5341" },
+	{ .name = "si5342" },
+	{ .name = "si5344" },
+	{ .name = "si5345" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si5341_id);
-- 
2.47.3

