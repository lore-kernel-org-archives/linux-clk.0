Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451059;
	b=YkJU+txb+newKpqsoTUmpR5sDwaBRO+QHDMqq7H//gfFL5U7zL0sfF4+yKk7dQZLEaj1
	 4hDTDunjFEcV3TSQO4F5CY8JBmznAHF08yGL6NDXh9hbdJoSgLU1zIH+wXwa7Cc9Xd6p+
	 hxSyAOnwpRIKZqKGGUgidYWg7YbVpWoPs3E0Achdjf6aRFH1ZElPttRlv4GMcSWlYo+9M
	 J2DTg95pN7AtlNlSVupU5k9gGFgSGG0xzXHZvp+r1w//AR6a28gLpkUX9m9Iy4aNWipvK
	 EU6B3dtJ/K7n8iOF+V7fZRL4vSBsEoQ4paiCrBs+VBNVuJBsbMX7Z7A8j9foJIhS/pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451059;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fMa1F596zZeCN4DtEvr02egD3NFnabU1nIZffJ3y2Fs=;
	b=cW6N6QW960dVsQtZtWQFJVaOLmST9haEu25awyajqfA8aL/DY3sgigi7qDYQKlL+MOyh
	 SX95pqk7R1eM1PK3hC3QPTBd25nwt/TIIDD2lz2GtWmwpDZRdqP4X8GbBJGLG6jruDtU1
	 rqUJ2Xf4k3qO2/8uwr3lKEQg09EbF9VDJ87IzrTnDPPnjND2h3Rjx45fTIT1Hiiiq0qCZ
	 llKbVMacMjjnVc1zN5ut45Z63VIku0xTgyGBxbM1611W5Gb+HbDY6mGM06HciBziwv+pg
	 HkGkM7Dz7wb/5ZmlKHq6xQgMMYSacDG67acJ45EMMNkKD76QYZSVhqC2pZcMfCx50RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IfLpwo4i;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098F3606A88A;
	Thu, 12 Nov 2026 02:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098F3606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IfLpwo4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794451057;
	bh=lUDmKjtljGQw127/vFvt2r0JrBvNqetevLUcJso/6hs=;
	h=From:Date:Subject:To:Cc:From;
	b=IfLpwo4ivjWYLXGC3jzRWCcE78/65qO9rAG9w2IqBclGvj561Li5P0T0X1Fe73pwr
	 eHRN86E43Mbapmo60lpHTwp3OU9E2oYDz9MwrAzQDW1T8jYQLMYMkRnXV+VyUjn/6U
	 TlP2Y0MhBzksj4hfFOmnJARMAphqzb7FJmNpS/oVDc0eq+SyhV05ZkG2j8/UfFX8Ig
	 /9pFNGAa6IkNUgUWl1Vo5FsEs1NaIKCalA8TIWwHkc/OD9gXxd6wREY8UuOktIovh2
	 BTRDg62qO6mWijKFFI5/ToRvnmfMQA+IFbGTtORKqZG52iepVSO6IiSv04dl6k+2EC
	 i4P6uH51iQTFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D6417E0240;
	Thu, 12 Nov 2026 03:37:37 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B87D948002C; Thu, 12 Nov 2026 03:37:36 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 12 Nov 2026 03:36:40 +0100
Subject: [PATCH] clk: rockchip: rk3576: create proper platform device
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm1CS4DoVYiLYeho5TcdICaEu
 zvq8lu8d0AUU4lwyw4w2TXqPCXQJQP/dNNDULtk4JwrImK0vijrCv3Q4zK4Ncw2YpdCL0jsAud
 lfW05QBosJkHfv3lz/ztu7Uv8+j3CeX4AnojzKn4AAAA=
