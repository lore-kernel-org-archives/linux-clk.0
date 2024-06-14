Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66518754B
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349617; cv=none; b=FCaMqlQiqOxRDcStvF8oJzs2zCArXNbL2e6MvrBkfghsZMIfs87Kam+Bqnfk1ZKwstrwHAT+pfH9UJfIJ3+e7ReZOUpeWe1AuQhVZIOZvegsZnkaSoQ0swfqHMjy2glR7CalixIay21A7pNqVXvXuDn6Ye1TjLC/iA3ERP5noe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349617; c=relaxed/simple;
	bh=KAFnvdRq+2pR7azMtu2K0xo92UGOZLfO30BelL+InbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bo+PWu9puuOd0jZuPAMwwmu3S0Pxk0B5V+dWrCtkG39akdKe42T+fAHvCYo5rkR75Mhau2OtWqt1uD7IGcQJV+HL/ZSPoCGGzYHLyp/u1m6MsNGLdLCQ02MVNywYIbVx1GMsBvziplr2HZNWj2i87FXqV4Q7b+ilG0yMioi5gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VCdJFOfq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VCdJFOfq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4218180a122so13406705e9.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349614; x=1718954414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=VCdJFOfqQgPTTiObcJs5/lSR5gIhPVm+FegjQBYw3EzGQXAKh5v3SkhcXxgM/K/hJN
         s4qhWo6ezeBjucmDZTgJor3ZbAPe7b1L5hYNf9l/mgbm5GrklXdDbadFl9r1anR8bcME
         a3uX0sgJIrVT1S3+i13ZbCCfps41hzJdp2T6vFyBaKKR2mDxJGTwnDe4x4Wtg+IENvpp
         w5QqnRDFii/fZMEaAxeNzfYZhJ61cWMIcKswoXNgyrEVqcIXbdlFymNnPW4QnlLEci9T
         iVT4wzPASbIpo/qf2K6VpcCbJG7Rnq65dLus4d6ZNBXuNunhWjGUO77kf4WSct6NTLVG
         wVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349614; x=1718954414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=GjXd1eGakLjBY+N+GZT4EiS3dGn/VN15pHB9Iq9NpxOA9YxmjihK6LAzDkyNJoLq4d
         V7QxZV9siJZLXRUbPzwVxiQMHamuQTv1athH8+471Y+3q/r4Xt5z8gemnlcA9pcN6tYj
         dLa29HWLRTPrrf2kaFt+orNv/aLrr27awb6YJ3XJ2QNrzbSloq+U8KhfiAXuK/ZxfAf3
         lhxTXiKD8liJvnnhAQybKY183dcRUqN78aCEa/i3FXo9GbUMSzqWViBdo6J3TCooZblb
         Sp0Pw+BOBGUTgI5e2okhxGylfTf30BTU+hiEXSe1bG+yCBF8gUWA8eZDZ1+XOEfD1CM1
         wf0g==
X-Forwarded-Encrypted: i=1; AJvYcCWSFRhXi77l84GyBGe1+Skwlotv9O7EVH36K25wX4YuvPe0kJJw211QSliFnqLXBn4hzR5kIRPLK32WdPkwX4Ji1JNTzUP3eaae
X-Gm-Message-State: AOJu0YwQnT3eaw7vhALG7+U4QmWMViFWoJj7yjw2nTnJfMZMAX5eAMOr
	bWc1ghkLl8LcEtld4JfHSsVyXvpa/L6aOsMg4r/wbXJKxx6w6XuW5xajnZblu78=
X-Google-Smtp-Source: AGHT+IHPaQD10DLPhpZ7aY3WCufuA4Kxyjs3R72r9aYkAI7AVznPL9Zts5GX/ZtfATd4xeTNB6QBsg==
X-Received: by 2002:a05:600c:45c7:b0:422:727c:70b1 with SMTP id 5b1f17b1804b1-4230481f0cbmr18120785e9.8.1718349614367;
        Fri, 14 Jun 2024 00:20:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:13 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/12] arm64: defconfig: Enable VBATTB clock flag
Date: Fri, 14 Jun 2024 10:19:31 +0300
Message-Id: <20240614071932.1014067-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable VBATTB clock driver flag (CONFIG_CLK_VBATTB).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 05abba0a0209..fcb0c7ee8769 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2

