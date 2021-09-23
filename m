Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09E0C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 07:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87DDD61164
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 07:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbhIWHH1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Sep 2021 03:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbhIWHH1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Sep 2021 03:07:27 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EDAC061574
        for <linux-clk@vger.kernel.org>; Thu, 23 Sep 2021 00:05:56 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w19so8334173oik.10
        for <linux-clk@vger.kernel.org>; Thu, 23 Sep 2021 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stapelberg.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IthV7tE5yfFcxnSKvKQkyd8eIFf4X2+/XnbxnjKj63A=;
        b=Ti5PxVpEJ43IsCs3soMxypjPHP8YvDGzovtrxlfJoqYfMSobbR/y5JdJukiM/KKvXX
         J07UmFZMjmOIc2MzXUWdBI52WJGqwrBxeoTPxsM3Vk6hc3jn7qZWrkHl2Xs8vzzFbMh5
         8uE00Z0RLEQWMuRC1x+V3/QIJcoSpe0g2cTvvsyIZYC2EMgJ/pwIT2u5iD3ZF1N8f6DH
         quIfq69aE1jXpKsnt7NJU7RV78k7UJXTfBsf8hNnCHj6jArP4Sdei971mmMjPpLqUCCS
         orlLyN0v3pFuxPTqQi2sjvw32m+5LArmmeyR5MmweQADTFHBVh0EqfJLwrVJSVIeQFqN
         9HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IthV7tE5yfFcxnSKvKQkyd8eIFf4X2+/XnbxnjKj63A=;
        b=KBNwQ/5PGxT9OjfaogTKHIZnAW9oFP3MbQiQNdWETcFNhOISHLjNO6GViLY9x4ak6N
         GFDNp/YekTENBbkmgXkEWvfUvl3Iz9T6HCqbHq8hy/UI2shs2yeMS0atoIzlm03DHEkf
         +FfmU40BWanBK+zgkiVNS6s42irzDD+ACyhbMmgOQUQh9nYtocSANg8BWCg9zXJG62Oe
         8aqm5HOhX1GO1YdEMVnV9uIKjk7jSUXzXdpRB0qzYKc13e9MyHndXeGbRi2uMBute+b0
         EUGAMqixTwhZG96Bjst6SVFOrxATT/H1euWSGFgH5Xj6mflrvTJTVgl/nEDSn13U+mU2
         3CqA==
X-Gm-Message-State: AOAM5304lUm2RrWt6ldFqhc8k5Qv2wYVEO9zfBcoNXes7AICbEsqU9g1
        0UY87fsc5K95grxQ/fA6pwE4one2SAxePOPBIAtArw==
X-Google-Smtp-Source: ABdhPJziUkXCfKg1abMsQJVrmNpsTMA3+ywisLcmJYhVcH4rGHtvpHWAEag5v5Tq1ibv0luPVijjEvBObRJ/fojrVgw=
X-Received: by 2002:aca:ab51:: with SMTP id u78mr11733036oie.177.1632380755894;
 Thu, 23 Sep 2021 00:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125419.4125779-1-maxime@cerno.tech> <CANnVG6kFC7q_dDDp4rRZsJz=paHKy2STn9127LE=JJOf2kW2TA@mail.gmail.com>
In-Reply-To: <CANnVG6kFC7q_dDDp4rRZsJz=paHKy2STn9127LE=JJOf2kW2TA@mail.gmail.com>
From:   Michael Stapelberg <michael@stapelberg.ch>
Date:   Thu, 23 Sep 2021 09:05:40 +0200
Message-ID: <CANnVG6mEL+Lzir=K7zBTWVV5zXsdokWCHvsTkM2McGHTO3HEfQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/vc4: hdmi: Remove CPU hangs, take 2
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I can confirm that this patch series (applied to linux commit
58e2cf5d794616b84f591d4d1276c8953278ce24) works for me =E2=80=94 my Raspber=
ry
Pi 3 still boots fine (without HDMI connected).

Thanks!


On Wed, 22 Sept 2021 at 23:18, Michael Stapelberg <michael@stapelberg.ch> w=
rote:
>
>
> On Wed, 22 Sept 2021 at 14:54, Maxime Ripard <maxime@cerno.tech> wrote:
>>
>> Hi,
>>
>> Here's another attempt at fixing the complete CPU stall while retrieving=
 the
>> HDMI connector status when the connector is disabled.
>>
>> This was fixed already, but eventually got reverted by Linus due to the =
same
>> symptom happening in another situation. This was likely (but not confirm=
ed by
>> the reporter) due to the kernel being booted without an HDMI display con=
nected,
>> in which case the firmware won't initialise the HDMI State Machine clock=
.
>
>
> Sorry for the lack of confirmation: yes, this problem was encountered whe=
n no HDMI display was connected.
>
> I=E2=80=99ll try testing your patch series tomorrow.
>
> Thanks for taking care of this!
>
>>
>>
>> This is fixed by patch 3. However, further changes in the clock drivers =
were
>> needed for clk_set_min_rate to be used, which are patches 1 and 2.
>>
>> Finally, patches 4 and 5 are the original patches that were reverted. Pa=
tch 4
>> got a small modification to move the clk_set_min_rate() call before the =
HSM
>> clock is enabled.
>>
>> Let me know what you think,
>> Maxime
>>
>> Maxime Ripard (5):
>>   clk: bcm-2835: Pick the closest clock rate
>>   clk: bcm-2835: Remove rounding up the dividers
>>   drm/vc4: hdmi: Set a default HSM rate
>>   drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
>>   drm/vc4: hdmi: Make sure the controller is powered in detect
>>
>>  drivers/clk/bcm/clk-bcm2835.c  | 13 ++---
>>  drivers/gpu/drm/vc4/vc4_hdmi.c | 90 ++++++++++++++++++++++++----------
>>  2 files changed, 68 insertions(+), 35 deletions(-)
>>
>> --
>> 2.31.1
>>
>
>
> --
> Best regards,
> Michael



--=20
Best regards,
Michael
