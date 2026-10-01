Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77104A3866
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873535; cv=none; b=CW3rhWs6U/Ii/xChlUuP5+iYFU4o6n/dIHC7hlSgjcGzZnmeEM72RD9wwKGD74NXJrTx9zGgJZYWtBr9OjGCJCocFE79VTvyd9L349EmOG9nuGUFxORJsW0AZ0OCQzgfXxXNSK3fnQrdEh2c8hcefHucjxP0+6T1ljMrW5vwXCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873535; c=relaxed/simple;
	bh=YGepmHEEE28SCic71nixtmEJDhkQEownVeSMq//+6dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifTeTobUKSfE1Qu3kxH6HIPQMP43ECBe74c2ZH5iL6BxNy4+n9RUjdoaCrXPfY0gnPqi6zy3ZEeamXV7GoVVgZ7KPcTGo24YyovhHKkZxawXdMmgJeAAMBHmDvlZnsI8goQkMkfWFQZANo0owCwht1QP7X/B3PczSKof+gTQxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzmLlBSY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzmLlBSY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4215094f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873529; x=1791478329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=RzmLlBSYbAbRVdIOZlIqBWbf3F7NB1jZEzGvpDlNn5Dto02cD++MorCI6FPBDQW5wN
         uU/1fjq3zsJcXWNfx5ZxrymXWREOcmv+Owud/1cTYsNMAlnYITKpLUjSds/eoN0F94Z6
         FaBPMzFVuPflDIkTNlEZ3xDPvJAAgygcAIrbIYlDDcubag7AsknmrzISX5aAxYtvyFtS
         JF+zGiw4BIaIXUD8sAEzI52tU9+vn9lCmlooVmZ85SA+pY7j2hDc9TyCLUuCYHp5EX+u
         3zHdZ+7H4+fJmrA65a91UiuPluVNQfL+6mZmXH0RcpbM1HlZIQoyYLkGJdRwAGxff/CF
         Ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873529; x=1791478329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=d5RgWeZJ7tNImrpiv0b6WP7A6wltTE5lpk1KkVIz19s7fhPRKoxx2Cb2NOio3puMTO
         O+oLanH/I29t3VfWIlD2fxJkG+6IB50aeG7wKc6KTLHsOQRinAZnlWpyNvM3VOhU83hS
         8TDpZDmoX/sxyt5eYB6EtLpkX79eqIhKjuXT5jbzHmBx1ngJzbUktgt8s2SmUXZAgZUg
         s4KbaZgdSaH+3zPbfP21fx/TcymOoxLoWP3MCxwIQQNOSY0zl83diTLLDOLAfZdulmga
         d+JgZrjKeJK+JeTJUXZ7ICaep6pu5mFC/3d0Jzqc0EzmTWyzJsLbM+OCGnQA2hnLB35V
         hiPg==
X-Forwarded-Encrypted: i=1; AKwUvBw01LD9aN7AiiF9T58oOuts4sxLftM1LjbR+LVys1chyNN3kF3gnOmd3p4zMRxPSTIW/BgwFFu6BcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kpxCkplrUssXBLDd606jlV2Uu+tofWkUiqJFImwQK/dLJaa2th
	nlW/yP3mhBGAVWWfK4tECqthqShqPWfkwo6hAWJ/RcGtYi4HDs2q0WSm
X-Gm-Gg: AYBFou0zdeQ+P3+IqoKoJ3nnrHg9E1uzO7wevguGMacxKxewfy1XMFGLhMWgeUc2eLJ
	IBBYDrF6+JMIXcYz1AwaGUVotQ0oY2RZP+uMKyI+rKmkgEer9y3AVYijc3/euO8KcqK4Cc8o0wo
	bSxL1NChju9ad2QoxnawzLxDITSVj7Qmp2bgo6VTetZZHnZhConLxgmz1OI6SDI/Kkekt3dr5xE
	1pbNAN0gYcrwP3pHgPDqnIUU+qvm0ILd/DxeGrULpD6LqWjELDEYUPvO0d3axpL05NIwVtVWDnG
	18LjUTz+mQygJ2k9B1fFM6+vW4j2LmQ5hVYoDk5Iu6I0Llt7+b+C9TvbKn+9QbdE8WcwEyJ1YGe
	wgYD74ONlZYokfF3vbPqq5XSb/38XNPJ7cxmaDw/TqY0u65M0vkHF7wwak6VFR2dc9+Ts7Z8TyS
	jfg4+Oknajq/mcVpacNcVn8ozxkeMoh5GC4f3BrpilUEf5EeB35aFqZ3jHPemiAONjh9bMna+tp
	VeQOQdD/3LFaYHss2Rc9IyLWmIZqOwzbQDz7lMYUhCCHYpFwlUeUAoxt4y3LNIK9HqMnWF+PUEu
	4H99469o
X-Received: by 2002:a05:600c:3e07:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a027585dfemr4054005e9.12.1790873529179;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 3/7] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Thu,  1 Oct 2026 17:51:57 +0100
Message-ID: <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f247e42d54f5..4beaac44d027 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

