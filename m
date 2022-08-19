Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1818EC32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 13:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349373AbiHSN2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 09:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349359AbiHSN2n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 09:28:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EDF5508E
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 06:28:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q7so2450738lfu.5
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=dP94wt5jHiSTgYi6J94tIJEwZ2nFwZSjrOFlQEqy3Jo=;
        b=tQL0p9TlZIZHpUyp5n0TdCgLom+rIFjCY8pfenGQq1i5z8DPqE3DEvdkvtkmngn5UB
         oXVrWU04KLVWV02GJBFIkfP8MjHg+j2C1H0uvUztWMSWLcl1ddnD+92noIrgqu6kBRtr
         gae/QRIh4uPRnFuAiHfavmYZH1AgdbK4xGqhNsmqsdc+/QHZQFgRnuELIz29ws7/Z526
         P4evt7hgUVNdMG3UMa8U5ZmvX4NSQ4ATp/7RFWf70AIyDgfhUfrZDTuiAHEvBv6vrCYq
         bQSXsekwDNUkEsWzjxdO56uz8GY+EibdrpxR5w0o6hTFIuSygU97V7JUJBvR8Tp5420j
         AmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dP94wt5jHiSTgYi6J94tIJEwZ2nFwZSjrOFlQEqy3Jo=;
        b=bfoI1dVBe5LuZXJmxxD4/nakn3Jx0vp4yzNFqExsFhKJrRcHSeBS9Wy0/tz8R0zp/x
         3E/FKLrFQbKHymeh0ZcNb2dO7RWeamAEV3u25LoFvNgp6A/8FqbQSsSuwTbhCHcmfesA
         AV0HRIFqVnxW8Dz9scjUVFysP8KGNiyvXqZeVKnK4quWfsOI/6a1ay4CtM0Ca5G1BfCa
         uqrhnhVms6psTMvjD6jac7QqzeaY0qx9POVpdoBUK/lreNZWkI27eVZhCVx+scuTgvLZ
         7zrY0xz+6v3hA9aULxk+1RvQkHlTeVxN++RVQVI28nceQcfhYT/bvAV15Nc1RITNnCih
         SM8g==
X-Gm-Message-State: ACgBeo2SDBOVFuDBfVPspCbx7GyEg6Xf91kgJGmgKhOxXSoSzZrKtguO
        wTQ0N64briNO2U5ZDTuYRa+vEg==
X-Google-Smtp-Source: AA6agR7+CjcoCzyQ0iEw8Zkc6jGXpE2KbHigR1mTCV62ktVNoaG2Wdly8C1vmhjPVwAVmjaNJp1ppw==
X-Received: by 2002:a05:6512:1399:b0:486:2ae5:be71 with SMTP id p25-20020a056512139900b004862ae5be71mr2393901lfa.246.1660915720766;
        Fri, 19 Aug 2022 06:28:40 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id s8-20020a197708000000b0048a891e4d88sm638853lfc.193.2022.08.19.06.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 06:28:40 -0700 (PDT)
Message-ID: <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
Date:   Fri, 19 Aug 2022 16:28:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To:     Conor.Dooley@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
        Daire.McNamara@microchip.com
Cc:     paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 16:15, Conor.Dooley@microchip.com wrote:
>>>
>>> +             ccc_se: cccseclk@38010000 {
>>
>> Although you call it "Clock Conditioning Circuitry", but the role of
>> this device is a clock-controller, isn't it? If so, node names should be
>> generic, so "clock-controller".
> 
> Thanks for the prompt reply Krzysztof!
> I suspected that this is what I was going to hear back. The reason I
> had used the non-generic node name is that I wanted to use it for the
> "name" of the clocks in the clock framework. As you can see, there are
> four instances of the same clock, and I am using the of_node's name to
> generate the unique names the clock framework requires, like so:
> 
> # cat clk_summary
>     clock
> -------------------------
>   cccrefclk
>      cccnwclk_pll1
>         cccnwclk_pll1_out3
>         cccnwclk_pll1_out2
>         cccnwclk_pll1_out1
>         cccnwclk_pll1_out0
>      cccnwclk_pll0
>         cccnwclk_pll0_out3
>         cccnwclk_pll0_out2
>         cccnwclk_pll0_out1
>         cccnwclk_pll0_out0
>      cccswclk_pll1
>         cccswclk_pll1_out3
>         cccswclk_pll1_out2
>         cccswclk_pll1_out1
>         cccswclk_pll1_out0
>      cccnsclk_pll0
>         cccswclk_pll0_out3
>         cccswclk_pll0_out2
>         cccswclk_pll0_out1
>         cccswclk_pll0_out0
> 
> Maybe that is me exploiting the "should", but I was not sure how to
> include the location in the devicetree.

Neither node names nor clock names are considered an ABI, but some
pieces like to rely on them. Now you created such dependency so imagine
someone prepares a DTSI/DTS with "clock-controller" names for all four
blocks. How you driver would behave?

The DTS would be perfectly valid but driver would not accept it
(conflicting names) or behave incorrect.

I think what you need is the clock-output-names property. The core
schema dtschema/schemas/clock/clock.yaml recommends unified
interpretation of it - list of names for all the clocks - but accepts
other uses, e.g. as a prefix.

> 
> I had experimented with a "microchip,ordinal" or "microchip,location"
> string property to do the same thing but I thought you/Rob might not
> like that - is location/placement on the chip a relevant property of the
> hardware? I'd argue that for an FPGA, where the user is the one deciding
> what clocks what, it could be relevant to some degree.
> 
> Knowing if a CCC is the north-west one has some extra benefits as it
> is co-located with the PLLs for the processor & has a reduced input
> mux range.
> 
> Any suggestions would be appreciated, even if it is just a NAK to all of
> the above!


Best regards,
Krzysztof
