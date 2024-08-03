Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601B13633B
	for <linux-clk@vger.kernel.org>; Sat,  3 Aug 2024 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722682693; cv=none; b=ootAzNJHDatzEQGPSqjCi+HaYUHJdVpoBOiEw2LG5tBHwa8PEZ3Nt74mB/umgxKOSoAGwqoU0CG7YqSTF3wf0dJjpJgwvb8vP3i3txdDq/8FRU5FBiMySjvt0O2gQ0moLJ6w8X7+6cgOMSoconljXiBEZtC0PzuqdaZKB4Q5yyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722682693; c=relaxed/simple;
	bh=tJcOjOt7CpDAdvGLNDfCZNuwgqeXDC/aJ8MWg3SS2gY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+nGtqumEWvaegg5DtGUxZYVypaAgn77cD2xMrGhuU8Th1D5VMxan+O6CqSqX5J45xCjJtWFOfg9SoUQR2fbm7VHVTNbr9/ORNiCCXcsPt/1kC6kJf4TMAF6Q2lnoj4bmsQ0DXeZwvhxgv/2zgqxyKDYkmewGCwkJyOTkuJ9lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=k/OPrCeH; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="k/OPrCeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722682690; x=1722941890;
	bh=0bJIPx09LELVRNHeZZCMVFYiAtr1yKFdcOKvTL0Vwlk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k/OPrCeHGyQdKbNRCpwQ0Fwc/4kSGQjXQOX+HeoVYPp7JmIlp7jKJAPRpBA8kF6T/
	 Y0f18A7bS4B9xBfRAWHHsThzJjvN8ld7Y7sX5tz8fgaUX5XrK9w5XZvK/9AO3fLYcp
	 jB4d4siEmen/U9TwybnM9bwcxrNlXH2lFn822+LpkBHmF7ggoTDs2+miZEjW6GxV8M
	 d8i/xyjDYyNaXBecIKEkgj09JVfSQqHhgSHlVUAl9szEUj6c88JBskRND63xZgUjRi
	 UPCSQt1y7Mo/U8OSz9FTD/DKPyccs8Q+c7JCwxI5DBB0uqXn1RYoYm8VtFwXg39K70
	 WflY/jE/DjXZw==
Date: Sat, 03 Aug 2024 10:58:04 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v2 3/9] clk: clocking-wizard: use devres versions of clk_hw API
Message-ID: <20240803105702.9621-4-hpausten@protonmail.com>
In-Reply-To: <20240803105702.9621-1-hpausten@protonmail.com>
References: <20240803105702.9621-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: bfd10b61e6f5845dd8c2606d6350dd8cd8826350
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use device managed versions of the clk_hw API, entirely removing the
need for the driver's remove() callback and greatly simplifying the
probe() function's error paths.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
v1 -> v2: New

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 52 +++++-----------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilin=
x/clk-xlnx-clock-wizard.c
index ccaf30c2d9481..810d57c46a63c 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1082,7 +1082,7 @@ static int clk_wzrd_probe(struct platform_device *pde=
v)
 =09clk_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(=
&pdev->dev));
 =09if (!clk_name)
 =09=09return -ENOMEM;
-=09clk_wzrd->clks_internal[wzrd_clk_mul] =3D clk_hw_register_fixed_factor
+=09clk_wzrd->clks_internal[wzrd_clk_mul] =3D devm_clk_hw_register_fixed_fa=
ctor
 =09=09=09(&pdev->dev, clk_name,
 =09=09=09 __clk_get_name(clk_wzrd->clk_in1),
 =09=09=090, mult, div);
@@ -1092,10 +1092,8 @@ static int clk_wzrd_probe(struct platform_device *pd=
ev)
 =09}
=20
 =09clk_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul_div", dev_n=
