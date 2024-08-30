Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D71B2EE5
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022977; cv=none; b=n/cn131yzXFhZ9Sbsde4I0gOqYZLtGByoNS1yLJ7//4tP1B5BsCLRzgCKXMVfiCHvdK7UGv7BsOepSJDYa+Lm9CQRlcskNJb4gt2nCfqimfyRF6L0zwf9gLXIuwcLeuEuBDM6tM9OVvzo+Sf1n+6XAYDztpaSRC+WIOMsRG6Upc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022977; c=relaxed/simple;
	bh=4rakxW1AIrAXx9O4olZXDDGIfXC1bAD+bHy3Dwf6b5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UK8Nch+SBMfnc6xmiwgsW7Bsmw9COSZpS0RmiUWSMgVOhDGtJ1kZfJEoOAqugaKwGBb8xcyUby0Cl3X6SNkciPZEFDr/nErQ/hLK4S/QsHuhsh2zLBS3yCsX1CAkjQ2vRyCeCrxKYVwtCBhWP/o8incVMQsYOdmXdhUyRsDcTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R+8PrTxo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R+8PrTxo"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f51e5f0656so20266011fa.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022974; x=1725627774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOW1zVumwbW/kuzMezq4g272/iEPuAs621hgPixLK3c=;
        b=R+8PrTxo3q/7ZrFuopV+IzgTjvPElsN49WYOikkrok71GIf9wUGDqBfD6APdkSdCPh
         dTeyTnvCv92HJg2CPdpnsIijeSCr0fJVMfBkwHVlgX3t2Xb2NfKCvZ2XeROTniPTsru5
         eux6OmszCoE6Ebl7AW4FIMZDY2jjzJQeyLdhSCfcN7am+mpJxGlPtGXyopbPktlv7/er
         HeYeeff7A7pVTFyvYe4crnSKYEkox/gHIuDeh1fV8NgKj4NWNij/Ov6cGJIucPG50Ng2
         z6fWhQ365FNSPcKVIf3sUXe2cn/047tVc1iP4YVqq6UvEuEuXRIoZ85nQTAuY9Fw3eC/
         3goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022974; x=1725627774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOW1zVumwbW/kuzMezq4g272/iEPuAs621hgPixLK3c=;
        b=FL2zqXn3N3BrEk/m0FleA9TUm7/RNR3hyUJLVJFc3Yu0EUo8g4IyHnPfcAxdao5KSP
         NymBJHMI50RSJ6sLEnOKpQKJbzJbo0c0OhJ+bCx0dYQM/551CXcxAqBDfe06B5tSct5T
         +ePuLws3lIsNn8I4t12xXUHMr0EpAe2ww+Wcpk1UPR6ARZBbR0tFOOKBOBOgn3tYJXYG
         NOp7lHnf3xnZ6op4IfeoRlE7SFhauuIaSPtqX1glZkfFewCpzMp0Fr0y++n0Z4ELIv+a
         qAxkHaewjpv/GUWUxsv48OMK8akVAIIU1qLZDIu0Wsmjj3O5aAppFcuqeNqRiekUKdJr
         5GFA==
X-Forwarded-Encrypted: i=1; AJvYcCXc1zsnU+dQrrb7UVnx71Tk6EZ/jYulvWG+Fqx1+pyxZRXqaetEpqiU/8Rc5XS51Dupf4RnCGHBLeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoGEXdYOYK7CMcWxFWqXNbJnaBsSDij3jO6Ku6wP0jPO/0hm4j
	Nfn9+xzHM82AngAeuv/2barDyFTRRzxlUddQLBVJpv8rZIBz7R2HeBEN0hcfV+0=
X-Google-Smtp-Source: AGHT+IFZzGUHkXYiqjsmNvZxAlgGfJWJ4+53GwF2v50K7HS5bds/Bm3OyQcdWokxIIhfUj6PuvGMvQ==
X-Received: by 2002:a05:651c:b26:b0:2ef:1d8d:21fd with SMTP id 38308e7fff4ca-2f610390981mr50261141fa.2.1725022973619;
        Fri, 30 Aug 2024 06:02:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 11/12] arm64: defconfig: Enable VBATTB clock
Date: Fri, 30 Aug 2024 16:02:17 +0300
Message-Id: <20240830130218.3377060-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable VBATTB clock driver flag.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 81ca46e3ab4b..465b70a06c33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1361,6 +1361,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2

