Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DF3C433B4
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 15:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCDE561059
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 15:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhESPLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 11:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhESPLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 11:11:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E1AC061760
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 08:10:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d11so14382370wrw.8
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=pZTrmzjRk0JsfMU4NJ6gfhJKpkFDNAJqvtFPV6c7aqI=;
        b=sPbtHp+UyY0QZk3Slfytp2HlLx5k++0LMnr/g/kaaRlHRT625kD3YaS5w2vxJasi6s
         c3p+6gAW3YGpU3+vzRWDafgfn+rUbUgIDgtOcnFSBpO0YZbIpgx0SZXmxGi4St2tSPMF
         lQAx3VMVcZapIWxpApznRvFQnbQtdpq/ZaUrva1Z69laBzJkwxYPHxOtduY5dXgr50gp
         6JMDPnj1ltLmanag9oczTddqe6IInR7gQV4/3O5eWeVZMq2xQq4lmF1lrVqUyJeWM8hQ
         mJmDVSx1SJTZ851+BDiXZLMTQV0ipWJhnyDZwol3gULGVpnghldw/XlH/y56pLgdyola
         evCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=pZTrmzjRk0JsfMU4NJ6gfhJKpkFDNAJqvtFPV6c7aqI=;
        b=ZBNCQD65BrAdsEjBSZ8pOtlOW5XEykC+Q9s4LdGaap/NYR/xlaPC8x8+w0T5H/Jn4q
         U25drKCw2/ksIrdqbvo8nn3UsFPdRT4eQ+gbeE9WLVJg+QINDF6sPw3UcYBpXZNSK8tC
         B45Gj0BvoaRha/bocHt06Ltf26Hodwjp0qbzcc/bslFq0LK7/X4xIdrYLdcTkDByLDxd
         ynUhcI2HgFJbxrRkWr+GoAhAbMttE9uAeqqnlsl6P5nYHJMZWOM8/cKcErOwN7d9wH5G
         o7uVDx2b12cQ85X8g7lc1sL3r5VxlyB2xXXruXNZWLwVWlzLYM19Bt9sFgVAIfTTKtCJ
         B6tA==
X-Gm-Message-State: AOAM532AbHup5Vi01x6btqeCmNs9SMkN6adk1Vtnt2IY+EYJ9xcPXIBA
        0qlus8N67pW+jGI32VL6txv7OQ==
X-Google-Smtp-Source: ABdhPJzuKJrQL7ukPErjV9xAxeYsKK2e9MVgKM+TWHESmAB3zfHQlkZ07BgfBUGY9o+FLk0Oal812Q==
X-Received: by 2002:a5d:598d:: with SMTP id n13mr15262787wri.38.1621437027253;
        Wed, 19 May 2021 08:10:27 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id h13sm22758075wml.26.2021.05.19.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:10:26 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
 <1jo8d81nw3.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBREyEp0gj_-ac2OccjSruULPG1m2=L5D7GEA4HoqQqLg@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, khilman@baylibre.com,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 3/3] clk: meson: pll: switch to determine_rate
 for the PLL ops
In-reply-to: <CAFBinCBREyEp0gj_-ac2OccjSruULPG1m2=L5D7GEA4HoqQqLg@mail.gmail.com>
Message-ID: <1j1ra2dajh.fsf@starbuckisacylon.baylibre.com>
Date:   Wed, 19 May 2021 17:10:26 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 18 May 2021 at 22:17, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Tue, May 18, 2021 at 9:50 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > This increases the maxmium supported frequency on 32-bit systems from
>> > 2^31 (signed long as used by clk_ops.round_rate, maximum value:
>> > approx. 2.14GHz) to 2^32 (unsigned long as used by
>> > clk_ops.determine_rate, maximum value: approx. 4.29GHz).
>> > On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
>> > capable of running at up to 2.97GHz. So switch the divider
>> > implementation in clk-regmap to clk_ops.determine_rate to support these
>> > higher frequencies on 32-bit systems.
>> >
>> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> Looks good. I see no reason to keep this one as RFC.
> Great, thanks for checking!
>
>> I can take it directly if this is OK with you ?
> That would be amazing.
> Obviously no objections from my side :-)
>
>
> Best regards,
> Martin

Applied then. Thx
