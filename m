Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F925D8EA
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009201; cv=none; b=OObOB47yc/vBIhzTVzteS8LoGBOOghTpWET/qxg9eJWm6mn+t64H+97yuNhSGBRrf1mSxYjWxcbKayfCOgrTOqTrCtgWGkLk+kyGyp7CJWMg2K56TNo/xgqANJqDVHDXu4M1tJKVjo1k8HMegvwreUshXukygj+2tqdMohSbvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009201; c=relaxed/simple;
	bh=/qb3LqOk0CPpYt1EbGZXh/Cw0pmf2cmac/XhDTHJc/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLGTeECjUxDWWm21M38BS1lTP0UbryU0pLJ4Y4z6ZXsfrZvhk+MDXmFrFU1kggOhUR0rdfQt17FH12DH/8grcHAwmhOfF7/29i5kf74GHgDBkXAUzTz1IiyN4ZpWZvRamyD+yQFTUMFsAMnMOZulzaqzxHBtqL0l0XljLd/g61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FmUjbCUe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FmUjbCUe"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb415dd8faso994301666b.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009198; x=1746613998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=FmUjbCUel/sDyoT96HiYbVfnZDo+v2BW0CCcZWw0bXzJ++Q4SVcTJ49ikGG0R++cfq
         aXg03AGEJAXs54SuWkde7nF8hOWT036NHNkkwZyQsmFXJJLUa13uq3yJbgxKKdfn/axD
         oS2YzykAKuXhdWJixjv+yoMhJcDe+ZMoicXN3L0MfJ6CaV5RkevYwhMZSzU2eEK8xjBz
         BSp8I4HfY6DB/hd0OxI22CAhdUvJZKRe0xh3HFZm1j4vSWyszzyczuAsbnvBEbr1EbaP
         0GkgnSQ1h6N0FyWhYWwsBoKgXXTSv41dldS8FRWOFIUv5RkGduvGzmRT1Jx6Y3LR4/br
         7QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009198; x=1746613998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=cyAtnMXUDjQu40P01BsrAHsRkewtavGJ5yVnVJVitvUd8zXD85AxjmHyZlaU43ojGv
         3BRMDNtyQkrhgZ1LcoxXHGzFpY7SxKGPFLv5Hh1S+aC/BqGAUxYFFHB5jUzrtFSYlrY8
         +hEPsI1qSrf0k85WD5GtfdO2y0YEV2J4Of+pO9XKxCVFkh+jn5baNzyId7w2oE7iz0PF
         Pz/DdtVUpcNS76wXeQSznQqLeKDpj9ITkiJ4SQIlyEhmEFW0v0Oat4TXh25rn2EkjN8Z
         NHR1+HZrrKr7cRKIJHbX9hTHPZuaJEUN54HWtnNGP7z9P5lvkqFGprhGnETY97zAUTPh
         U4cA==
X-Forwarded-Encrypted: i=1; AJvYcCWpJHrs3QErphNY3wFihEW2w8iJt9C2lRj8dfymAfDi3V6H/l5BFcJY0PZlJhYWLxqilJHC/avXT4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx820+NTo7I64oHvIeEfLjz3fn329ORB9DfFaj9wA87w0pUVg0O
	tmjFDKAP8srH5vVspoJJuKfn9qeLnMJA5p4PTpi+PJqOVdiDmaEm4jDPDP4ioEg=
X-Gm-Gg: ASbGncs1+V6J6v6QE/H8n33yDjwcWgiF1w0Avw1+4JDNE0NEWLkDVGITxSAL2wcM+B7
	c48hEfv6unkZSFb1JXQg2F6td8zPkM9meoT0Y6YGrqwlwB/G82aVnXRn0ir86kgH6Gq/E0fEDLW
	ND0UoNEfQu9EkmzKfJIynKfXtYn24kQ345HXfgyHgnFFP/2fu8d/DFZN+AFSOnR52vAsvdpuiYV
	bavOZY2u+HWucr9klD+K+iU7/be1pE5ZyZEhUys8b6uPB0I2KO0iJJErQ5LgeQo63Gc47Xn8SWK
	5st+3SRmYqaOlhDq3Rt5UsponxmLuaxwxMrZParii+XLQ124QYJrCKdeCUk6JJsu2D8pQ8Q=
X-Google-Smtp-Source: AGHT+IHBcCruFD2Sx7wtL0cb9Uodi9fNatKRjptTZekaQF3eLuwGTgjpuo5/jbKcvNzZcB+Y1bBY1g==
X-Received: by 2002:a17:907:3ea2:b0:ace:da39:7170 with SMTP id a640c23a62f3a-acedc768b2fmr307149666b.55.1746009197623;
        Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:36 +0300
Message-ID: <20250430103236.3511989-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..b36a96777018 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0

