Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9303C1ADFE0
	for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084212; cv=none; b=vGoSfVpzhpB3FfTBpQfgYlbYRouMnIP3D4SN9rM8qFJMEaX4CCW6oSKcpD9nyfxbbmhnnHcKFAkPNcJcyeazxnHXXrj1xq0/0VWNOFxFumq0xCzML6+3I5J80Hjo6TYOVuqvspdr3KqD0Yym4peQFIxElZD5OXnGU1YLnI2+V24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084212; c=relaxed/simple;
	bh=n4zlrLsVQUGa5+NUAanIaq9aZoPbWfTfoCH89MaS3JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YNKA+qOnd/L6BAW66rMAogQ3uLKlRooc6onPt01EFrFWLy6z9NAeQDlD1pD9eA2mE8aF2e/OdqbDE9rjGqq32AItt0l6RbgRaoWV8SEd2lrmrwDW4yKlR6Lw2+Ghs89NuiGEbOmzEsco+WH06v7WJyyANePTI6sZ4AtsBVT6r9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t6vfc9EM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t6vfc9EM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b364538so882896f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2024 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734084205; x=1734689005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFI9i4ok0V47vvvqEZzi7w3lJlZg6r1OCY/7ewYTXag=;
        b=t6vfc9EM/4GujzzzALTG3VbFGu/DhPsKrdJL0+We9dpATGahH8Pp7xQ1OJ6+NpMhFI
         bI4daUBRYMmxqe1KNZPHoQvj7wCRHp91imlMLzmO9LfMzWZevZZpnVX25P1/0NBrMcnv
         EFlbv5+sg0qT2AL4k3sE+QL7tn0rb37VdIMwtgdKOmTZnLd9U05bUsUKF/Q4XkR0Q6tn
         ZVegKvv7LUVe9Hxw+gQmFIZIBPbDKQle9xJdZP7AgPk+IdnOasKRidDi8/uHOf7wTIpY
         bAQRvbMLXzuAzKfREMEGCtB5LJ5onq5yF3LKdiuHj4oKbxAAD1nPod8XfGvpRXMHEQ25
         3aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734084205; x=1734689005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFI9i4ok0V47vvvqEZzi7w3lJlZg6r1OCY/7ewYTXag=;
        b=mlvHjHK8/ClGHiMIraSyU+7Je5L8eR9Nuaj9z6zMG97Tgjhot8RZUN+/LFzVbPJvsE
         7X0+HGluk5JjDeJV0xWDNoH9yLjWsqr23/s1uJwPu3MuaQS7zF+okfQvvQ40J6Iu+Ho8
         xKSaki/IasaipFgJ1klSaBtB/bF5U0e9y6zSNmI1ds+79Kv1H6/hpqgIIBJInbDiVY83
         qBaxNYAgkbo33drP044cGYOw4xdwehQ437t72oJPb6fYMC0tHIDxVmA2FDRb7+D0ir1o
         OM3OWFjTpi9bB9Te+RXJ7DNOKNV9B2bGGt30UrJZqvcb4zz8ZXEMfZmxEDdqZh9akBdw
         BvXw==
X-Forwarded-Encrypted: i=1; AJvYcCVigdyzyXs11j8NF3ec2K1H58Kb+yxZQV9hN5YW42KBLPvFCFuF9BENMlESOJqmc1yOxNHIXWnkCjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDoCO+Hu2n7BH+a30pLcNbLQy924VKW8o30HLep6K3HWWX5Yb
	8y4w3yNJucjP1V9SHp7hY1m+02pnFWAzh84XcLM17D7M2dv8hrGTqJUgaeR+CvI=
X-Gm-Gg: ASbGncvBD9ThVroRtYQbc26lJSh0FZnO9Ns+NYkEJkdDov1x1uxSGxp4rPR7/QC71Kr
	I67wxJ6zcg9y9jItU/p9waYsd6hBxDSSOlGDQuYAIq8NCOmzvT2vRM1qHAU7vmBuwU+JvKkHE0s
	qNQa9vZUN+76oFeboy6Pgj4mEM3nNiFQ9bK3CizqkIeEc0jnH8kkt0J/QkB0HVfoKwRMn4VDE4r
	YAePYA+vgzz5aId5DcGu11v6XBSG2z1S/b31KQfUJTvxvtvgpXAJ61BGYmm/UAzWuU=
