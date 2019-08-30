Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D9AC3A5A4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 21:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECE772377B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 21:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I0AEN2xK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfH3Vej (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 17:34:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43251 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbfH3Veg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 17:34:36 -0400
Received: by mail-io1-f66.google.com with SMTP id u185so13177530iod.10
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2019 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bRs4USZKqbM7XBEpqSlf+cAqUnmhWlYsbxb13NQJujQ=;
        b=I0AEN2xKpIGmcgkXKtx6SFCfbwffnshtQwlmZGZTHXEMrRwTHSroUZNeZHwZKpDjkB
         RP8EJtFJshofOn/0QZyr5+B4W28EsQhTiGx2lJUl1RgCA5q/sFUq1rS8nPS6HqNAofa1
         Nj6xnyfPyXccIvJZ96T74h/vhqDdxOJlw5cEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bRs4USZKqbM7XBEpqSlf+cAqUnmhWlYsbxb13NQJujQ=;
        b=S+/3MrwPRmyb/svr01K3Zm86ZSRAEMVWEIOIXKaB8mA24Yd7rPJBAMiLzjSGNQSST5
         Veg0qnIeIFxhEZCB1qYQnimtkX2abBMmcMK9iJOyKInqJuEK4mRzEg59srKzn11ZGEqh
         dDgIDLKjBC/t1z9XSWnyt6l0hxACnCEt+0GQHrSdwTxQmeCEb2Swr29jyeZQTWJJlo30
         vxfORzr+H2rw0Lmkg6V2fb1eTSc4l2vnJj+R2ehMpe/KzdktMpd5/eQvshsExHPJ/Ert
         qoT7uQtn8TqSSXy1sYQbM3iJxsbsgcanu4jY1j79yBJ2HQ0Ws9YyXS1av4INtyH0VHvB
         EJfQ==
X-Gm-Message-State: APjAAAX2L3LKi66QnFy2qfOkvlmMAHXsxNQ6nryXOHbMj2yukYE24hbD
        G6F+hPfLU5ZVMyr6tGhbGGyNj0HC4wg=
X-Google-Smtp-Source: APXvYqwoGRZElwWUuMmBf3s8Kw0EZxcNisELGunUGFZWcuJgwrL/qukKpGxJqywmnxAws3fdq3gUGQ==
X-Received: by 2002:a02:600c:: with SMTP id i12mr19213210jac.84.1567200875408;
        Fri, 30 Aug 2019 14:34:35 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id 6sm5410191iog.40.2019.08.30.14.34.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 14:34:34 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id u185so13177415iod.10
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2019 14:34:34 -0700 (PDT)
X-Received: by 2002:a6b:cac2:: with SMTP id a185mr4014873iog.142.1567200873979;
 Fri, 30 Aug 2019 14:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190830195142.103564-1-swboyd@chromium.org>
In-Reply-To: <20190830195142.103564-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Aug 2019 14:34:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vr5o-b86588qe--bVZ5YjKVB3gzaoYa6YcqCd9smkxVg@mail.gmail.com>
Message-ID: <CAD=FV=Vr5o-b86588qe--bVZ5YjKVB3gzaoYa6YcqCd9smkxVg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Aug 30, 2019 at 12:51 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some MMC cards fail to enumerate properly when inserted into an MMC slot
> on sdm845 devices. This is because the clk ops for qcom clks round the
> frequency up to the nearest rate instead of down to the nearest rate.
> For example, the MMC driver requests a frequency of 52MHz from
> clk_set_rate() but the qcom implementation for these clks rounds 52MHz
> up to the next supported frequency of 100MHz. The MMC driver could be
> modified to request clk rate ranges but for now we can fix this in the
> clk driver by changing the rounding policy for this clk to be round down
> instead of round up.

Since all the MMC rates are expressed as "maximum" clock rates doing
it like you are doing it now seems sane.


> Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> I suppose we need to do this for all the sdc clks in qcom driver?

Seems like a good idea to me.


>  drivers/clk/qcom/gcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
