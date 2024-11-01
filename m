Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776719EEBD
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455079; cv=none; b=s5MXVbct0G1x/VbrDbjKcU7/gONUZRVjr6qP1oYot3Hl/f9APLq7bZCKgHqBYpDga9Ei8PfmaLJk/7xSLtz1BbzGIJbmYWMAeJ1lb6ywkf9IS9qgw9myzW2QBn9s+OdcjC+mDpkeEPAZ2Kj+q2gwoQVFtCtKxN1pjnhXK0jNmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455079; c=relaxed/simple;
	bh=Pf9k322Noul/AUoZF1lcvPKEcxZYOYxw5S5eT2YDnXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/UrndwWq38c+9rHtKFhBUGaiWFx9T4i4VHwa/5mlfYKGz+kxVmB55eUz5DfMsHR/06NLINbQ+ke2081/XMTyMhYwNQzppAZhWFUfzmu8BkEVD/izjX10DP+SFFKHHdtaYYf0XoNVQ9UcEP1ePu1mGo8aqrHmnlvZMGcVeSICPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DfXQFLSs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DfXQFLSs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso2666259a12.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455076; x=1731059876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=DfXQFLSsrbMNA5VOknfWfhySdFrCjvu0tDgwrTEWF1sUtGqbT8H2o/gCGINS0nfl7j
         nouq6LwZH23a9x2wml4xQCO7kR5XuND8zx1qG4+OwTqPart8LGYYvU///slPG0xfhNRz
         3iGfjI65SIjGdrP6opiRuR27K2hWE3QtrLCR6ZdSmbeKwAVCGhYio8n4rqw9VdZCHmJc
         SbCp6ML4isJAZ4q0w80/ROUfyOvxpRSM+mZwYUVUxnWEf2Za4rbFiVXnZO/X2SiJmFRV
         lKCrJsV+lA9gi1SEv1bh8fr+HWB1HJOU5aSTYsUeATkfWePam0hr28Fg989jaizKmSfM
         WDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455076; x=1731059876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=Ohq/2VxFlkLEU7J/rM/3KJYQkaTNePQ8IHNUDaQQX9htThcevP4AuTefGidsPfEJyu
         btOPI1bwcDho4ALi3DyE24W3BiaEL7e3Cq5yITHwmM+ZrS49I3AdIDVb5UvUutKyLvVK
         0mLIlx11FOe8exb/ZjwyjfFf9WJLkORiXy4SO0ke0QnBpKicE2RwLk+2mlpMzvL90LsM
         LclLl9GQRW/bFRcsrj4leYxi/rlYE681cCjImXo6R1pPdbKpunpR7/do2AlEKAo6vpKM
         nLyhkQUvxWWB5XkR1JWH/0N9pJSN5K4juN4cqdRsb1KS+Qz2Y746b1BWC7n1k32NuoXB
         Laqw==
X-Forwarded-Encrypted: i=1; AJvYcCVqLmL+6qvsWYWDQLO5cr+/T1HKt6JSOSGgDBMk5eOUXJrLck0cJ7ANHn2UWY1y/tmi5wm1chnQ77Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsknbWa5zGmrZUyvALLkHO6Jnchu+S1hvrMGnXUwB1eKobrJY
	EWHioFVHmCP7J4uIf0Ktlrh0Jt08FaIFsbQlE9GrCNJGnpk5QDCu2t+HLHF+XK8=
X-Google-Smtp-Source: AGHT+IHIInFyvvZ21N4w9XKZUzECowUn+aG9F5+oWwykmTnOmG6gYMfAOXIH3hB+PUh/16T6BdSrwQ==
X-Received: by 2002:a05:6402:518a:b0:5c9:76ca:705b with SMTP id 4fb4d7f45d1cf-5cd54afde73mr7392400a12.34.1730455075953;
        Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:54 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 8/9] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri,  1 Nov 2024 11:57:19 +0200
Message-Id: <20241101095720.2247815-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 30bb4f5a7dfd..2ed01d391554 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -345,6 +345,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2

