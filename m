Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2876C32772
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 17:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiHWRm6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 13:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiHWRmf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 13:42:35 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5DE9D66B
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 08:37:17 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v12-20020a9d7d0c000000b00638e210c995so10003019otn.13
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=v31+jjDAe8b8bSeB3m7vjA69108ZFOl1IwaE1C9+p6g=;
        b=ehS+dPduFec0TYms+eKA7qJx5obDw3y+LyCRyq+Ru6CDFRO9kkTL+5xanQd7oqRdiG
         rfEPeHr4mHdBWzi7mplNImhxtTIhIoMKT4DZLWbu04u5YQ+HwsNb3VwbdbeceUIyK4SP
         HwIxxp0MbVCJSlzH3nF5cNt8u5+NZ7V5aNiaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=v31+jjDAe8b8bSeB3m7vjA69108ZFOl1IwaE1C9+p6g=;
        b=kJCaP7Q3p6ciVdwtGy4yY2/iAawfLqTAuF+orR8bUOKB9ZjGvfNSu5mRa5KlSwFPp4
         bNM19MnGzblfKxO6lxvldI4Fzf54M38GWh/xCwjUsYN7uVrkMV6NPZb8us5CboCE8EmC
         UepjCqHsggo/WGWYJCAWU+QgN5b+bVo3LInomx693IBpP2UkZxYMiUdm9KzBZPU2ZtE8
         hPIyUlpRaXMcDhn8IK6cyyC8c5fe0e1+orwxC/efpnh5sGjniGzOaYzj2jz9xxv8Wsvx
         /ebxGoD8ZrKyU0BUCY7zG+0gwzarY5sJ+nMr61U8kpn+bkAsqzPT4m7ELt9b/jr8wbTx
         9pRw==
X-Gm-Message-State: ACgBeo0Kb3XLNNRsZBy3I/iMNh5gDrbr1lmmi/zeEbFdDKioL7/2sE9K
        z29uKuVVtcWp55gisn+GvoJae0/CsLKzWEffjI1IZv83Z+0=
X-Google-Smtp-Source: AA6agR7oXCZFuTC7Lzxlb4CwuONinxB3CRhuL08aLXINitOJmy/axmk0nwSsMf7iBwFXey4c13CPaDhDmRFCPlSAl6I=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9407094otk.73.1661269036462; Tue, 23
 Aug 2022 08:37:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 10:37:15 -0500
MIME-Version: 1.0
In-Reply-To: <1661245527-5596-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1661245527-5596-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 23 Aug 2022 10:37:15 -0500
Message-ID: <CAE-0n50g9UUH9Jyy1_CGKLbXd096waP_Y4kPJiFmfqBaKMhG5w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: lpass: Fix the invalid index errors seen at bootup
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Satya Priya (2022-08-23 02:05:27)
> After support for resets is added, qcom_cc_really_probe()
> would be called twice for the same cc which causes
> invalid index errors in qcom_clk_hw_get().
>
> qcom_cc_clk_hw_get: invalid index 5
> qcom_cc_clk_hw_get: invalid index 6
> qcom_cc_clk_hw_get: invalid index 7
>
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> This patch depends on [1]
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=667984

Why not resend the series and squash this patch into it?
