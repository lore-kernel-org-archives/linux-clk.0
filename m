Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A08C678D5
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 13:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCGNaR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 08:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjCGNaQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 08:30:16 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6349652F5C
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 05:29:39 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x6so13174722ljq.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Mar 2023 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzlLRqeLIoCqWaeCUWjv2sHg+Xif4EvH9trW59SFbGc=;
        b=fOUJ3VKR0xgJCRsivOF8z+yqwiKvQTkZJuVKiQm7TEdr7v4AUNTKvl24w5XMb7WMR1
         EqkMQ0pp5xiQhvu0HJUAPMi+W1p3taMXijnPONvM4jyl6ImYL2qy7MSRZnQhP9Y5h/7/
         LfM4fJwcmCldKdJny6k8s+TzyhvhtVq5I9m6uOoE9uK3HmgsAvPpJmt/t6O1x7sEtTzM
         ZicykiXRZt4fIsEkxF9EjmVyzuVfvVyoQqxHpk0UVrf7KcfKMCatHIF9VKdjM8YOaBMa
         9jahkhWxostt1+pAHG6mKh0WQ1fJWK6MS2Zeb81xlyT+TpZoR4hMgnwm4V6peewZdxqG
         yzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzlLRqeLIoCqWaeCUWjv2sHg+Xif4EvH9trW59SFbGc=;
        b=jazOjCn0Bq8EctqPlsf05bVDxJli8PgGdMgcGkH5SJ05dDxo0uIC0bEFFH+keii2IY
         dBrdOhLzTEIrgxJcGczu3tRef97130AjGqIlMgVzHSJyUWgxkAv8povmpe2Aw+E+6lwp
         EZOTFVF74fdqQaOPFvz1+bkEuBDeoBA+QoXKhloirpPrKcK6ac0lHVA9ozdiPCf1yIlv
         yQu9lHnOPxDgUxlyD16yXz8YTgCsXmWiD9dKkFY+u+z7uEUfxFHmpxw3PgHvXykMJwXH
         WRKKJ+uOj3EiUW7qYt1i3nWBBGihOVBEg0xjMbFlkDqhJt7EnNobzVyKmoJzsvzrlZGI
         Qvlg==
X-Gm-Message-State: AO0yUKXybw6kRvOHfcx348X8sH9KLGq9TJFh4XYIb6QjPpTHBGvW0fwT
        TNCJNROjLbiJA9dUx/CdYNwnjw==
X-Google-Smtp-Source: AK7set+VugX+jpRUPrQINQ/X7Fr4VOXfnfWI8pvcndAFBpJP9FnP7FnobOzCPA4RocPFaHSQJKXOPg==
X-Received: by 2002:a2e:96c7:0:b0:295:ac45:f088 with SMTP id d7-20020a2e96c7000000b00295ac45f088mr4271172ljj.44.1678195771320;
        Tue, 07 Mar 2023 05:29:31 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id f8-20020a2e3808000000b002983bfe65b8sm1674813lja.84.2023.03.07.05.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:29:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: Print an info line before disabling unused clocks
Date:   Tue,  7 Mar 2023 14:29:28 +0100
Message-Id: <20230307132928.3887737-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently, the regulator framework informs us before calling into
their unused cleanup paths, which eases at least some debugging. The
same could be beneficial for clocks, so that random shutdowns shortly
after most initcalls are done can be less of a guess.

Add a pr_info before disabling unused clocks to do so.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Don't add 'else' right before a return
- Add Marijn's r-b

 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae07685c7588..115a80fda3f9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1406,6 +1406,8 @@ static int __init clk_disable_unused(void)
 		return 0;
 	}
 
+	pr_info("clk: Disabling unused clocks\n");
+
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-- 
2.39.2

