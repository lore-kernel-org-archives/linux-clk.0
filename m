Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955993;
	b=MlgX7Yf/dHylogPQc729sumLdw4m73ejX2IsILXCbwY4oGsCWJpazDzXBSIntQFJlR57
	 BXHJ6Lj6uQ6FLQVWs/q1fwKFEOmCxrIp1F7FJdu8CA4OOhI3KOESp5aov2BdVqI5oyFev
	 q0/7PubuxwjPWmgM+kALZEMQSxKl++rA9up5CSMjuqiOhyeJrE8tl13T1gpOxyHNym0zg
	 zwGdrhBLWhMQY4bWcHsUmaT2/kwNWmCo2RTGh2EOaPUWcG29ZrZ/Z3pJHv1qUmsWvfJct
	 JXiPwczwZ2nnKncXtZrzvxs99Zxz/co/+oWf0OqWiLVHhOkTYmqO3uo/BQLLcRzk7iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955993;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=M8r5svHUOM8Y59Gw/fCkU5WvrtoHiBC/aQfKFdM2kxc=;
	b=OUSeq3D/qjkxrazV49iRIOYFjz0GSOTeWs7/UYmLnM3Uy0bBObgjvKg7Y+gF1qkAzuJs
	 Ya5E/KdaoqWit5OQs1/nONJJa68g0bkqsmqQqAEygQG2lRO60jL24XZiGXZgS+m6wFb+v
	 baVcK/kQbPaWbcBGytaWc/m/d6KFUIOJ+IbfnC+TZ94RsbMWmdiznzb3IScvNlWuy/krk
	 BfbfOa/nliK+Xjbta/qipSRF3vzYlz3rhoKnY+LN5gO1t1w4LgC5cbP9iB/C2fSFyhXzP
	 HlB461lhMARMJV+yrIWzFUSSVR1nrHPwS5TzC5Ir6Xoi3cZhqiExKg/8qDZnQRDe/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=cXwhVmW8;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620B606A328;
	Sun, 25 Oct 2026 19:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1620B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=cXwhVmW8
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eV514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:11 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eV514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955952;
	bh=M8r5svHUOM8Y59Gw/fCkU5WvrtoHiBC/aQfKFdM2kxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXwhVmW8y6tArl5aWad0YcF5TwCQx8nXbr9US6/nskItq6XqsLREapDVWrdL+Dcog
	 fYa3sB8VLEskFjVvvzIFPBQRCSOEmRTv76A3T+Ir1cpFoVl2QIUGFmggGP3ZUc7Fh2
	 +ck/vYH6QWkBbv/4vVpIAuVXF2psAb6Y7eZl/VWs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] clk: meson: s4: propagate rate requests through the CEC 32k muxes
Date: Sun, 25 Oct 2026 20:18:52 +0100
Message-ID: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The AO-CEC driver asks its core clock for 32768 Hz. On S4 that request
stops at ceca_32k_sel / cecb_32k_sel: both are muxes without
CLK_SET_RATE_PARENT, so it never reaches the dual divider that can
produce the rate, and probe fails with

  meson-ao-cec fe044000.cec: core clock set rate failed
  meson-ao-cec fe044000.cec: CEC controller registration failed

The equivalent G12A mux, ao_cec_sel, carries the flag, which is why CEC
works there. Add it to both S4 selectors.

The other parent of these muxes is the RTC clock, which must not be
reprogrammed on behalf of CEC, so boards should pin the mux parent to
the dual divider with assigned-clock-parents.

Only the CECA path was tested; CECB is the same defect in the
duplicated block.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/clk/meson/s4-peripherals.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 329cd526749e..8e303db6154c 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -407,6 +407,7 @@ static struct clk_regmap s4_ceca_32k_sel = {
 			&s4_rtc_clk.hw
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -514,6 +515,7 @@ static struct clk_regmap s4_cecb_32k_sel = {
 			&s4_rtc_clk.hw
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.56.0

