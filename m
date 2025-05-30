Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E422D79A
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604000; cv=none; b=Dp91H2WE42EwRKphe9oHxE+pUn04C1shnqqDIT8SBxNnn/naqnjuCcFjq3TsWDnbX/HxepS6qD0GaYqj6+SynMlW+16Ub+et2K0SxDKJc5MSYxwo7svocRTqNjiudmfq2eWXpEvplT8HCngrJQUB4EuzJf3bRWx2GBKZENb4iFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604000; c=relaxed/simple;
	bh=JTrdaAZ1ROVl7a1oj4t3COHx+ERflhdGhlJk2YHh1O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CU4M6TMf9GoQP0F0/aRTrchvNkbtpf0VcuoNEeaElYCVFNdzOAXqzIskzSW7aAlObI5BIOBdju05dtsZqRUDo/YFZiMxU694Td93MazcRxZz2KhJO0qxmolWERF+fX0P77cDq1zybeD9Fvjgz9RJBiKXF9Bw98GO1xxmNGy+92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BnpTPMmc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BnpTPMmc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso15252615e9.2
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603996; x=1749208796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=BnpTPMmcuog4O0CSnJ+ayesc1LGoZfog+M5zTi/2AgahLxrysziU5F25UhpD2fcB5h
         gW7ClGnXI+2yMo7W/zo5idxb2t3Dhwo/Ewm9ZjbpaDHFWem1fVsu6xaT3wazo15N5UAf
         QOtFchKf1u08qipINvqXT+mp9o/+7SWzSahM5mL9+hrh8efxzK3xVRvshbGKhbICNRm+
         TzGcpoz/Yx4jZVIYvggBwlhdtnZcXvf6c/CDKJwhXnNWrC2ZKGpLXkOBiNl5qNYO47+L
         Fd2m3O7Mt72zcZ00fxG4XSv5ID5UEd0Z7ExR5Fw1jfUYdMYJBtlYsztgHdGAej5RbzbJ
         RCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603996; x=1749208796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=Ij+aYDTFs/kmnx8Aub03dKi9qC3fXcX8BJ4LaE35qbNmW12sYhFq4uvmNeHylBcj0m
         NmwvbLNc4Mkl5oeIPqMsXRiITIqAdN6gIqbQMzybSRPKXJGBGS7LCJbhSsEkaLdbCiMc
         v4GyiZwRDwJJQYkn/5WlxbVf36XvdXFNiR5KTefHWIU0aGtBEHa/gDU7L0bwLnAPKtQY
         psV4eUnt73okBXZC0R4xdi3y80a3BWA97vsJbvMFwK5EStT7N5Sa20zjj1lNazx8r4ev
         WmeIrwxK3RlbhdT5BmzEP3fRse1ZU0V2Z6kOLW3s6k79AMLzIfLRy8wXCv4HGEBsDOF1
         3ZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV80tngEJJyF2QCaThLQlTMuMEq09BBkjvEKgjPqEF4CQb5wclYMXEJl0lPjCviRn+RufedtSYbOMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1q1BZcK6ypWgQuNy5eeAvxK9rKnitSoYaAT29Zi8LtradN4S
	LkzVPar9F+M4LcXbq4LV2v8wbw4LOABF4JwMVwlU+8cRp6aP4qP0uGydlJ/U3buy9wQ=
X-Gm-Gg: ASbGncvhwMOHAGHBea5zR+yh0D4XiSefZIBguF3RxMWX1Sa3OO+4liz+w6heSG3/2TW
	98ZohPiV+UGM74BlWd+Cbd6nWLyZS5//auGCzqrwoP4pcv2/+3LeRCleuTNG+UO8Sl4sY3mbhcD
	BmFTS87pg9GxLLLwqfOn306Kg/DIBGvqLJrbJjQbw2tH2mEHXbT62wXE2B8tJSAe9dLYKvhpC2x
	DtbHUctO89xqPh45RZOXRM6go3kFPH567ybRRjpiZine8oU9dBBcJ+p6n7kBkty84nUP7d5Ke/b
	OzmIusqBDVsvWBMklU9W+71NfO3GQIBGcJ8iZkqIlEnLw97BugvKGMF/ENp6ysh51cmcbL2IuyK
	MjOstyQ==
X-Google-Smtp-Source: AGHT+IEOmvfgxDBSjQyjTAsEbb9y2Sc2/DFcebPrTV7oNj2NnWeeNPPvSc2ZCRmRQYNSn7XQ7be7vg==
X-Received: by 2002:a05:600c:354b:b0:442:f44f:654 with SMTP id 5b1f17b1804b1-450d656016fmr22662535e9.33.1748603996269;
        Fri, 30 May 2025 04:19:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:55 -0700 (PDT)
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
Subject: [PATCH v2 6/8] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
Date: Fri, 30 May 2025 14:19:15 +0300
Message-ID: <20250530111917.1495023-7-claudiu.beznea.uj@bp.renesas.com>
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

The first 128MB of memory is reserved on this board for secure area.
Update the PCIe dma-ranges property to reflect this.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none, this patch is new

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..1b03820a6f02 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -214,6 +214,11 @@ &sdhi2 {
 };
 #endif
 
+&pcie {
+	/* First 128MB is reserved for secure area. */
+	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
+};
+
 &pinctrl {
 #if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
-- 
2.43.0

