Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D91FC433ED
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D831A6134F
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhEBMVe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 May 2021 08:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhEBMVd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 May 2021 08:21:33 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D393C06138C
        for <linux-clk@vger.kernel.org>; Sun,  2 May 2021 05:20:42 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i24so3191407edy.8
        for <linux-clk@vger.kernel.org>; Sun, 02 May 2021 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erZ/hSW11kcsKCRUIcvxSo7XKXnXb+kosLOsAnmkOzw=;
        b=Ws0bt+uQoQN7Aluocnt+DgdjAWfSG1h6rZbzpSAxR5aUxp0ERuIT1boLotdE10yBnp
         4EUKg2dwLpTeQgubVTT55x3sdt0SeaYtS2LjY8XF2lekkxRECH3bEYn4df3fuXt6ZD9U
         lDcqMe+8FAm1i3rLcz94BlgqcsZo3SHVEugjEearoi8rWtFfFJD4qr+7mWg7K6xwCgVN
         l9cw/b5PQlVgEA9vjRXLQ3y7iYuFllpLa4YvtLKjBoyWBtupQo5FVWt9Q4yqkbQ50Fa5
         zE3P7ViieSoCXZ40h8hAZwN8CXfCO5ZaheEuH0UB5aqOwn953yvxEReaz9nBbHcIVOfm
         Czhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erZ/hSW11kcsKCRUIcvxSo7XKXnXb+kosLOsAnmkOzw=;
        b=nk4lMMrgcR8F9CMHwFSp2K/s78P1C9xjASoVCDwFjJIr9hsa9abaHOAyY+yqFnXbHk
         I5lBhvAKhXboCH5uxiaUG1WA3Z7pYZOos4iSPZLlEgHUgAwVUb3K1FffMZY3ywbsdc+C
         SG7u9Wsq4KcDC3+NZHWCxOPPXukClJZB6DDg+R/jpPUunS75AEmBXNa1c/q95gwxN3nB
         W3Z93XHJKaEL/W08e9RNE/cov+ofmabw7YXb9IdOEL4lHqxsia0zfqtRXK5hiCfoBsDg
         Watsas+SoSmKldTY6tHH/VZM+zybLeKqlYvn+O6LszWelBghEJopvJteFiXRS58vQbNp
         fGtA==
X-Gm-Message-State: AOAM532Yg7ejdZ/1Uw1iP63QfcpN+3tFv+rLSnB8rSrlq8+opa9scZwh
        rrmEsU+Q7EjaMP5e1Nl8c07NXw==
X-Google-Smtp-Source: ABdhPJy/A/Q/5vxcW51k03G3qPNBSej8IUlSSrS7fpXBaxvcyWoUAHUn79q6oRLgARpl0HpzT1BwfA==
X-Received: by 2002:a05:6402:b48:: with SMTP id bx8mr14981979edb.157.1619958040801;
        Sun, 02 May 2021 05:20:40 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id p21sm10064085edw.18.2021.05.02.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:40 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 92da083f;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 0/4] soc: qcom: Add support for MSM8226 RPM
Date:   Sun,  2 May 2021 14:20:23 +0200
Message-Id: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for Resource Power Manager (RPM) and RPM Clock Controller
(RPMCC) in MSM8226 SoC.

Bartosz Dudziak (4):
  dt-bindings: soc: qcom: smd-rpm: Add MSM8226 compatible
  soc: qcom: smd-rpm: Add MSM8226 compatible
  dt-bindings: clock: qcom: rpmcc: Document MSM8226 compatible
  clk: qcom: smd-rpmcc: Add support for MSM8226 rpm clocks

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 74 +++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 4 files changed, 77 insertions(+)

-- 
2.25.1

