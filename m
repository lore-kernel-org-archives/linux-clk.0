Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE222E3E9
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604004; cv=none; b=kIHCWnm1FxpHchBVcgSUoEHDYi+bENAYydKGLlb+j5O+GIxyr31GaDLI03JsYEBrlgaw2/BiWaGk7jTEGiMwsXdTSZbT1WhOn+AHF9rIExsCq0tcDP3ouBakcfQ6AOBw0A7IdnigMs8hvPlHXFKSUe6+5084x987j9a12YvLHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604004; c=relaxed/simple;
	bh=PrFWTreIuoDsO+2dJtLRS+p9byMc23RZOKSzUzdjGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt6FO8/0xU+PXEJWQWYbIYwLT60wimKZ/GDCzHXJg7DkTRw2ZIBkSUzNTrs8Re5m3JSn+NueB7VIPx3cRzJPYS6RSjABspLVLUVA0hjp7MtTnP+IQtXDvbO3cq1weEk9vj4MBSuaO4LZ01cAKeF5elmMqMxfM82ACqgVz+ob+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GOVGmP3u; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GOVGmP3u"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450d37d4699so6726075e9.0
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748604001; x=1749208801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=GOVGmP3uTCvTkrkGmlk9XlPB7Zcc930lljqJSrcMoFR7ic1xGAqzYavWil06zi2mGv
         1+znsfSXNcU7BJdpSyWPzNlI3zsvNGfqfG1egeCbwtHmYcUwu/fIeK31Ua4pX19r0pSt
         GzYMBTdtRApDw9syaQcsooIxlWBOkrDJbutynG5UPmggQYjozAcfe8SMm70h1BvwLXm8
         Mf59w+tm6ZvJ53Uup/gg++/9hs1t9eiq3JbqC6FB2OM8OwSQK4YQKCAgWLVwaeCbNsoV
         MYvPkFsUMMzBYUFxtkeJvqK1afXhptMDP8zwwSr1WW+9ufSbd+O+EiLGeIx0D7ayGauD
         7Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604001; x=1749208801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=lQNKrwdADY7S6ZAirTeLlQsZB5xzm+lAMCG04oPohxlPB084uwHYCF7psl5L/dOH58
         n+dzRyqjwB33vzyGSOUSOIBM8FOt2XaKhVV9lFt8svREsCuI8G92g5W5F8ojDMB1h7Cx
         QTNnGnbhKyR2SSnPpN+WLzfDmsIorjXYliUNVxAswbVMSYCp7sdn1Eton/iOEfIDjQmJ
         QKKFqmJG+/s9/EJ+q/YA97dfy1sq7rwx9EsfiCJrW5JvH91J5mhzgjbhEd+dVURTDVpY
         arvDjnU9Sob7RT/tJoLx/lKBEj0+oX/QZuZHjmQhqxkF1Pw27yFANQh/ToIRr5gEbxr0
         osaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeInL/RzfzvjhSTIQiw9xAOf1XUB8Z4qbqLQFrkAzNsPWZ2D264W1F37ARp93HOBZCJAQ83O8nm1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyakCe4AiZHa1HR/dW85h5IUVoAIm2JSuKf6tb3oJy+o4SOvXrh
	dg12rIRUh5C/Eanc8FdkQHEDHGkwJ1R7qCfiKhCsNjCe+gbfS08QsGet8ydbkd1NPTc=
X-Gm-Gg: ASbGncv0apkZU/xly9jJGXguXPhdekOgqCOeH+iL59W41fp5vXRiKZp6yEtvJxuBP2i
	N4lN3U06HtQpDJkfRHg3aAtlu9RVLknrFIoNKYgfyzCI5S2kMddXxZTeN4daSekoK9Ws4OfJBaN
	P5A883aMLZd4zOxjq3pqqGuIvdaLqud1+apYdMO/T6hg5G/bLVwGmuHKA1cJri9YwN3la271SFY
	LvWYGuCamBid5PDeegdNu1ek9zwCVZRLbfkdUa9qid+wR9qMMq7rQAIaAbUxDNyuZHtwEHPyY2W
	muhFCJbNlnCIqOdvZB99dyKi2OBMsOGxHoiaywz6L6lFlwGNjs5468IVwLY1HOfGCinjm28gUFe
	OJe5n4w==
X-Google-Smtp-Source: AGHT+IFOnZeDzHLcJzr2XiB1V8TCQqZ4gnYI0oqjqw7IlK2qZ/Smc3vbO5ZYPTsUQejGYt+DG3ev/Q==
X-Received: by 2002:a05:600c:1d99:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-450d6546354mr24484345e9.22.1748604000826;
        Fri, 30 May 2025 04:20:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:59 -0700 (PDT)
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
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri, 30 May 2025 14:19:17 +0300
Message-ID: <20250530111917.1495023-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..3274d14421d4 100644
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

