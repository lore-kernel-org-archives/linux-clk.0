Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBB6F315
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058140; cv=none; b=rPn0Ww25N2arnKtRxRhaR/ShqcmzJjU+TTcJ+XPP0FPjWm3QaPocCMGwFsOd3ydFrw215khgg4oPL8dnkd9JNMtiOm2AuE/R+QIVS5VpmBnyBuim3VSKQoGyfzu0uZgIAwEQystnAOB2sVLX9ySWpcI6AEEVJ+UlPYcVeBQcxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058140; c=relaxed/simple;
	bh=3pvDzOqGauCPupjcFSsY1hPMvPhsIclEecQbEFRd8VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mI69Xqq40Hp3He0I+MwL04eNZJUyxyhTC9ei547IL7Vn+E1EIGGc+XORoCo1aREf4sPC3pccsXuA2NTDP7xO7Fkq41bWe/AzS/4HYl6Q944E3Rg1quqZRrMN+Rg2WxSKnkTk4CecdT95w4SDfI0ImNzz9ewVvVe16q524UG8N3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KOKixVyj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KOKixVyj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f4a52d2688so5307695ad.3
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058138; x=1717662938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
        b=KOKixVyjJyxXE/zGv6pVX+zYl6HzS3mUlRy1hUupdMnTF4Lq0/PM7kFcWgGO3XRIoR
         x4VFaFRmweMuNeZBuUG1G+Tcas3eXDdflTmELrEPqjYBOFl/XmEeKjjMh7w/sGwC1/Sq
         I9Rhxoe8nqyJAUzDVhazgmtcPfEMkvHFCzO84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058138; x=1717662938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
        b=MGatBwqK6DT7hKdXzcMgWKirXX++jjstg9umoGuIopjlyYA5NkWg13iafugfVRKPxm
         KquSaE0DUF4VmxOb+aOOW92EPHWvRwvTXu7lOalvd/MImZ3PJ5plrCXOWIg7Xl2qr89v
         e8hjUEXFnT8WyN0sRYcnYxnMZU1WPKrF3Q//eStKUP7/8fq/A2dcpcbNqIgytuqnrARo
         OO85NqYmdSOm/gWeCJtA0pIRZ6kqAAI0oqgOJEhqnAeoNd57jHegKOo9wtP7F3pSB5sc
         ldb/G7ImU5Rj14HD69/6WNgo9/oZAYSmGIpTrJCRnDXWh0dSfvb2ttubqiTqB0vR8yrn
         Gg8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWI3679cgJ5HuIR9a4txl09k5mGFQLGZR8rsID49RyZv72xnNuL9M+HVAJpUNrMcZ2XuxZ81TTpxt1V6CL2H2+wKX0nE1scWXEp
X-Gm-Message-State: AOJu0YyO2SPPEKTJoidrPYTTgR1/ZWePkIt57wuGYiTZoumVdIOTtYdF
	QqE1SM3p0yrGyT+qBuAZaibnCfGPytJPUb/BXjKzneouH6nGf0iZe459jsPYkg==
X-Google-Smtp-Source: AGHT+IFpzoyjS8oEHpsPco6/0czovfTG+BgxZDwOvkJUGlKruUTXsaiUOVp8Alhb12YxLjpScrPXfA==
X-Received: by 2002:a17:902:74c8:b0:1f4:7f18:6d7c with SMTP id d9443c01a7336-1f61a4db927mr16665575ad.61.1717058137709;
        Thu, 30 May 2024 01:35:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Thu, 30 May 2024 16:35:04 +0800
Message-ID: <20240530083513.4135052-6-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..136b28f80cc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.45.1.288.g0e0cd299f1-goog

