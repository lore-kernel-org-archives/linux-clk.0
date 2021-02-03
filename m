Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622DAC433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2054564F72
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 11:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbhBCLyp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbhBCLyp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 06:54:45 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD97EC0613ED
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 03:53:58 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id u14so4916702wmq.4
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo0qUtEXwSXsNazm8VbU9AtoskXI0qGiMJnfOg8ptAo=;
        b=rlPyJYCBTV93jFKiD/Ra6ZUEO9bw6iirwMBSocPpOjX5N2eWcc6ikX2lVooU7OKTUe
         tCU97ObrYYeKpsbXLBpjEO4c+Z77ac3tmF11G2J7yGEIw9WKIB5+H4hU1CqBFO24uU+R
         IGlMqwVcB5jHKNlUi15VmP6CTe8KCqTo+8TzP+jxK/C+ivpgQWqyYcsJkK11+9Jo/7s4
         /KYBRzxjqNZFJKDtTipcC6WHnY0hGeHRRcMvfYNBrrZw4jXKuTrF4tMFAtKceDDsiIkC
         oELqqCvwWMtD3INhV2WRYAce1jTO2wjJSqlJ20Xnwj4ZGPbJ+valT4S+Tj5Fc9YxWUiB
         v4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo0qUtEXwSXsNazm8VbU9AtoskXI0qGiMJnfOg8ptAo=;
        b=GW2ZuYy/U8luw02sa15wg167v87K+xNfYBmICUHLYOU5prwhze1NHZrysMeuDg7t5g
         APpH/twaxQH8SPLSUEkreoqraMEnVm/sNFOwxnVWS2GUFKlznonViDj7dTocUYEYuraT
         GIl8A+IBXWaMKQAwhrS9jwzvThqT0JAv9tDH2bvcXK63AUy0wZJKWOEOXbieDemgHNak
         z1rMpTK1z1YIh7b6xTxAe6whSA8tT+YYObxNC92FEOXijr5xYZyNF49gF7pALRn2sJRs
         nWqTUMOJfGIB38LXph9//mZ1MPwi+qKi0PjtEA8UxK8GiAYa5lnnGvin/E478GRFn0Kp
         TTFA==
X-Gm-Message-State: AOAM532BRfN+EGWO8QwLje32DaX52TjRh8hDVpUW7pPMZTgGOBLY8ixN
        e6Xx0bIySC2iAjU1RWAB2i1W5QY1qdeVdQ==
X-Google-Smtp-Source: ABdhPJw4sbMauQGn8omPbihaAwGhxycoQiMypZCyEy/b4DM9GQEYUjV3aco4IM36sxgl9kPiiU9s/Q==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id g11mr2384923wmq.71.1612353237301;
        Wed, 03 Feb 2021 03:53:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:53:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
Date:   Wed,  3 Feb 2021 11:54:52 +0000
Message-Id: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

- Adds some missing indices to the videocc index
- Adds videocc clock tree hirearchy for msv0
- Adds a regulator to power the videocc consistent with downstream

Once done we can move on to enabling these clocks in the DTS and switch on
the venus.

Bryan O'Donoghue (4):
  dt-bindings: clock: Add missing SM8250 videoc clock indices
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
  clk: qcom: videocc: Add gdsc mmcx-reg supply hook

 drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
 2 files changed, 41 insertions(+)

-- 
2.29.2

