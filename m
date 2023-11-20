Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TV8bB9PI"
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A8B10DA
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:16 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50930f126b1so5143293e87.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463674; x=1701068474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xy2p6wKX+cRsudc9CGrTgEJFgRUbbi06MpJ65zqOIE=;
        b=TV8bB9PIs97wzp5p6VsXfUiIpK9KGU8LevBv5E5YdzXuLvmQQeHtIZKHvWMDX2csI+
         Auz/u3U8jHg3gAxmhpzwT3cz1IvgnWUkRrodSXtCbZK6G0o3NnOrObHsyvdKJXXJAId/
         nzwcEDNbrWrbwzbephDlsQn0+Jf1KqktnmufRRSU9YkAvYJJzviZgUXRdm/ezXH3I7p9
         WKNHRfX7xAKzu6MamoVis94GjVdPviwe3zcj2dv0ODVm7sotHqCZ8GGYZ0lI9PrY2R/T
         ooy5BxzPaAuh3lgdVe9xBWI0jbwMruFEGgTqjyRPuv0faOW0oUQIaA58b2BxT0tDOX73
         b1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463674; x=1701068474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xy2p6wKX+cRsudc9CGrTgEJFgRUbbi06MpJ65zqOIE=;
        b=bW3BVem7jAy23+hVj3wlNhVvFzeQO0/eIrqDUUgPaNCKlA684KksZxnpKny9aTOyyK
         SKAcYulyzqdQ9AHyMgiQ00JQkMOV28IU5xXYZCVvXDvjKMD39iKeod4JNLd/NPtn1rZ4
         FLWHXU29kHblaD38rlKyyf7RB9BN8bwjxNXI3YwYefJJDnmEB5j1FxpGkU9rX2hgo94d
         X/6g5BQ3PnriSEkQzAYOUiOuOg3M1DryW3s8hcfU6XZV4NbkQPiJrPNaG9xwbHmipHiv
         IU2onOff8sVXa8C9/gHts7lGV60X12leY+KB9z4w7+TMPkn7IolrFKmsS/SQ3qh3j14x
         exug==
X-Gm-Message-State: AOJu0YxwC5KK/cAiap5qbM+f2dP3tGLnBcuZNbRVqpuCSoqEqB4/1Lwr
	po9JW/s13oYWv6XmyDRKsc6bmA==
X-Google-Smtp-Source: AGHT+IGfGm8OEGn2UQQ//iKUEdt+02S9t97oQMZwU4ZLbFpMApxh8gOBKXhhM8jTFK7zquiEVoqJ2A==
X-Received: by 2002:ac2:5639:0:b0:509:d962:3c67 with SMTP id b25-20020ac25639000000b00509d9623c67mr4876972lff.20.1700463674488;
        Sun, 19 Nov 2023 23:01:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:13 -0800 (PST)
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
Subject: [PATCH 06/14] pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups
Date: Mon, 20 Nov 2023 09:00:16 +0200
Message-Id: <20231120070024.4079344-7-claudiu.beznea.uj@bp.renesas.com>
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

On RZ/G3S different Ethernet pins needs to be configured with different
settings (e.g. power-source need to be set, RGMII TXC, TX_CTL pins need
output-enable). Commit adjust driver to allow specifying pin configuration
for pinmux groups. With this DT settings like the following are taken
into account by driver:

eth0_pins: eth0 {
	tx_ctl {
		pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL */
		power-source = <1800>;
		output-enable;
		drive-strength-microamp = <5200>;
	};
};

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 21ee628363fa..819698dacef0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -376,8 +376,11 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto done;
 	}
 
-	if (num_pinmux)
+	if (num_pinmux) {
 		nmaps += 1;
+		if (num_configs)
+			nmaps += 1;
+	}
 
 	if (num_pins)
 		nmaps += num_pins;
@@ -462,6 +465,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	maps[idx].data.mux.function = name;
 	idx++;
 
+	if (num_configs) {
+		ret = rzg2l_map_add_config(&maps[idx], name,
+					   PIN_MAP_TYPE_CONFIGS_GROUP,
+					   configs, num_configs);
+		if (ret < 0)
+			goto remove_group;
+
+		idx++;
+	};
+
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
 	ret = 0;
 	goto done;
-- 
2.39.2

