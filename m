Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH -next] clk: meson: Fix invalid use of sizeof in gxbb_aoclkc_probe()
Date: Mon, 22 Aug 2016 16:08:21 +0000
Message-Id: <1471882101-22347-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

sizeof() when applied to a pointer typed expression gives the
size of the pointer, not that of the pointed data.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/meson/gxbb-aoclk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 61ef28a..b45c5fb 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -142,7 +142,7 @@ static int gxbb_aoclkc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gxbb_aoclk_reset_controller *rstc;
 
-	rstc = devm_kzalloc(dev, sizeof(rstc), GFP_KERNEL);
+	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
 		return -ENOMEM;
 
