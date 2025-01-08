Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C441F03F1;
	Wed,  8 Jan 2025 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329002; cv=none; b=FfOPyLbJ0aw/JMBWLbqRejOu5Oh/ljWvkAEw0JIPWbsOa7NLZ5HdURElJfRsacwlUPP9X+FheXSkZDex83IVvuwm/JXXUXDQfklS/L3wGc0Mk+Afp0Gq995UyU3jrs0uqMMpcX9JgfTy9ZTT6EqrfiZ1oVRPxZT87rriuhIUeQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329002; c=relaxed/simple;
	bh=rL+51DfZqr9UBehcBoLMSIU4hNBv1dguHoopQ4OLK2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GCb0ycgFon6GaRjMP+LYR/Em9bkp8KvZ4MB3gdgBt9GT2LlHbNKQqWyju3DUnAeyFOoiEk76he6o1vox5ZKkBZxpAhmNA2rLL1uX6FIdlTxaLB49YrB48DMMjLAn36d1XmnXY5H1D0uYL0+gNKf1TPmxQRwNNgrqJ40AGVXUel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAcIDx+c; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAcIDx+c"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361c705434so119204175e9.3;
        Wed, 08 Jan 2025 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736328999; x=1736933799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDYeYW/u6fNVia6QTTE+7W+qMbdwhM6JEbCTl7sDDhs=;
        b=aAcIDx+cONyry0oUrZo//FdJwADR5ir69Y8NE9LK7/h0fEGdbA2iOOmLN5skADCBm0
         GEYM3xt5Am5ZNTniGaf0ZIx3rDshplIbXNKkA3ob09VkcdgnVhR0f5h/23OdQOyebrBZ
         2qVfW/GxyR/sZFFoxfSRljKf2d/h3NrftNDQS2fqeCgx051kWZKibWOv+q3nw3X2ASh8
         EzfCu/25ElbStDbDU1+Bc+UBlSbqJRd/6Xo/MASCMsYZXMaP0dmfDcZ9yUgXAEKF8mIZ
         JE7BvnybCvwF3c/25fGu4DVzhvF9cjNsQzy+Yu9QuuqbxgNTOoEuXHk3R05nYZ9U0f7I
         8O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328999; x=1736933799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDYeYW/u6fNVia6QTTE+7W+qMbdwhM6JEbCTl7sDDhs=;
        b=iKS6rpbgwPc20uJokOVOc/6YWATk1yGTJ00878aKV6YzxQjx/ijLgqLomGaV1eMOBY
         5usZZnVcGPfu0Jw4NlUQUwub5dNEkztM6IT5JxVEDxVm3AqP9nOOr4kgx7mRYV2GS1Bh
         P7k1UEyPiJpAD7OeApARocp6GzhXskrjL+O4pxK/qgkTSrlo9IFs3eU62m3JgF5mQU3N
         0Zed8vutIuenBeWKDL50tHKuE0x3fonZdYb2cP6UOn9VaneGY3+jbhP9NMCZxVVsky09
         ExlOOx0FN1xLqF1rIoO85eMTNc8t3Ha6gyQY0QCBOAiFI9iY1g2ql6gmq/vrJa7q+mcW
         +olQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDMPtUkvzP2XnEBLaDQdXPbHxLuJilB/xQujD51ed/9X4tZFNEyEyBtPvrm3TRoL8uQVLwNPid0ccZCdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFVj64gqeqZX28cHA1yqXHh0/zvAcp35ADwXDK7voHSeqKgjrj
	hZkTu3foCyrARLUcQ75AdDYJ7GeJXV2i8Oy/h3SITDfVnbH7h2Icln8/IA==
X-Gm-Gg: ASbGncsfMaNAVRhWQiFPMbZaxMfAjUMpbUKIskPkZd57U4nOEmsjWKYuUdMxuutVtIN
	b/jOdBO5biIZt0vyDH1Wz6S5WHdLJZoaDb7g5zIPTkOYIsRAvbDqOIZicP7FB/spxdY5upjgN+B
	A9odcbgJkYDoF/AcXq2JVjORc1Yp99bZduy7Gh1vmi0yDpO1S8EOrbLKIaEjl2DudRLYJNB64ae
	C/JCP3QNoAHYTzljzkdWMc6AOgmZ27HHuBFiUqwUANAjiCxGPTHUfWO4xKloSEemOProAWzJC7c
	p/aHTsUgSKKwOaNaAkGg3yfZxKJStA+pfx7GNdERnhK1VY7M6w==
X-Google-Smtp-Source: AGHT+IH2CA6F7jiyHIbISYAeLSuelfbnnvpf2WyKr3Ji8mNG9dXQiz/PtdE9rZIknPfANBPLojlIbg==
X-Received: by 2002:a05:6000:1a8c:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-38a872f6f9amr1570878f8f.11.1736328998731;
        Wed, 08 Jan 2025 01:36:38 -0800 (PST)
Received: from localhost.localdomain (199.red-88-11-183.dynamicip.rima-tde.net. [88.11.183.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm53161715f8f.84.2025.01.08.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:36:37 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH] clk: ralink: mtmips: remove duplicated 'xtal' clock for Ralink SoC RT3883
Date: Wed,  8 Jan 2025 10:36:36 +0100
Message-Id: <20250108093636.265033-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ralink SoC RT3883 has already 'xtal' defined as a base clock so there is no
need to redefine it again in fixed clocks section. Hence, remove the duplicate
one from there.

Fixes: d34db686a3d7 ("clk: ralink: mtmips: fix clocks probe order in oldest ralink SoCs")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clk/ralink/clk-mtmips.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtmips.c
index 76285fbbdeaa..4b5d8b741e4e 100644
--- a/drivers/clk/ralink/clk-mtmips.c
+++ b/drivers/clk/ralink/clk-mtmips.c
@@ -264,7 +264,6 @@ static int mtmips_register_pherip_clocks(struct device_node *np,
 	}
 
 static struct mtmips_clk_fixed rt3883_fixed_clocks[] = {
-	CLK_FIXED("xtal", NULL, 40000000),
 	CLK_FIXED("periph", "xtal", 40000000)
 };
 
-- 
2.25.1

