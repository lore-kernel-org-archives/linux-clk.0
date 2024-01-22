Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE84BA9D
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921918; cv=none; b=Y8T1GJNeY1lt+DAwq+3fuUyU4tlKc4KsDZWT77dfaoyctTWen0U4L+nv/7JrmCIFOSebDqTrmO6t2HZ8gK5hFbOe0aD2Zz0Yh6COiFSjKXDjqcQxmPq7+MptZbdf3c3SuD6O2EaP2UgiFfNE/qpe1xFQHl2hIdoWSNbTUv/uKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921918; c=relaxed/simple;
	bh=ifaXXPlzQ7Cc0JIuS3Sr1nJdIEtZglhNMQ0Q1KYtPVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UgCDleit9shBmkkzyfGpowPMD8j9J04tTYUs0CV9YrVBQY9puJXJbK2AFBPEAwjR6Jzz8dgk6WPNtIsDU8Mpvjhh0nLz3Jq9+QcO0uy03CjkBQAwoGZLvD5RFcIZ6VzWjyb5DDxirckwcpKN5PXKqZzPw+DGeyYCWQWPz1a/0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=efZ8CXDA; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="efZ8CXDA"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so3544743a12.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921915; x=1706526715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVHTL5RIY+bNimER8/uVEqIPwk3bXfvGHZ/DYHY7974=;
        b=efZ8CXDAowoAVM6HA9+9w0thUwU1A2Zdw3LGpPKDmRF3HRGK0Ac+aaDzVEW+WxwW0G
         uiCpKZ6A/8Svl92HuNADCy7qFAwwHOqu134KP/3iSVwDbjrHdNZpcCeOxS+pAIpPghfu
         CPhJj2g3IR29NP6+KxodcKiJyTnsdRQByT4+oFxRZzYvKnXBCa9s0NfFYrLWb+KuUjNl
         uzXqdHCzDSDDf/bhtqPIrCZH9TqlzXuv8BwT1QqBUbDUFQyeVjpkonk6II3kDkHR/jrt
         pGl+TQO+WCxusk+D7+krBRe6a6AYqOeW/E18RWblllUPb2v1K1mbEXHAGnpqbBXE2qfp
         0mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921915; x=1706526715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVHTL5RIY+bNimER8/uVEqIPwk3bXfvGHZ/DYHY7974=;
        b=sk1ch5vRWAxPBbS1HaSAlc375pzuk40H4+HlMUjZyCpfN/aFjGulMkp/XWXY5Mwyrj
         JNd7U7DljCSm4zKsZ2cYl8Kx2Xzuc8eVC+SxHHUys7r+vaIzji9OOokj+Vu9PBiKKvaO
         ajfe7J1Lcrqgka0QoZMLadzTXeLZm0NtT7JEXbHN996DDHMCbFquWgsMfY7cWMfe9+lX
         Cf8clp3oQjjx3+8xq6DGZLEfu2g0GL3W4cwLooAmSaHp0fm66SEqA3siAcoD33Xm4GLp
         Ip9L63mJkZgZgl1JopHwVJjnc2o4XGGrC+jDms09zmRYGXuvU1Iji7MmF3/UUi2diSJK
         Cx3Q==
X-Gm-Message-State: AOJu0YxT6m+8l4gKRYu74i0FQNRlivWDnlbAwzABrt4p+c7cb1AmBEv8
	sapxThx+vRIfrYOw+UCvxfrVuH/nLmnIQVjzaLyXHNkjeg0mqe3fjUDtMyVlR+o=
X-Google-Smtp-Source: AGHT+IE0QOOQauPyN7jiBB0wkj3vCQ/E4lksKRkdsglPNnpXOAnRbWLas218nPffKQxKybxy6Cr8AQ==
X-Received: by 2002:a50:e614:0:b0:55a:6dc3:59e3 with SMTP id y20-20020a50e614000000b0055a6dc359e3mr939510edm.139.1705921915306;
        Mon, 22 Jan 2024 03:11:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/10] arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface
Date: Mon, 22 Jan 2024 13:11:15 +0200
Message-Id: <20240122111115.2861835-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the watchdog interface (accessible by Cortex-A of RZ/G3S SoC) on
RZ/G3S SMARC SoM.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index f062d4ad78b7..2b7fa5817d58 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -336,3 +336,8 @@ mux {
 		};
 	};
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.39.2

