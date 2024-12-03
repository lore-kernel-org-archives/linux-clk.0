Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301D1EE006
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224440; cv=none; b=Y3VH60/N3B6/1VRkvqRsvx1YywIuec8wADc1Nbp77USvGhmsTc2sTrzWJItN/XFOj3TmwURnDVjc5Shi6AUz0EvLMFbsQJC9ZD8Bk2BxmNe1UdwepxX0sQfhNw8OPoVHqEJwRt3RrNIdW6fa8svCoynj+QbARxVpsJmpHnniJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224440; c=relaxed/simple;
	bh=hPzvAQBya4lMaHbeDMGEHEu0Sst46VpHxejcDLV1/YY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cT5AkmhHFdFbXR7i9DyXsEk+mlY825y0mqQgy4LaBU1oU557xHtYBD2E2knjOmXALa/w8R7GQDgYOavmEGXCrPD4hirNdt12WZL54yQw2bYl1iOdyXbDd4PAK54v0gF4Tb3ANJ/LO67Ku5PwcbcaU8pc2rSqEQstmgaLhdbInhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=It1J3/+s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="It1J3/+s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a766b475so49553135e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224437; x=1733829237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuYmwt2mwWEd+Tu2KpQNpDTdmewly+5/W4Kvuhh8MtU=;
        b=It1J3/+s9eSfgOa8xL59iWVGv+bPplYPchi3wNeRX2rnrYbTkBFFvQtNbDfm1r41OG
         qgBVYtaUStEnB5rBO3lZRE2JNiqq/BrOXom1WDnToiQxwuP+th0L+oEeaEuz6BZtxlWQ
         GAqrdY74ufxHua152q5gx1h0V/u2yPDuoCozhjPXuFj5YxlLGafPWd1XrJyX7U3nezW5
         CTHDPFT1pdavJiWU2Khk+m6t02EbH9zCCuTWuAmUz4d7Zpo7VwRze2UVDrr6odo25X7T
         GnlaqtR4KRk7r2WiViqaEkG8rJDo49sD7BFGDvlsLGyOUvyr7SOnUSvF/zgT017NrMi5
         avig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224437; x=1733829237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuYmwt2mwWEd+Tu2KpQNpDTdmewly+5/W4Kvuhh8MtU=;
        b=YKm6Hb12YyJiO0KZn6NGVzl5C9TAj22v8vn9fMJUG54cpTbvirOjJtCHUg5PXr2Rwm
         smijcUXiS0CB0AE8UUeE8nCJwiGhAbpZ1IajJWRkClktdyY5+VpaJdUxxu42QxGKT4uR
         38CV7PbA/h6Kv3FmB6cY4ZYr3kaE8NP8Qk3kzuthw2i7zDksW4r8Es40noPO9smTZvNi
         8p6nm8Eqt2hoRoVBRLEXFGanqvAN52gzDhXzHy751Xf2mq1ovmbDPmScOCANlMmqAyR6
         pc0EgPBFeuNWbNV5p7Wu05R5vmgCEsj75GmkaX/rkJgztW8+ojjJ1vzwes4/qFYjyNww
         yv/w==
X-Forwarded-Encrypted: i=1; AJvYcCWIxfquBYY+wHi7T6wcLqYD9WPbNpYkfCPRna4TraCxzY35AGBei5UvZUvyyybXgEVEUo7eNnGk7GE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySR7tJXOtHk/zj+v0MWV8VtcCc9LnPuvNjH4o18RbP7AuFFBRH
	Km+x/gXB4Z5OPQsRmg0KcN5FeGAPac7NCKHPbCfdp00lsyuDm8wOEVOFJcaGwQs=
X-Gm-Gg: ASbGncs6gFQe13W58U9MfYYrguoomdBojWRJs/mNTpyN9eQXyZ6xXWnxXeKiUC/ju0J
	XCYgnmXOUBC+3rLrsoLPhzUYoMv/1MgnjNju32Poijz/flun4932kYiAuNpIWm4WceIESsSwDPw
	+OPEd8f+hOPHpGYuRNpNG0sizjgwT0XrqIVD5L2dkhxwAPQmObCqgSyeVMw8X7rqcaEz+ziKmhc
	HOMEEl8ejxXOrbC9yZOtjBLHv3+Qux05AC2uK5tOPQX6iAn5cD5Tu38JyOMayB4lcTX1S3/kYqx
	fIX9
X-Google-Smtp-Source: AGHT+IHOuquR0Z2Y/9RwvEymwXXAAW6Jm4OPLCo5DQNmdYBocmhFqjdVsjkAP+GiCZweMjILCABwxQ==
X-Received: by 2002:a05:600c:4710:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-434d0a239c3mr16423245e9.27.1733224435487;
        Tue, 03 Dec 2024 03:13:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:55 -0800 (PST)
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
Subject: [PATCH 14/14] arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
Date: Tue,  3 Dec 2024 13:13:14 +0200
Message-Id: <20241203111314.2420473-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
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

