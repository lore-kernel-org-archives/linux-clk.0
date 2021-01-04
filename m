Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F8AC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4564221D93
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhADLm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhADLm6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 06:42:58 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DE4C061794
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 03:42:18 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id u19so27024341edx.2
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=kUUHeak7By77zEE1nbDrZjZ6iDrz8DI2SEFaci/HNo8=;
        b=RU8r3tfIPDFn08B0mFOH3NcvWgiJIiwTZxDxiLZajdWdHmiw34jZv37C8KTZfE4ntn
         j6zuN49YJEomqTJJSq4gDNHVt5ZfZSJiySgMHQOWFyrm53BYdBGqgi/wKVY7G7DAuKBh
         itD2GT7XF2OikvaKIJQh2vacbMktfRPCRGfItlrfQ5LIrrBZPBkIidEZ82pT/78816KT
         Ww2dkEt/BpHvSXPMtC3TqWkeYasets083NQAErW7reAFme5T7imT9yHd9cXJd2+vbjkJ
         FEricqrtLRAP3klYRTB/KxDvPw8ePyt76gEwVUDmY42S6te1EpMJ25mHbqaSCQ7lz6X3
         e89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=kUUHeak7By77zEE1nbDrZjZ6iDrz8DI2SEFaci/HNo8=;
        b=HbN6VXgtksWrhZef1jwdhk/hCk/z5JYf2F/k0Dlt4/CiBrO46M6+svA2t4hf4P4fbL
         bsjo8LrrSJ9RY9DVSZfYxL+2k9kpz3Zpl/pLy23SvjwkdvK/q+4mAn/lgKmRacZVNoav
         DqXBjcEEv6ul9QMUJDnIWl2qYMKa0GW/Y/mp8P2A2wHSfi6VTy+CJOYxEoEcFHf2wzo/
         3yUo9Jc4X2NpI+hOD9/cncTw3a25IJ9SEcMUIoSHe2+sXh/RUxJxV9QiaWhzvu/p73Hw
         VbKajPOPcwi03WX/gsgRnJbJaz9VRsOfK4SpG6lOzp+BApPemXY8pPCHQTpV8rOrz7N3
         kQqQ==
X-Gm-Message-State: AOAM533tXGYX49hxpqYnhJ2MQqnjN57Xq6JemfFAtovLiTfYsH3qKjSA
        l6pAPCWax1pXjrUOtc0BZ++dKA==
X-Google-Smtp-Source: ABdhPJyRwi+RW45/1B4cm4abK49cRjl9sbdLy0nc6xW8Uyqy6G/zun/bQgydWWnxMervmGfomwRPjA==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr71619321edj.293.1609760536776;
        Mon, 04 Jan 2021 03:42:16 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id c25sm23332482ejx.39.2021.01.04.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:42:16 -0800 (PST)
References: <20200309210157.29860-1-repk@triplefau.lt>
 <1jd09k4ot7.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Remi Pommarel <repk@triplefau.lt>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: meson: axg: Remove MIPI enable clock gate
In-reply-to: <1jd09k4ot7.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1j5z4dx71k.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 12:42:15 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 10 Mar 2020 at 09:05, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 09 Mar 2020 at 22:01, Remi Pommarel <repk@triplefau.lt> wrote:
>
>> As discussed here [0], HHI_MIPI_CNTL0 is part of the MIPI/PCIe analog
>> PHY region and is not related to clock one. Since MIPI/PCIe PHY driver
>> has been added with [1], this region can be removed from the clock
>> driver.
>>
>> Please not that this serie depends on [1] to be merged first.
>>
>> [0] https://lkml.org/lkml/2019/12/16/119
>> [1] https://lkml.org/lkml/2020/1/23/945
>
> Series look good. Will apply after v5.7-rc1
>

Finally applied ... sorry for the delay

>>
>> Remi Pommarel (2):
>>   clk: meson: axg: Remove MIPI enable clock gate
>>   clk: meson-axg: remove CLKID_MIPI_ENABLE
>>
>>  drivers/clk/meson/axg.c              | 3 ---
>>  drivers/clk/meson/axg.h              | 1 -
>>  include/dt-bindings/clock/axg-clkc.h | 1 -
>>  3 files changed, 5 deletions(-)
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

