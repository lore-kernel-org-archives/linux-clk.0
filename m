Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D01D1F44
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340533; cv=none; b=cNzyi0s1F1WdtoJsIHgAjNTCYXRNONdeqghfNKhQV0VF2DNA3I9tPk7Z5mum5Ae/h/PbEeX1cZQNpBmvPhIUXA0hfVC8iR7uhgGUPIDrrn/qZCmcYCsnAz6CYwjpJLkMVJvp7f17PcA/IGG1zqd1svEd4Ut6RVav536pX5qMayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340533; c=relaxed/simple;
	bh=EuKZSKvEQCXDCZNoMj0d43yKeS+Y83/X3kJnCx6rqMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zw44P873qSBtS76C2dx92pfxXSR2NOH8MElfKoLJDFlnY+5wvK5jLI+T43YZldrDC3r7Be9Smdj3JfMXFgSE6KPGfG2PqTO7uxZ9+1osk3Qj+RL7m1qxng/m6/Mvdny3mCtzGy9sTr7uUJcozGyxirzBkvBHSr5fgnqEUt+ROOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eNET13nc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eNET13nc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-371b098e699so683251f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340530; x=1724945330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzzVJZseYqmAj3uluQhRMecpWI1dTsj4zEH1FZKD0d4=;
        b=eNET13ncH98OLgbcdG0m6G74QdeBkl8ixJZo/ljhZqeBccGQmKVF2xjxOfTCK9JqF6
         jskjXJaLSX7pARiTsCNZstW3xjf2GH+X03ldyAeJjGcAc5nUkmOy/mBnGw1utLurYAkS
         du7Rt4CBkpic6xozXZ6BCihFhHIHyfzVGS2u3PZghi9I7RI9OUHy8hAxENHmVmwZFFNC
         wpCTHMj97ffi4DP6tpXp34qtdAke1+gnCtc88qDa+74iGJCcSqaXI32t/7PDWlkTJIaG
         Qt2Px8RBAoaWVk72CUoWckj5vp6z5z0m1AE37fhec+fuSEdOy8R8oTCIfy31Tb/bF1Kw
         3uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340530; x=1724945330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzzVJZseYqmAj3uluQhRMecpWI1dTsj4zEH1FZKD0d4=;
        b=kGH+vf3M1tPOXjP19EX+ev7yJRQcnHvGWGfuyb29fav/wmTE5Na7snpgcbTFfOLELi
         TM7aJPePgib2I+94twvf2gAWxmxLTvdaNAbF6vumA6qzLFWox+fDG3d8VQDaklZSNAI2
         qBSk71jRYqaapFA4UjvqsU9kMDFxHYE4H9eWckHmnwVTQbNAFyAxjxUGtBZd+AzHGnfN
         HyehmwVjE4F1YVaDkNWuqmDF7v3WsxutiYZurr/WAXh3Ye+jsQ8mouWxt3OXyB3Vn9a0
         oaDszKeYsEvviDoeOuDZLOWaeCAD9QNw6QjPGzCdCD9NE1kRjnut6M4qUZ6UkOvNLczL
         QJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp2QnR5TBKNYcZPF7tqnv4OCTT0xQ/+3rtosQKRcIoJdilGGYeqHFAGG2vaN//IRs5DRZWLUXXv2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdNdqS46vPmDIyrBm/MMwVHRTWAzGZnGdyrkw8Rd0coGUUPWpw
	fQzSky67bsPQKVA1gYUsNWlKuUISKRUJsMHiWZMggTub0uHxge1Ofua79PGHEKI=
X-Google-Smtp-Source: AGHT+IHCUCn+biQIAnOUlxWOCjXAVeKX8ey9d7uY1NWlOsuugSxvOZNpC2pcgsn0KfGk8KOYuf8lZQ==
X-Received: by 2002:adf:a416:0:b0:36b:3395:5363 with SMTP id ffacd0b85a97d-37308c1826emr1937317f8f.16.1724340529907;
        Thu, 22 Aug 2024 08:28:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 16/16] arm64: defconfig: Enable RZ/G3S SYSC reset driver
Date: Thu, 22 Aug 2024 18:28:01 +0300
Message-Id: <20240822152801.602318-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RZ/G3S SYSC reset driver. This exports the control to 2 signals
(one for USB, one for PCI).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..4720367a41ea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1510,6 +1510,7 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_RZG3S_SYSC=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
-- 
2.39.2

