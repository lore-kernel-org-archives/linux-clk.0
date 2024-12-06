Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17C206F19
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483664; cv=none; b=BjysIiTl23r/wxkqOjpxSLpWTmbtR6pzieyT/Fwc1QP16W/y8+ixz1ZFJEsUxX7ZoKiMgO+z9dEenSnjnzkOhlCSQw9F8vYphIhM0QRssXfM+LQ5ZdfwEg3j41wEvhDelBFkW47E5YjzhwDJ4vuVF5YjUgsEHC1pb6EA2U/yyY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483664; c=relaxed/simple;
	bh=a4/gsQVtR7MVHM1KJuAuPMWGtk0F3Gae6xSRbB+vIWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OVzWq6l7ornpRYyBvPrX0W4GVxWRLOtUlH+XxtOlbBlEyN/CAIqy/HuejoVHab9ivpj6yjpm7pJagcTC7jVAmpwDiAgxK55OvDCjDON2l9IwESs1bcbsjQ3zrHTMCcxCVSiHpEY9mZk1Byl3IpcXsSt8A+/8O7iV8Wi6ARQwn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IGUkLjZj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IGUkLjZj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d340313a4fso1457922a12.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483661; x=1734088461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Dnr8lBPRV9hwY5+L6VmdONZwzLphVT7+zA8FZuSvc=;
        b=IGUkLjZjdXavSltmBn7WJKCt7ZmfqpeDzq+c8eJyOQNUX4pmJzPPgbOzPqDCz+QuVr
         0Ee0ApCmiF9L5o970PXWXaFksLDbsPONJoXANY1yjBKK15S8LoRwv4yaI96oTxeBqJo2
         Yr+gjDZ2FhW1Kh/GXVTV7lOFJ5gypIS301DAgBcVqqqsEkmOy52N31+BTOmEd/w4lLyV
         bSuerh/gR7UOtBdU5HxbeKm1lP8vXbSByk1US73myzpL1FAp+lFZ5EzLpOngyAbGRIu/
         VC2PirSXVrkC6aPm57d0vKHq/bjE+wVAIULPleREHmFcG5WpkgNHfVv27jaeWKhyDKH2
         hA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483661; x=1734088461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Dnr8lBPRV9hwY5+L6VmdONZwzLphVT7+zA8FZuSvc=;
        b=FQMZfWeNB1ATptzUhq0mXDeYAj1ZQDtWXvnT8CxQLupAk3v6R0d4XdMGkrmmbl1MCi
         WpXqDa7d6p70PTphwgH/VYiayACv+Y9+0u/8uV6oClm+Fi8+UCvW5/xW+3S4fqFpOtPB
         LSyyhZfvTmQO4kJoP2fAdRHjUxaRV9Xj0/MsjIp1a04NpCinmVyB4BhskwcMg0PJPTbw
         XBrn4EiJqkpAEDI+S7EUByHFFaX7XGTuaAK3Jq+qd/nqTTDOcBOA6AYalXpgW926Ov2P
         YQ5qKU0U+9PWlXtQGISgr8+UMRvEg7ze4Cv/LDE3on1WOBeKI0k4EtFW2O/MeV+ZJufr
         76aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyzEiA7p24OvIAPFEeWV9b80k8/0Ahs1jkkcXVMPzhdVCC1exSMsifh1IPknG9BspsF1p1C+Nb6MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2XPY3jKqdKNhF4SfKgd8nrYhW8WbljcrgU30G7/ygQ3wDSMe
	wkfYu7OFZnePbse6qbi4zQbWsAgUS5yjeSrl7m5VKoWhn/ehQlwRPYzI2h0aIPQ=
X-Gm-Gg: ASbGncsojQfM67Xk1aH8EIZy0GP+1i3OSVU2Ml2J2gimawFnwZUBifilJwAZIFUf3rq
	LE5vmXwMb4A1CCP9qaHFdDmBRIYoKNE7x03bJI8N4DSSV5CLJB7KiZqg6uaq8F8G09KfS1BjpvL
	zHLVCh4L/Rw4KgClxHZ6VGR+6l6j90agk5FcJuOu7jTeIrUY7uUFKGPXC3tFgP/Es24p8Ks3Glf
	pccmuMGHQpHKJNSONoqNDw4qCYnzcqVSCFb6z9PFf06PU7NDus1SCm243+XfhuQKAoqUpk/T0Uw
	ONg9
X-Google-Smtp-Source: AGHT+IG7gJqc4CGdANniAawsf3QrNvInv7nJ0Q0Fqm3FfT2wXTQhceZu1E4SlHPGcY841V3MyHiZiw==
X-Received: by 2002:a17:906:4d2:b0:aa6:2e07:5cf2 with SMTP id a640c23a62f3a-aa63a2086e0mr165912666b.38.1733483661317;
        Fri, 06 Dec 2024 03:14:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 15/15] arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
Date: Fri,  6 Dec 2024 13:13:37 +0200
Message-Id: <20241206111337.726244-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable ADC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..57ebdfc858eb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -94,6 +94,10 @@ vcc_sdhi2: regulator2 {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 #if SW_CONFIG3 == SW_ON
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
-- 
2.39.2

