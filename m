Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89C4C47247
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 16:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF2F82078D
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 16:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jhf/ev2c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730422AbgEEQD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 12:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730352AbgEEQDZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 May 2020 12:03:25 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B536CC061A0F
        for <linux-clk@vger.kernel.org>; Tue,  5 May 2020 09:03:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l18so3374464wrn.6
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2020 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=WtK4lkmxnuhqEL9MrdcXhTfMNLOEAuXiB2K70MvxivQ=;
        b=jhf/ev2c6iw3kTKkuaHqt6K4MiAHE95gM/VMkGmkMy+1xVoC1C1srH4mjYfLKfiwj9
         QdBNBqN0VlqRJ6UftTdKvMgWwled4xICnR+2wXelpBOapwoAzxgZSXsoT6XqOP3NcUkz
         8ORS2G76S8L/l9BTqQ92Uy0p9apMWqRa5wMrYFmuelsG/wC1ObVGRhozgwoZuiXVBoDi
         jEk7PunDCTgVrVx+77wQmUA7B+C0fAhYUQZLEZbGqEl6+ssYRG9feTErxv1ZiRr5RFWI
         PeC8XVG8YyNqm3ZY1OX/nYjKT1sU/wB9xXE/zV05YJdrlHRm0a6mQIjNgwNiR4pQ6TcG
         SIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=WtK4lkmxnuhqEL9MrdcXhTfMNLOEAuXiB2K70MvxivQ=;
        b=ViuXBXG+Iec/ITAd+x77cPoKdcklEOsXZnaT8ZfUXMYGs+jPXKlzAJ061COpvYzZI1
         v9phofR/GpwD+pF2Cd31OgdvvtLYP0fKHY3yoz+kAW/9wsiUZASSNSuMrRVdN/K2czqg
         nYK6P/SvgJZi5fQhgFUpo+mml+tbuuB4Y8EYiCFJcdK3AHw+H3QltFd7Od7q7SrnmQV4
         3SQ8sCUFmQccHcAzChcplq3o1FP9P18VmwvEMa+CwkHoTICiseodWld/aR5gTSYgkfRD
         oSF/HyJx0C2ED2oy6JmN7KzdvmtQLtgTOJqe8RqY+/YT43cHQj7Vn3jHnydPuk/dzKBe
         3V7g==
X-Gm-Message-State: AGi0PuYUHcWAgbT2huLnn9ol54LztSwNxDsAo5ZoaEGnVMBp1NwXw6/T
        j9bF8ODQgOaaMKFUjPHWNW8R54T2kxU=
X-Google-Smtp-Source: APiQypLDKu7PhMfACG24kQblVht1fU8mNlGHDOGopmyrRM8TnNb3LogjoedLdmRhbaRi9Y10ma9g2A==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3434250wrn.172.1588694603453;
        Tue, 05 May 2020 09:03:23 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id 1sm4612446wmi.0.2020.05.05.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 09:03:22 -0700 (PDT)
References: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com> <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ulf.hansson@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: clk: clk_register is deprecated
In-reply-to: <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com>
Date:   Tue, 05 May 2020 18:03:21 +0200
Message-ID: <1j368egyie.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 04 May 2020 at 19:16, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-04-30 05:24:41)
>> Hi Stephen,
>> 
>> We have a question regarding drivers which register clocks in CCF and
>> later need to use these clocks.
>> 
>> So far, these drivers had been using clk_register() to get a 'struct
>> clk*' they could later use with the linux/clk.h API.
>> 
>> Now that this clk_register() is deprecated in favor of
>> clk_hw_register(), how are these driver supposed to get the per-user
>> "struct clk*" they need ?
>> 
>> In this mmc thread [0] Martin proposed to go through a provider. I think
>> it is overkill, especially for a device which will not provide its clocks
>> to any other device.
>> 
>> They other way available is "hw->clk". I suspect it is not recommended
>> to do so, is it ?
>> 
>> If not, what would be the recommended way to get the "struct clk*" from
>> a newly registered "struct clk_hw *" ? Should we add something new to
>> clk-provider.h API ?
>> 
>
> Yes we should add a clk_hw_get_clk() API that takes a device pointer and
> a string name, mirroring the clk_get() API but cutting out the part
> where we have to go through the provider to find it.

We will try to propose something for clk_hw_get_clk() soon.
If we do so, could we "UN-deprecate" clk_register() and make it a
wrapper around clk_hw_register() and clk_hw_get_clk() ?

It would make it easier on drivers which both register and use clocks.

To get a short term solution for Martin and his MMC driver:
-  If the above wrapper is OK and we commit on doing it soon, would you
   also be OK for martin to use clk_register() in his MMC driver (now) ?

-  If not, could we use clk_hw->clk until  we have clk_hw_get_clk() in
   CCF ?

>
> This is so that one day in "the future" we can remove hw->clk and make
> that an internal detail that struct clk_hw can't see because we go
> through the clk_hw::clk_core pointer instead.

Yes, I know it is your secret plan ... ;)



