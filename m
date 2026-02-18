Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A52F6930
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402604; cv=none; b=W4wPIUgxEX3bqh7x7twB14W9d16B24MhIoCkyK3du8CzF/4JB+lJxaL2fTahOQ/I2FkRn/fuiCAgQZHLT9pe12RwGrcWM87UnTVV6PV+KJSaZdaZujd2ruOXLeZkIvBOgPnSBtGeXz/4fUgHqTNa69d7/NrvHsgwVmjKIiGkMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402604; c=relaxed/simple;
	bh=ATLkbn8TN+9WkJGc0zUgyg102ukNwiK3cRL5DAp1VH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lSmDPlSxS++6vVmk5lIrv/w03eMKT+1Hwr6LpedpI22FZ2uxNRhIvx/+9H5jGF7IjQI1Kqfi3/X6raUEZXOuRzSvyd4lSCkSwZcDuKaB5aXq/+Ni7cpbzEfQAXTEf5HYN/YiFB8ZehKUDlXyqV3DxyBUWVa5Y+C9eH8d15EvnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDsSIdBM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDsSIdBM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82491fbf02cso2920380b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 00:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402603; x=1772007403; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0bP01qFBrwLQV21WFsuN0zM6OdwGcJ2YrdhXKOaIYw=;
        b=mDsSIdBM09Hi2eRJiI2IdTaquqHz80gsrjtJM6865uVx/34wUqPqk03nXOej8adq3R
         2bVCl6xVTfDiNuZZfIzTRc3khzwPqzQK0UyBWRzi0rgY3RcxFeln0wB5estf/7yb+iXy
         hKSa/fqmvBOjFI0r/w0OgAo16y73Fg7WMnJl9JVwsMsMgqRox6373JdTTW0nByN0HKTv
         z3spg/b5WScxfJ5gvPn7e+CLVJp8+/MJsAmWI3OEoFDzgsoRBFXuAS+hl6HYu6ftVmLm
         imhR/1yHzCJYkq7ROsXdG/VlLk/sL6SY8pq7p4un4uL95oQ/Lgf8+ZbpLHH4c4NeYhlw
         ZYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402603; x=1772007403;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0bP01qFBrwLQV21WFsuN0zM6OdwGcJ2YrdhXKOaIYw=;
        b=Sg0ldeK4h5JEmj8c2xRTo8W69CD+dmJxpa0BE7mPcxm2DxrfMm8Vt/nfQs39zgV8MS
         J+tiCAlN7bY1YnRwpJ/vpy5XXXRh0O4kxyWfqh0t8vJBU3Is2xqRSYkrB58yl9EglN4d
         98RwzO8tE1+icPifIaC+4LT+sMFO+1irreNOhH/xicnXOMkSLro4AJ2OJGvPgjZL+kCj
         xfR9hQFHbH48vdTOeA8lI6EaEZ642RT8kLlYVHmxZN9JxSkHDIfa1vRpKoHWjYvIWG9l
         GTK55g9l9WYk7tSoJxc/BW2okFcDrMNGh/y6/q2JU/ENczdYVoD2LlLioQ2A6hbiaeul
         rdUA==
X-Gm-Message-State: AOJu0YxvwWMk6PYYdnELEvFYsBZXXxIag54ckPm7w5tcFkT15yssR7KI
	A5EsnJZJcO4dJHdR0wpVNinQVEOCa3rm37HNpfp+7TClKSy2oXQT8mhF
X-Gm-Gg: AZuq6aLivrTKeLXCPZ9y+AQTWbPCBDfL1DjDaP2cRIY3RNRiR9MNkQnlhTLTOutR6MM
	vnPc526sArhcd3H5YY4U5APde6sArdmx7iYsUqECefOAm9B/yFYzQgQVE1Nx4K+yKxGyUGLDWAi
	Vk41GQUt1VT3hXalUdq035EpyE3R//uKlGTwsNM8LG4EZ28g6TdgHeVWF0R80XaBD3G0+CyNVZK
	NKuOCDAtlZqDp4LhPWH8o5LbgQ+ZJ8wEU7fk8XRmg0v4ByKxZuDpVJ9oaLb9bbDWmQ57/RbAAWN
	4H/+0BDlP9/X5rhiaFFFlDYw707K523tchoshmNc/rHa4hF2i9kPWX2Cx2mG/lHSWG81bzAgY+V
	M00cWITugKGpwvHryExNyayHepQrq6ZRS8O3SSu7Re6Reuszl5wjHi1zt2pf6wbOHMlA/inFDDu
	mt4H1fN+7QiVjDaavLLCeT4pZYtrFCN25/xM1+
X-Received: by 2002:a05:6a21:748e:b0:38d:f250:7a79 with SMTP id adf61e73a8af0-39483780690mr12105647637.15.1771402602733;
        Wed, 18 Feb 2026 00:16:42 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:403:e988:3f54:236b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm11966535a12.29.2026.02.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:16:42 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 18 Feb 2026 16:16:37 +0800
Subject: [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for
 devm_kasprintf()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGR1lWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3cTiEiNzAwNds+Q0C/OUJHMjyzQDJaDqgqLUtMwKsEnRsbW1AAt
 +zz5ZAAAA
X-Change-ID: 20260218-ast2700-6cf87db729f0
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771402600; l=1056;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ATLkbn8TN+9WkJGc0zUgyg102ukNwiK3cRL5DAp1VH4=;
 b=mbhAFVh+U+0K5i8+MeMwiZF5g2QdlgYBo36O8enjZLUm7iFq7+Vaki2aS8uPGORp5U/erYDXe
 TirWXZT+NRjA8lBL1zQsJf5Aq5gsMXEhCXt30+bItwC7kLUzMkRglut
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

devm_kasprintf() can return NULL on memory allocation failure.

Check the return value and return -ENOMEM if allocation fails in
ast2700_soc_clk_probe().

Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/aspeed/clk-ast2700.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/aspeed/clk-ast2700.c b/drivers/clk/aspeed/clk-ast2700.c
index bbb2b571eb72..011f8be03edc 100644
--- a/drivers/clk/aspeed/clk-ast2700.c
+++ b/drivers/clk/aspeed/clk-ast2700.c
@@ -901,6 +901,8 @@ static int ast2700_soc_clk_probe(struct platform_device *pdev)
 
 	clk_ctrl->clk_data = clk_data;
 	reset_name = devm_kasprintf(dev, GFP_KERNEL, "reset%d", clk_data->scu);
+	if (!reset_name)
+		return -ENOMEM;
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, clk_data->nr_clks),
 				   GFP_KERNEL);

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260218-ast2700-6cf87db729f0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

