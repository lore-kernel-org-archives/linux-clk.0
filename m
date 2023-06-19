Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A991FEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 08:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjFSIcJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjFSIcI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 04:32:08 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090EEC9
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 01:32:07 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso7892905e9.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687163525; x=1689755525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKgLxFNe6Vqer27h+wDKJ38s4aUcdV6KAPk/ux2OGzM=;
        b=isa+VCyPRBW3qNrZPJExkSh+lO23Q8qPTzQ5U8b6qLj0CqlJi+dNX7oXhQHcTgN7+0
         0WKkQUalhafgEitjWIhmDhWX2KG8SXN4S1bXpXytq9ibpi94NP5k3Cvrw79HRRnbzInJ
         t4k1u+sEfFCPdRFmH0JZ6N4bWl19s3SOT/g5GVDa5t/eDDWDlV7oQfxfdnIEdgtkKaks
         zSJvhsxgNDsRmo+fPXIQuFr6VqBE6pokBVHZr086RXQQA5P88+OBqRFJiPaHvYRvyXrY
         KHjeLvlMdjmi2jeqbxL1aQf2VukxyV+IeBxCCnUYeZTJCK9b48Qf9zpF0l9JgYj2sPI2
         Er/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163525; x=1689755525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKgLxFNe6Vqer27h+wDKJ38s4aUcdV6KAPk/ux2OGzM=;
        b=Rii5AoKX9KoBEohBinduvO3TTbk5O7ufGq439UyBqWoWM4W04OhvpIlY0iG+KNIywU
         Ip75pVyiUtCLzkR94IisE1CPfJ2Xl+9/3ekXVfDu0VwwW0/dEYnHMGFKaLyY+JLxOmg9
         8y3+QjDYcT6Ac6ZXIVOxgwYOeaHsHt1YWHhz7qG8VbGPHpkMsX2wbMakgoNht6UTtaip
         sFbBmNJLbciBbNSxtoxECPQTwiOT1Iogn8+nZqWyqg2fky3tTuZs3HQgDSzGV1nvUQfS
         5fabMIELWJC4aEbHuOgywIBr9bUSsl6olfrFpKs4hN7LnZTe0OJfPS1dZgqdPVPHxeWz
         yTHg==
X-Gm-Message-State: AC+VfDwnq9GIOKXlWI1vwuahhh4xZBhZqozeczpgQqKHif3Mi51kMFzf
        xmaj0TyJudqKiu6W85/JY9qUQg==
X-Google-Smtp-Source: ACHHUZ5dfrlTzQZaKtkSsJqn5n2OOWZI5AIm3s7kGaM1LXA0sGsO4oPrV7FqHvnbGydobk6ik4WaBA==
X-Received: by 2002:a1c:e914:0:b0:3f8:facf:7626 with SMTP id q20-20020a1ce914000000b003f8facf7626mr5530793wmc.20.1687163525549;
        Mon, 19 Jun 2023 01:32:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z25-20020a7bc7d9000000b003f8fac0ad4bsm8634301wmk.17.2023.06.19.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:32:04 -0700 (PDT)
Date:   Mon, 19 Jun 2023 11:32:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Fei Shao <fshao@chromium.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: clk: Fix memory leak in devm_clk_notifier_register()
Message-ID: <56998d04-7f09-4982-b0f1-20ef917aa524@kadam.mountain>
References: <20230617160901.1.I2b151cdf7a72d9e3ecc7ab2ff38409ebe6d65d6b@changeid>
 <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
 <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
 <8366a35f-bc2c-4aee-b2bb-5fc9b2a7072b@kadam.mountain>
 <ea5c0b0b-7aa5-d4eb-def9-fa279d69cd44@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea5c0b0b-7aa5-d4eb-def9-fa279d69cd44@web.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 09:42:37AM +0200, Markus Elfring wrote:
> > He doesn't have a very accurate perspective
> > of what is important and what is not important.
> 
> I offered various hints for desirable change possibilities.
> The change acceptance might evolve in more constructive ways, doesn't it?

No, I'm sorry, it's not constructive at all.  You're just creating noise
when we should be looking at if the patch is correct and how we can
improve our QC infrastructure to prevent bugs like this in the future.

regards,
dan carpenter
