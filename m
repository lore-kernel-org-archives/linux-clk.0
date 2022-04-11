Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8983FC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 08:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbiDKIis (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 04:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiDKIir (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 04:38:47 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498D83CA58
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 01:36:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t1so4164224wra.4
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=bQk4CSXCvxodfbzwB8mGoUwybmZ5jCU30b79Cr4ncpo=;
        b=Bkzs2EHUoAt9FUIbbCl+CWcKQNhFujwYKw+VPO71yGgP76vM8SoU760ZqyEscxtDHX
         /Wdj8HYUnOWrIQAJecyoRIOuHF1M6wkREhd9z9I4QqVUIlnqJERgTKFBD17ilXuVcpfP
         HAbdymSsTlrmHHvFgdI/IWjabpAt84oDE/P2dW53BbKjR6zwAhiTFadijcjlsuo2xTuu
         I+rOZv9x1YuJ2zzng2Axi0+a9hESIjiShcgjTeiy9U4VAFltRXYnEsOJermd3i9cxPUx
         nUyKI1bOiyh7qfJnEuMpny8T/NlFNCvGyz3Xzi5l4R9DINX/PU7RcjJRBPNTL2JyOJDa
         DdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=bQk4CSXCvxodfbzwB8mGoUwybmZ5jCU30b79Cr4ncpo=;
        b=SGOy5LD0QnTx4I2ueQtNvSWPD0P+JnEsFf2BPXxYsh7DrLfpFGhUJAB6malW0/FbRG
         JuvKL5cD0WfgYwo9UL/VuATPYfF5MtUzwEQP7CS6R+EPXa0g7C0mLKMZ97rlv0k7BuZe
         yj7j12mZyGJ0A//9ak9I7fhmnQbb6fICdJg7a0bpZHafPgSD2PqumuTPJewjVTiHz2eY
         qo0tPVdnEJU9IEZMwUg0/xuX9hiAVvqjJMc1n61sQHvXqcZWgzPPefvwdQ66P/t3yHeB
         E/NE0Ik3kwFUNrnesxZxUV8Bq4Cc3Xxy13G9AkLDupHUfQkWr5FVk67AznXJBGHwMQnj
         RoqA==
X-Gm-Message-State: AOAM5329iCg4t9rQFIcdEqaQVxklyec7ZrnvJugfQQHDisDyQ6xLk3eT
        QcoQp6YrYo67Jry6gIqrEfkZfQ==
X-Google-Smtp-Source: ABdhPJx2hJ0WGgSSBkrd1paqaTROOhfsqN4pOFjz1KqJOwY9XO0qpnXZ5QHpy7B5NcSy1DfRajqOig==
X-Received: by 2002:a05:6000:1a8d:b0:204:39fa:d21c with SMTP id f13-20020a0560001a8d00b0020439fad21cmr23593807wry.9.1649666191704;
        Mon, 11 Apr 2022 01:36:31 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b0038cc9aac1a3sm18656708wmq.23.2022.04.11.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 01:36:31 -0700 (PDT)
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
 <20220408125526.ykk5ktix52mnwvh2@houat>
 <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
 <20220408153625.ugodcmfwtanr75gu@houat>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Date:   Mon, 11 Apr 2022 10:20:51 +0200
In-reply-to: <20220408153625.ugodcmfwtanr75gu@houat>
Message-ID: <1jczhoauen.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 08 Apr 2022 at 17:36, Maxime Ripard <maxime@cerno.tech> wrote:

>
> You're confusing two things: the rate output by the hardware, and what
> the CCF needs to return. We're discussing the latter here, a software
> construct. It models the hardware, but it doesn't have to be true to the
> hardware.
>
> And even the meson driver doesn't follow what you're claiming to the
> letter and is inconsistent with what you're saying. Any disabled gate
> will also have a hardware rate of 0. Yet, it doesn't return 0 in such a
> case. And no one does, because clk_get_rate() isn't supposed to return
> the actual rate in hardware at the moment. It's supposed to return what
> would be the rate if it was enabled.

I don't think I am confused at all.

What rate would you get if you would hit enable on those PLLs with the
invalid setting as they are ? 0 - no lock.

recalc_rate() is about giving the rate of the clock based on its current
parameters. This is exactly what the amlogic PLL driver does. I can't
compute a division by zero, sorry.

The fact that some parameters may be invalid for a clock element is not
specific to any SoC and we have to deal with it.

It is not up to the clock driver to select a random rate to just to make
that valid again, assuming it even can do so  which is not necessarily
the case.

