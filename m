Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Uh6UBi3W"
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A58A170A
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:45 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-331733acbacso1456750f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463704; x=1701068504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj4K1pfoFmhhsoRQVm6vixpVPFIpo1qe9oMsVe2v1kc=;
        b=Uh6UBi3WA+R0O4PX+8lI+jPWnt1T6LV+QZ+jP6jq+LmgzkhDFnKylZxKuUoRGpJp4O
         BaDHRj3ro5p5PpKENYni+3gQULTE+6eiG+6YLe+juzlpGGRXBWOlAWZ+8ve/FOOz95t+
         4rn3E5EnJ0qFODYgP8enVvX/gsfNeB31x/mss9g3ENoL8JKsVO/ZSzBega5jSpsUWFqj
         fHVMCdt0EV526WbCEVaPxyh7yUnAI2TLmuXyOrrG2i1zRbdd6QOM79nGOfZGGw5lKGPt
         G6s0IvuI5LD1czBJINQAxu8zgwSDymwbrU5vw6UwEMIDIwkkyf5TSDuJocpdXmsD/mAM
         BBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463704; x=1701068504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj4K1pfoFmhhsoRQVm6vixpVPFIpo1qe9oMsVe2v1kc=;
        b=VPt5Vq8YD0b8qqVWHv4wqm+7DyiRP3gbV0ygRsQfTuBAZCRv39NOgNYTZjUb36Bsqy
         9LR/yoIbRuxake934h/wOzVBOuqoPPEWKLMkNyQ6YaXwr+sSeESbT6DYsdPhzoJ9My5a
         Zbts6tAPN1y6bUniIshLK0rB7qaJXCe/bxO6qxEc7MAx8E0LPiWIotuKd9espi5M8EWm
         CcQyglvQf4a7YGRBpDuJXNzSiT2nl9DfpRRZGUnwLxr87kt9ty0ADZFUkRLwm2EHPMBe
         mSN4YAU5i4Pg39bBqMKIIhIJz7Yxjiv18WbvafVFw4Ml8bumf1L6u+d+iJ6vvkwPLTPt
         Iccw==
X-Gm-Message-State: AOJu0Yz0sV78CKVuYBpM+/sc+UGa9PG5T6eNpEcu56lao0nHCUG2fmCB
	Ub9UPIrm2iQkAJlXpJnkcAcFxA==
X-Google-Smtp-Source: AGHT+IFbHUCjfCJLgApfU02GbEBAEEDTn2cUfzkYAcqxgH3UIdeUTzC7eHrWRIOHe/xLOqhqenD/bA==
X-Received: by 2002:adf:fd4a:0:b0:32f:7cea:2ea2 with SMTP id h10-20020adffd4a000000b0032f7cea2ea2mr4049149wrs.17.1700463703709;
        Sun, 19 Nov 2023 23:01:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:43 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/14] arm: multi_v7_defconfig: Enable CONFIG_RAVB
Date: Mon, 20 Nov 2023 09:00:24 +0200
Message-Id: <20231120070024.4079344-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

ravb driver is used by RZ/G1H. Enable it in multi_v7_defconfig.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 10fd74bf85f9..9a04564566a7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -272,6 +272,7 @@ CONFIG_KS8851=y
 CONFIG_LAN966X_SWITCH=m
 CONFIG_R8169=y
 CONFIG_SH_ETH=y
+CONFIG_RAVB=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_STMMAC_ETH=y
-- 
2.39.2

