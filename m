Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDF8C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 08:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D54619DC
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 08:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCYICN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 04:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhCYIBo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 04:01:44 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D18C06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 01:01:44 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r20so1970795ljk.4
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PSDYKCU4D+h8JAWG/0KCy+Z6v4O298AZODSqQ5XOavM=;
        b=h4V6KsyvVDi4QT3WbcVkyCBZAUbONfsHEC9w3nU+UDYff7dMLQg8Q/RwW7sku4dvHR
         5KKTpoQdCEeRTtyP9Fw0wRMGt+x+dMHSD8p0XABKZLVZIm78GQUn69o47/k9wvNvs/Z+
         nw2km+sZ5d4i5CTN8egPBCJ7dbqmYwG6IBjYcKAAgIaD3xcKaBGH80wENuiLLowVd96D
         /vDgt5FicVarIDwKs3gwzfKkV0w2lsTe4DmQ+/JZTzySitMGu5sEN775Olgshf5cQeIg
         VPs3Dg04HxlnXuLzlkpvJVusaNDy8iBZ9FHuo/xZMe3CA51k3ZYnF25O5qQX8GKlV1oA
         coDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PSDYKCU4D+h8JAWG/0KCy+Z6v4O298AZODSqQ5XOavM=;
        b=MTI02yN3kMlfswWNpTrGzxsfM7jYPTP1yAkpBoIB1mVqAVQGjM1YUj660W08G7PdTB
         gQ6dbos7xM86CtAA3BLLDIUzmzcCpsYil4ULTBo0AGjkxeogsB7eEwBtUFSpHPz41187
         33sfHZbjupEn2IfPPOkgAMWCAUwEYLTr3DjdGRGvA1iIGTnF+4a2zJ70vReBc5+PsHqu
         1a8nWS+6NCo6KsB5IrAi6saS2aSYB/MrkDI1k2Mc7gTHc6vReALTU2qt6WyAdAhs8V2W
         Ndv+qb5U86C98127xXVz0FIy8ZCzJWR9H9MSYK9L4FhVqbZ+9cv6cyoHFnBkMW1vtFjf
         5etA==
X-Gm-Message-State: AOAM5313MWWlTmVuSknk2Yx9KAKK8kxL6IttZV+cr/C54E2kMmbHAiZG
        RWaOGW4RHqjVJrF29rR/JJx5GP1JG6us5odAcD9xDg==
X-Google-Smtp-Source: ABdhPJx7pzd/lddfsXFHXEhbU14wX2WWhV6oZimjfSTlbp5ttPG+hFWdLyno4rJbayYmD/vwou92BtNZUbS0RZW3oBw=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr4562722ljj.467.1616659302610;
 Thu, 25 Mar 2021 01:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
In-Reply-To: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:01:31 +0100
Message-ID: <CACRpkdar4tNTLLd9NFV-nG3kQnq-cLhLDB10EcLyN_Sew+uRAA@mail.gmail.com>
Subject: Re: Scaling back down a shared clock
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 19, 2021 at 4:04 PM Maxime Ripard <maxime@cerno.tech> wrote:

> How could we put some kind of downward pressure on the clock rate to
> make it run at its minimum all the time? It looks like the PM QoS
> framework implements something similar for the bus bandwidth, except
> that it's not really a bus that have this requirement here.

Unsolicited comment: this is similar to what _regulator_do_set_voltage()
is doing with voltages that can be expressed as linear intervals or
selectors (fixed voltage steps) when a consumer calls
regulator_set_voltage().

Yours,
Linus Walleij
