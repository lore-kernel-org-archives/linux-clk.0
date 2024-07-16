Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E28519A86C
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125857; cv=none; b=vBq9py4FD7ozr/mDOhVId5/9pLXRmB050ixj1XkLohKRizGHK+VwPmD8GRnvrSU3M8pGe4PHUmmls+DlkC84R1/fd3+SxseSdI3GKX2wI13XtZr7hE7hpOujpx/XwETC+3p7O/cuwlx5F+LvdK6rqgJHAPL66BYfYRIuYSri7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125857; c=relaxed/simple;
	bh=JipNE+kqEQPBn7Jx4UqjRRUM4WXbboTrnyw0mDx93KA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bnltxiJ2z11daXeTEA2EzcKiJ7ZxIBYRgdQoncaJ+CRy/e2qn5F5Cn7P2s4yADeI7m+b5yInriiEiPDuPDdvsq6KiovRKVT9xF0dglImAYLCx7FQI0pzU2YB7/GDZVXxwOjFxgYV2A4gRBNBHzpAonT8F764p42ZYMbOX+srlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BlLLwGcN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BlLLwGcN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52eafa1717bso5488161e87.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125854; x=1721730654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAXdKc5Z+02xSdGxMpcMXF7UJmX+WtkbTbyJ/hK50W0=;
        b=BlLLwGcN5mUmW7Fw/0UW6QIyETSGj7d8hXPmhMifppK3O4TM/M+3EpH4Y77Z91LIdG
         +QKUxlUrAU1YA41ly59IxsHMDk7eP90M+7f69/ecHBwsB6Aqz0N9jeGCcx139e7BY+vK
         CFV6zL3sUklGCCH2yqsmLI03eMQnthm68cm0vKDc8n5/X8yiQ017VilaZ84Ahuh/whCk
         lmuaCVmj3xW2dxeEBe4DZ1609eaQij4OkDnbuXC03PqtIfFpZunUDlG3AQaScWe0kAJp
         8XRUxU5xSZMA9SLEfRnf2g6fhQ/SDo3En9Vsftai6OcnphvLeGwg9TmRF77lQIiCphEY
         TtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125854; x=1721730654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAXdKc5Z+02xSdGxMpcMXF7UJmX+WtkbTbyJ/hK50W0=;
        b=YtK6FDSePN8CDPcZdSKfdr0rDPkRv1PQP85cSuWewjkhwna39Vn4E4cWqGXcmIuEap
         Sm21JXBSrk19ELK8YmvQn3y+cp0mpbXJLwqUE/r7CYJ0dKBDpSggf5w6IlklU7EzNp4y
         yLkQmbSymnm2S51WlxHb6V0H13Dgw5aIAUjswBT0ZELirEBFmqXaaw88ZJA74xo9DJco
         eSmmSwfKRtLA7bwk2q5qm/v79i81RSpkMl3JIwHscDId2/EkZuvf1uxSFa1taMey5vPP
         ywVB+QlBu2QZqTLc3J+tpBtp8X7f+VDD2cuIgQpJpd8zI3gCWS0x79DlbQSKGQFyz2oE
         J89Q==
X-Forwarded-Encrypted: i=1; AJvYcCULt7tEzeBe/Bgc2cD4DyV2iYifBqac8xogFfZyWEvFmemhr1UY7QDCgPEur05ONRM0bESiQ7RRWHFRsATUxybfhwabGmJbX/iy
X-Gm-Message-State: AOJu0Yy+Isz+mUg89X4ivbFM3dIgZ2bK6ZuuMixTzvoM1S5eAvU+e70n
	qpLubSd5zkJt0Qak36YRveXRnGDKKzSw6/FOtRYGwksfYmUcvXaOTaWLzwFc4cU=
X-Google-Smtp-Source: AGHT+IFbkiHtNVlSjCVJf3cVxZfgoUXWPkU+uRJ0BzsW0f977HEVh4lCus0KUh+9d9jKXgqmMYtbgA==
X-Received: by 2002:a05:6512:3c8c:b0:52b:c025:859a with SMTP id 2adb3069b0e04-52edef1cc52mr1084908e87.2.1721125853907;
        Tue, 16 Jul 2024 03:30:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/11] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Tue, 16 Jul 2024 13:30:25 +0300
Message-Id: <20240716103025.1198495-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f35fd006bbbc..e90578659447 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1213,6 +1213,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2

