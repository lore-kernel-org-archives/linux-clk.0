Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65286C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 22 Oct 2022 12:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiJVMN0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Oct 2022 08:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJVMNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Oct 2022 08:13:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4032550F87
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 05:13:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id y10so3894819wma.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=iBk0CGw7WcuryOh9lQut8CkGKBWj+XFGwLE39Z2bst0=;
        b=EGEGG1Yo/BHjquuWMlqmJkYHRFwkwO8NU7g+SNmbrFpSGZcbS/fDn01Ls+20OKwBfj
         xgJaSh7rMBwRa8Nl6597V2ZzOvmFZ27WbGzHfqcCxH1R0R715V0z8870YKzGcTXHZqbq
         Aj8RNo4+qWSrYtH2oqeoZE4KO+UPwcXvmq7VbYE/2GnRcXjyeU0W8/NTyvNF2RgcWWwb
         ppNxAHAfl9kK6iNMUSjASoe/zI5HGOuJGY3mJGXqhlK7r2YKADbKRep38CJCAlHj4wF6
         /SUwNFhdvi24Jv8EeZlk4cFLlB459Terd15hp6HL/Vb7hFDdP7fBFk61rbsMnErkeCuL
         pqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBk0CGw7WcuryOh9lQut8CkGKBWj+XFGwLE39Z2bst0=;
        b=oMngY+rIyn2lYrPcd9/zM6sDzplaklYdFxGg2F07e9+qR9zSkbIrpBZ4QpHowQXabV
         P/rUkVXNkbQsDhHLmIKTL9uWe3jqu5zId16X9YokCPkulW1K+3SOt8oXUrAAr9i42kUj
         xuAIxdPuq6eIgjAyNErLMlGgPnwQVd/yRDnkrqD8dNazopGcAWkWlGFgR1UK2qz84iIi
         a1aRZ+ARq+k6Ya9EccyJGVBN4wt6Y7VPYt+naPbLmuz7kaiqu0mNCagMfOmr51ReseoT
         tQ2U0V1jR/DjS6fH8F44dI0K6u0AqKCJc+JsBOLUxc/3IvaNlRqdc6dzWqPiViludYmE
         O/RA==
X-Gm-Message-State: ACrzQf2BZED/L9xv8gyFpmPaEdMeHUF11MVYudc+rPq9nWdvZYrG6/WY
        9COj2/5GDIjLsfMEKWuomNifIA==
X-Google-Smtp-Source: AMsMyM5jUUpIrRjDMyE7JXZxwWaYImTrE7gVStguHxI1uWoBSCuHSBbRFrCVQsOTFmJCl/arVFhQLQ==
X-Received: by 2002:a1c:7407:0:b0:3c6:cc25:c02f with SMTP id p7-20020a1c7407000000b003c6cc25c02fmr16012584wmc.124.1666440801820;
        Sat, 22 Oct 2022 05:13:21 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id y6-20020adff146000000b00228d67db06esm4604673wro.21.2022.10.22.05.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 05:13:21 -0700 (PDT)
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
 <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
 <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date:   Sat, 22 Oct 2022 14:10:31 +0200
In-reply-to: <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
Message-ID: <1j8rl8awf2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 22 Oct 2022 at 13:21, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Heiner,
>
> On Sat, Oct 22, 2022 at 1:17 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> [...]
>> Hi Jerome,
>> on Sep 6th you responded that the patch has been applied.
>> https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
>> However I still don't see it in linux-next. Is it pending in some other tree?
> Jerome has merged both your patches and they are part of the linux-clk
> pull request, see [0]
> But it seems like that hasn't been merged by the clock maintainers
> (Stephen) yet.
>
> Do you have that other mail in your inbox? If so, can you please ping
> Stephen in that thread?
>

Indeed, It missed the merged window. I'll send it again soon

>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/linux-amlogic/1jh71b3asq.fsf@starbuckisacylon.baylibre.com/

