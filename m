Return-Path: <SRS0=ZQGu=NT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77522ECDE47
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 14:42:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35B0E2081D
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 14:42:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lqcukAS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35B0E2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbeKIASW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Nov 2018 19:18:22 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44028 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeKIASW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Nov 2018 19:18:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id y3-v6so21215772wrh.10
        for <linux-clk@vger.kernel.org>; Thu, 08 Nov 2018 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Qd7s6NAnXFGgIegSPddEyWYm7lfPYzqV1BsL+L4tcN8=;
        b=lqcukAS0BOvoQu605p8Ijs/NSzV4NXTonaBJY7rDumeasNxOiMh4P70oLZoFwhyP0X
         0w+IuBpZpu8e92ZnhJUYl0/ailH6+onLfT41uPYgUUZxDo5yCIv5pjcOvzBEjha7dPI7
         +VlGH8xaphn1Rt5BqHhv+klfSyPlfUDE52aMu1y+R/89B3WizekXDMPoNKJVNum1/can
         UWfaCORziT5JhZghlRrc7kMwfijfxbDJ+MfBwTA1lH0etTMpyeI7aEnTiAYTkfBqGIC2
         mi2fdPzteQc2ap5Xal5crCtBDV/RZhoZd+ySj2bBo6y+VpwmQK6hbiPaKmItuvYqGGJw
         iSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Qd7s6NAnXFGgIegSPddEyWYm7lfPYzqV1BsL+L4tcN8=;
        b=eJ3i/qtFnVE+fvUuBNZa9VE0v6GgVoKAWLA7ESNbvFbiO3pPlbOU95jJ5WxIgZCWxh
         NYxZrm3Fu/iH+8uavg/oLWneP++N+P77JEs7E4pduJVTVgdeghCrs63cTA5rKiSbyb0a
         moktiahZhF1+LU/QG2nKeBa8QC9QW/4kYMNgHBeZCNUy84UmM84Ur342Zw/mSoP0dZAs
         lI9fsFI3zdSkJ8E6RlpTASz3q8SThHjlMFM1EfCSkBlvs+dJ7wyCyhOjVlt67E6/qyyk
         fcFrV1AKi1LI3okXioDf9wiBd6b0Jg6WZ1GIA14z/Nnq3f5/uv8mkJrrpOPKtoyAhy6N
         qgvg==
X-Gm-Message-State: AGRZ1gI7Bq+W4p02wbCt++QZV1AO8uLdBrkm1HuR1UZJAzD2ycPwFCaS
        c24G2ly3588BUVonlUvTCt3OA8RNgbM=
X-Google-Smtp-Source: AJdET5cYSYqIzyQ1y3Ne24W/rc5/GiPd9T+1H9Oop/h9SugX0UHZusxjlSM+WkcZYOP2AmD11hGTjw==
X-Received: by 2002:a5d:40cc:: with SMTP id b12-v6mr4699659wrq.133.1541688151775;
        Thu, 08 Nov 2018 06:42:31 -0800 (PST)
Received: from [10.1.2.12] ([90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x11-v6sm3566700wmg.14.2018.11.08.06.42.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:42:31 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
To:     Chen-Yu Tsai <wens@csie.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181030221310.GA22640@bogus>
 <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
 <CAGb2v65L4Sq1Fxqyffq16Zpamv=WosgvCaXdVYH6ooLLmHW0SQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <5440e173-3bd1-9ce2-ea9e-cc95b909d4a8@baylibre.com>
Date:   Thu, 8 Nov 2018 15:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAGb2v65L4Sq1Fxqyffq16Zpamv=WosgvCaXdVYH6ooLLmHW0SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/11/2018 11:20, Chen-Yu Tsai wrote:
> On Thu, Nov 1, 2018 at 6:10 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hi Rob,
>>
>> On Tue, Oct 30, 2018 at 11:13 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
>>>> The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
>>>> as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
>>>> There is a register area called "HHI" which is used for multiple IP
>>>> blocks of the SoC:
>>>> - the system clock controller
>>>> - a few reset lines (there is a separate reset controller, these reset
>>>>   lines are not part of the other reset controller). this reset
>>>>   controller is currently implemented in the clock controller driver
>>>> - a HDMI controller
>>>
>>> Does this have it's own clocks, resets or other resources?

[...]

>>>>
>>>> The first three could be implemented with a single node (either in one
>>>> big driver, or using a MFD driver which would register function-
>>>> specific drivers).
>>>> However, the TSC data is a big problem, because the ADC has it's own
>>>> set of registers but needs to write one bit in the HHI register area.
>>>
>>> Generally, that would be solved with a phandle to the HHI and maybe an
>>> offset cell in the ADC node. I don't see why that's a big problem.
>> this is what I'm trying to do, see my dt-bindings patch for the SAR
>> ADC (which is used to read the temperature sensor): [0]
>> my understanding was that I should go through syscon to avoid double
>> ioremap() of the same register set (the clock controller and SAR ADC
>> would have to do it).
>> which APIs (other than syscon) would you suggest for this case?
> 
> I would suggest avoiding the syscon API when you have other drivers going
> through the same register space. You can do a syscon like approach by
> having the HHI driver register one or multiple regmaps, with appropriate
> access controls, which other drivers can fetch using dev_get_regmap() (via
> a phandle to the HHI device). I don't know much about simple-mfd though.
> If the registers are neatly grouped together by function it would be easier
> to deal with. Or you could just have one device node with appropriate cell
> properties and have a big driver register all the functions. That driver
> would likely live under drivers/soc/.

Well, it's the role of simple-mfd, when you only have plaform-tied sub drivers,
and it's over-engineered to write an MFD driver for this.

At some point, we should move forward with this since it's a "system controller"
specific mapping, and "syscon" was designed specifically to solve this kind
of mapping in DT.

The other SoCs (GX, AXG and G12A) uses this exact DT architecture to solve this
issue, and we should use this same schema for other Amlogic SoCs even if it's
not the most perfect way to solve it.

Neil

> 
> ChenYu
> 
>>
>> Regards
>> Martin
>>
>>
>> [0] https://patchwork.kernel.org/patch/10658557/
>> [1] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_hw.c
>> [2] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_reg.c
>> [3] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/include/mach/register.h

