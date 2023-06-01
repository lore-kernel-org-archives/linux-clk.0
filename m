Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB812C7EE23
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 21:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbjFAV5y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 17:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjFAV5x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 17:57:53 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C259F18C
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 14:57:52 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5556e2bddf9so794050eaf.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685656672; x=1688248672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruzONHVQNNLn5cbL5oGqVupApwre43YqM07fYPN5vjI=;
        b=xJ3xHiRVsz8R7jMctT41qJPcKiBMuq002UN7r9mY5OoIHL4nk4TNU9bO882krVSeYl
         F+LcWIkkh8dut/CrRkIeYQNJv6Ztxuc0L2yqyg4BJkzX/oLWAjHj8uUVy2NMG38qcZHc
         gC/em/1iWrZyeWApUBNlPAkCo7rQzXVHwMr/25D/rcQHwBuJfqUlvl4MeK/Hpv3W5dRW
         70yYkXlrOJMMOozJJKV0N9A775LDDzO0Gx7E/gUu6vBu7eExVkS/OZkNP5tdatwIjnaY
         ZHjT+b0sxqybeL48s/zonqK9gyu1fGwFq+/ETOHCM407OJwxK06Qr+TFUBzsrmmQNnRj
         EfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685656672; x=1688248672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruzONHVQNNLn5cbL5oGqVupApwre43YqM07fYPN5vjI=;
        b=ioCi5/yh1dVFiFR1fXmymKvR1DZE7V6DKajPytVngWlXHNDfoOyVKwoLhUrxE4GRJ0
         mKj3ESPZZ8LA3bv7PiZBBm1Ci/7VdSeGMKRFsjDThHtqIxS4FdgtJTHtaAvkspiYNe3V
         v1AEaEz72/nTeY5R6djr5Kh3BeGPBobc0p+pM2JwRLIFzbQFp3Qx1timnajTCqvV7suH
         K+TE/kVEVYC7c8DsQDZJPd1uIxUjs8ICp9j79FMIRmmIs/nveN6BRIHtX1b9UTqXLgrE
         7JBLmIKRgSr2pjOhCIcySbnVww/rma7WETAywz0jchgpXNtkNlyPJ7Hl/c90WTBVEaS6
         AnnQ==
X-Gm-Message-State: AC+VfDz0wlxcYmT8KD5ol/3Z3hpOGsE8RB6JNdPyHWkXJhgKeQU6zRQ+
        2+Tb73kaSliFQ8CsSTyY5qO/VGjE9YQ4Pvz6s799aw==
X-Google-Smtp-Source: ACHHUZ56tRKln5Zko0KXJAcfvYlxi6GxnyaGVCrS/sW2jiWiCLzSvzQWu0NgIDvAnsayfumJnSDtE29yp2/8bVVKkD8=
X-Received: by 2002:a05:6358:3408:b0:123:896:851e with SMTP id
 h8-20020a056358340800b001230896851emr4756088rwd.12.1685656671940; Thu, 01 Jun
 2023 14:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213416.3373599-1-arnd@kernel.org>
In-Reply-To: <20230601213416.3373599-1-arnd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Jun 2023 00:57:40 +0300
Message-ID: <CAA8EJpqRUf2bp1SxyvKg9t+1AM9gqd_6JHq8LAp=6Dd32+h2rA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: remove duplicate initializers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Mantas Pucka <mantas@8devices.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 2 Jun 2023 at 00:34, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A recent change added new initializers for .config_ctl_val and
> .config_ctl_hi_val but left the old values in place:
>
> drivers/clk/qcom/gcc-ipq6018.c:4155:27: error: initialized field overwritten [-Werror=override-init]
>  4155 |         .config_ctl_val = 0x240d4828,
>       |                           ^~~~~~~~~~
> drivers/clk/qcom/gcc-ipq6018.c:4156:30: error: initialized field overwritten [-Werror=override-init]
>  4156 |         .config_ctl_hi_val = 0x6,
>       |                              ^~~
>
> Remove the unused ones now to avoid confusion.
>
> Fixes: f4f0c8acee0e4 ("clk: qcom: gcc-ipq6018: update UBI32 PLL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
