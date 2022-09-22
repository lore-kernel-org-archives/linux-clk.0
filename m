Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12F6C54EE9
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 12:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiIVMqY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 08:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiIVMqA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 08:46:00 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20504B2CE5
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:45:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id q9so9000465pgq.8
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=EUOZb2990E/2sm9nyDml2aFGYKW9boLOMIoTqqkufhU=;
        b=1Bcs1Ny8mbZraxYiQuvMnq/zbwtwWWnCOQVPvj/I/46jXmekqMhqko99SpjSu5QdiH
         qDtYVNR2ZNk39h53rapFnDcnYFZ76S5k9IjhP77Z/A926FXiga6R/i+yzuz/uwMq7U+q
         158wYH7FmsKqdZnAfPcR9wKuFTG1R3WTDSMv8CnX5s0cBDpMEQWONja1/aeaRxVMngbG
         5/PZTCoPStAAc2kI0cJ15KfyVhEZDDWAZbwSaCIgTFrIIprM9upFdYel/xF2bl4uHrfh
         CoQDh04eCu7eXYrD0k0Vr3Cwaeoklvq+lh92xk96wzyyldhrj3cNlmUt4hmtc86UUzin
         0PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=EUOZb2990E/2sm9nyDml2aFGYKW9boLOMIoTqqkufhU=;
        b=3QH4ZbLdd03PD2uy+1qkWDJitT53M1GAR52oNgKSFzFNyLb8znP8syJ/wsMZfrCIR1
         kfVE6WasKeP/aYqqZdQOtMxq+gMbzZgr7pqaLAbvBj3IenC243Q5kRsJvrefSe8THz1I
         4fSdipfLmjQSKwyTXrRaJjYd1S7SxqMng7mLydKdfEYedSUXCTmm8HmA9TY7t1gUTB3C
         TxKT3476c1MfkMMc+NUcfIiwvrpVhhcP6TUPAl0M5zYTOLnExqWXmfivzSpjjPvr+0/t
         yr5c6o6LcEIF4dJFrJr8WpVaSXfy2Y5W6OTUujBAbOXdpPy3rH4q/SmuHGIzYEUYbicd
         rAHQ==
X-Gm-Message-State: ACrzQf1loxGPlVVD1xKqzSaH5661Y48aE3WVJHtQkgnlDj0e+ZXj/gjl
        FSdRuPnwrzzv8d1zQXazjkotzM5NT+oW8+gMD2yQLw==
X-Google-Smtp-Source: AMsMyM4O/N/zVs9zWHo8VZ8pdUXoohAewcmlUdHeafYOGuDWYY8oL47N7HPDeTurxd6fZSfsLroIY0k3HWCl8XmZlms=
X-Received: by 2002:a65:57c2:0:b0:438:ac40:1460 with SMTP id
 q2-20020a6557c2000000b00438ac401460mr2997875pgr.216.1663850745089; Thu, 22
 Sep 2022 05:45:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Sep 2022 05:45:44 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
In-Reply-To: <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
MIME-Version: 1.0
Date:   Thu, 22 Sep 2022 05:45:43 -0700
Message-ID: <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 22 Sep 2022 09:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:55, Guillaume Ranquet wrote:
>> From: Pablo Sun <pablo.sun@mediatek.com>
>>
>> Expand dt-bindings slot for VDOSYS1 of MT8195.
>> This clock is required by the DPI1 hardware
>> and is a downstream of the HDMI pixel clock.
>>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>
>
>Looks like broken patch.
>
>Best regards,
>Krzysztof
>

Hi Bo-Chen and Krzysztof,
I've sent the patches using the rather new b4 prep/send commands.

Though it produces valid patches, it's using `git show --format=email`
to produce the patches, which lacks a diffstat.

My understanding is that the diffstat is considered to be comments and thus
are not necessary to produce a valid patch.

I've reported the issue on the tools mailing list [1], I'm looking at providing
a fix.

I'll be extra careful at the patch format for V2.

Sorry for the inconveniance,
Guillaume.

[1] https://lore.kernel.org/tools/CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com/T/#u
