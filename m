Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA28810E9
	for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403394; cv=none; b=sz9BHQJD4k07Ulg3/FEQF1OnSjW1prHI/xdCOlXtaJcC/xZ9zovkz/UZyTRnmALd3bKAP90haGtNrT0QHF1fur5NchdL3h1eJi3v0ob7Ouny6uNf2TSizwPXkhhrelwG6a7no9Cb47lKHlaXMlY05wFExHMzbbO3SjV1IOV4CmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403394; c=relaxed/simple;
	bh=Nie+wA2lEKwH2I614ELhqO2d8Vq+8E2sjK5/V77zdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqqOXQND24nQjQXflY6Sc3Uif8jQ6RPimgkmNmVP7htyI/fmPj4gRq/jCViTDIfmE1s4lwzQ9rPXKKCbFaOTD3Z2JM49rCw5QBO/9VWzEvXC3csG31aEJiJ9eRmOIRxjIZ4Z1DV0Z/kbfzGLRTSrLUhKFnDJpWZW3xy5ebOn6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KTPjnA+b; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KTPjnA+b"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso133716a12.3
        for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747403391; x=1748008191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=KTPjnA+bF2/Q/ezQujB5JOF1TKpjrYvhCdJNfSzyn7G1sCJbG+LRhsmczVGxI6cGHa
         RxC2uMiIh6oLpFLhMxsEq6tQ/g9opDv9gSHu0n5QxGkjNBeyvnk4D0zxdjdc/bY+y03A
         ioq+zGV/kTBbPAi4vR0xsjSTASaTMPZd8w32k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403391; x=1748008191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=gOB6uWW4THl9Op9+UBJL0qsdd8PyK0gv+zHZHrhtELwYcvB9QpLGqCGUhqUvSEaqTa
         owm2+oVey+WYVXqXQo0wiP3MhpfHIP6bYX//j+koQ9C17Wq0U87jec7PdxPDoqDxiTpg
         3URglDXsQbMrHvhRB5beKCYS48eG5DkH5fhuaRIdXy4JUBT+s6sPOl4MhrgAsfwXoqcI
         9qLgUO30LEjf45tRh5wCo6CRnnGL2eyzEmyjbMWMENq4ed29w+xG05T4I8hjrIKdWkBq
         Y8uczbVvZ/oAatnDAc7xCcrwdJPRdebq3VM6etUvX/YjzfJzdKm3SA1wA68qUDbfvKEs
         me+A==
X-Forwarded-Encrypted: i=1; AJvYcCW+uEucjR+ZCR0jJ1qNnQeSAKTZHbKe2otk7ivMa07koWl3ZIH05H9sa7Hbm4pOS/TsGkdgiM/GTX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMWtgQVHrvfS/GQ9Y7ovxaPa9HYF6C7vRq4+Z5NXgKwsOcZZ7
	hCUFG5IDe0xHVqfsdAMlI+bF6LFhRuC7QzdEoaFZugRtsmVavaWse5xshxI01O4Oarg=
X-Gm-Gg: ASbGnctQwf48oQLygTCbeVqs9VbqxtRCJZVJBPK7tlMbrMs51r1/xdV7Pcoj6GltB9u
	RXzUB24fv8zedeuFNSIprzRQk9CtMB4XgtAoCsSnEP6wMT8EosCW8nAl9mKi+vnEw+AlISonDYl
	x3oVzIH7muAq5qSEoc/at7tmTIIVGeEYbm+Zziyi9GX2mcGJTmv4rrkOA5G6m3UHp5bN63TCVU4
	R17Atw0j8VaAskpfjvikjk1vIZ4aG8eAiqY/H53oujDVIhdTOJ7bMxjQM8j8ncmKZmODN16mmHJ
	UzCQR7iGK+TumWLWgsUVM6TYu1KnUTS80dbg7iBkv2il0A7yt7mXvbpoY0OAS1QYEdZH5e7be84
	H2OsLiOrzKW0Ce33VjyW/1/ymTIo=
X-Google-Smtp-Source: AGHT+IFoN5V5sXxRw1p11CkmgQLqoxiXH8inT8H8fElyYIKPtuQteQwDowZG6nwQRuFNGWvPp8sSnA==
X-Received: by 2002:a05:6402:27d1:b0:5fc:966b:23fa with SMTP id 4fb4d7f45d1cf-6008a39c9b8mr2906162a12.4.1747403391082;
        Fri, 16 May 2025 06:49:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([62.19.60.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e6389sm1562951a12.45.2025.05.16.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
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
Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM platforms
Date: Fri, 16 May 2025 15:49:27 +0200
Message-ID: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
driver") breaks boot on i.MX8M{P,N} platforms.

Here's the log for a board based on the i.MX8MP platform:

[    1.439320] i.MX clk 1: register failed with -2
[    1.441014] i.MX clk 2: register failed with -2
[    1.445610] imx8mm-anatop 30360000.clock-controller: NXP i.MX8MM anatop clock driver probed
[    1.455068] Unable to handle kernel paging request at virtual address fffffffffffffffe

...

[    1.634650] Call trace:
[    1.637102]  __clk_get_hw+0x4/0x18 (P)
[    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
[    1.645152]  platform_probe+0x68/0xc4
[    1.648827]  really_probe+0xbc/0x298
[    1.652413]  __driver_probe_device+0x78/0x12c

In the imx8mp.dtsi device tree, the anatop compatible string is:

compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
for the i.MX8MM anatop is incorrectly loaded.

The patch fixes the regression by ensuring that the i.MX8MM anatop
driver only probes on i.MX8MM platforms.

Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-imx8mm-anatop.c
index 4ac870df6370..90ff11a93fe5 100644
--- a/drivers/clk/imx/clk-imx8mm-anatop.c
+++ b/drivers/clk/imx/clk-imx8mm-anatop.c
@@ -37,6 +37,19 @@ static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
+static int is_really_imx8mm(struct device_node *np)
+{
+	const char *compat;
+	struct property *p;
+
+	of_property_for_each_string(np, "compatible", p, compat) {
+		if (strcmp(compat, "fsl,imx8mm-anatop"))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -44,6 +57,10 @@ static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret;
 
+	ret = is_really_imx8mm(np);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "failed to get base address\n");
-- 
2.43.0

base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
branch: fix-imx8mm-probing
