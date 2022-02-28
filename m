Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25652C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 12:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiB1MEU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbiB1MER (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:04:17 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F1117E0E
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:38 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m14so20943385lfu.4
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wpNOYJbLuHAROObNPm3JzKG5s6/JM5BLEeZyhqZ773Q=;
        b=forMbeBW4fCCoz6ra4j4jdnnt3YZ5ahGiQmjH2hEPf8wICpZ2GTJyc2R8kIwGaY8um
         e/YGs+u25viKM9bvkNlZUH3Lx6dQe3I52XSEKM08qaJX/yCTxlGYkcPqDgVwYXte+tgJ
         /+bLsSqvfLZw7RV+pmep9Tp9pwEuu8Zf3dRzKREoYtzPEaZKEnwIzQ+wsAi9d+cvUcJZ
         f8XNxY3wBPP2HUQJgwdr26xMCalE3ZecLpaFX8LcHUgIIH6Tzl4/d8P1xHQMQ14iGwV1
         7Ez6s4F/QyW5NsH7JW41bTJGQZpqCH9yiFBGBQl9J1ZXiStNGie/5fiTefAyWScSUDnH
         fwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wpNOYJbLuHAROObNPm3JzKG5s6/JM5BLEeZyhqZ773Q=;
        b=46NiqBydeXM1hTNGJjQn2elH7zEJ4JGaYSb+eLiB+kr/VewdrRvEtPmReNqluQQP7p
         i2MSRZdgvkF4lZ2EWyLQJTX2ykq/Y0jlrnh/281UBlL9lJn1X254XCQuGBpZmfrU7eZ+
         pbv8DzJ8lq++mxO5Az6fStIiIZ0QWyqihqTm5Te7s4qrG5V/e1ksyxneRbwgYUKt3WUR
         8lNTZHjDjxDBJtFpmwcbokyrVTjf2OUxBzv/htjd9UiiMmkn/tcTQZP/dGgpl306CQnt
         76mdr+B7RWo8Nd4mXsvREY+4KwvyhtZjXXK02N+4OtjzxUmdKWO4nqqzAS80aBkzYo4X
         7+iw==
X-Gm-Message-State: AOAM530PIzIZHqv/IpWk5PqwMHQGh1nhoRTUGIZaOF90RQgsTv/LvX84
        uPQ6W/L7T3KqUmdscOxTVFJikA==
X-Google-Smtp-Source: ABdhPJwjcDOJvwHIVv66Ff6OPuiGUnLQofUx6A6fszsDjXhpOsnULjPQPLHdH4yTocrBb1jVxciN3A==
X-Received: by 2002:a05:6512:324e:b0:443:b0a3:6756 with SMTP id c14-20020a056512324e00b00443b0a36756mr13127965lfr.613.1646049817146;
        Mon, 28 Feb 2022 04:03:37 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id a21-20020a19f815000000b00443977d5a61sm928516lff.110.2022.02.28.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:36 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon, 28 Feb 2022 14:03:34 +0200
Message-Id: <20220228120334.997058-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

