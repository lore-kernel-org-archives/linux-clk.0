Return-Path: <SRS0=c3RB=6B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1178C2BB1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BF12206D9
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eepHxWx0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgDQHnr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgDQHnq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Apr 2020 03:43:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37033C061A0F
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:43:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so1905073wmj.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=7VxUyCozUFRQ3HWyk/FR84Y855XH8vC8ACtL+uxdHOg=;
        b=eepHxWx0UCQ3bBjYPAxbl27Om6GC70uRgirDesMlw0GcwtwctP16SCiHB+9lipG9Q0
         MgNdJoEZVSmbzmwNbFctN8vwR/E4WL5PrBitcvaR4Mv5RZyqao5nKchsF6SAoVjQw6q8
         1sBR/TQ8qY8RmucdLYRWbxuvwjwkdplwZck/fYRcvy1zb+UVhxu540CJET3ACX9t6WuQ
         IAlO3q/oQ0fiIwt/0iD1Y5oFpSq3BcdbdHfOVxTsU7YR4v7fa0aOShrllZ4IZQDEdY1z
         wcrFjOJJqsSYcm+HvrKBxOn3cHvgNXvN8UbAciWfiS7exv4J4Q6YoZlD4nsCuLB51+ze
         HL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=7VxUyCozUFRQ3HWyk/FR84Y855XH8vC8ACtL+uxdHOg=;
        b=GbXogCTUAtjef9HJ0vqufT9IhaSM6qLIfw1G46Cmf/cLyYs6gplx4HA/6kw+WbDqhD
         fjduSGPucTdMLarusgACv3L6f9VBcA7a7Se0jAnTrmkVjsIS0fTyfDnZkaUA2ECxKcAG
         mA+bc3fQVlRegI5egVcuFO0Yu88NGWr3H9AlL61McQTeFjbU7pnSqmVoOwYesUciGGM8
         DzgKUIY4FJfILXULxheUrXQjixfvtLqixkkTL2ykyqBog5ZEr9l0Y7S+Uw7Og+ayLuCo
         5ArTdOWarhOcctg5ub+aeesHLR8pyI6Dq2RxhJQaJYKruSAb3hHFLQpCOIruG7reipAl
         rxwg==
X-Gm-Message-State: AGi0PuZdUXM0sKFC6XUW1PmvRMpyI7lDOxUX6nQM7sTnErxWOoGYsyh6
        lPhm2sw118p1CorpUAA1gIuf52bHY0c=
X-Google-Smtp-Source: APiQypKB/8+cZvXsHO1NRHGVVpm+LapGF68siOZwDYjt2dTxd7u+tUAFWwcTxeJ3csNYW5kgsVQ09w==
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr2124159wml.189.1587109423806;
        Fri, 17 Apr 2020 00:43:43 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id l185sm6779244wml.44.2020.04.17.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:43:43 -0700 (PDT)
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com> <20200414200017.226136-3-martin.blumenstingl@googlemail.com> <1ja73bbtqt.fsf@starbuckisacylon.baylibre.com> <CAFBinCAtSPTHfbr5KGNFFg3eo_d2p2q59fQfMXu+XkOb8WVrDQ@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: meson: meson8b: Fix the polarity of the RESET_N lines
In-reply-to: <CAFBinCAtSPTHfbr5KGNFFg3eo_d2p2q59fQfMXu+XkOb8WVrDQ@mail.gmail.com>
Date:   Fri, 17 Apr 2020 09:43:42 +0200
Message-ID: <1j8siublqp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 16 Apr 2020 at 20:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Thu, Apr 16, 2020 at 12:38 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> >
>> >       if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
>> >               return -EINVAL;
>> >
>> >       reset = &meson8b_clk_reset_bits[id];
>> >
>> > +     if (assert == reset->active_low)
>> > +             value = 0;
>> > +     else
>> > +             value = BIT(reset->bit_idx);
>>
>> if (assert ^ reset->active_low)
>>         value = BIT(reset->bit_idx);
> I can do that, but I prefer "!=" over "^" because the result is
> expected to be a bool (and because I'm not used to reading "^" for
> logical comparisons)
> will this work for you as well?

yes

>
>
> Martin

