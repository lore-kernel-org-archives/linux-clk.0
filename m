Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0820E031
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094789; cv=none; b=V7p0Lhrs/TdeGi9zYtABpcdnxW0s5xv39XY9km6Uizp5tPplrS1fPFmSd/U0hepu4otZNGZMIrKgHLCZ+2HlfSjrf7C4l/Yr6ti4uYPnNFILUheCJA9QbCO4Ej+wPSAugIHcdOESQ0vJsQTuYutGUZ+HEFnDEf9gWu45XBKLSOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094789; c=relaxed/simple;
	bh=iAKDyNseVG4JZAI/4/9XYyxILg/1/MvWisG08E7UdNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fA5L2avmRlcd31d59oGej8fjSxMMmtss5g7Q59fi9YxUHf6xshpsPbuSkT0wnkGYxaAOGFYmMMu0o//SOdBsraUBnc0mP2hwfZvxDQN1BfjmWL3e/C9hGcFJ6abgzHG8aCaCL+m7QqyfHR8w2DRq1r72he2eMAaZLQ6LuLe0KuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOFVBN85; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOFVBN85"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5964596e87.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744094786; x=1744699586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ZXUlXFpxCk76Zskk3n3ZWQ72WfXAgt8H3OlOtqE54=;
        b=KOFVBN85zJybjWJBEwgRy09/allpV/s9nRwxjLAHPwComCJvmcmFSrMJrQxyEiUcD7
         9ZZcFQuDbWP+tkG7XzgUigtydJXg4jBirSL7KLbktlbKO3T7W2hKKmE96Of89mqRnLs3
         DHy3xiyjO2HuB6+3qAXyeFeY6LuLRyVUyu8HMSpbg+cioYWK3LTKQjv38+eVSEtH/Pt+
         TsOODDBCUALBmHjI+sy/TcCHTnk0C9CpXTa98eiYMhd87I7xAsESeXOFOJiB4RDd+30G
         UZ04xY/jBX1t2gVpWvXFy6N9XY5PSYhh55k9IZaU4nij+CBu7ThyEb7M9kfeoTCmVrVZ
         b0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094786; x=1744699586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZXUlXFpxCk76Zskk3n3ZWQ72WfXAgt8H3OlOtqE54=;
        b=q57en5crr8IHhDv4fu2ZijZ2Ud0tbrBF7pa9uCHXGkzmzguYX6QBuYsdKnGZ8dbPXy
         f1vMSZUKq7sCRAA9cEz4j85eg3KBuwsYBZjc+5E781FiCOenAcKeW2WfPO3+u/sp6bMh
         GPUsPMAXp3cXJ8VjrLUMIDU0L4SVQYaRsNPNndwD7eEDIpECQUL/k6sGh3xgcYQ1jc3V
         /ihIRa1xUE3PC5Dxi9Lx7T/q9LAUeMVoquoYlXzP9uAqcqeEN/mKQ/mHU/1XsHmT4OOk
         PPpgf9WXkBT2//IupFteCGmMSBZzU6WSJwgAnMfkaWFQr1raZp/BuMsZLLq8PXxeH/lV
         3KPw==
X-Forwarded-Encrypted: i=1; AJvYcCU10k7Qo7TC7mG9T5l2UOwm8gjzOTJ39w55BcWBPsHINhy0XmbKYKF8lGHVM2FROGZEGxn6J5X1RU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLJ5xvYZUdyhYuJBelMfArMePyc5HSeMHWegEl6X11oe9XTcG
	PvYgcJpC5WOlVzQxjnodKGnGcQsH4LMC9R4KO7f5hu67LMSAADrN
X-Gm-Gg: ASbGncs/cetUlPECdcQE+UGl2972+F++D2GvXyy3ck6XwFYyP+btmK5Caxc0flkfAHi
	CAaxSgdd0HrmOmt5gOpDu701gk7MzuEYNo4Qyjkm0dmCziOzOkDRBzNWP7LcW0+4Etyg0eDzIkn
	8nin135dWBnkHNEGESQo1/PcpDUUKMMUa2knYt+N7qAGrdXOuI/vjtPQDvKe+6A+tmnaPzDnRMW
	o7C1ZKWrXuqc7AFVXJy4XfcEfEOOqD0b+LNo+YnJdjdBZ52zJdtsFNmhNZANvKTFk4tKVnSro7i
	YEcfF+j0USlEHXRTty4x7ePj7pAk/NYXbehZ34aFVBZKqvrSn58X3rvwLSD+MIFyMrM=
X-Google-Smtp-Source: AGHT+IHgHWsakrfLfhmmiWC4HHmMMPaI4hd/D/q0s+PSgcAGf6f/l/AVumjrJcERbVfKlMMm58iWIg==
X-Received: by 2002:a05:6512:110e:b0:54a:fa47:b2a5 with SMTP id 2adb3069b0e04-54c232ddfbcmr4204887e87.23.1744094785709;
        Mon, 07 Apr 2025 23:46:25 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e63709asm1440800e87.145.2025.04.07.23.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:46:24 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
Date: Tue,  8 Apr 2025 09:46:12 +0300
Message-Id: <20250408064612.41359-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At least one RK3588 clock (CPLL) uses 1.5 GHz, so let's add
that frequency to the PLL table.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 4031733def4e..1694223f4f84 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -64,6 +64,7 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	RK3588_PLL_RATE(1560000000, 2, 260, 1, 0),
 	RK3588_PLL_RATE(1536000000, 2, 256, 1, 0),
 	RK3588_PLL_RATE(1512000000, 2, 252, 1, 0),
+	RK3588_PLL_RATE(1500000000, 2, 250, 1, 0),
 	RK3588_PLL_RATE(1488000000, 2, 248, 1, 0),
 	RK3588_PLL_RATE(1464000000, 2, 244, 1, 0),
 	RK3588_PLL_RATE(1440000000, 2, 240, 1, 0),
-- 
2.39.1

