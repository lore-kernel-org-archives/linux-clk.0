Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584019F478
	for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512705; cv=none; b=t4tbIxi2I6vk7LCpmjh9Bepllb79FRmuRbSpJ+7U7FQvQJCWInmSdtiny8QLNEpM23uLuDjahvR0Wc3N5pXG9lLrkWoVpqxSeFaxSn7UxxAHnnGBKF1AdyyWTkpL8k+FuaUyFOCec2vYWSLiTpGWLzE+Oq2Zt5Ta0T9wbb42Bww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512705; c=relaxed/simple;
	bh=LJPl+PM/ybnwsGuR1t5bZ68xGmDFx3Tf0fdhTqB9WHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuiQ7V92Cge60LLTlUbxwfz+9APHYkwTRY/jAyQd+PSQVcNMAxEIL6tQLSl/28EMkkVgmxU4gndYCzq+jP3CivrDQG+3XDYUnpR/cC0I1u+T+E4fBKbT/uzxwOn8j0feZeaGmSgMXGvjsgllv6zn/m9pdMKu50FygBasIoLUb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XTU1bsLC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XTU1bsLC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c5cc65a8abso3013159a12.3
        for <linux-clk@vger.kernel.org>; Sat, 28 Sep 2024 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512702; x=1728117502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sANYTc56l1dzuSb6OkWAQtijEDV1flO+WLT+P2kRW58=;
        b=XTU1bsLC9mdss7jplmg2js1Uqe5uR3I8yCGyKUfz7q3Vwenl53d12XtSMdrR9LTjiP
         Dde6nolCYmfC+mAdKuXjxn5D7mBebgwWTGK6IjX5eJeMGlldJtyZetFiHXAIT/M/wmE9
         AwpC7g6Uod7B90HvEhuiT4E6yUorMO8uX2GTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512702; x=1728117502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sANYTc56l1dzuSb6OkWAQtijEDV1flO+WLT+P2kRW58=;
        b=Xk8lo5IlCiuzrgs3zzSuXT6oe79Hx+8Ig8UgAiioUHlOmDPOZOAu5HDW7djJJD5vYE
         HovYEi+3Wa5y9rOxgzoc4ko/8OBsL7lWVcsJBID0eCwN78ewZVetvzJPp7DTGAJtROmq
         yaPNKeAJfbKpn6t3kpDzhAlzg+qf13nvwbbkxsBu9M5wMYnkAlWJHfQMJNidgjoM149z
         +1nmxXvP/uslWCCJTqOcEja0viXfUanPaMfWzxs0Ov1GnQon5ivq9RaCT+hCSWzk14XY
         iPg45OBCkbAEYkmXTCMW3liv6G/p8ZCBN3dAAw2noDsL4kCBFEyZCVogCHfL+z7EAGY1
         r4qw==
X-Forwarded-Encrypted: i=1; AJvYcCWnpr7O/q5HgkueINQD9+bibgWFqffMHy7jKRZSxliqxe7Xv4FvMhD3m1blKhhzS3rIwWSWiNVYTrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxynsDFgBw7Bbg0oKKX5w0z6rIvDDvt7/30RrdBC+go5NhGn30y
	vwGn7JhCajSOI7F7rpuRMYuraNfbJPah+LvHmzOWkjaT7Mkft4ZUa4zx1/18Ltk=
X-Google-Smtp-Source: AGHT+IEQNTGrd7nRTduYyFXKYNHcURQgmU386XHHP3cI20GYQr7olx3OUCxS6nGdYAY+ZIc3kLmHPw==
X-Received: by 2002:a17:906:fe04:b0:a8b:6ee7:ba29 with SMTP id a640c23a62f3a-a93c4ac9401mr576566566b.44.1727512701885;
        Sat, 28 Sep 2024 01:38:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/6] clk: imx8mp: don't lose the anatop device node
Date: Sat, 28 Sep 2024 10:37:53 +0200
Message-ID: <20240928083804.1073942-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the "clk" (clock-controller@30380000) device node caused the
reference to the "anatop" (clock-controller@30360000) device node to be
lost. This patch, similar to what was already done for the base address,
now distinguishes between the "anatop" device node and the "clk" device
node. This change is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/imx/clk-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..b2778958a572 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -408,13 +408,13 @@ static struct clk_hw_onecell_data *clk_hw_data;
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
+	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	anatop_base = devm_of_iomap(dev, anatop_np, 0, NULL);
+	of_node_put(anatop_np);
 	if (WARN_ON(IS_ERR(anatop_base)))
 		return PTR_ERR(anatop_base);
 
-- 
2.43.0

