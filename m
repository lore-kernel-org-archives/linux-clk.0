Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99001C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 06:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiF0GqK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 02:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbiF0GqJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 02:46:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83969559B
        for <linux-clk@vger.kernel.org>; Sun, 26 Jun 2022 23:46:08 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u12so16966217eja.8
        for <linux-clk@vger.kernel.org>; Sun, 26 Jun 2022 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ADBX8pzB7I4NVaAI/SWhyMsSxZmAZE/UmxR90sSNn3w=;
        b=PuvvswSYGXHqs6gwAEwQpzWBAPQ0IpC9CnKE5r81hf2Si6B5l5738Css0MpGyYsoCx
         hVygkdwfayTMifPN5OMvV40xwI4c5U/8apZQh2diqpRWr+2JHmenjtU2P2MJOEvLBeAS
         hPtZZB44xXiRi1K6OC8FOgn8tib49180cgozu//0nBp6q95byr+poBjwAkPht8kk4TQv
         RN+ddVIdoLUxNcgt8dImlfoJhB5RgpIpQKSP+Lp22zzvjV6ouIK1dQD2O8cxy1N8v/Yh
         bbWsQONEmY63t9fX/VvPRqaouz5zHYKDbs5L9kHLA0OWS80v2IdsnymDUAqZAHXDAiCb
         dXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ADBX8pzB7I4NVaAI/SWhyMsSxZmAZE/UmxR90sSNn3w=;
        b=D3vpIedd2zPV54ckyqb0V2flTYbCaRuly1rjYKk3t7Vy3XdeU+fC2xpi6Hzof08omt
         nN5S8/yZoUhV9GJFRnAJIoOpgY/CfF9uO5NBDWxj3sr/hfD+uQwBobnKQEAh4bZonrvP
         zbkjCDedWVCkVtPhKUoGhKYaMiIPng9mVXrB/3BiRl0NND9FCILwUC3HRzOUqRQMnDQm
         gUuucJ6iotPwbj/s5UdAG5C4TIa5RKBnwIYtLY70JsVB+Dc9vkAuaXRtc46Gk4JLezoA
         STirA3JQCHpDLcLz+lzA6AQMhlihm9OstxiUGOjdBFhXKuj3vydqKgxR8HWVxjQ8XGnR
         a1rQ==
X-Gm-Message-State: AJIora8kwdB2N+e8yiqJKU7gpj8I5MELxB/8PLcg7+ukrHwvb7ZTTWk0
        qLvC/iGY9Z1Q/aXQoVqP5r8a7Q==
X-Google-Smtp-Source: AGRyM1vTDdRRHIDDxqaXUnByiIT8mDOmWurINlYJm6kz/6G9IyK97xle0oFuXHZrrn/3ao5xz2XK2w==
X-Received: by 2002:a17:907:7678:b0:726:9fca:8106 with SMTP id kk24-20020a170907767800b007269fca8106mr4586490ejc.640.1656312367106;
        Sun, 26 Jun 2022 23:46:07 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jw14-20020a170906e94e00b007263481a43fsm4305504ejb.81.2022.06.26.23.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:46:06 -0700 (PDT)
Message-ID: <97bb42c0-725f-3611-ff3f-0c7344aa0a00@linaro.org>
Date:   Mon, 27 Jun 2022 08:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] dt-binding: clock: Document rockchip,rk3588-cru
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>, kernel@collabora.com
References: <20220623160329.239501-1-sebastian.reichel@collabora.com>
 <20220623160329.239501-2-sebastian.reichel@collabora.com>
 <0841741a-22f6-40f6-c745-6065dfdbcb1d@linaro.org> <8081469.T7Z3S40VBb@diego>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8081469.T7Z3S40VBb@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2022 08:14, Heiko Stübner wrote:
> Hi Krzysztof,
> 
> Am Sonntag, 26. Juni 2022, 22:27:41 CEST schrieb Krzysztof Kozlowski:
>>> +#define PLL_V0PLL			4
>>> +#define PLL_AUPLL			5
>>> +#define PLL_CPLL			6
>>> +#define PLL_GPLL			7
>>> +#define PLL_NPLL			8
>>> +#define PLL_PPLL			9
>>> +#define ARMCLK_L			10
>>> +#define ARMCLK_B01			11
>>> +#define ARMCLK_B23			12
>>> +
>>> +/* cru clocks */
>>> +#define PCLK_BIGCORE0_ROOT		20
>>
>> These are abstract IDs, not register offsets, so no holes, incremented
>> by one.
> 
> I do believe Rockchip nowadays creates these automatically from soc design-
> documents. I've looked up the thread in [0] as this seems to have started
> with the rk3568.
> 
> So these are in fact not created as abstract IDs, but are part of the SoCs
> manual.
> 
> [0] https://lore.kernel.org/all/b663994d-853b-4474-bd77-a444317bfffb@rock-chips.com/

