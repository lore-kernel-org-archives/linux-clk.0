Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197B8C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 08:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D07D561186
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 08:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhD3IDs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Apr 2021 04:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhD3IDs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Apr 2021 04:03:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07518C06138B
        for <linux-clk@vger.kernel.org>; Fri, 30 Apr 2021 01:02:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id t4so20604383ejo.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Apr 2021 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=gEXOq4bTfcSUdUpLFcNhC6eN04AyrduIgQ9uuxLC6OQ=;
        b=CyLMRHNZPKD5a43+OjCNpQu0X+iMse+Mr2s56g3TR5iXy+jXFzudjJpE2fTY4RhNBj
         4V8hEHqAG7ZxzBoVsDu4/+iassEyaCRU+seGci3cHCaPgMa7O1v9riFc45YLhEzJ2VLs
         qWKOrXNo3xeXuo8CDVK5AQWFvHgggovEvtvxZrLztYPbJG8tkcZTYNYlpgwHyjSkSPBZ
         lbu9SRDRXQqGvEKSHcr3qbsVzwQdqGr6CV4kfMIMcOR7un+52eImiIMbSDR4dngbdH+6
         +ih3cdClm3/L/I/Nt0KRkGBhKQovaluwXwzYoE6z58qK5mgRHdROcwNWLG+HAEzNSMR0
         c7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=gEXOq4bTfcSUdUpLFcNhC6eN04AyrduIgQ9uuxLC6OQ=;
        b=NCfa37aWHa8U4sJIOQ+ZHSpaASSwAAT/vCqGE2lj85F0+GDaZrKenvSeDh+zXQdd5V
         BZlxJwbxCrv4R3TT3uX9adi6j92Z96FG6KunNqgBZIIQdNCjRSQv2itPuvgcQfWNrGQu
         tYZ4+VzDpmcZHLRLntis3hdElRYxCDs/ChUGgZGv7Qm6ILQK1FRZ/UhZgJ6fBd4n1weS
         UP0NkBTnYGZL4Q1ePSlXC4/lMMwQbK/ChyUsQ6/7252qDvfYKeVyKHrK4mpy0QP32i5d
         M6BvyfG8IJW54yc6GKACkE+rG96w6uGGw9yuVx7omj5QGieqcfLojGVL/VeI9XFsNkrN
         aI3g==
X-Gm-Message-State: AOAM530zggBoFJZAdjmxcpWNguo8OUPpev5p3ExgMacMFT72AamnEelg
        kbf6qEAbx64OtuJgu87P8OdRLw==
X-Google-Smtp-Source: ABdhPJwWRSCUbw6PZjmgVFMqTWKuf9gCMZIlgo3uw/ckGNvacB1VpAMS8tzpBCnM3QlRu6BINi1NpQ==
X-Received: by 2002:a17:906:a20b:: with SMTP id r11mr2884072ejy.323.1619769777683;
        Fri, 30 Apr 2021 01:02:57 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id x20sm666852edd.58.2021.04.30.01.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 01:02:57 -0700 (PDT)
References: <20210429090516.61085-1-jbrunet@baylibre.com>
 <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
In-reply-to: <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
Message-ID: <1jlf909p3j.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 30 Apr 2021 10:02:56 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 29 Apr 2021 at 22:49, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Thu, Apr 29, 2021 at 11:06 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
>> index 7c8d02164443..5e501eff0840 100644
>> --- a/drivers/clk/meson/axg-audio.c
>> +++ b/drivers/clk/meson/axg-audio.c
>> @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>>
>>         ret = device_reset(dev);
>>         if (ret) {
>> -               dev_err(dev, "failed to reset device\n");
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to reset device\n");
> many drivers are switching to dev_err_probe nowadays
> According to it's documentation:
>   In case of -EPROBE_DEFER it sets also defer probe reason, which can be
>   checked later by reading devices_deferred debugfs attribute.
>
> so I think it makes sense to use dev_err_probe here as well

Old habits ;) thanks for pointing this out. Will do

>
>
> Best regards,
> Martin

