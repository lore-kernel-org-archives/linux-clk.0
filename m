Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD390C43461
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 18:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AA8220936
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 18:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Me3fWKlB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgIPSx2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbgIPSIm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Sep 2020 14:08:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A893C025268
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 05:16:19 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id r7so9986211ejs.11
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2020 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wkEKY9veHTwPibIHFpbD04kPDOQlB3REzNn2vqHPLEE=;
        b=Me3fWKlBz/bqv1qyH6RCJiLuuY/IJw7XNFXLrVrwKYKHruhMxmGWqHk9uy41rfgEVY
         LZqjwAG/jqihFG/PL/OHw5RvGAFiWrp4Hy/kLOSYPdzzZrN7Vcygd82ikdCqFLFyRcCr
         CCaE+kAbk3zaBPabqbIojCrQ5S54k+tX8KPbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkEKY9veHTwPibIHFpbD04kPDOQlB3REzNn2vqHPLEE=;
        b=S7o02v3lfvhJRHAlAdQEmG9qpgRS46TfWkb+zvDhwR2fX83/4XKN9Van/wYRePQGje
         qz6TPAaczViTsUp3CzQerOf3pUXSzbtu+Rz/dTj6Sgn0nsyzW/2iFOdOVKonVW3QUOTO
         CfMviyqzyNWmnFx5ttu7+R8tuiSY5GisLncJyjS9X5w4ZE0eVuVprSimzs9T8w5YQ5dE
         aiwTJa8KOlGdj9OhA5rorIo0e+EtVLjk6NMsJWjYp6G6UgTp58UqYLqR6geUkXi5GqM2
         8qN4x6Kca4HgyrYRWlPH4GkwNe+p/HltKheL1vVy03gSgolr1sHJrWAthi1/Yd0hB8QC
         I3HQ==
X-Gm-Message-State: AOAM533pjR8gu2zfYgr1Wdb+k76iJtPoF0bd7tGrk6zb9HtOz6Ee2w0E
        4X3ygFitdNYpcmr+kiMTqw76Md89T67aJmgUcbyiCw==
X-Google-Smtp-Source: ABdhPJyA99M6JuluYGiUPYdhAAyel9XALtRQxBmx8btvP1d+cDssH7Igzx6HlNtOGtIsFZ4JDWuY/U+IkJrWfmIyos8=
X-Received: by 2002:a17:906:46d5:: with SMTP id k21mr24564281ejs.247.1600258577984;
 Wed, 16 Sep 2020 05:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200831161436.134186-1-jagan@amarulasolutions.com>
 <6d3de17f-1922-e565-6a6d-b11b2f4be04b@rock-chips.com> <8e9567e3-cb75-7d74-1e50-728658a1b0e0@rock-chips.com>
In-Reply-To: <8e9567e3-cb75-7d74-1e50-728658a1b0e0@rock-chips.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 16 Sep 2020 17:46:06 +0530
Message-ID: <CAMty3ZAtZr_OoEVQxP-YdqLeT4SUbz6BqBGd9fZmrsVROS+xxw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fix overflow rate during fractional approximation
To:     "elaine.zhang" <zhangqing@rock-chips.com>
Cc:     Finley Xiao <finley.xiao@rock-chips.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Sep 15, 2020 at 7:10 AM elaine.zhang <zhangqing@rock-chips.com> wrote:
>
> hi,
>
> We have two submissions which I hope will be helpful to you.
>
> https://patchwork.kernel.org/patch/11272465/
> https://patchwork.kernel.org/patch/11272471/

I can see this, I have reconstructed the fractional divider handling
for px30 instead of all rockchiip platforms, is it okay to send
px30-alone fractional div handling support?


>
>
> A few more notes:
> 1. DCLK does not recommend the use of fractional frequency divider.
> Generally, DCLK will monopolize a PLL, and the relationship between DCLK
> frequency and PLL frequency is 1:1.
> 2, half-div, not all SOC support, detailed need to see TRM.

Can you point me the Page number on TRM?

Jagan.