ame(&pdev->dev));
-=09if (!clk_name) {
-=09=09ret =3D -ENOMEM;
-=09=09goto err_rm_int_clk;
-=09}
+=09if (!clk_name)
+=09=09return -ENOMEM;
=20
 =09if (is_versal) {
 =09=09edged =3D !!(readl(clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 20))=
 &
@@ -1110,11 +1108,11 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
=20
 =09=09clk_mul_name =3D clk_hw_get_name(clk_wzrd->clks_internal[wzrd_clk_mu=
l]);
 =09=09clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D
-=09=09=09clk_hw_register_fixed_factor(&pdev->dev, clk_name,
-=09=09=09=09=09=09     clk_mul_name, 0, 1, div);
+=09=09=09devm_clk_hw_register_fixed_factor(&pdev->dev, clk_name,
+=09=09=09=09=09=09=09  clk_mul_name, 0, 1, div);
 =09} else {
 =09=09ctrl_reg =3D clk_wzrd->base + WZRD_CLK_CFG_REG(is_versal, 0);
-=09=09clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D clk_hw_register_divide=
r
+=09=09clk_wzrd->clks_internal[wzrd_clk_mul_div] =3D devm_clk_hw_register_d=
ivider
 =09=09=09(&pdev->dev, clk_name,
 =09=09=09 clk_hw_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
 =09=09=09flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
@@ -1122,18 +1120,15 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
 =09}
 =09if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
 =09=09dev_err(&pdev->dev, "unable to register divider clock\n");
-=09=09ret =3D PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
-=09=09goto err_rm_int_clk;
+=09=09return PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
 =09}
=20
 =09/* register div per output */
 =09for (i =3D nr_outputs - 1; i >=3D 0 ; i--) {
 =09=09clkout_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
 =09=09=09=09=09     "%s_out%d", dev_name(&pdev->dev), i);
-=09=09if (!clkout_name) {
-=09=09=09ret =3D -ENOMEM;
-=09=09=09goto err_rm_int_clk;
-=09=09}
+=09=09if (!clkout_name)
+=09=09=09return -ENOMEM;
=20
 =09=09if (is_versal) {
 =09=09=09clk_wzrd->clk_data.hws[i] =3D clk_wzrd_ver_register_divider
@@ -1165,20 +1160,15 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
 =09=09=09=09=09DIV_O, &clkwzrd_lock);
 =09=09}
 =09=09if (IS_ERR(clk_wzrd->clk_data.hws[i])) {
-=09=09=09int j;
-
-=09=09=09for (j =3D i + 1; j < nr_outputs; j++)
-=09=09=09=09clk_hw_unregister(clk_wzrd->clk_data.hws[j]);
 =09=09=09dev_err(&pdev->dev,
 =09=09=09=09"unable to register divider clock\n");
-=09=09=09ret =3D PTR_ERR(clk_wzrd->clk_data.hws[i]);
-=09=09=09goto err_rm_int_clks;
+=09=09=09return PTR_ERR(clk_wzrd->clk_data.hws[i]);
 =09=09}
 =09}
=20
 out:
 =09clk_wzrd->clk_data.num =3D nr_outputs;
-=09ret =3D of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get=
, &clk_wzrd->clk_data);
+=09ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get, =
&clk_wzrd->clk_data);
 =09if (ret) {
 =09=09dev_err(&pdev->dev, "unable to register clock provider\n");
 =09=09return ret;
@@ -1201,25 +1191,6 @@ static int clk_wzrd_probe(struct platform_device *pd=
ev)
 =09}
=20
 =09return 0;
-
-err_rm_int_clks:
-=09clk_hw_unregister(clk_wzrd->clks_internal[1]);
-err_rm_int_clk:
-=09clk_hw_unregister(clk_wzrd->clks_internal[0]);
-=09return ret;
-}
-
-static void clk_wzrd_remove(struct platform_device *pdev)
-{
-=09int i;
-=09struct clk_wzrd *clk_wzrd =3D platform_get_drvdata(pdev);
-
-=09of_clk_del_provider(pdev->dev.of_node);
-
-=09for (i =3D 0; i < WZRD_NUM_OUTPUTS; i++)
-=09=09clk_hw_unregister(clk_wzrd->clk_data.hws[i]);
-=09for (i =3D 0; i < wzrd_clk_int_max; i++)
-=09=09clk_hw_unregister(clk_wzrd->clks_internal[i]);
 }
=20
 static const struct of_device_id clk_wzrd_ids[] =3D {
@@ -1238,7 +1209,6 @@ static struct platform_driver clk_wzrd_driver =3D {
 =09=09.pm =3D &clk_wzrd_dev_pm_ops,
 =09},
 =09.probe =3D clk_wzrd_probe,
-=09.remove_new =3D clk_wzrd_remove,
 };
 module_platform_driver(clk_wzrd_driver);
=20
--=20
2.46.0


