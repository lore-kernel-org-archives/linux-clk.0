Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C4C2BB40
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 18:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2AD322EBF
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 18:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgLESTU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Dec 2020 13:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgLER4f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Dec 2020 12:56:35 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769CCC061A56
        for <linux-clk@vger.kernel.org>; Sat,  5 Dec 2020 09:55:49 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id h21so9876452wmb.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Dec 2020 09:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=ShrpRxCRDSFuegFEC+mO5LWHn840hNK9yWMo6lf5Wpo=;
        b=Yx+4BuKtf1C0Q7cWF7vF3DCElOWRkkl0ag14GQcBquVXOrNCUn6/n4DqkPD5t7+fQT
         FU646OONhZrjbO3zHdCNsIHrRVul8i0RcL02Mx0b0yX2ST4tmylK86M4aMZ7yTlPKq/7
         1D0fgf8KIju3Y0G7VLDEr6+v+0tj+nGtrmaRhaSaVGLu9CJzrAQFQCtlczbiJ1W+jFf5
         aozTWwpQDxEh2anOkq2GU9cvBUnTJrYGilRztN9yF8YkQhRV7xjxdME4/Uy8EKLkSpVg
         Hc2ca43KCWGV/TfLr7ZdPxo/JQFl7xGqkmaOrBjGNYKp1OYWXA4ed9UrlHUtj2ZEOVU9
         sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=ShrpRxCRDSFuegFEC+mO5LWHn840hNK9yWMo6lf5Wpo=;
        b=Vb6Kx4/rV85pe6XV6q6TukDCMO3Etgy8+5CCjLPnf6HaUd/3lYxobAUy0xE0Xl07hM
         CqFv4eouCR3K1LdjKMUQcQbx30JJ9t8J879Xqcn7EvjcNE9CIN/XaQuGooPf8m+zqw6H
         sNH4qaGy5k5q0HA70Lux15wJEiBcKF7PR3ZY2/qK3hqs5XDsBtj4DEX6qfxIt1V0J8ny
         tWTb9a+ve5DO5GjTJNr58Yp48yIongjmxfrpky5x4+lroCDrEEZqyao/sWbzHt/oDWSL
         0MF+6pmhDr04VIkQtecP4SVrRgZ0xGSQAe54ii2R1AjwEkpkIQr7OXEBeeMIv/Gpr1ET
         22ng==
X-Gm-Message-State: AOAM530vCsdEIDjnYrafoxA/zi3L9v6DmaJC1ccKVvd5x9T+Bpyf/MEN
        mxCkXhMlRCLiOsZ0I2cREs4Grw==
X-Google-Smtp-Source: ABdhPJyqYfb/4J8xZBewMqf1WV9fEhMTai0WBw0KHvmhiRiCkRsRxDj2kn0GzmWxjy6uNo19tm8aIQ==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr10375605wma.186.1607190948174;
        Sat, 05 Dec 2020 09:55:48 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id b12sm7619307wmj.2.2020.12.05.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 09:55:47 -0800 (PST)
References: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
 <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v5.11
In-reply-to: <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
Message-ID: <1j5z5gp271.fsf@starbuckisacylon.baylibre.com>
Date:   Sat, 05 Dec 2020 18:55:46 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 05 Dec 2020 at 07:26, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-11-29 12:50:40)
>> 
>> Hi Stephen,
>> 
>> Here are the updates for amlogic clocks for v5.11. This is based on your
>> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
>> stuff you've already applied.
>> 
>> Please Pull.
>> Thx.
>
> Ok. Where do I pull from!?
>
> :)
>

:) seems I forgot a tiny detail ... sorry about that, resending

>> 
>> Cheers
>> Jerome
>> 
>> ----------------------------------------------------------------
>> Amlogic clock changes for v5.11
>> 
>> * Add MIPI DSI clocks for axg and g12
>> * Make it possible to build controllers as modules
>> * Fix Video PLL clock dependency
>> 
>> ----------------------------------------------------------------
>> Jerome Brunet (2):
>>       Merge branch 'v5.11/headers' into integ
>>       Merge branch 'v5.11/headers' into v5.11/drivers
>> 
>> Kevin Hilman (2):
>>       clk: meson: Kconfig: fix dependency for G12A
>>       clk: meson: enable building as modules
>> 
>> Neil Armstrong (6):
>>       dt-bindings: clk: axg-clkc: add Video Clocks
>>       dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
>>       clk: meson: axg: add Video Clocks
>>       clk: meson: axg: add MIPI DSI Host clock
>>       dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>>       clk: meson: g12a: add MIPI DSI Host Pixel Clock
>> 
>>  drivers/clk/meson/Kconfig             |   7 +-
>>  drivers/clk/meson/axg-aoclk.c         |   5 +-
>>  drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
>>  drivers/clk/meson/axg.h               |  23 +-
>>  drivers/clk/meson/g12a-aoclk.c        |   5 +-
>>  drivers/clk/meson/g12a.c              |  79 +++-
>>  drivers/clk/meson/g12a.h              |   3 +-
>>  drivers/clk/meson/gxbb-aoclk.c        |   5 +-
>>  drivers/clk/meson/gxbb.c              |   5 +-
>>  drivers/clk/meson/meson-aoclk.c       |   4 +
>>  drivers/clk/meson/meson-eeclk.c       |   3 +
>>  include/dt-bindings/clock/axg-clkc.h  |  25 ++
>>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>>  13 files changed, 979 insertions(+), 11 deletions(-)

