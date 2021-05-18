Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDC4C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F17B2611AD
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240826AbhERHjH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 03:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbhERHjG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 03:39:06 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32FDC061756
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:37:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id n2so9096115wrm.0
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=n5szVkmDytzCFFysXlMeXwZdOmvmm3DgEonzhUe+NZs=;
        b=E9wXKYF6dL0El8ZNRN65Z6CmACcbkRqJR3ZdX8ValaoldrM/XVIlDGsbcVc9xM+eIL
         qNvdHiv/6JBpkiFlAvlqvlZn1/nKz9+JP/QfDvqQSCqcgZ5rUSU+0wE0TH4SYRoHgMPJ
         bQE4TSBPniexesWLhEm+mpLR0LM1++5YwBNGa6bNyk073bQxgjhIllLpWRoHNFGNeggN
         zhjsU/phSkKoOOTRiq26uymQ1N5S2qjEtjSxxpX+nQRoEHt924OgQe2pz8DSg/mi8cDO
         wizZ6nWKkVlz19TbhpglLLQK9n3n+Jf82tptgiaIrqEAzsVBoITATd61rVnfLIr40eGe
         4rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=n5szVkmDytzCFFysXlMeXwZdOmvmm3DgEonzhUe+NZs=;
        b=MyxBkmDepUs5V0Fy8JAVaSvgRxU00CSZ32TCcGaZC8dIkXoDx/eoCACd550Wto+p/4
         K/uHZGmmFM4uuqPU3xHeFZJ+Ab04B2UFbg4j68xUL2zrTjEABYBUgrle5kxmgWxXtPkZ
         h5R8+wFwE9WgZw6Paacs17a4KNfL44VkLMwjckS36Y3DlEhr+iwDYm4+CNeQ4TqnSd+6
         n9P2TqYDLzfB1LqMjG6wb+4voTMKRmqq01y67SIeT9+/Nhy024uYaL+06PIqs5MhCReQ
         mYmJJPeoC68slsNNa1KE3uJIQRkTMoBGXcXIUxjuMFGLA3jkCjv399tcTgoSvC79NWv5
         wwDg==
X-Gm-Message-State: AOAM532PWRzaK8FOYbaM1kQwNfifqjI3IkQyQPW4Do+AWj4zaGl1CGo7
        Mljg+UqsgLQTqbzR0BMjiPCBbQ==
X-Google-Smtp-Source: ABdhPJxPm4kXQ/GUstw9/tmCmcx/mApmQsELG0ZEwn97QcrRxaG2c/FQ3PsX076/9/osBLg+SZV2eQ==
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr5049978wrw.71.1621323467412;
        Tue, 18 May 2021 00:37:47 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id p6sm5037371wma.4.2021.05.18.00.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 00:37:47 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     khilman@baylibre.com, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 0/3] clk: meson: rounding for fast clocks on
 32-bit SoCs
In-reply-to: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 18 May 2021 09:37:46 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> up to approx. 3GHz.
> This however causes a problem, because these rates require BIT(31) to
> be usable. Unfortunately this is not the case with clk_ops.round_rate
> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
>
> clk_ops.determine_rate does not suffer from this limitation. It uses
> an int to signal any errors and can then take all availble 32 bits for
> the clock rate.
>
> I am sending this as RFC to start a discussion whether:
> - this is a good way to solve it?

.determine_rate() was meant to replace .round_rate() so I guess it is
good to do it :)

> - what are the alternatives?

I don't see any ATM. Even with determine_rate(), 4.29GHz limitation
seems a bit low nowadays. In AML SoC, most PLLs should be able to reach
6GHz ... hopefully we won't need that on the 32bits variant ;)

> - getting some feedback on areas that need to be improved
>
>
> As always: any feedback is welcome!
>

Overall, looks good to me.

>
> Thank you!
> Martin
>
>
> Martin Blumenstingl (3):
>   clk: divider: Add re-usable determine_rate implementations
>   clk: meson: regmap: switch to determine_rate for the dividers
>   clk: meson: pll: switch to determine_rate for the PLL ops
>
>  drivers/clk/clk-divider.c      | 39 +++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/clk-pll.c    | 26 +++++++++++++----------
>  drivers/clk/meson/clk-regmap.c | 19 ++++++++---------
>  include/linux/clk-provider.h   |  6 ++++++
>  4 files changed, 68 insertions(+), 22 deletions(-)

