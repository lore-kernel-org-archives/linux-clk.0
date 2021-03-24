Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D50FC433E8
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31A4661A23
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 15:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbhCXPTs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236560AbhCXPTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 11:19:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C109EC0613E4
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:11 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z25so30669998lja.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=v97pfOc4wkHEYLNV13IKhZN4dNBeU79Lu9y2VS+lBjB12QYlkvwkgu5zYE9OCOosLl
         BBGF0NeD6RdbhyA4ZSLoAWj57W6+NeHbE4i9klTOV1u2ZYpSnl3jBmmAOF2jtqH+a6B5
         7XIdCG37smDlqai4oAnutXmDnP5F7+xNN1t4Sqoqg61BMea2j9G+33R/V97EjyytAm4+
         WTllpBHpiT/zceAldkY5KNC2sx6XJyJl8imGEpWR1Z84pSSwo4FJ3yJuGHsIjmd3RK+q
         hzrGdGq9n6RD9MQJKAZrDguHacli8bMQQd2tDY7UX62AbZbhdwV36Cdus3DI7C4D7ZXR
         +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
        b=LouIvl9l/UPmLcHfBy7zMDM1rvVgPoXLlJ7qlm3jw4pfryeoPV17b9yzT3wLElWPk3
         9XfwVsfJqbMfwRTbBolBwO7nD3/Sg7C5YdMz6Kli6Fk5lJfw/23wm5YscCt2Irtov+Cx
         iG8JgGfx3f6U8yWKfnTX7XsP7+T0zybi6usjbhjg+EgpHyl8/q4/RS6Ub35+oqMZOetm
         3RDjC3O3Q38As/i0Ggkm7JiozNufTQGkSfChAbSS0RqYIhxApSO5RqgXFUEkV6KEkYYf
         555cLzBA++tOq84cuhthn8AeSU2GAS89n5SfQ3I9H0D5FhdOek9C2Os+p/BWZCHC5Uzd
         lOyw==
X-Gm-Message-State: AOAM532/QLKeG7AO9KNxKHjSiGP4TRKnQpmSRSKuEkTGJzfZ5htbTAoA
        3U/8lLKwe6LoMgfnokzn2BewZg==
X-Google-Smtp-Source: ABdhPJy7sQnjixlxXt2dxgPhyoBWzHKFhcfufQc5+XNuAJ+ErdVXS3tnmZXpUAcNqIG+KRIjkGVLgQ==
X-Received: by 2002:a2e:7301:: with SMTP id o1mr2429148ljc.42.1616599150228;
        Wed, 24 Mar 2021 08:19:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 03/28] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 24 Mar 2021 18:18:21 +0300
Message-Id: <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

