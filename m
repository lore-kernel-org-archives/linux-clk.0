Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8989EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 15:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240883AbjFMPqW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 11:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237244AbjFMPqV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 11:46:21 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5BA127
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 08:46:19 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b3db8f3d94so11664385ad.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 08:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686671179; x=1689263179;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DycG4W9rFQOA5mqe7LcQiptnT0e+7vh1h/UF+fmSM40=;
        b=C3cRStvIDnDkv3GLqwbGtgaSGMIZ2SSA4wb+xYyUpx+zA9iyTfn6gbPmfFBG2qr3zj
         gGm3bTb3Ml1HD4rBdeIsm84aXhwFtKrcdoAIKj846WxXeMZR9/O/zwo1h1T4GdBRde+u
         /mynsTnIKhy8WemxHaae8xLP3Ou0AlsxgafBy+saWHvHjZboM7F4moFbuCcBfsjLZYxX
         Yp4Wju0Nu1oDoSO3XEYR+zec9lVrmdcHUpTTMyxLCv0QZmJwwau4T8pxHgoRQG/c0M9u
         RFdNCYKEpJ666f2IbvipNvilp703AhiF7poJdHehoxYcri44S6L3lga5uyD0JsY2Q+pY
         s26Q==
X-Gm-Message-State: AC+VfDwRYJw4c8LTyoGwoSn8fcX0BunLICsnm6iKWEfgxq+JqpfTUqUl
        U0Q0ho2n0zDNGrUtmgJlTw+diHNIXNzkjRkoEms=
X-Google-Smtp-Source: ACHHUZ57ihyk/UnWUTc8fZnPloB6lQh8V/nD/R7t1VZlIHIgcTPby2SjniCB4PIGKmfv8C5HcaZS3Q==
X-Received: by 2002:a17:903:120c:b0:1ae:305f:e949 with SMTP id l12-20020a170903120c00b001ae305fe949mr9690010plh.6.1686671178914;
        Tue, 13 Jun 2023 08:46:18 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902848200b001b3ab80381csm6439130plo.301.2023.06.13.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:46:18 -0700 (PDT)
From:   Kevin Hilman <khilman@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
In-Reply-To: <ca6a5f0cd1f64368045df05ba048e31d.sboyd@kernel.org>
References: <20230511133226.913600-1-msp@baylibre.com>
 <20230523114618.laajn2et5nbcxszv@blmsp> <7hsfbjxcqs.fsf@baylibre.com>
 <7ha5x8xzrp.fsf@baylibre.com>
 <ca6a5f0cd1f64368045df05ba048e31d.sboyd@kernel.org>
Date:   Tue, 13 Jun 2023 08:46:17 -0700
Message-ID: <7hv8frwek6.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Kevin Hilman (2023-06-09 11:21:30)
>> Kevin Hilman <khilman@kernel.org> writes:
>> 
>> > Markus Schneider-Pargmann <msp@baylibre.com> writes:
>> >
>> >> just wanted to ask if I need to do something specific for it to go into
>> >> a rc? Sorry if I missed doing something for that, I haven't had to fix
>> >> something in an rc that often before.
>> >
>> > I think the  Fixes tag is enough to indicate that.
>> >
>> > Steven, is there still time for this fix be queued up for v6.4-rc?
>> 
>> Steven: gentle reminder ping.
>
> Who's Steven :)

Sorry, I confused you with Steven Spielberg.  I bet that happens to you
a lot on the mailing list. ;)   (either that, or I can't spell.)

Thanks for queuing this up Stephen. 

Kevin