X-Google-Smtp-Source: AGHT+IGWMsKDo1RGySfTJ3+dMT498NxRdjvPBH6a71w42cCCbzdBrjO8TlN1ev5zP81xAaiujA6C1Q==
X-Received: by 2002:a5d:47c6:0:b0:386:37bb:ddf8 with SMTP id ffacd0b85a97d-387887b8642mr5284456f8f.6.1734084205560;
        Fri, 13 Dec 2024 02:03:25 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3da8:c88:4a1:9b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3878251dbbfsm6531759f8f.97.2024.12.13.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:03:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 13 Dec 2024 11:03:23 +0100
Subject: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGoGXGcC/x2MQQqAMAzAviI9W3DTy/yKeKi1zqJT2UAE2d8dH
 hNIXkgSVRL01QtRbk16HgVMXQGvdHhBnQuDbWxnrGmRwn56ZeR9Q28sYQhMuOiD7GQiXtpudgy
 lv6IU/b+HMecP4zYA92sAAAA=
X-Change-ID: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n4zlrLsVQUGa5+NUAanIaq9aZoPbWfTfoCH89MaS3JM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnXAZrMpC1y+J/u2peikLthve2ae+c+aoWUB6+f
 ii30C1SL9CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1wGawAKCRDm/A8cN/La
 hdoVD/9ogoG46YZegGOTeTQRSPngGmTelmUFx85r5qO/DwY1ZIUFp/DFjiC0cz9pk1H5IYyLh1T
 M1Ne61pUqt43/j4zwkym8YOj3jEvKM4/SBeBuKB0Dpt4zeLeyZQfRtad/ny4Yxy1RdnquxihrHU
 tm7gW/py5Bq2jCMj09beHKQxTzyW7IcvJtHvAU8hicAH3vKGKpK1/EN2APw67jgbjKbWGglaDFx
 oGK319P1tQ39jBGTzOrtK4b3ePOzPa9znAslAi5Fx+nd8Cu2+aCMyw4mpGiQ0f+fWOGCWB7kKrO
 zc9pbED8gPXELWl3ETAwwZhTHLpjSceNBkYR3CXKddaoe2U3NhqE2W1JLnz8ThDNzb1T1//gB//
 OZ33zmyUli0cRl92iVMMrbRWbriFprxf7j0vruOH7fx4NMzCeDM6wj8ygCPtzDDzYdDGmQgtE3Z
 Ux8doX8e6wakG0c22BPeXTstDUtGJFkdyxpoF4/2TbdjSimBHUV3aLVnrdb8YkS6jAL7PEsRjLA
 oRknwYxMcVYSlB6S2T3G67wWXlauLspQet3Z5DjtS+9rF+LAfgrJagf3htfHokddSxMwV7fq8cx
 IFpRJkr6D1rXbN5bxlySlvlGB57g7U0w6icE3WB7Rjx+67cIlzd3BaH0MzcM+8tDvax8hTY+lCG
 TEifzLYOsJM5nbg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The bit index of the peripheral clock for mmc A is wrong
This was probably not a problem for mmc A as the peripheral is likely left
enabled by the bootloader.

No issues has been reported so far but it could be a problem, most likely
some form of conflict between the ethernet and mmc A clock, breaking
ethernet on init.

Use the value provided by the documentation for mmc A before this
becomes an actual problem.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d3539fe9f7af5538201a78ce560f662ddb3935f2..20be7b037c07535bd2115f6e70404a95a7832756 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4311,7 +4311,7 @@ static MESON_GATE(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
 static MESON_GATE(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
 static MESON_GATE(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
 static MESON_GATE(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
-static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	4);
+static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
 static MESON_GATE(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
 static MESON_GATE(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
 static MESON_GATE(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);

---
base-commit: 52fd1709e41d3a85b48bcfe2404a024ebaf30c3b
change-id: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c

Best regards,
-- 
Jerome

