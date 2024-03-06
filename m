Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB25FDDC
	for <linux-clk@vger.kernel.org>; Wed,  6 Mar 2024 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721559; cv=none; b=ms/eFZKLj1LLEldG8/Ua1Oflg6xeQ9HMwKltHR+jDFRhz+P/nkMjfLU1dVygl6VAdOUhHf5NJW97xUHN/DDsBzUeSXAWM954xoa7xrf7uY/ToGXydLuxhMIEbxHNAmk/zXzyjpkJttbfTXrp3uE2juxfDF8gfvP+ZAbN73RXpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721559; c=relaxed/simple;
	bh=vIc6TdPhXd1kX/avPbpFDWQrNdFePTX5Ajo4Bc1oq64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHRiJsEIXYZcPDyz6/T340laqmgbMq+72M3SzBQLPwzjeYd+64ZTCdNPGErlK6R6Ykt3k/nXVSoJtq7Jr70Ae1CB7iZlRPB0VFz/vvItqfeAlRfh9ND63/4AnaNBSmMR7jfIS/upTG09/Rjxb5vJwVTZxnfF+EymG6245rej2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhofu-0000m9-9m; Wed, 06 Mar 2024 11:39:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-004jAh-Ii; Wed, 06 Mar 2024 11:39:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhoft-000d42-1a;
	Wed, 06 Mar 2024 11:39:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clk: imx: imx8-acm: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 11:38:55 +0100
Message-ID:  <ba373ce7341518216a4940e76ce61d759b912b3d.1709721042.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=vIc6TdPhXd1kX/avPbpFDWQrNdFePTX5Ajo4Bc1oq64=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6EfAOvpBlrvFECH1JzFiP1N0VpY0xgRwInvbt Ky7mUAAf6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZehHwAAKCRCPgPtYfRL+ TvilB/9gBR815Rxi7A/nCY8oDjbfnbNuJ1Hbhr8cx9RgEV3Qeatz27NpWV2tdt16eDSM3zNz1/8 eXgoIm4WmUhLy5cKW9suL3QlFo7LBFsfbxEmcO1USVwadnEUxtjL45kng7KcvQKoelJm710VnMW NCXF1QUAIYK74Bj+EKGh3wWrXdX0i1kEKYCUKdKgYJKAKjdM4HmZMSMjJgpYqzSRUdUUL+7ylR2 5U13vuctxl50juoIb6HaGD9SfNGCzaIltGrM3NY0xzzW0aHvMGr4b8n1lgL5GqnHhTAzYfT8HTE WmhteIlvfeyffO3yugNZi0iuh8ApQwErO0/NygI3KoXncy7R
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
 drivers/clk/imx/clk-imx8-acm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index f68877eef873..1bdb480cc96c 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -394,15 +394,13 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8_acm_clk_remove(struct platform_device *pdev)
+static void imx8_acm_clk_remove(struct platform_device *pdev)
 {
 	struct imx8_acm_priv *priv = dev_get_drvdata(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
 
 	clk_imx_acm_detach_pm_domains(&pdev->dev, &priv->dev_pm);
-
-	return 0;
 }
 
 static const struct imx8_acm_soc_data imx8qm_acm_data = {
@@ -470,7 +468,7 @@ static struct platform_driver imx8_acm_clk_driver = {
 		.pm = &imx8_acm_pm_ops,
 	},
 	.probe = imx8_acm_clk_probe,
-	.remove = imx8_acm_clk_remove,
+	.remove_new = imx8_acm_clk_remove,
 };
 module_platform_driver(imx8_acm_clk_driver);
 
-- 
2.43.0

