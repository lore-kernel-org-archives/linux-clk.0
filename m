Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB93DC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:49:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF86123109
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391915AbhAZMs4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 07:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391691AbhAZMsR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:17 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDF7C0698D6
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:56 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v15so16303029wrx.4
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uU6U7e+Bn+fD4ver5DjrrStmc291AlsHBOuXfK4dxLs=;
        b=IwFo0CYdlUafY6Byo0R+b6bvvlGXaOENiKJ2ZQwlgfkJsf+VoYu3/yjUzAtePy9TAX
         HbHRg8cIC0ko9QV9ElrO+pb5yB+MSfM+bN28fKBVoKKUMEArKMGSPGa3pbdQ1sYfRViK
         CMf/h5hBhebHXfv4JWun5jdh0n8xiz8VDi2yzG4908LH/BUdQbqOd/iyPYgkiigtWvX+
         TtAHaCnXn9xqgeOZsuyDsKzw87+x+r5fWGCbAAquK3sLssEoCrwk3nc88SFjDEiU9uuR
         gx2RBFBQdmS/SX5nP4mg2DV/3cYIRDRx1k2QRzvgWN1sbvuvqxQxRjXeWJZRfjDV9TXb
         nWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uU6U7e+Bn+fD4ver5DjrrStmc291AlsHBOuXfK4dxLs=;
        b=mFPeL/3WgNG83DacNlBapfCJkn1IN59djbj0k5rEJF9PI0Dqvo1gN+ztZXwx+WtK5W
         MA9D8xVlqLSNyssFeziu55oHgMvHn/8cD8az4wsgG35dwFgZ8lmmk67wPF4RJYjFqHky
         AAObSrKPkcgWP+nwlOxC4vxEUhQuA/SHLx40RVUA1wA0L+4iv+pWQb6RFN6eyIvPRyHr
         xTCmSFiHAazsSLheNcKmuoaE77kgQFqj1g8/AYnADrNaJKy7+e37Re4gazEO5ZXYEpzw
         khbc/EcNYcyb18xphM1PoYROdXNsX9MlA3nUCyrgPUEJcqOXdIrNU8ZaX/z+kFnYyH14
         RCdA==
X-Gm-Message-State: AOAM532VA1RrQKYTzx55O8Zsvx3RQiO4qKduPJMytMtbqRaTLFSbksEL
        HHhca9n3S56sMg4o2TU2HxVb3A==
X-Google-Smtp-Source: ABdhPJyYah5l8tpqi8HzCI+EEhW6f18InEXMudNL+zdJgmVDef+U6MN1L6N18riaoIOyn4yKX7D4pg==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr5605872wrm.376.1611665155292;
        Tue, 26 Jan 2021 04:45:55 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:54 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/21] clk: tegra: cvb: Provide missing description for 'tegra_cvb_add_opp_table()'s align param
Date:   Tue, 26 Jan 2021 12:45:28 +0000
Message-Id: <20210126124540.3320214-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/tegra/cvb.c:106: warning: Function parameter or member 'align' not described in 'tegra_cvb_add_opp_table'

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/tegra/cvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index 21115c4e5d3a1..a7fdc7622913c 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -86,6 +86,7 @@ static int build_opp_table(struct device *dev, const struct cvb_table *table,
  * @dev: the struct device * for which the OPP table is built
  * @tables: array of CVB tables
  * @count: size of the previously mentioned array
+ * @align: parameters of the regulator step and offset
  * @process_id: process id of the HW module
  * @speedo_id: speedo id of the HW module
  * @speedo_value: speedo value of the HW module
-- 
2.25.1

