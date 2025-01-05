Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3715625A;
	Sun,  5 Jan 2025 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088177; cv=none; b=fHgItpz/mEgGAp89HWwpLq1xGP8ep9GeS1zk0aabFx242ddIeCIAb0FKwedjchmT7AEEVY7pCM8zVE2uzEQccr7vvFFAIpLEk4+bWkz1ObAy6xGnHKCu2j0k6wBwJGWVnW2BwehSCWxlMMI2HTJs0OY44i9mVU8A/6Q8E11H1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088177; c=relaxed/simple;
	bh=aXYHEyhcGDnwQtSXky3nGDQSSqSNdvxMLGJcZmOBs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTmymDgpjv98S6UtQxysuUOkY66LvCOjbtLDpg+P8NwjigA8nyAQhGHK51M3T+E4xh+hYQ2/mX8KOoserem+6gGlDadn8/Mb4UCrlws7UnAhLJdFAZ7OfPygm7U8mgqUO2NrgNdxr5iSMehMBbHJM+ZHIb/bEtmFtbgnmxsWPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6luk0g1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6luk0g1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso92795515e9.3;
        Sun, 05 Jan 2025 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736088173; x=1736692973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd0ivsCOxo6eepP3Mt6WIBgGEYTd25op3kx8K4XoTrc=;
        b=Q6luk0g1ByDhDMAULCi1aYYiptJHs0kAcXAoLbwFxIYYOXR1vYmwDtRwkMoS9QYftc
         r+UjUort9CVwyQxenocnOvuj1rs2vPMh3TvYYbb2ONl4Y8JG+/YYEdbAeUcYtMdjOLjl
         2WYp8fMGJ2Bapv6BWxlmu32MNsaI9RV7RL+VyJV49eDLvD418lpoPuYT/0sYkBuWc2eT
         Gyc5xoy8sTX115DFk5ojzmhmC3k8K+4GbQ1VRTcBRNrd8IR6I2HPxrxXQ/lfUK/IVpid
         YZt9dZz7RuoVajemJ/foEvk2DJ+0g1UhMKM+dWX2i7NF46Zw0/z0Axpys+Mk1W2LSaaf
         ptjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088173; x=1736692973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jd0ivsCOxo6eepP3Mt6WIBgGEYTd25op3kx8K4XoTrc=;
        b=PA9GA8mwUa2m4KmOcPwofjNopxE5LJxr2yN1jDLZ7SikDiazCISNiT/L4ZrxWkKGLm
         XHkKCYVjqzcChPg7yRGLLG4K5ulBWQ1XJqjUiDef5+xOAsfBsMZoyZALA5yc2oClekjr
         6GFuJ8K0A8k9mB1laWZKh5f+DYSUqlX+xahyRIdd8YeEdr6hEuiSXA0zND51nulsCQuc
         R5Q8qxrLJ6/G9ysfrf3+JM/7r2Wp+icBl4J3IhPMwrFIA47A+hHOr2a4QqYFSBg0tJ9s
         E3mR7TU/Q71OxgNkMwzKcDEU4hLWBfbfcupxXmyllIFhK4BNI/qxK/z0Zi0Tly3ll7By
         7Kyg==
X-Forwarded-Encrypted: i=1; AJvYcCWGuZ8d8d9xEXo/uK+U6BjCf+wr6Dg/QT47XhpzWIgLT7Tp05c007hW8RgktXh5e4pmOO3j1Yf/uyOhLnIE@vger.kernel.org, AJvYcCWbXzDJVcnrdtcZ3ZBSU4jO0v8tXO2qCEGROIdsLtb6xuXlrXb/BkKw9jnaUi7LzEx2zTiiyR30g3pB@vger.kernel.org, AJvYcCXbednUfRREAkHCNlmbWA9phgbCVcJiOVRaoZBcqqWia67ohnv2u2bWjnlv0Z18QcWoRIRiSHpZ4+vK@vger.kernel.org
X-Gm-Message-State: AOJu0YzhPGHJCzGpfGRcCaElplMHsluvQ2H93gWZh/7I2nmmImD75s19
	edYNfRz3KQdvuThKfqvV0D8YrfgQcPsL5d2GiyTvMR92z4buSAzi
X-Gm-Gg: ASbGncvLdBStq+pWQk0//8EiUMBo86JegHtTwB3y6nYvBm1aaBSXNbuziW6MDrWQ1lB
	f05Uf9WCreBS4nJBvHx0r83SO+DoqE5M8VdgXzq3JCvFhEjfJvp5v+WnZNIXArD+HuzJKV8eo53
	U+vf1H5uTl/BkNxYoFI3sIxlWsDxTGtEkO3CcB6a1puMLF92aAMFyd/FajCabzXwjU3XgIt4sJH
	1OkcVenaOg64P44szGSu/jQo5Q8rdSgvx9IzXBY0pdJ2CyYmVWhtAHgu/gYeW861T2WMst/jq6z
	I9qpj2P4d/RJeX6ezNZlXvf16wRCa1cLqd/eVqxtMA==
X-Google-Smtp-Source: AGHT+IGG/tO2Lt1RR3RwIADrDoxZJHJyg2667n9OATP8E6fkLp+FqDm6xbKIJUkTGitScnbjrZs9tg==
X-Received: by 2002:adf:a342:0:b0:38a:624b:e37b with SMTP id ffacd0b85a97d-38a624be4e4mr11369844f8f.53.1736088173542;
        Sun, 05 Jan 2025 06:42:53 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm537419415e9.10.2025.01.05.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:42:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 4/4] clk: en7523: Add clock for eMMC for EN7581
Date: Sun,  5 Jan 2025 15:42:01 +0100
Message-ID: <20250105144219.22663-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105144219.22663-1-ansuelsmth@gmail.com>
References: <20250105144219.22663-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock for eMMC for EN7581. This is used to give info of the current
eMMC source clock and to switch it from 200MHz or 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v4:
- Move to patch 4
Changes v2:
- Rename emmc_base to emmc7581_base to make it more clear

 drivers/clk/clk-en7523.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 596847446b14..b36445359b5a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -91,6 +91,7 @@ static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 }
 static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
+static const u32 emmc7581_base[] = { 200000000, 150000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -281,6 +282,15 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 0,
 		.base_values = crypto_base,
 		.n_base_values = ARRAY_SIZE(crypto_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 12,
+		.base_values = emmc7581_base,
+		.n_base_values = ARRAY_SIZE(emmc7581_base),
 	}
 };
 
-- 
2.45.2