Nothing stops Rockchip to change the tools to generate incremental IDs
without holes, right?

> 
> 
>>> +#define PCLK_BIGCORE0_PVTM		21
>>> +#define PCLK_BIGCORE1_ROOT		22
>>> +#define PCLK_BIGCORE1_PVTM		23
> 
> [...]
> 
>>> +
>>> +#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
>>> +
>>> +/********Name=SOFTRST_CON01,Offset=0xA04********/
>>> +#define SRST_A_TOP_BIU			19
>>
>> What are all these? Bindings should not store register values or offsets.
>>
>> Also, resets go to separate header.
> 
> I think the comments are misleading, these are not register offsets.
> 
> Which in turn is a set of registers SOFTRST_CON0, etc containing the
> bits which to toggle to soft-reset individual blocks of the SoC.

So these are IDs used by the driver, not hardware? Then they can be as
IDs as well, don't they?

> The CRU (clock-and-reset-unit) always also contains the softreset block,
> so they have always been part of the cru dt binding as well.

Separate header under reset would still be part of the CRU DT binding -
I did not propose change that. However why storing reset IDs in a clock
subsystem binding header, instead of reset subsystem?

> 
> 
>>> +#define SRST_P_TOP_BIU			20
>>> +#define SRST_P_CSIPHY0			22
>>> +#define SRST_CSIPHY0			23
>>> +#define SRST_P_CSIPHY1			24
>>> +#define SRST_CSIPHY1			25
>>> +#define SRST_A_TOP_M500_BIU		31
>>
>> No holes, but abstract IDs incremented from 0 or 1.
> 
> The IDs are not abstract but instead do describe the location of
> the reset bit inside the soft-reset register block.
> 
> For reference see drivers/clk/rockchip/softrst.c and its
> 
> 	int bank = id / softrst->num_per_reg;
> 	int offset = id % softrst->num_per_reg;

So these are register offsets, as I mentioned before. Bindings are not
for this, this is not the purpose of binding headers. You do not store
as binding headers GPIO numbers, IRQ numbers, block unit addresses,
right? There is only one case such offsets make sense - firmware also
uses them and you cannot change it.

This is not the case here, so these values should not be in bindings.

To clarify - I don't ask you to change the driver, you can still code
offset like that. Just don't store this as binding.

> 
> And as we're doing this since 2013 this way, including these bindings,
> I guess it can't be too wrong :-)

I guess no one raised the question...

> 
> And they're probably also done via tooling.
> 
> 
> 
>>> +/********Name=PHPTOPSOFTRST_CON0,Offset=0x8A00********/
>>> +#define SRST_P_PHPTOP_CRU		131073
>>> +#define SRST_P_PCIE2_GRF0		131074
>>> +#define SRST_P_PCIE2_GRF1		131075
>>> +#define SRST_P_PCIE2_GRF2		131076
>>> +#define SRST_P_PCIE2_PHY0		131077
>>> +#define SRST_P_PCIE2_PHY1		131078
>>> +#define SRST_P_PCIE2_PHY2		131079
>>> +#define SRST_P_PCIE3_PHY		131080
>>> +#define SRST_P_APB2ASB_SLV_CHIP_TOP	131081
>>> +#define SRST_PCIE30_PHY			131082
>>> +
>>> +/********Name=PMU1SOFTRST_CON00,Offset=0x30A00********/
>>> +#define SRST_H_PMU1_BIU			786442
>>> +#define SRST_P_PMU1_BIU			786443
>>
>>
>> The numbering is getting quite unusual... As the value is not used by
>> the driver, it suggests it is some register offset or value, which are
>> not suitable for the bindings.
> 
> see above, it is used by the driver. Though it's still very much unusual.
> 
> Looking at the register offsets mentioned in the comments, the
> main block handling softreset-ids starts at 0xA04 in the clock controller.
> 
> And historically the soft-reset block has been a compact set of registers
> inside the device, though this time it seems someone tacked some more
> registers into the CRU far behind everything else (0x8A00 and 0x30a00).
> 
> So the IDs are in-line with the how we handle reset-ids currently, but
> I'm somewhat undecided if this counts as more of a hack.

These are not IDs but register offsets. You do not use them in a meaning
of ID. ID is a abstract number providing a mapping between this abstract
number and actual value. You do not have mapping here - you directly
decode this ID.

Best regards,
Krzysztof
