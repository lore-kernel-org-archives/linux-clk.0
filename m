Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B982222A0
	for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380060; cv=none; b=dWEEF9HK5HJPvspcrMBrFLD3cradT9EL+jBc5xW4cVGiM15lyYTe9kJ5X7v1WTY9CKdTccQboHZd9PgcLp2slOYkfradoVki70mfpB+3R926+TQg+LzmSGPvBT0r9ePEWESgyXurRvKs6QoMAeyMRU3Soim0fZlomSEgho+jP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380060; c=relaxed/simple;
	bh=/6YpLzd8OP7OrUNZhvNvzosp6L2aNf68/nMpGbnMjVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjB3qYjHQVMqDM4e4DgbGL65bAbIHG9gxNB9/M0LnwuwYsVJrhswaWLT27esx3u2AHtDnv54MzR6pmAmo14vJ8hP/1avCmjBjg9qhpfgsWkAfq5saOpVyyYz+BSmFWAQccOISJdVkr3IHYrESRuCDJbFb4UNkqkWwZpuAxivXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKiU2bGX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKiU2bGX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so2052758b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747380059; x=1747984859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bZtQnrAbigRgok22yw4g3798mI7fLMxITNSqQuTVaw=;
        b=iKiU2bGXY2QwjMFmH93YRSqBnEGPN6rgEkVqWG6G8pGPrp10dR5UQBGTpjhdiyIae8
         LY0UzxP/QOs9wzt1Bd3NqI58TSnjaTifZgd+3/H1/ZcdW0vIekzzaeDAxXKYmx2n4U1w
         /rSg/8rMd3t9GiXi/KlTPXz27Gzs8RUKrfZrjdD7GywSvRuUm6FJfqAaRreEwfJ2lqIo
         +nf9SwySEu+gLnfKpthY8LpXYoRQECnWz0T0Fi6r3nVknMxojSwkAurrSUqsu4pwURb2
         8eXzrBhunsRWAsk4PDsBw+eLq/KMbrFJOAy44LHNouElMxB86mXdPY3uFS764J9plUkK
         Zn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747380059; x=1747984859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bZtQnrAbigRgok22yw4g3798mI7fLMxITNSqQuTVaw=;
        b=iFzmNIfqFy7YgmOjrNW3+lsBrOza1WMtkVxgmQ53FtxKK9u6oVN7HI8QnzWz+FrVUO
         vyMvPDrJRjr8RPDikm+0R8n0+BlwmifEy1eB1VTdn2kGWkAa6Iq3X/IiKN+Q8TadCz3H
         1hOSDwZSTpok0uvLb72rpTB59tRYhI8yK8qD/+biqjnnGYIjRlPHTg0KY6apRnDKbq9u
         Rk3tydfJKP3cmZni7gubPxtsilS5hA90UKx3sN47XJPxs/4CyAr0ydm/h+TEoF8t/VWM
         6JoETcJqwxoZkcdaFbBg3Q5CZwhben61HEV+sHxKz2Jg8Dby8zeYX8qbMG2P2yQjSzKA
         siCg==
X-Gm-Message-State: AOJu0Yx7vpGYxi8kLbiIy2OdBoN4feOf2t/YTf0jGmKMnY1coFhMQASy
	cVoJl29PZs0hvRnqh2X+xHwIv3sS/EI8DCEkyGhVNjOACiqB0cNwOwrD
X-Gm-Gg: ASbGncvWcTNAiMp2+ZqG1fIo//Ga5iggnOxEbj2xbCCUDewitByTEU1p8ijtMnquMAB
	yiqcYjirgAGmbOwLTFSS2+R5WkF32yFacAwknt3nqpPLcCu0kMZ8dnnXFz4llipSLv85zNm4QHb
	BXLbB2ozgkRzhdn9K1YfkxNCFyM5K7kp7A0aG2NCfrAgux/IJ5rHNOjzBB8obOarCp3+VHlAXXY
	UZ8QVPOfZDiUL5NBaAArx5G80juEt+ye7HLWXUnraiS3Emb/TiIkg4mN6s6ZCBp9DXX8REzzbjF
	e+WFISpefxYlUCQfTI6zRhi6L7MNXaBEnogt0I4baz+bEQBwPSubjSmRKMPI/BHtDM6YT5Dpl5t
	n2CIn3Q4g47h0D6GIfLfU
X-Google-Smtp-Source: AGHT+IEHgegbY/RBwhcOsjlIgozbZNU96udSDFfRZZ7XnQaa466la0CQFAVhXq7j400HqayyRJK7Ag==
X-Received: by 2002:a17:902:e80c:b0:231:ba23:c7e5 with SMTP id d9443c01a7336-231d43d9be2mr23575485ad.6.1747380058519;
        Fri, 16 May 2025 00:20:58 -0700 (PDT)
Received: from fletcher-beelink.. (syn-172-090-047-185.res.spectrum.com. [172.90.47.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebad0bsm8498385ad.196.2025.05.16.00.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 00:20:58 -0700 (PDT)
From: fdostie@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fletcher Dostie <fdostie@gmail.com>
Subject: [PATCH] clk: rockchip: rk3288: Enable clock rate propagation for I2S0 output clock
Date: Fri, 16 May 2025 00:19:58 -0700
Message-ID: <20250516071958.837174-1-fdostie@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fletcher Dostie <fdostie@gmail.com>

The I2S0 output clock (SCLK_I2S0_OUT) on rk3288 SoCs was missing the
CLK_SET_RATE_PARENT flag, which prevented the clock framework from
properly propagating rate changes to its parent. This caused the I2S0
output clock to not function.

Add the CLK_SET_RATE_PARENT flag to ensure that when the
I2S0 output clock rate is set, the change is correctly propagated to
its parent clock, fixing the I2S output clock.

Signed-off-by: Fletcher Dostie <fdostie@gmail.com>
---
 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 90d329216064..0f24060761ac 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -364,7 +364,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 			RK3288_CLKSEL_CON(8), 0,
 			RK3288_CLKGATE_CON(4), 2, GFLAGS,
 			&rk3288_i2s_fracmux),
-	COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, 0,
+	COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, CLK_SET_RATE_PARENT,
 			RK3288_CLKSEL_CON(4), 12, 1, MFLAGS,
 			RK3288_CLKGATE_CON(4), 0, GFLAGS),
 	GATE(SCLK_I2S0, "sclk_i2s0", "i2s_pre", CLK_SET_RATE_PARENT,
-- 
2.48.1

