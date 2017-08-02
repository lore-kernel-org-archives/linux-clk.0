Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@codeaurora.org>,
        <mturquette@baylibre.com>
CC: Franklin Cooper <fcooper@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH] clk: keystone: sci-clk: Fix sci_clk_get
Date: Wed, 2 Aug 2017 21:32:13 +0300
Message-ID: <1501698733-27316-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

=EF=BB=BFCurrently a bug in the sci_clk_get implementation causes it to alw=
ays
return a clock belonging to the last device in the static list of clock
data. This is due to a bug in the init code that causes the array
used by sci_clk_get to only be populated with the clocks for the last
device, as each device overwrites the entire array with its own clocks.

Fix this by calculating the actual number of clocks for the SoC, and
allocating the whole array in one go. Also, we don't need the handle
to the init data array anymore after doing this, instead we can
just compare the dev_id / clk_id against the registered clocks and
use binary search for speed.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reported-by: Dave Gerlach <d-gerlach@ti.com>
Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
Cc: Franklin Cooper <fcooper@ti.com>
Cc: Nishanth Menon <nm@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 66 +++++++++++++++++++++++++++-----------=
----
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.=
c
index 43b0f2f..9cdf9d5 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/bsearch.h>
=20
 #define SCI_CLK_SSC_ENABLE		BIT(0)
 #define SCI_CLK_ALLOW_FREQ_CHANGE	BIT(1)
@@ -44,6 +45,7 @@ struct sci_clk_data {
  * @dev: Device pointer for the clock provider
  * @clk_data: Clock data
  * @clocks: Clocks array for this device
+ * @num_clocks: Total number of clocks for this provider
  */
 struct sci_clk_provider {
 	const struct ti_sci_handle *sci;
@@ -51,6 +53,7 @@ struct sci_clk_provider {
 	struct device *dev;
 	const struct sci_clk_data *clk_data;
 	struct clk_hw **clocks;
+	int num_clocks;
 };
=20
 /**
@@ -58,7 +61,6 @@ struct sci_clk_provider {
  * @hw:		 Hardware clock cookie for common clock framework
  * @dev_id:	 Device index
  * @clk_id:	 Clock index
- * @node:	 Clocks list link
  * @provider:	 Master clock provider
  * @flags:	 Flags for the clock
  */
@@ -66,7 +68,6 @@ struct sci_clk {
 	struct clk_hw hw;
 	u16 dev_id;
 	u8 clk_id;
-	struct list_head node;
 	struct sci_clk_provider *provider;
 	u8 flags;
 };
@@ -367,6 +368,19 @@ static struct clk_hw *_sci_clk_build(struct sci_clk_pr=
ovider *provider,
 	return &sci_clk->hw;
 }
=20
+static int _cmp_sci_clk(const void *a, const void *b)
+{
+	const struct sci_clk *ca =3D a;
+	const struct sci_clk *cb =3D *(struct sci_clk **)b;
+
+	if (ca->dev_id =3D=3D cb->dev_id && ca->clk_id =3D=3D cb->clk_id)
+		return 0;
+	if (ca->dev_id > cb->dev_id ||
+	    (ca->dev_id =3D=3D cb->dev_id && ca->clk_id > cb->clk_id))
+		return 1;
+	return -1;
+}
+
 /**
  * sci_clk_get - Xlate function for getting clock handles
  * @clkspec: device tree clock specifier
@@ -380,29 +394,22 @@ static struct clk_hw *_sci_clk_build(struct sci_clk_p=
rovider *provider,
 static struct clk_hw *sci_clk_get(struct of_phandle_args *clkspec, void *d=
ata)
 {
 	struct sci_clk_provider *provider =3D data;
-	u16 dev_id;
-	u8 clk_id;
-	const struct sci_clk_data *clks =3D provider->clk_data;
-	struct clk_hw **clocks =3D provider->clocks;
+	struct sci_clk **clk;
+	struct sci_clk key;
=20
 	if (clkspec->args_count !=3D 2)
 		return ERR_PTR(-EINVAL);
=20
-	dev_id =3D clkspec->args[0];
-	clk_id =3D clkspec->args[1];
+	key.dev_id =3D clkspec->args[0];
+	key.clk_id =3D clkspec->args[1];
=20
-	while (clks->num_clks) {
-		if (clks->dev =3D=3D dev_id) {
-			if (clk_id >=3D clks->num_clks)
-				return ERR_PTR(-EINVAL);
-
-			return clocks[clk_id];
-		}
+	clk =3D bsearch(&key, provider->clocks, provider->num_clocks,
+		      sizeof(clk), _cmp_sci_clk);
=20
-		clks++;
-	}
+	if (!clk)
+		return ERR_PTR(-ENODEV);
=20
-	return ERR_PTR(-ENODEV);
+	return &(*clk)->hw;
 }
=20
 static int ti_sci_init_clocks(struct sci_clk_provider *p)
@@ -410,18 +417,29 @@ static int ti_sci_init_clocks(struct sci_clk_provider=
 *p)
 	const struct sci_clk_data *data =3D p->clk_data;
 	struct clk_hw *hw;
 	int i;
+	int num_clks =3D 0;
=20
 	while (data->num_clks) {
-		p->clocks =3D devm_kcalloc(p->dev, data->num_clks,
-					 sizeof(struct sci_clk),
-					 GFP_KERNEL);
-		if (!p->clocks)
-			return -ENOMEM;
+		num_clks +=3D data->num_clks;
+		data++;
+	}
=20
+	p->num_clocks =3D num_clks;
+
+	p->clocks =3D devm_kcalloc(p->dev, num_clks, sizeof(struct sci_clk),
+				 GFP_KERNEL);
+	if (!p->clocks)
+		return -ENOMEM;
+
+	num_clks =3D 0;
+
+	data =3D p->clk_data;
+
+	while (data->num_clks) {
 		for (i =3D 0; i < data->num_clks; i++) {
 			hw =3D _sci_clk_build(p, data->dev, i);
 			if (!IS_ERR(hw)) {
-				p->clocks[i] =3D hw;
+				p->clocks[num_clks++] =3D hw;
 				continue;
 			}
=20
--=20
1.9.1


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki
