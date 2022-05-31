Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7582DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 31 May 2022 22:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347649AbiEaWvX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 May 2022 18:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345178AbiEaWvW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 May 2022 18:51:22 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3916CA006D
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 15:51:21 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s68so138336pgs.10
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ObltlVOkUE2OJx3EUGLxpwIeNHmLofE/Hbbs9yC2dVI=;
        b=Srv1f/KQO53oV2Tdw4Dlb/nPN3mc/93OBmsbGIWKG20D9iH/qqIWPLhb2EuaUZtJRi
         e8CKPb8b7fsheC3U2bWW3MVBsov/GIJalDF/qPgYQOu7L9A8yrYZpfWVA3mNwS7wl6cn
         PfWQykclGNYr8vAYQ1yIvaYi5YwBVJJQvU8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ObltlVOkUE2OJx3EUGLxpwIeNHmLofE/Hbbs9yC2dVI=;
        b=gOms6R1pjOko1u1T8a2ieWgIzEKY0wieBe22HG9EPoPm8ggL1byTzH2qMzAx3pwS9M
         7qLaihQwtPN0U/fdO1V6mYzZ5Z0UV30W5IWiL+amYQY58JrSWskwb4TXVO62BEcH5NC4
         PRdkW9Oma8MbGKumglsL0fmtbRKGQRRZ2Z/aKwCVDo2D7x99zmPYfZWcAjqjnC2kLvOc
         1c3WW77mU6yqaOMQcFYzQZApsG9jeq7PC4xG+rB5oMVtf2Vmon0JbCVNjus2FRKHsAqW
         JRVOaSw7WIr4JfJQV/YJLQ238lb9l4fdeqJaPrlg21FkpKozSZzwoG0vy/wEiPDaL0mr
         bF0g==
X-Gm-Message-State: AOAM530AH8ypRo9xp+uXYA+TqqBCsYU6hw4EIRl/UHTqFUS3fzXHG1VA
        rI1eI1S9K3rg4VNCUEIyzSy4Fw==
X-Google-Smtp-Source: ABdhPJxsuSwLjSCmKCwHbwK6CS4COgLya/whNqnIb0LrGO6Da9iL3ujpmNVaCDeyUb3R7xd8Vt67QQ==
X-Received: by 2002:a05:6a02:19b:b0:3fa:3e63:15fb with SMTP id bj27-20020a056a02019b00b003fa3e6315fbmr40523358pgb.129.1654037480826;
        Tue, 31 May 2022 15:51:20 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e69e:f483:e751:7c7c])
        by smtp.gmail.com with UTF8SMTPSA id i33-20020a632221000000b003fc5b1db26fsm2040797pgi.52.2022.05.31.15.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 15:51:20 -0700 (PDT)
Date:   Tue, 31 May 2022 15:51:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?utf-8?B?wqA=?= <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: lpass: Add support for resets &
 external mclk for SC7280
Message-ID: <Ypab50H+Y9W9XnnU@google.com>
References: <20220526042601.32064-1-quic_tdas@quicinc.com>
 <20220526042601.32064-4-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220526042601.32064-4-quic_tdas@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 26, 2022 at 09:56:01AM +0530, Taniya Das wrote:
> The clock gating control for TX/RX/WSA core bus clocks would be required
> to be reset(moved from hardware control) from audio core driver. Thus
> add the support for the reset clocks.
> 
> Also add the external mclk to interface external MI2S.
> 
> Fixes: 2b75e142523e ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280").

This commit doesn't exist either:

git show 2b75e142523e
fatal: ambiguous argument '2b75e142523e': unknown revision or path not in the working tree.

You probably mean:

a9dd26639d05 clk: qcom: lpass: Add support for LPASS clock controller for SC7280

It seems you got these commit ids from a downstream branch, instead of an
upstream/maintainer branch.
