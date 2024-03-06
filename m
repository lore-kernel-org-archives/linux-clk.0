Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29745FDDC
	for <linux-clk@vger.kernel.org>; Wed,  6 Mar 2024 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721561; cv=none; b=kqCoVdRYuhGPzRsNfjrasUdekw/8vFkrVts1le4raDhuI69coLudg2eC/bUslX4dxa6N8adotQqXZWvZiqV4hj9y7ixy5NJ+v9BCg41Xk1YVsc2tZiCrSHCzWjIGzZP+HYKnAf3UHjnW339kaEht2MeIk2o0im/p5+fOKuVUapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721561; c=relaxed/simple;
	bh=3dfa49T7l/SF5Cv9Z/URZaYPBAyz7zkTwvP0cnLLOTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+DfsfvBLj/m5h2r2JHbQTx41wVVEqz7P+QDyLzCFjhYKe4g5lDqYn2jBG0seeyOx2VwSsUxMpXYI+Ao+6OAm58wV4OZ1uzToTtbodt//3WhKVkYmYotlnyUGzMjTf6Gf8c8j0K2H2y+xtMAksRVUnJbDQVm9SYMn0Bpz1+91jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhofz-0000mm-RD; Wed, 06 Mar 2024 11:39:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-004jAk-Ny; Wed, 06 Mar 2024 11:39:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-000d47-27;
	Wed, 06 Mar 2024 11:39:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-clk@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/3] clk: starfive: jh7110-isp: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 11:38:56 +0100
Message-ID:  <312ec7052c4e327c0b365e167a8e86b406cb7dfa.1709721042.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709721042.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=3dfa49T7l/SF5Cv9Z/URZaYPBAyz7zkTwvP0cnLLOTc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6EfBzDxtkqOLVTFV2lFqNC9g6s0GNlylfccvl vEDSsMMV+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZehHwQAKCRCPgPtYfRL+ ThUCB/4k6opepzFimPswkLyiEaSLo6wdceKCNFbzDl5fBv3g0uFb34KvuwjLD3krGWKseLsJ+FV pVhX1w3ZdMU1BBhpm/C/LE9ZC+7HF0FSiF2kpI3Q9ZUfhH8NSXZ2VD0o8iamwkj45uvkyhuw+DU FDUPt44R1DM4L2rFFgK2yyET2GE/+KZOGyjop1Yy3flq1SjLTXhtniaOmpFwSZ/+3sZO+SYXzo6 DVJfCaKTb6caB3ZI6EtUKXZTg2qpL9anZ+kt5v9NZlDnVHHRPdEGnlFZktugxP4G4qczqk5e7Y5 gMxw7JBnbORpGPUt61T0jXQ+AqWTv2ZjLIFw4av/zcuhewX+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/starfive/clk-starfive-jh7110-isp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index 929b8788279e..d3c85421f948 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -202,12 +202,10 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jh7110_ispcrg_remove(struct platform_device *pdev)
+static void jh7110_ispcrg_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id jh7110_ispcrg_match[] = {
@@ -218,7 +216,7 @@ MODULE_DEVICE_TABLE(of, jh7110_ispcrg_match);
 
 static struct platform_driver jh7110_ispcrg_driver = {
 	.probe = jh7110_ispcrg_probe,
-	.remove = jh7110_ispcrg_remove,
+	.remove_new = jh7110_ispcrg_remove,
 	.driver = {
 		.name = "clk-starfive-jh7110-isp",
 		.of_match_table = jh7110_ispcrg_match,
-- 
2.43.0

