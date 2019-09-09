Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D4DC00307
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 08:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB9682086D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 08:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elru8+rT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389573AbfIIIyh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 04:54:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52200 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389559AbfIIIyh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 04:54:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so3157943wme.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=93tDfN83mQsd0DPVLc0brfVYsJhwPv42JzLgK6vCzz4=;
        b=elru8+rTyxJnAkRhSgpCtGKhvAzkZlMgML1O+PjWOVzMhVAwGdF9mdMl17yIKWinbF
         Pyy6PK6nwfQV5XGO52F6rddjfLoTuo42XyaL8+vXtJxbuvOKtoETYTCgowHJU7dGBtaZ
         yDFVoVhq0NiwV8DC3DNqEKBbhS0xYPVmxfqacrxJcuOC+lqP1wI4v4jR3kpLPvkeNfgJ
         MMpU8LbFzSZ8+v+24aIyPlKotBw+kF87nnHbIrvLu9gISBhkJsGqrFJnZvT1DRHajBkP
         wPRdWm4WWfuVQYLL6SxMeATk/Z2Y1tisSr9TtcTvz8TOBWamw9eYO9oMfOZS3fCyKtdt
         pUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=93tDfN83mQsd0DPVLc0brfVYsJhwPv42JzLgK6vCzz4=;
        b=V64qY45WtYKivXS+TXUFyUYDjDay7m/zD7XXBDMey/3AZPkhhvXyOeJCiwyCBnru30
         U1gbdV97MfI6fGudoxtwrXNUuGC9XItWObCt/3eR6xhPe32akPHlxFMQ4KtySl5Vfe8o
         T4CYGTWjEpQ8sQuwxr9GhqV4fQQYl9jU5AejIHNsXkqlo/Sh+K5ztv9wIAnwbXwHMjhd
         +caHJhajqOLDp3sqKElq4sPdR51l4acojCXHMQ5GutQcTRMb+0lCkiTliyGUUY/3mOh0
         zJ0o3bjhsVD2bCyCT9mW7NQJbRRNXG21rthOrWHoy5tSSm0d/0tSMVcqzEpONL73yiiA
         3Vbg==
X-Gm-Message-State: APjAAAVTXPMymw2KDLE+oBQ6lV0gHbkQ5LlIShJbBDm/1XXtoY2zY6Ct
        6f/vqt1h+v32OV9GXABsNQ6yYpNSH+I=
X-Google-Smtp-Source: APXvYqwNLAGFJD/5uFgLmvZMGl1fB1pcIoE/EBBaGXx9m7Z80mi6LrNWXEAXrgLH7W7MUpCzjsy0oA==
X-Received: by 2002:a1c:98c9:: with SMTP id a192mr18219335wme.29.1568019274219;
        Mon, 09 Sep 2019 01:54:34 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id r17sm13265220wrt.68.2019.09.09.01.54.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Sep 2019 01:54:33 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: fix QCS404 TuringCC regmap
Date:   Mon,  9 Sep 2019 10:54:30 +0200
Message-Id: <20190909085430.8700-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The max register is 0x23004 as per the manual (the current
max_register that this commit is fixing is actually out of bounds).

Fixes: 892df0191b29 ("clk: qcom: Add QCS404 TuringCC")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---

 v2: add Fixes tag
 
 drivers/clk/qcom/turingcc-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/turingcc-qcs404.c b/drivers/clk/qcom/turingcc-qcs404.c
index aa859e6ec9bd..4cfbbf5bf4d9 100644
--- a/drivers/clk/qcom/turingcc-qcs404.c
+++ b/drivers/clk/qcom/turingcc-qcs404.c
@@ -96,7 +96,7 @@ static const struct regmap_config turingcc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x30000,
+	.max_register	= 0x23004,
 	.fast_io	= true,
 };
 
-- 
2.23.0

