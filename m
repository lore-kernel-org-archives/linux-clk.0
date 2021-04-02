Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC62C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D3E96115C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhDBU6L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhDBU6K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A251BC061788
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id m12so9070812lfq.10
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh6tlwGlVgsjPbfd4aPH/Z77SrxX/auFbVs6qPqa7sg=;
        b=LwdaSBXvHjNJ55j9n67G0fDMnPv5DeXfWSEO2HnTWgZxyLimPHa+MAatCZxxyTmlYs
         vibw8//CB3Uz6m24al0XmoQa1CBaiUy5OWj2tYPkSphd9wJMOykZuUU/Qrnbe5T2IJfE
         /kAL8FqO1YueleLlMR5NDaXT23zTfLEuQ1EWTqVoDAIKjiu0LBAZiwyzZ/S6hefrh6qz
         JU1hG7uNQa8my0AcMUnVI+lG8TRvXvQn31yoS0GSKG64ufsS5mT0kSiuwaSFKdV6AGd7
         oJKpNltqOuysK+o593rc3l9ezrGXsEVWzj4EIAXnnwm9S6CBDBWZFtP3HQyKb+z3tfd4
         QnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh6tlwGlVgsjPbfd4aPH/Z77SrxX/auFbVs6qPqa7sg=;
        b=At5730liv8dJ3qKIcREAS/x/N8q+Hx7wiO5ihqZpaPzR//tJ6p/LuuxnqqAsqIQa50
         bV28s0Fs8nJin8BLtAp/Mo9dDUOLI4BBcxTr++ZQePFv7tV7SGTIJ5pMGqvswSR5wc5t
         4DVVxVeAIhkTm4fvXqbtaeh4ImDxTu+FgOP6CRjOJGqJINH4W1YSjUVP9H6H/JQZyQO1
         pbMRxscFJ2GIn/ejV9W/aWj74ZnCWitvFd+7mlW+4tIZhESMYWEnz84Hh82LJ+BhQcxH
         e51i5UX4uteF/DPnXpg++MO+VecIwmiFs3u4+mhu/BwqKLPgQThMwu2/1EAvREYcOMLP
         oulA==
X-Gm-Message-State: AOAM533Ab6z23LdXQLV8EhYWJmVf5caaEZqcWs9Lb4Ku3JJEH6XOG/qO
        0bMEj7fM5rRqQXYXQX4EY8KsUw==
X-Google-Smtp-Source: ABdhPJwfwmuDegn+wMJPwNB5jKPfcAxb8qAssfftTChaKVyIr40iI+qiNYhybnujlD2Qs0zEi3AyTw==
X-Received: by 2002:a05:6512:c02:: with SMTP id z2mr10245023lfu.595.1617397087083;
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 00/16] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Fri,  2 Apr 2021 23:57:48 +0300
Message-Id: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v2:
 - Comment out unsupported video_pll0_out_odd/_even clocks instead of
   removing them or just using .name for them. The clocks are
   unsupported, but mux values are provided for the future reference.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.


