Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558EC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjDJC2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC2W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:28:22 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF052695
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=kJRNGZkKr8CUvUmVHWM6Ireku+hSf/LpbXSxKTWbXSg=; b=gRbVl7TQMhTAPi0LbZvKGtgN8N
        jSKta2pGJpgEgvE8SmxndS4d3PbdXHfoJj1ZtLKC26aKFE5VyhOyoPXwTfXYUBtJ0F6ZiaxKrWRm+
        2f2D93ZwVDFp9JEApn5RZ0YWhiNAu2YM5dZUt41FhNusLkcQFpnOwi41QlYE1QCh0RxLEzwBqvSxU
        Aj6+qrUyIDevS/Pp2HNRSvYrScsx/7GgpfWy5w0QxU8xWmXKHbfRFcPPVm+HZqVFHNrPWg1rfYDif
        Iih9fCIOHImm8gXBs65gcLiTJ64ygIaNaGJT1tR9G8q/sr4UiHW+H7bLW7IuyXiCioq+JlF9B12xJ
        q5RsCWjA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbJ-0002Re-QY; Mon, 10 Apr 2023 03:45:45 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbJ-000EJ6-6J; Mon, 10 Apr 2023 03:45:45 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 07/11] clk: qcom: rpm: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:58 -0700
Message-Id: <20230410014502.27929-7-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230410014502.27929-1-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26870/Sun Apr  9 09:25:02 2023)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the managed `devm_of_clk_add_hw_provider()` instead of
`of_clk_add_hw_provider()`.

This makes sure the provider gets automatically removed on unbind and
allows to completely eliminate the drivers `remove()` callback.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/qcom/clk-rpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index b1be5b664bf3..cac623e27b0e 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -580,8 +580,8 @@ static int rpm_clk_probe(struct platform_device *pdev)
 			goto err;
 	}
 
-	ret = of_clk_add_hw_provider(pdev->dev.of_node, qcom_rpm_clk_hw_get,
-				     rcc);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, qcom_rpm_clk_hw_get,
+					  rcc);
 	if (ret)
 		goto err;
 
@@ -591,19 +591,12 @@ static int rpm_clk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rpm_clk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-	return 0;
-}
-
 static struct platform_driver rpm_clk_driver = {
 	.driver = {
 		.name = "qcom-clk-rpm",
 		.of_match_table = rpm_clk_match_table,
 	},
 	.probe = rpm_clk_probe,
-	.remove = rpm_clk_remove,
 };
 
 static int __init rpm_clk_init(void)
-- 
2.30.2