X-Change-ID: 20261112-rk3576-clk-platform-device-12af20579b2f
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 YouMin Chen <cym@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Dragan Simic <dsimic@manjaro.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4298;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lUDmKjtljGQw127/vFvt2r0JrBvNqetevLUcJso/6hs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr1JnDFs9N+ORoHA/zkD4paMpzY9YFK/0oca
 aypg7XvG9a81IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9SZwAAoJENju1/PI
 O/qapGgP/3JYeHHE33FqJeXoA82rbh5VSH7oTa/FIq4xjf4mwBhcFMDYgd735i22DjNDHjct9BD
 RakcG3HSMNLVymfiAPEGtWFP9IgXDwwNJo4EU1ixpKzXyVLKn1jaL/ylpkhxsHzU+vjUCZTlhah
 2j7LgwQ4U/yg0NK6RVTIT+YAUYx9fNxVDj+SfAdBFJaB/BjDRClh8Y1oKOVj3ju0RMRlVLd9+kY
 eWGR3c3QpMKk08SjtHSu881mncwflJm+eIM8IHzqiEN8UG48U6elwtoU+an/h4r/q7gdf36KNTi
 Hl2wJaD84fGquOkiIpVgh3eM45/gEZhIrpIl0SZ1bL2M7n8yDAxqsA3s1+dKFJr21xiLw5ZeUwc
 /pnscgSnLLQfMkWTgqcjP1ogxve7ylFCi+eU/GK0gmhSW7ub3oDcJpyhaEfllCO9kT0qKakNbdU
 PLWK5/dge5IigT4jhCboWewhJY7FAdSeuDNJPoxOeJgzXbFJwf/+39WVs9royCGivZ14g/5Z6zr
 jEz+walFZ/Dl9IEDYQ7qwHO0pqSRVxbIgMaGMB1mEVhMRLzVGeDUCAfHgxzQ/d8T6fewtKIRm8x
 1wMlx2vg1s/FsyQ2HvYfJIB93vc3LdL4LZ21dH960hFbxuI4kA6cJ2J/rcRgl9nPIEjsZParQk8
 QBl1/jS73SbMNciNYXfUoZg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When RK3576 clock controller support was upstreamed, it copied the
vendor kernel's logic. That code makes no sense as it contains a
bunch of unused code (clk_rk3576_probe is never called as the DT
node is already initialized; if it would be called, the clock tree
would be registered twice).

Let's switch the driver to use the same style as RK3588: Continue to
initialize the clock tree early via rk3576_clk_init executed by
CLK_OF_DECLARE_DRIVER before the device model is initialized, but
don't mark the DT node as processed.

Later the device driver is probed for the DT node and registers the
resets as well as the restart handler. It also officially becomes
responsible for the DT node, which fixes all device link messages for
power-domains with a clock phandle:

Failed to create device link (0x180) with supplier soc for <device node>

Note that the supplier is 'soc' here, because there is no device for
the clock-controller before this change.

Ideally at some point we move the clock tree registration to the
device driver and get rid of the early init completely, but the
upstream kernel is not yet ready for it on the Rockchip platform.
This gets us at least in the right direction.

Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
That's 16 scary looking error messages less printed during boot on that
platform while reducing lines of code and modernizing the driver :)
---
 drivers/clk/rockchip/clk-rk3576.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2cdd667f4004..577100659593 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1733,6 +1733,8 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(59), 5, GFLAGS),
 };
 
+static struct rockchip_clk_provider *rk3576_early_ctx;
+
 static void __init rk3576_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
@@ -1802,12 +1804,10 @@ static void __init rk3576_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3576_clk_branches,
 				       ARRAY_SIZE(rk3576_clk_branches));
 
-	rk3576_rst_init(np, reg_base);
-
-	rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
-
 	rockchip_clk_of_add_provider(np, ctx);
 
+	rk3576_early_ctx = ctx;
+
 	return;
 
 err_free_pmu0:
@@ -1817,35 +1817,27 @@ static void __init rk3576_clk_init(struct device_node *np)
 	return;
 }
 
-CLK_OF_DECLARE(rk3576_cru, "rockchip,rk3576-cru", rk3576_clk_init);
-
-struct clk_rk3576_inits {
-	void (*inits)(struct device_node *np);
-};
-
-static const struct clk_rk3576_inits clk_rk3576_cru_init = {
-	.inits = rk3576_clk_init,
-};
+CLK_OF_DECLARE_DRIVER(rk3576_cru, "rockchip,rk3576-cru", rk3576_clk_init);
 
 static const struct of_device_id clk_rk3576_match_table[] = {
 	{
 		.compatible = "rockchip,rk3576-cru",
-		.data = &clk_rk3576_cru_init,
 	},
 	{ }
 };
 
 static int clk_rk3576_probe(struct platform_device *pdev)
 {
-	const struct clk_rk3576_inits *init_data;
+	struct rockchip_clk_provider *ctx = rk3576_early_ctx;
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 
-	init_data = device_get_match_data(dev);
-	if (!init_data)
-		return -EINVAL;
+	if (!ctx)
+		return -ENODEV;
 
-	if (init_data->inits)
-		init_data->inits(dev->of_node);
+	rk3576_rst_init(np, ctx->reg_base);
+
+	rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
 
 	return 0;
 }
@@ -1858,4 +1850,9 @@ static struct platform_driver clk_rk3576_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver_probe(clk_rk3576_driver, clk_rk3576_probe);
+
+static int __init rockchip_clk_rk3576_drv_register(void)
+{
+	return platform_driver_register(&clk_rk3576_driver);
+}
+core_initcall(rockchip_clk_rk3576_drv_register);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-rk3576-clk-platform-device-12af20579b2f

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

