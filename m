Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA600C4332F
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 22:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A95610CF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 22:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240977AbhKIWu5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 17:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345043AbhKIWuF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 17:50:05 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC55C00EB3F
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 14:21:24 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so850445otk.13
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 14:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLsRex488etMkJyCCFaXLtgPzZ6BB/J9dKWw8UO3KF8=;
        b=HiVLib1yZobRnuW7sMIDMYgEiV7yhcNYV53azWFi6aSYW4Hu++8xN0MqgT9ZBTBPe1
         tHfuZJW+x3zpArXVhEztoQURqBgNNAqvkhrpdok2c1CYScgbTEkk3toWbsXGaEsMPhBc
         pobpQ2rMClAZp0i0TvDBo0SZAGTrza1mdUUSgjugkU2oA7tzpHVZSIZWY2OOOlvRabpj
         xPBPjmrQZd9Z6fxEVq7BWnagN67ohxQ3kkVDeE0cZHQkykxoJzisjtym0erskVnhIOYl
         BxQABSwHk0vmOC8j2uq7gypLmELd9QUegVybgm3hF2dKB/JaBQMP0LD29ohzDV3YG8Wz
         hM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLsRex488etMkJyCCFaXLtgPzZ6BB/J9dKWw8UO3KF8=;
        b=uWs1zah+dOeSMhA5a4cfamzicOulp4uyHdfXB3NmW2UNAvwKfcqvrxUiZHZjLSo4VJ
         vvrNVp9FviKKq2XYk6PS7yqXVwyYvNDx3PW3N6HO9qYXTUM3LN+cNg/mRLMccdmxRhEc
         hY+vwdm1MHRk6/5lAGcTlydrX1tS2VAj+TcmjSTg/9/jMhVW7v2NItA6bHaQQXNdFYUg
         l53czAFBjx1k+J5xrXu3TS1LfTlCoSHPii0PdsCAH1rlxTmWzwNLmRMULt6uFNaSGk9H
         WiV1NjHxMiLzBPRj0TpwPRWCopkdchDPs5Ivq+L4QuO0JBKm3p6Qp7d5R4efg/aDNlo8
         Yoyw==
X-Gm-Message-State: AOAM530wgtgK5CQ2wb9AZkb80ono1R78AKGE9X1lt5BKfq6KrxUeP2eV
        UtlYX1gO+IwCQSo/sNgJS1TiF8VjJSA8B+E0IsRnKg==
X-Google-Smtp-Source: ABdhPJxnGCMwPBzOn0vDnUGZChUhsq9PbhUnrHTyTVpdBpkdT5/1fxR/EpRTVr/sEUcMpLzruQlZhgh3IK5H9XIVdOU=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8689832otj.35.1636496484311;
 Tue, 09 Nov 2021 14:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20211109164650.2233507-1-robh@kernel.org> <20211109164650.2233507-3-robh@kernel.org>
In-Reply-To: <20211109164650.2233507-3-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 23:21:12 +0100
Message-ID: <CACRpkdaY9VQcUCNe4ZFKFyRd7HSFh1FX8yOT-AFqjJ6wc56Ehw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: versatile: clk-icst: Ensure clock names are unique
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <Sudeep.Holla@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 9, 2021 at 5:46 PM Rob Herring <robh@kernel.org> wrote:

> Commit 2d3de197a818 ("ARM: dts: arm: Update ICST clock nodes 'reg' and
> node names") moved to using generic node names. That results in trying
> to register multiple clocks with the same name. Fix this by including
> the unit-address in the clock name.
>
> Fixes: 2d3de197a818 ("ARM: dts: arm: Update ICST clock nodes 'reg' and node names")
> Cc: stable@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
