Return-Path: <SRS0=JZ/x=BW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DA8C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 12 Aug 2020 13:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10951206B2
	for <linux-clk@archiver.kernel.org>; Wed, 12 Aug 2020 13:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N+kSkmDi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgHLNwX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Aug 2020 09:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgHLNwU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Aug 2020 09:52:20 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21939C061384
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2020 06:52:20 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y8so1107498vsq.8
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2020 06:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8InXO4IHlwCJ/3LHKr2wC5cvoqCeqc4wxbX8rXjUiPg=;
        b=N+kSkmDigJZm9bdYj2CCq6cRuTJusMts4MyrYLhaepzh1SFeONS44pX8HelNsXmkpt
         Sar1XiJvk4yffabWSLuwN6z7snQ+dFjiNxSHvBEnAwmsfgNATsdM1HHNgVZ0t9hUvslm
         ipOuT2PSmwUT1HfAGS8oOlizyFM9mh0PMN6DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8InXO4IHlwCJ/3LHKr2wC5cvoqCeqc4wxbX8rXjUiPg=;
        b=eiQN7SEiByoMKNIkcnqtHkXpTtChsqo3uBFrVAzRnOiMln3JegmS5ocJ/r4RaKC4Sl
         iCqHsxxyxLY3R/oGdHYLvvE5dy0K5v86CpK7XbMy1KnXSI+rXVAd8a1CbBQV7wb5wvrh
         Z0f1FVBHmqS4Ci9+5isdnt0VK4QRrUI5zz/YwKssJxqJlE2BKQSTAnpMC0q45f8u/L2G
         KLlLHCPJfu3B0I2kVeWQUO9JSs9ODETdTTtGtoRgHzzKfz1TN8h3M0WbT773bLSe3kdY
         08+z1cy3q+rmUS7H5NdOcc/PNlbpvfceGaUXwMezHq88yxiRSOiQ3fUTtDp6KI9DqCLt
         uALQ==
X-Gm-Message-State: AOAM531C+Nee7Oso/gTk83X+eGr4u7QBlMA3cY7b7h6u5NbepTM8IsVu
        tgStNilG3szYNVwAIo/z15BJkIehTnM=
X-Google-Smtp-Source: ABdhPJx4q+FmEAiXZv9DWpIS/aKG3lFomAkkRL+DAKIE6sW47wQIeYtapjSaTJkaX+R8nCNwpIc5Jw==
X-Received: by 2002:a67:5ec2:: with SMTP id s185mr51550vsb.167.1597240338783;
        Wed, 12 Aug 2020 06:52:18 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id t21sm227863uar.17.2020.08.12.06.52.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id x17so624101uao.5
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
X-Received: by 2002:ab0:3114:: with SMTP id e20mr27858800ual.104.1597240337098;
 Wed, 12 Aug 2020 06:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200215021232.1149-1-mdtipton@codeaurora.org> <158378825407.66766.14135857856613969751@swboyd.mtv.corp.google.com>
In-Reply-To: <158378825407.66766.14135857856613969751@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Aug 2020 06:52:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsD7w9oqbUUKJwWSRsfZ9qTLy9KyNp8i+BShi7S-R92w@mail.gmail.com>
Message-ID: <CAD=FV=WsD7w9oqbUUKJwWSRsfZ9qTLy9KyNp8i+BShi7S-R92w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Wait for completion when enabling clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc:     Mike Tipton <mdtipton@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Mon, Mar 9, 2020 at 2:11 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Mike Tipton (2020-02-14 18:12:32)
> > The current implementation always uses rpmh_write_async, which doesn't
> > wait for completion. That's fine for disable requests since there's no
> > immediate need for the clocks and they can be disabled in the
> > background. However, for enable requests we need to ensure the clocks
> > are actually enabled before returning to the client. Otherwise, clients
> > can end up accessing their HW before the necessary clocks are enabled,
> > which can lead to bus errors.
> >
> > Use the synchronous version of this API (rpmh_write) for enable requests
> > in the active set to ensure completion.
> >
> > Completion isn't required for sleep/wake sets, since they don't take
> > effect until after we enter sleep. All rpmh requests are automatically
> > flushed prior to entering sleep.
> >
> > Fixes: 9c7e47025a6b ("clk: qcom: clk-rpmh: Add QCOM RPMh clock driver")
> > Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> > ---
>
> Applied to clk-next but I squashed in some changes to make it easier for
> me to read.

This landed upstream as commit dad4e7fda4bd ("clk: qcom: clk-rpmh:
Wait for completion when enabling clocks") but seemed to have missed
stable.  Can stable pick it up?  It has a Fixes tag so presumably it
should be easy to track down where it needs to go.

Thanks!

-Doug
