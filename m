Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B933605A6
	for <linux-clk@vger.kernel.org>; Wed,  6 Mar 2024 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721561; cv=none; b=G8RqceWvjZPC2SGXrzwZiLQ/9auh6YCiNw8MyZPnJvkQOjjDzTnJh53Yer70bCDq1TN5RULGFmD1iPCDbfLA/3X1TLKT6Sr6aBqmPV/MmeNf8knuQVBXtLsqugl25mCtJGnKS4WKwibmqIGIoq3QBJvWlsyYo0Pco799UQ1+dd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721561; c=relaxed/simple;
	bh=Qnrjahv5xmhVg8n/jVKNRCAVuhxoW//KNtqg8n0T+zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKhjrM2UZBWihAOwhIWyA3SWBiZ1olrzC5Ohf7Z+eRrMD28SrK6cF1wrWAFb3CPBS6R8oK4sjAE9keIdlHxafeD1YUVTuMDy/Th4IWkTK3ArwdWetvk9QRYHKia2dK5xmZOUi+HmnVvBx9kopYtVsKeL1VVaIt0ebPLKB+qDhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhofz-0000mn-RC; Wed, 06 Mar 2024 11:39:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-004jAn-T6; Wed, 06 Mar 2024 11:39:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-000d4B-2e;
	Wed, 06 Mar 2024 11:39:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-clk@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 3/3] clk: starfive: jh7110-vout: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 11:38:57 +0100
Message-ID:  <90054b8b2e118bc04ec37e044d0ac518bb177cf4.1709721042.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=Qnrjahv5xmhVg8n/jVKNRCAVuhxoW//KNtqg8n0T+zc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6EfCuqqQ5M5EsjPFrmLCliz15fMDBSgIAs5f6 X5kA5gE16yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZehHwgAKCRCPgPtYfRL+ ThbcB/43VLahv6W4Ck6Zqw1jwc667mfinoZG2swiGLkyyTGKLe4ZtnoBm8c9cMUNCDahVz5zo5c o2abaQo7Z4kPPY2wtd+L8lt3rCc52sx+KuQ3jtNWJex5GST3QlQJgiuFFTyYaFwOYYKBXXfaasu Cd5B7ikMEPUB+CT4HskfFJ648EcKbYircNhYZjeL7ByNN08NXCZZFnwUGgZ8wzM8sTYEYNFx/Kg 4lsvsdAbKUWysCQ2xDPxaXua3CNCdkuoTJ3SMi6zwnbpQbI8BbEItILLItmOzPRG+G4PrODyZQ3 u5cziQr0Wlo7MP6ZzgufY4cWqqgaRC+26qqEcGGVTrPrGp2o
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
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index 10cc1ec43925..53f7af234cc2 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -209,12 +209,10 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jh7110_voutcrg_remove(struct platform_device *pdev)
+static void jh7110_voutcrg_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id jh7110_voutcrg_match[] = {
@@ -225,7 +223,7 @@ MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
 
 static struct platform_driver jh7110_voutcrg_driver = {
 	.probe = jh7110_voutcrg_probe,
-	.remove = jh7110_voutcrg_remove,
+	.remove_new = jh7110_voutcrg_remove,
 	.driver = {
 		.name = "clk-starfive-jh7110-vout",
 		.of_match_table = jh7110_voutcrg_match,
-- 
2.43.0

