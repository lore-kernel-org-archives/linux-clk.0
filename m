Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C649AC11F68
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 23:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A588761452
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 23:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhF3XCb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 19:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbhF3XCa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 19:02:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA92C061756
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q16so8149915lfr.4
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA0O2RS+C77CPjstuqYyfYTBCR08cJ7jlzsIYzrS2WA=;
        b=k+3F3dLS6LM+zaDXVKGyCqiLEPtbj8hiwqQR3AcS0AHnjW4JzhtD8xW4GIxKdCuYfQ
         MSShft0IgI841LbfkoWdbEnCtgmwqFp8I0+ldbCdKo0RfjHhsLhxfCe/NgVz4sWhBV4h
         y4Hgogb5XmNEm238XZg4eqno3f7TD3iRalcgnERCPE4hV3lCuoihSB9Kjxhd+lbS9ft/
         rZRCq2mJeuCO7UHTfcETaCOXc7rUQfoxPL4B+Cykbc1lmId/eGYNhecbNmwYfif/tA1f
         YuL+IlV+6ZGeXmIa9goOGOqedoSCOlIrf964ytJlTZ3B83RX/jhGn4wY6FVjBHJsFmFa
         /isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA0O2RS+C77CPjstuqYyfYTBCR08cJ7jlzsIYzrS2WA=;
        b=HVxVgSU5+FoJmFRmyXUNQsLkuU1qQ6ghOb17/6XAVaBsfANIopsH8NKENndaIjsEp/
         r9/KkxYoCHwdUKQSv+RWyVFyX+r2S8a55jsDVG04phkuVoBONHirB3wWPPPOCxbJ3YXF
         aiv824Vcf8w9SzVrhio64H6ERj8jmCtW8PD6gDANdNBpR2AaFA5OXH03Qm4kZu716jfk
         u4iMRkPKLpOfxwhTuqtCvUXw4DPMCHmrtSBOYO3lDCuWLUhYCaY3AtXujIdBguJ3iTj2
         +5LelTAlIxgO7Q0e+3gD90cCWaDKTd3Bk1MfZtVIMe0hpM/DhMq0krMq2GIEgueu0omV
         gJeA==
X-Gm-Message-State: AOAM530Cz1e2+3d+REV8L1dcAPpSA+XAf65vb1CQCHiFvZT0KaRZFMFY
        jlb2FWPkZdrjRHOPTc5pvZr2mQ==
X-Google-Smtp-Source: ABdhPJwZhitEjLOn7dEgy9fGUNit6J+J616luVsM3y3KoE317Fl6+fySjjpDVwtIM2WoZDzz8RIYdQ==
X-Received: by 2002:a19:8c02:: with SMTP id o2mr6192594lfd.326.1625093998148;
        Wed, 30 Jun 2021 15:59:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm2324444ljn.125.2021.06.30.15.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:59:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: qcom: fix error path and cleanup in gdsc support
Date:   Thu,  1 Jul 2021 01:59:50 +0300
Message-Id: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix error path in gdsc_register() and cleanup code in gdsc_unregister()
to properly unwind all genpd registration calls. Both patches bear two
fixes tags, since part of the issue was present in the very first commit
adding support for GDSCs, part of the issue was added when adding
hiearchical power domains support to GDSC code.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      clk: qcom: fix error_path in gdsc_register
      clk: qcom: fix domains cleanup in gdsc_unregister

 drivers/clk/qcom/gdsc.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)


