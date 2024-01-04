Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8C2CCBB
	for <linux-clk@vger.kernel.org>; Thu,  4 Jan 2024 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWcT-0005UU-6C; Thu, 04 Jan 2024 23:55:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWcS-000SYQ-CM; Thu, 04 Jan 2024 23:55:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWcS-003eR0-0x;
	Thu, 04 Jan 2024 23:55:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: kernel@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
Date: Thu,  4 Jan 2024 23:55:11 +0100
Message-ID: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xm02GKpjV2TFkwX8EAqOq/s+Xpt5y9OMI2w68qgNtkw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBllzdQ0ucHgkw6iVfpJvSfPnT8fpb5L7l/vciU2 ianhZ7mNNqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZZc3UAAKCRCPgPtYfRL+ TvB0CACP1Bpv72C7bC7wZN6coCZFgCHsedTcmverwB5i1TyOGUTtW9uA8TNVWbJhKhemyJA9j9z Ki/oEDLP9DKqR9zO9qLSb+dX0/UGs3z7jCwCSY2SlxOqjUXIVdaIc5CuAGaUloQDfwVPNQ6v9Gw TgKcd8gaQXA301YqOaH9psNlxe+cpCLNllZICtxg3SLBAf26ZF7fQmd9ub6XAbAQQPVK822Oz65 cD98/IHH3jCx1V/wd8xzi4dC2qN00JK8jRnuMHoRKUnjTecjHmJaO+XVL3wsNOIuGSuEtUm4nRz HAYc/2EUTwn1hLoi3TJqh7Js6IX1CibaGnDqmS1Ge5NsF9Bt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

This allows to simplify drivers that use clk_rate_exclusive_get()
in their probe routine as calling clk_rate_exclusive_put() is cared for
automatically.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1, sent with Message-Id:
744a6371f94fe96f527eea6e52a600914e6fb6b5.1702403904.git.u.kleine-koenig@pengutronix.de:

 - rebase to todays next
 - check return value of clk_rate_exclusive_get()
 - fix a typo in clk.h (s/cal\>/call/)

 drivers/clk/clk.c   | 19 +++++++++++++++++++
 include/linux/clk.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..a3bc7fb90d0f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -939,6 +939,25 @@ int clk_rate_exclusive_get(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
 
+static void devm_clk_rate_exclusive_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_rate_exclusive_put(clk);
+}
+
+int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk)
+{
+	int ret;
+
+	ret = clk_rate_exclusive_get(clk);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_clk_rate_exclusive_put, clk);
+}
+EXPORT_SYMBOL_GPL(devm_clk_rate_exclusive_get);
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 06f1b292f8a0..24c49b01c25d 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -201,6 +201,18 @@ bool clk_is_match(const struct clk *p, const struct clk *q);
  */
 int clk_rate_exclusive_get(struct clk *clk);
 
+/**
+ * devm_clk_rate_exclusive_get - devm variant of clk_rate_exclusive_get
+ * @dev: device the exclusivity is bound to
+ * @clk: clock source
+ *
+ * Calls clk_rate_exclusive_get() on @clk and registers a devm cleanup handler
+ * on @dev to call clk_rate_exclusive_put().
+ *
+ * Must not be called from within atomic context.
+ */
+int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk);
+
 /**
  * clk_rate_exclusive_put - release exclusivity over the rate control of a
  *                          producer

base-commit: d0b3c8aa5e37775cd7c3ac07b256218df0fd6678
-- 
2.43.0

