Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	jassisinghbrar@gmail.com,
	bjorn.andersson@linaro.org,
	robh+dt@kernel.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v9 2/7] mailbox: qcom: Populate APCS child platform devices
Date: Thu, 21 Sep 2017 19:49:35 +0300
Message-Id: <20170921164940.20343-3-georgi.djakov@linaro.org>
In-Reply-To: <20170921164940.20343-1-georgi.djakov@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Register the child platform devices to probe their drivers.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index ab344bc6fa63..fd9055eacf42 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -98,6 +98,10 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, apcs);
 
+	ret = of_platform_populate(np, NULL, NULL, &pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to populate children\n");
+
 	return 0;
 }
 
@@ -106,6 +110,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
 	struct qcom_apcs_ipc *apcs = platform_get_drvdata(pdev);
 
 	mbox_controller_unregister(&apcs->mbox);
+	of_platform_depopulate(&pdev->dev);
 
 	return 0;
 }
