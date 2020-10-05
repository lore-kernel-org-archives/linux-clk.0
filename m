Return-Path: <SRS0=hOJu=DM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC8BC4727E
	for <linux-clk@archiver.kernel.org>; Mon,  5 Oct 2020 22:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B4FC2078A
	for <linux-clk@archiver.kernel.org>; Mon,  5 Oct 2020 22:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whkj1phY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgJEW7Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Oct 2020 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJEW7X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Oct 2020 18:59:23 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF70C0613CE
        for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2020 15:59:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id p15so4668373ljj.8
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2020 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RasjbO/aKL6xgHWeTfDO4Z62vB2SneSkIEF2/wi8pU=;
        b=whkj1phYySdBon7CnDUEmBOZ/0aFMH4iuzdzxXQrlukCooJC8YCyB5sjsU4hzII5VE
         jvV0bGnoU4ArFEptzrwTQA4tYpKxrdCSHnyknjRoH4asygTJqTQaFLCGXELxgWm92kSo
         rrIwzybdmh6RzFA+WAijGaQjBd4LC64dHsZcVr+eLMndehAcC2LQmP+H0ES8A90JSSOJ
         SCjqs/+2RLbdIXbBTn3ibyLKerUiHNynDx2CEk+Ut2gJb6HkbXdscitVUUlDcX6Oloq0
         VZ15/uMjQ6od6QR7aNQo2UNG4G8LE+Sf8svm0wE47nmq6Cv5dYuvUBGWtk2DsksUCJmj
         JZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RasjbO/aKL6xgHWeTfDO4Z62vB2SneSkIEF2/wi8pU=;
        b=bUEWIZnh625oe/bH1nW49uz78uqArfTfg3gqrMu17OlanBd02evEdv9xsxaeKKWIpb
         s/aCtQ2He2CrZqOsF5JuojM4s7nSxqXuF6bWipX8Y2QzrW/xynaDxC1iY1T7KKRrzYLk
         0biVRSbkfIoDm2wtz2DBzcMgrNKsms8Cpo7mTn6ulZOzj8SN8L2zkaHs7GadeSOQqEwI
         slTgv0fc+395x7NwUzoNdKPnWU7YTCvuwNJjj/Fympuk4pbZzKkwAX1qws9QONL8cehZ
         cpFBNNEO9qG4xYA+NdFJqKxicJJFxW6dIitOOs+bWY115NAPO0cVD1wum6dWU0Xfr/Lo
         H/Eg==
X-Gm-Message-State: AOAM530YUE+Z1yqh1oSZOxqgH/lJ8hIkwtZqR9ow3wIXpEJAP9RvBeSv
        b/Zk3NHz4MsY/DeUs/HOgC8YFg==
X-Google-Smtp-Source: ABdhPJzMqwVqhWMjmTzL/sA2ceLh7lj7NhlAzV1bg48rIU9irVM3XDrI79l7ijRYojZaxg4YJVgFSw==
X-Received: by 2002:a2e:b167:: with SMTP id a7mr644524ljm.359.1601938760189;
        Mon, 05 Oct 2020 15:59:20 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id x4sm353831ljc.80.2020.10.05.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:59:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 0/3] clk: qcom: handle power domains supplies for GDSC
Date:   Tue,  6 Oct 2020 01:59:11 +0300
Message-Id: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 MDSS_GDSC (and the rest of display clock controller) is
supplied power by MMCX power domain. Handle this link in GDSC code by
binding the power domain in dts file.

This patchset depends on [1]

Changes since RFC:
 - Fix naming of gdsc_supply_on/gdsc_supply_off functions
 - Fix detaching of solo gdsc's power domain in error handling code
 - Drop the dts patch, as respective display nodes are still not
   submitted to the mailing list.

[1] https://lore.kernel.org/linux-arm-msm/20200927190653.13876-1-jonathan@marek.ca/


