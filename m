Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C74C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbjHHRpJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbjHHRoo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:44:44 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B92DAA163
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:20:10 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-317e427488aso2217791f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691511570; x=1692116370;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=WYDOE0uAfuvMMd7frP4lQPvrrdCPX7CA5G+ozoaawe4=;
        b=iobwjdsGEVH1iKaRkHAcBYouOhfTHZivqJq77YiYimGMppEH/hB5us9f8F4GF7Qp7I
         dtV4SCU0mg9WyMgDP8amWTihcudHnzHzI61pYd5dug1vimYsJ5Ly8uOCqlV9yNu/FPNy
         qYtAZ+8aTBJcv4478MzTwSC4kQkmW6vFqoxsd9wvXlgBE9x0ElmAw49nmcuXWBqmKutR
         mXJ4VeEEHPnrobo1HzuN5G/vzdJH+gwKtVthaDH5EYrvYQu9ghPz5cb/nxH5CdjEgEli
         1k095C1k6+M6V4Yz2g16+vu9wT/9USYMd7z9wS0+1f6ZbJL6NhaUYbrexRUhzNmieVkK
         xAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511570; x=1692116370;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYDOE0uAfuvMMd7frP4lQPvrrdCPX7CA5G+ozoaawe4=;
        b=W2HS93Lons77IOzPwZ/ibkn0SFEARuCr9A9LW1Ozc5An3IdUQSWz1/LZvK9UJo+d5B
         FB1Z0KNrwfW1baU1aqgS7rObkvIYxuyVFostD71fgDfEKl4ykBvHXn6qdObr2qEPuVWe
         LYenuwC79R8MViJvWRohaQDfgCkNzCDraizvA9E+yXbgaf0zUa5KWFAOINqcv2ul0gw9
         sXGlJ4rU0J+baqWjV9UQYSwji8VoD6kb4jVLWApO+asdLEqleKuxYdPaNpXIdR7gou1u
         8JVKH3jFB9vhuysJpQxWzdLtT6Ns4Lr8+NriHgd9XbRp3idQ4o0S97UEjS9tpvrHGv+x
         bxbQ==
X-Gm-Message-State: AOJu0YxIt8j5pDkeZplX9b3z0V9vj81EeH2C97AmMR2Od9k+rYpglX1I
        XC4k0jpS3MRya9UkPworZXewBVzNFuZyO/lS9nM=
X-Google-Smtp-Source: AGHT+IF/sVg/Jhlijx/RE5QOgQaMgGYHCPyQMz8dSgQ4an0cId67kpg37dk0nwOSpbyiFJyhIGgAng==
X-Received: by 2002:adf:fa4a:0:b0:315:9de4:92f0 with SMTP id y10-20020adffa4a000000b003159de492f0mr8496109wrr.5.1691507150251;
        Tue, 08 Aug 2023 08:05:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b003144b50034esm13863035wrs.110.2023.08.08.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 08:05:42 -0700 (PDT)
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
 <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: second batch of dt-schema
 conversions for Amlogic Meson bindings
Date:   Tue, 08 Aug 2023 17:05:12 +0200
In-reply-to: <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
Message-ID: <1jleelo9q4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 04 Aug 2023 at 15:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi Jerome,
>
> On 06/07/2023 16:52, Neil Armstrong wrote:
>> Batch conversion of the following bindings:
>> - amlogic,gxbb-clkc.txt
>> - amlogic,gxbb-aoclkc.txt
>> 
>
> <snip>
>
>> ---
>> Neil Armstrong (3):
>>        dt-bindings: clock: amlogic: convert amlogic,gxbb-clkc.txt to dt-schema
>>        dt-bindings: clock: amlogic: convert amlogic,gxbb-aoclkc.txt to dt-schema
>
> Do you plan to take patches 1 & 2 ?
>
> If you can, it would be simpler if you could take patch 3 in the same batch.
>
> Thanks,
> Neil

Applied all 3 - fixing the checkpatch on patch 2

>
>>        dt-bindings: soc: amlogic: document System Control registers
>>   .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 ---------
>>   .../bindings/clock/amlogic,gxbb-aoclkc.yaml        |  85 +++++++++++
>>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  53 -------
>>   .../bindings/clock/amlogic,gxbb-clkc.yaml          |  37 +++++
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
>>   5 files changed, 282 insertions(+), 117 deletions(-)
>> ---
>> base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
>> change-id: 20230209-b4-amlogic-bindings-convert-take2-e2caf8e1c13f
>> Best regards,

