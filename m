Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D971FCCF4
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922324; cv=none; b=MPVhf5obMw4P6KGJfTQT6lIZiXnaw04r3632SF71mSLtnKfoovA2auO6hpDd8IwD5EUhokXCThc62I409dNyGSw0KuANGhAs21Zc2E1gkfGterRQVKUY7Lfm3WozXNwQUTGr/IxpE4J2wECUcWuQDJvKOw5kI5KpIuwp0/z62Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922324; c=relaxed/simple;
	bh=ElJIj15I7VDEmOYeFsm2GgBst4b8C7b3V/BjoymFWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA5c/uHBEqKl1lLIbDTVXxl8ZsbYnXeMSaBkTIKvM63oxA7+mgq7qJZGawd55YY2kJlzjDRt74dMBSHlUbpmYRDx1LwLKQinfyRP6J6jcEes75E/jsrBlLEoEvwJGxOrYw6tq/jJ4weHQnK2GMbzc0vwjqGeinosTk54GhbnQeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dEQYtl93; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dEQYtl93"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeec07b705so1262409366b.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922320; x=1736527120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=dEQYtl93Df3LWWZvuu5qW2QRtK6fz0b649Scup7lS23/SuQ9/KQDOgPN7ppr1aenF4
         q63qwk7oxnvuPpshdbbfQBsnOPWstop+STH848gnsTIChZgs7WPuo0zdLCkMA3uStnAS
         Vbgr0oCnJlvnaWbGknRBenUL2jFQIYe9jkLMzq8XcmEQHpiBe9Wu0DHc/GalexKHJSrj
         FAFPXpjVMUaRJXki7CvVVxhjHwob84XazPeQI2ly5Tqidrm8uljlEjLdxcIXw4vrFaKu
         JkEjSFQtPYRZFdAA81pzamLW/j/7zFSXM5w812OzwOJ8MhCU8Fx3EgwepehiBHIyuZqt
         6+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922320; x=1736527120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=KvkM24YzV4cW4WrIPeYEJ3bCNZTDC5OxwlIAsdT0zjpgPnpzRaDgRzJ837sihgbHxZ
         Ij6gsp38v29B2h7WMeEwL7oMPJlSnymhBIQAlJ+RVJFZhNKnHQf20jwQL9Mzi0K7HkOA
         aikgqrbsP+IV27i0mWnUdbLr8/ZK67QD1sa/WbehDmWJ27NpeTFwWeA+to59UlkDyxcu
         RljE4gCnOGWKT+muY/MHKsl4jlc74ugRJZIpbHMlxqLGLqQK/eAH+3hOaI0TqpPbQw3k
         t+cn3+rAmFbvBUr8x749uwoyUm5vwwB1J8t2I4DtAa2iW2jt3vmiTogJ1mW8N/mIriLh
         hWaA==
X-Forwarded-Encrypted: i=1; AJvYcCVufiZ+ZN12wHlezMIAeClsPcSgOqi52v4WfirxiTm+OhDik7TZ1vLHOI5XVllOwZ+dWAzETspfi/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj465r3XOvpY17xkscP+uyNi0W5xZqgwS1l0fzmIoPQnj7w736
	/co82pb1a5usVCzTqfzbrZfUQS9qgu+s5am5qZReiHAEph4xE3ovuRvehJ+BxdM=
X-Gm-Gg: ASbGncvN1VWpIKTG6T5n2jentWhIi9sG0f6u89h7hhdYdmPiYcWjtxU+E/JGbfrHHUk
	2XJJUPZLry7kX/ZVdVB+7h3anG3kZ4VxBdz8eNVGp4qk46H/GPDY/UFrc9JjjOwkx1t+lvMppv2
	Z7yVzVsiMTNqkog7RglL5IYghkHBes7GtJ8Hy4ibf/GiBdT/nRDoiI9uKopkw0tsS3teikKT+O1
	l8//5YtR8drmfL8txCy6tcpnYl9lbUwxEVAgoR+3PeNHn6X+vVj9oy2U3nSRlsSbMFo3ds1uAIz
	iLzCSer4Vtk=
X-Google-Smtp-Source: AGHT+IH+DUY6nprcntI+5aClJEE8pz4wAhTYG8dCJD+t8yU/xxOBpHwSJqf9myK1PfsCCnfBeBYRqg==
X-Received: by 2002:a17:907:1b96:b0:aae:83c6:c67e with SMTP id a640c23a62f3a-aae83c6c8f5mr3028524366b.55.1735922320359;
        Fri, 03 Jan 2025 08:38:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: defconfig: Enable RZ/G3S thermal
Date: Fri,  3 Jan 2025 18:38:05 +0200
Message-ID: <20250103163805.1775705-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..576a544b8c79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -706,6 +706,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0

