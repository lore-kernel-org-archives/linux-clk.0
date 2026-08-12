Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C794382286
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565714; cv=none; b=ERj5IrR9FqfbKh3fVbpmI+NH60ohnYkDsi3qwcaNfGiKbCWc8miIwoI29eQjEErw2JbVOBIElGS+1KtY/nKf5c+EYDN0f5Fwmf9lny85z4HhuoKJovIzLFtv3Dz7EQBk+elyoyDWFAxvfq4cY+/uq9IV7zirWBf0r2sLmGx+4zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565714; c=relaxed/simple;
	bh=rKcEzLrWHwOrPGnoX2RCStfIvnAY/kKQWHUNvFbq6Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2s85+063JltTYxVNtnNHdMR18jdzmgWYDOCp1Es0VH5FlAOGeGqlopBV+6tQ2sMB6hj7XrVJmHO07Jju6wahtpdm8O7X++rliTMxsTwZBNcsvJe1qFrydTUJXg/TpGS/Ddvy8sDYlzx0edbnSJfJ51QZeW6j+kqzQYefKxVurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za8gSKAQ; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za8gSKAQ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b026020b92so807560eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565712; x=1787170512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=Za8gSKAQCyez8oRADkZBJip2fRZt+L2NOfCo6P1j6cuq3/Co4K0KPwmhHIJulULopF
         05+UPMrcbfe0/mA0Yk2stDoVREMi5GUYT7vGzOPJn6gchhLw51Bm/oPB4YsmiPxP54mW
         jWMXhvLsCIwVrSIuyNZBZdLLWw1B1JUhAA+v6QBm2O3QOfgXBaHWDQjHE0LAF+5q0bWj
         WiLrTtW+H9i66euee7v6XhVTjnGf6aWAF5xGc5phx6/5twIKDLWkbANIHZU0Bk1bq2PJ
         rTtGd2V5X0sJoangVAq4PdzUs/EUt2KcMblZW9HgguGPkxMCK3lAY+H1iZWk3eJbXNQM
         34Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565712; x=1787170512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=JRCDZqIYpnP2cJR6MrmI6aTfxLrG8qxMkRAtUPBax5a1QILAcqhiHRuZrtKOPgjsMO
         /xRf4bCVZZZRkW0Gn2LFZ2r0LeTeYE0UPRJhPOOB0CdSJRyK7h5GBh1MDP/U1viR55Ks
         7w0sLl2cGTnrlP9OT+bbHm2wN29J0PjRzKnfUasyuJ9t0C5iZuiGq++qrpQKrwPbnXXy
         S971HdZKhu04oQkY18hPIBXTTehdGTXzGf0iOiZFA5yA5+GAcPFN8wtWLprlijIp/i7i
         vOZIq/50oWYaN8cHw0UfPvJYKa0FVOMHCLmJ+TkloNQnhIYoGhU/j4Jhv/RhiURSwhgM
         4mbw==
X-Forwarded-Encrypted: i=1; AHgh+RpfBRJSKePLKUY+I+sAnfEPrcURfoTeV1LjcJMT046euwlRwpzk8HYGqQ/zqqONtTehn+GZCeoiJ0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvEttHN4pmhSO+HyzYkk2P6kVmv0AHllqyMHsRQoknz0xxkkE
	d2EMa41fWb/UKsobO9O6v788VbuInf1G9hHiSsxIBrWIDWHKvq1R5qNF
X-Gm-Gg: AR+sD10T3thlnFEKYh29k8d90r4701A/lNMKV6iP+jHzQkwzzvXaB3EhSy98bhXUc0K
	qhbK/Ncd32wNGsI/IeOiIzzGKL0Fha7/UPuIKCclXgBYME6XXQh0lu9DJr/Hb/Qn5w2Pnv/I7SH
	ChRdPhrwNEq8pgiE4dPsu77H6c2x6bhMkKpkckPrgVc8/WcLYc9vhFQvALi7d5v9VJtwcFNwkm4
	MR1cNbnD9uwcW5nOp9JzG02kbvr9dg6MjfQ3qJdRUtHefeZuaWOa6qAm1ah/EqXV2LLiZ+Jr3Co
	9vB90EzYVudBFqQrNXhs7BoIgP4xGuf0bySd06sbaaRssEwz1xY0ZrN+/K5a6GUHPbRtqZfxHbP
	eWp+GxvGufKv08pSzpo8TCfOzZjM9Imddo5CZwH3W29EnTvu7G5K4y8UO/SSynQLtGGgsMjiM7O
	PpmY3mPROC7I0OIL7h3Q19FPAVn1NpkfGeV32uhLSVvzaZEzltMXHYY2owIQeeDShAz9CXykQkV
	8tashXck1X4H3/cNI1gpBq0hLC1Aj4leUXgcKgP
X-Received: by 2002:a05:6820:4b8b:b0:6b0:449e:5d15 with SMTP id 006d021491bc7-6b0c41a23a2mr1073613eaf.4.1786565707024;
        Wed, 12 Aug 2026 13:15:07 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 1/2] clk: sunxi-ng: add feature-aware M divider helper
Date: Wed, 12 Aug 2026 16:15:01 -0400
Message-ID: <20260812201502.264919-2-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow single M-divider clocks to retain common CCU features such as the
hardware update bit without using the two-divider MP class.

Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e976f..fd222ef0b8af90 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -212,10 +212,10 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
-#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				       _mshift, _mwidth,		\
-				       _muxshift, _muxwidth,		\
-				       _gate, _flags)			\
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, _features)	\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -226,9 +226,19 @@ struct ccu_div {
 								   _parents, \
 								   &ccu_div_ops, \
 								   _flags), \
+			.features	= _features,			\
 		},							\
 	}
 
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,	\
+					    _reg, _mshift, _mwidth,	\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, 0)
+
 #define SUNXI_CCU_M_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				  _mshift, _mwidth,			\
 				  _muxshift, _muxwidth,			\
-- 
2.53.0
