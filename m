Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A6EC6FA86
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 12:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiIVMvG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 08:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiIVMvF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 08:51:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21269E11E6
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:51:04 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h3so10895302lja.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
        b=bEQc5o4c96kL003lNdFFNF/PheTKYPzGOx1XlLuWx4uUt3ZZ8u82nZSviwPUHfH2xv
         bUDvPw5aOQbeDKQmaq1CoRgZsOnIg2YGfJh8cvDV5F9+JLKSUyn50zDSIBxJOcnrj4PR
         A/jflBtwfF7dKCfnIUVH8sg+arNoqIgkz9k9j9ZFaFWktQEtF1ZrBOG6ExeV2+xa5sCd
         gIaN+jPceaw/AtbWvWGSXMYZ/VYa/BVnHTn4+MNDa2/tr3mx3BIFfKkZZCFjQpef8XiE
         zuMwWdRrzBII8cLpO+PWCCMW0r7uAoqveKC5p2LZphYcvpAG3bcSeCk7PVaftA5tgi0M
         8RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
        b=lNemmBiFkaQFgKqY6TUld7CN3ZHD72Ka28zSXWPhrAbWpZr9a6fY+Da316LfksQZtc
         xmsB0js1cmWTuyrMGoGjDwNn+p4Nj2ByFpKirbxG7pqV7RELJjrYqac+dWUKoWtTU82V
         LGhP/BbCzMf9yp9FGoIT/qoFQZ7wdkXAKL8r7ZGqV0N2U6sbUscuNbKIk5oWvkX+mfwy
         uK4UppF8ekL/ONQiTmXkDlsFGDk3u/tBgp+1tnbs8XzkGlqKFw2h/cK3/CjqfqhuXC94
         d2vfQaBb+HRIlBYbnuKhpkQ4XX1otLqC58cOjhZOY4zTyeeT+UV1XZN9BI/gH8MJeWEp
         3ngA==
X-Gm-Message-State: ACrzQf2RGGwmzialN+NQKzsVqhQEVONlvq+wWrlC12elVlxnN0mAY3ri
        keCAfGjsIzjO4lT564XLEcU7Vg==
X-Google-Smtp-Source: AMsMyM7SDptjdpkW7tuuttAy0kYzK4MBmIe60uRZtol4i0HW5ltX1B+Cjzu/BNFNwE3TBkr+rbuBQA==
X-Received: by 2002:a2e:1458:0:b0:26c:3b83:e039 with SMTP id 24-20020a2e1458000000b0026c3b83e039mr1098450lju.484.1663851062438;
        Thu, 22 Sep 2022 05:51:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v12-20020ac258ec000000b0049496608d58sm925362lfo.155.2022.09.22.05.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:51:01 -0700 (PDT)
Message-ID: <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
Date:   Thu, 22 Sep 2022 14:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
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
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
 <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/09/2022 14:45, Guillaume Ranquet wrote:
> On Thu, 22 Sep 2022 09:11, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 19/09/2022 18:55, Guillaume Ranquet wrote:
>>> From: Pablo Sun <pablo.sun@mediatek.com>
>>>
>>> Expand dt-bindings slot for VDOSYS1 of MT8195.
>>> This clock is required by the DPI1 hardware
>>> and is a downstream of the HDMI pixel clock.
>>>
>>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>>
>>
>> Looks like broken patch.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Bo-Chen and Krzysztof,
> I've sent the patches using the rather new b4 prep/send commands.
> 
> Though it produces valid patches, it's using `git show --format=email`
> to produce the patches, which lacks a diffstat.
> 
> My understanding is that the diffstat is considered to be comments and thus
> are not necessary to produce a valid patch.
> 
> I've reported the issue on the tools mailing list [1], I'm looking at providing
> a fix.
> 
> I'll be extra careful at the patch format for V2.

Thanks for explanation! Probably your patches are perfectly fine and
should apply, although I must admit diffstat is often useful.

Best regards,
Krzysztof

