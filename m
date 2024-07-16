Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55319A842
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125857; cv=none; b=adzPuOBUp2WcfEagg6SsoorTqK3wFFC2Mv0YVyt2SBLTWQl531+7i7elUDGx0h3965ZP0Nkkab0TRPdtpWYhf9BoCyD3v3lCKqLXVVsQV1FR2GNR6S+rBdHjtt3MMnWgHMkHMITFbxaLS/yVLk64HXQnO2ZYnWYOux2UyyKQafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125857; c=relaxed/simple;
	bh=3FnnVqryGA1+fyj62llLLDqTN7Yctxhd6gzpR4TrpXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LdTut3cNykoZiGSM4TdkKi29f2Rac4wMtx9NSp/7aALfJLDbJWV6WD6ydcaDIchyKmrir6Fl24sJlUgcHkXZakaUXHEgMSdjFHA3ter/UA3b1I9LywNKqclJEI4TqHAZ0YBxuZofLyBZn01jKiSQ5wVL6ouTZx9r4hcmA3Hkiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MnqJtLqO; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MnqJtLqO"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso64901331fa.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125852; x=1721730652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Lc/uNU85i9gb0+79NrAcdA+6hL4Qt2Dc7/pD8w1sdo=;
        b=MnqJtLqOH1xetf+sej3CzzDckDmuqP8XGjAGqE5sikHYdKqGzb2HsUm89LJZZ+wPOl
         9WPBtgKXIGtG3NHpglNcxuimRYRe+KvAF3bwzU03KuYzWPbN7VgW6BQxxwYQVleEkjgN
         8u3dzB+ZW7wi6ILhJFS+Zl6ueCitHyszi9OUlTNLcH95rjaFq3sTS+iLcBJRK/wpYvPg
         8OH4Sr/3Ic8JwR1upvbppFu7qmFqFxnzlK+maQEEtTMPvbpVZIDRUPlAjXgAn2eximfx
         MOY0ZinQtOQrs3g/Q0yjtR9bnhaXJnq01nET9VzvWwQXKocHJSLjAFx0X2qA/PSOsatL
         KmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125852; x=1721730652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Lc/uNU85i9gb0+79NrAcdA+6hL4Qt2Dc7/pD8w1sdo=;
        b=IwtnHkFAmM4M4l4rDscN0hjI1O+rwnXtZG/NATwIPLkPQ+s/iiG14III2VIfbQV7gv
         aLBwvnLDnPrN9qYzKe4dzfjg1is4WGTPWu5jBP/Ootjp2RhVtUjlVRk9e10FweQvzvIw
         cML45vEz355bzLniSfjvISfWvdUqa5TZd20etaFNiE83UBL3lfRu98bKgA83Jz2SfntK
         bmmgvI4sAEFo+VaE2ym9z6mBOfNQ9TYy3yFqFH1fP21ar3x3vxuRPdFFCcgU1ClVXbRt
         YAmSaJBQ+uPED11PLU9rhvQCFLy2+t3o7rYGbgN7edbZrYl20MCfjuu89pNQf4af7pEn
         SpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0rRcVbf0rIU2tRI1tdpSj0kfK9/yfqL6ukisZg6u9c80DxuZDlQYcxCUBsAjkjXw5+gwwQ6hOYgvG6AAGYHzVYR7UYgZeyA6G
X-Gm-Message-State: AOJu0Yx9sjGla9oJVfmgLuDDbpYUxH3PuoO1cGbhOdVjcZLWrYtQy2OK
	CeLZIV8c460GjobxLw7Ojq8DhfmH6B47pLlJCPc4ZZUeLKkAQp0JAWUv2piKU78=
X-Google-Smtp-Source: AGHT+IF1Lb+nVjAsf8fHP0AS1wIPQKQn9s1ZCjD3vT5CusZmhAU+Uik6JLX9tgQRYjTy6nqzNxi6bQ==
X-Received: by 2002:a2e:9981:0:b0:2ec:f68:51de with SMTP id 38308e7fff4ca-2eef41e29femr10746011fa.47.1721125852148;
        Tue, 16 Jul 2024 03:30:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:51 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/11] arm64: defconfig: Enable VBATTB
Date: Tue, 16 Jul 2024 13:30:24 +0300
Message-Id: <20240716103025.1198495-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable VBATTB MFD and clock driver flags.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c9fcf9ad395..f35fd006bbbc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -750,6 +750,7 @@ CONFIG_MFD_MAX77620=y
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
+CONFIG_MFD_RENESAS_VBATTB=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
 CONFIG_MFD_SEC_CORE=y
@@ -1358,6 +1359,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2

