Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1452E1CD15
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093907; cv=none; b=TdvhQcZwioqDiCJEUt3Qu7Ml6GSnU/MhwXMTbPWWA0ttY/wx+w13rMi5JRlQTlTHOoOdv7fVenM8lTiaFB1hgYxaPen+pk3MiEqiXlYfGjhLGcYmkop0cNSafgT1vAf6kqgNrIHRaxO1tA10L0/8l6USgZXdtxisL5W4KerzXAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093907; c=relaxed/simple;
	bh=714ZcYQvY+/8egm56R9pWF/b0yGviswSqOEZSReZhcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pBUTiLzWtRtrt1DmaicH+x8VkkE3on32so66yE6Vog1+9rXNM1Gk0jQdqrtAl/PEmPVkV2X/iqCsZg5g6AMWc1njpUULZ0AE2Sn7w+UEky+STO6cQrdbxC4kZ2AXdQvZXv/0aoS/yKVnsxZRlXerY9o3Nt7KKFPtXJh3YRE8x4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5wV3KOp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5wV3KOp"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30ddad694c1so54870461fa.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744093904; x=1744698704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/j7X89O9xO0mUxcRUMJWfkgUvGR1hQnYHcZiDSC8zs=;
        b=e5wV3KOp19L5kh/3KYs2+f2Kzo+O2nQuqgynv2cRJRbGrIqlCbVR0AZBXRTx+3oDtX
         TEieIwlMW1CfJCs568IO5V41St3hk6DxcX1L73cQX9Er/SfqlgV3Fv076/XV304DIMOx
         udPShC0E1AsZQ8Jltm3n78b7GUBWolNBNKoKLJ4f8sZJTPTDHDqjmrxrGY4UIan20EC5
         AGula2e+VCxYedXdCLWUj3S3TRIrqBm1lgkppEWWNDjqJthU+wnZeDGl3cFnnBXgKliT
         aDE/RghZNhuaovttt/b2VmurvZZf8am4I+Dn1+0VzBkIQwpBa7OgVxDxbJq2N8momssl
         yFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093904; x=1744698704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/j7X89O9xO0mUxcRUMJWfkgUvGR1hQnYHcZiDSC8zs=;
        b=VoVHxmf55Fpx//HHIkrVdyQGjYtmCuc8XMBZa8rmf3awLvIShpeU2JcWC3bdBBL5XU
         8LVf75TxnV4kYZlmwdsjmL2c+anDw+Xjg/8/ms6SKDfawqI+jQPVgbbhj13PuarfPcnG
         E+80UTVr3X2+QMP3jh6fr2zNNq+sLMeQrXsK3tBLUQrYAWCM+LKomu8reAN8EYckrSmR
         Eir0oczIIO1CzxJs708fMBsSsAkFTo+pBd1dcb1jM+A9OvwyK0XTuOXh+2XJRFwMAhAR
         M+AtDrAQ8S/3o/dVQHrdpP4eBiT+PIZluy9bm5yT9oID3tf6+YUz6GNfllNuzwX1OXDf
         lV6g==
X-Forwarded-Encrypted: i=1; AJvYcCVjhrq8OVgTNDV+vbGpIxhr9soB98EYSKVvhQVcIO1Xit4fCXn/B0lSbx0ZacysXy8fJJX46WjpGwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3hOx3wg7g5zwOxEn/4UTHYq8F5WzXOC4hu54AggheKy3o2ki
	A+oHRlwSeW/XztRZ2XYoP6xHLCA0WxcFWNgjRV0ST1hxpee1JdprxgE1I8DN
X-Gm-Gg: ASbGncsy/OHLmxYD88reiOglJrgyh+zHZ28/mHY8Wwgw7PN3R6mCvTPR0Trt6BeKcUT
	paZza/whBNr4LGxQ/mIISxKQVpImR5qSZe8BQTX5SdC4r671/EltzgcKK2EC7nNMvZ0GxSYZHP3
	bahm3uKxX1u0X9TMZMmgl6fhwINd04IJHJ1J3TsjxmYayYTjpWWBllBmnEusjRgfXHmyYmYLSuD
	OAyizSBMH+stChAnOkSesZZ8izSkoXtCh6HxApeQJ76Qr8FKb/Z4ZQ0x2MrtO5W2qLYNLuJpnDi
	tjb+ATefsi96yIsM9ytXofu6J/syWdYfvP68ibpd2UpH3yATZFzywkwkIbD6J70JlaA=
X-Google-Smtp-Source: AGHT+IFFROvjnZfAxfoyPcg5HrxbhQFOC3CDl1CKWR3dFbmCGB2xIAFGBL6OygaC+l2LUb1NElNYeQ==
X-Received: by 2002:a05:651c:221a:b0:30d:e104:9ad3 with SMTP id 38308e7fff4ca-30f0c064a24mr33615061fa.40.1744093903907;
        Mon, 07 Apr 2025 23:31:43 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03125862sm19141801fa.3.2025.04.07.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:31:42 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/2] clk: rockchip: clk-pll: Typo fix
Date: Tue,  8 Apr 2025 09:31:26 +0300
Message-Id: <20250408063126.38904-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250408063126.38904-1-eagle.alexander923@gmail.com>
References: <20250408063126.38904-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed RK3399 -> RK3588 typo.
No functional changes.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 77ba4d6e7b5f..6c5039bd661f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -949,18 +949,18 @@ static int rockchip_rk3588_pll_set_params(struct rockchip_clk_pll *pll,
 	/* set pll power down */
 	writel(HIWORD_UPDATE(RK3588_PLLCON1_PWRDOWN,
 			     RK3588_PLLCON1_PWRDOWN, 0),
-	       pll->reg_base + RK3399_PLLCON(1));
+	       pll->reg_base + RK3588_PLLCON(1));
 
 	/* update pll values */
 	writel_relaxed(HIWORD_UPDATE(rate->m, RK3588_PLLCON0_M_MASK, RK3588_PLLCON0_M_SHIFT),
-		       pll->reg_base + RK3399_PLLCON(0));
+		       pll->reg_base + RK3588_PLLCON(0));
 
 	writel_relaxed(HIWORD_UPDATE(rate->p, RK3588_PLLCON1_P_MASK, RK3588_PLLCON1_P_SHIFT) |
 		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_SHIFT),
-		       pll->reg_base + RK3399_PLLCON(1));
+		       pll->reg_base + RK3588_PLLCON(1));
 
 	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SHIFT,
-		       pll->reg_base + RK3399_PLLCON(2));
+		       pll->reg_base + RK3588_PLLCON(2));
 
 	/* set pll power up */
 	writel(HIWORD_UPDATE(0, RK3588_PLLCON1_PWRDOWN, 0),
-- 
2.39.1

