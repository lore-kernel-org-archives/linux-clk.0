Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498F5CCA47F
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240823AbiF0UD1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240774AbiF0UDY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:03:24 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEA01A04E
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id q18-20020a9d7c92000000b00616b27cda7cso6554273otn.9
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2m+YjUY0OjFth6xgTNB2uHzcRzoY0ie6eRArFGbQnDU=;
        b=SaZA7N6vdwUKla5aGKenida96tK5DPhUJ47Qr6K6tVy1oCH3rjGheW5qD0oyOYdGSk
         NH5rBzs+fhxxxoF80TD6BTYO1Py0NMxBvAupcp1SKz0TgoWyuoa2d+0wBdrxztp8y0mX
         L09p4J1mqrOxbuKFlFUm7bJA34FPh1NjJx4xE+EL+M1A86WIIW86REaqPdZQb2+34VBT
         mIYUDEiCcPpECRXZ7EoIyq6uTr3Y8I5qiKPCAJJI3T12TbygtErgwJgISRE6q4qk/wNk
         3bFHoLr9J5UR7G4h9UUy5azU4gM45fvgVXJGf4Bj6GjZhtYZST6lYR2YXMnptpFT7CmT
         Qn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2m+YjUY0OjFth6xgTNB2uHzcRzoY0ie6eRArFGbQnDU=;
        b=Ug+6axMID7JFA6fL8UdxCSA22Q5/tXfd4ouh5+THGKjItgZa67Ix9OVtXd80I8hl88
         MwKX0d4Uhtn8x22cBM14hrDHqn9JevZRY2oOkBrWi2ntNZnARTlaEUuM0xBWDW17Q64u
         +i8zXntCV43a8y6V4zr66EYRmTAnN5TPmhh0inORkFTbE7B5ysdRhBRH0qjSGrUNtkJF
         joY06LLtKG3a/G0Ha7zpGwzjYPBBB/sKix2ZdbMxHhkTPyCPiMKqbpM901vll+pnN7Xn
         YOKCU+kHL6f8ndvKu7H1lF8+KR+/W1vDGRnXM7g10i3HbGLAtIzKDN18zRBIZxIotMNj
         1OQQ==
X-Gm-Message-State: AJIora8hi3yi8C5OdmvtaDWwClPTcFQUFX68aYvVbt7jNo0BHbV+S7z/
        ZYNvapCj8U7zUwSFpdTIo/85MA==
X-Google-Smtp-Source: AGRyM1t6CofuMDpSUpV5PxK3z8Lhcfi4pL7TyzbMTvwgi6KHkjY4Jeon20ibFWqJn4VpisoIBauYyw==
X-Received: by 2002:a05:6830:18a:b0:616:905f:98d2 with SMTP id q10-20020a056830018a00b00616905f98d2mr6732151ota.358.1656360203197;
        Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
Date:   Mon, 27 Jun 2022 15:02:43 -0500
Message-Id: <165636016349.3080661.15781429285446238278.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Jun 2022 15:29:21 +0300, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
> 
> 

Applied, thanks!

[5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
      commit: e7c659124c9a031c48e2fecf72c849cb63f9497b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
