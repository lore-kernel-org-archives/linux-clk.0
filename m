Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393A4C5519F
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 15:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEA4D204FD
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 15:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Yr7rMt2x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKPPOF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 10:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbgKPPOE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 10:14:04 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47994C0613CF
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2020 07:14:03 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id m125so12669058wmm.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2020 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=19pEDECv8cH0ZrgYts5lxqlIadiD5ZEN+OyVVWuFNgs=;
        b=Yr7rMt2x4YfM6LJRtQkFhRdEf9LXmuXPySOYjGa55IDj5cdzp0Dihyx48cQth4Lxvf
         5ps7uabvkyvXmE/l2I3YOnWOi8DaiYsIOToNBnHhzXv45T60aqrIR6cu8gYZffwWI3BO
         ktXuki58tAvxVI51rU4kZW1kDnJCdMYZqcVP3438Pnp45rHqZlQCPpaxWxpMdacZ1ppr
         ZQsEYjXzkoWgw6uKttXOHhX6Ax9uBLQ8T3Emm1lSmwvAIFFKQMqP0ExgtDS7odRGHbyT
         AZw5k6WPt4SBVigs7U3PHP5yTSMUPDjRzPME87HafGrO9j7h3MmzKW0aE4K72wzAKyK+
         I6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=19pEDECv8cH0ZrgYts5lxqlIadiD5ZEN+OyVVWuFNgs=;
        b=a3NeROmmcoWTaZouO92xS1Fo9n4KjVzi9/fU/Drp02HqAhy+ipSn3LD+xR06KbmABX
         ZL1bnBZ8SFSt/R5DD0wGS5rz9paUky8wK8Xu37gyZjazveEG0crpVvfGa1LF/2zO8UOQ
         X7xcGA1Mjtk6XBeP6zD2ufFl8ODucaLsvachYmiyYCcVtx5+o3UfAfrcq1cnjDjz5sjw
         nqxS0j1QqQHlTLnazBa6zbOg+KRdtr7WASZY1keDrEUOM2MqcOnzmXd37r9/3a8J7NOq
         /iDwe24J/uaQRoqSwsOZo88I1ejJUAkOJzv6IZhlEI1+kIMyP3ADC3Hfv9R83B0bzUR4
         FhTg==
X-Gm-Message-State: AOAM53326KH1Eq4f5nb5qk6M8pHKJIyUT3cwuVkGMjmgqDcxuFslF4Wy
        VhWxZVIx74P5Hb8GUe052XisDMbuOoVCTbd1
X-Google-Smtp-Source: ABdhPJwkpzxyrnlp+s5PufjqA/+lvzm33/VEaQmt6qWZnXNBnDmEDfv8KPDKzIdGxnSIdIIBYmTu0w==
X-Received: by 2002:a1c:2643:: with SMTP id m64mr16351087wmm.28.1605539641990;
        Mon, 16 Nov 2020 07:14:01 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id x12sm16803111wrt.18.2020.11.16.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:14:01 -0800 (PST)
References: <20200519170733.295100-1-jbrunet@baylibre.com>
 <160538776372.60232.7084881096431627810@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH] clk: rework clk_register to use the clk_hw API
In-reply-to: <160538776372.60232.7084881096431627810@swboyd.mtv.corp.google.com>
Message-ID: <1j7dql1gi0.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 16 Nov 2020 16:13:59 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 14 Nov 2020 at 22:02, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-05-19 10:07:33)
>> This rework the clk_register/unregister functions to use the clk_hw API.
>> The goal is to pave the way for the removal of the 'clk' member in
>> struct clk_hw.
>> 
>> This member is used in about 60 drivers, most of them in drivers/clk/.
>> Some cases will be trivial to remove but some drivers are hacking around
>> it and will be tougher to deal with.
>> 
>> This change is sent as an RFC because, until there is a clear plan to deal
>> with drivers above, there is memory penality when using clk_register()
>> (struct clk is allocated in __clk_hw_register() and clk_register())
>> 
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Do you plan to resend this? I'm inclined to just apply it and we can
> sort out the memory penalty problem later.

I had forgot about it :)
It does not apply so I'll fix this and resend

Could you publish an immutable branch with the clk_hw_get_clk(),
devm_clk_notifier and the meson stuff you have applied ?

I'd like to base my next PR on it since Kevin submitted a change which
depends on it. It will also help me rebase this change.

> I'm not even sure what the
> penalty is quite honestly. Drivers can call the clk_hw_get_clk() API you
> introduced and generate clk pointer so we should be able to fully hide
> the clk generated in clk_register() from them and not even allocate it?

Eventually, it is the idea and there would no penality anymore.
At the moment, a fair amount of "struct clk_hw" user rely on the ".clk"
member being present, even if it is bad. All those need modification
before we can kill the .clk member.

I was thinking of a progressive approach:
* Migrate clk_register()
* Nicely ask user the direct users ".clk" to update
* Once satisfied, remove ".clk"

