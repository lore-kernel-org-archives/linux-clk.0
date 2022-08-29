Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F3CECAAD4
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 09:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiH2Jph (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 05:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiH2Jpf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 05:45:35 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EB62CE3F
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:45:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso4118170wmb.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:from:to:cc;
        bh=fEw88egTf3n0WTxLSAsw2MCw2Md2Dd4XGwp5wqMSg0E=;
        b=DwxDMo+IMLmKaXg/GER2cKmuOn7dWteIo52dvOH/RD7vw7Uh7Vz/yGz0pH5Je/yzKk
         1qal1Nxmkh+wMeSF9lKRyM14qNMjFMtmX1+ZD9lAgoSgetgNt15RTNPjjMH67WQExw5O
         FJjhHT15HricLe7QIdVxc0JRNsPMapAOoKsAnO3wlKxBlut82KQ7CdT7YxejErHAkII4
         eb3wMj5H7HYiC0XggRvhqjI0un9eq92+QXG861izN/l8tN8OaWwGiFiJGdXW+mZT+paJ
         jhD9cD4KTKtMHLrJ0ndcwJztmLJFnr57VZa6aXFXV1HQGGJ1DAsVp/Or9S4hgxeKEGcN
         quoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
        bh=fEw88egTf3n0WTxLSAsw2MCw2Md2Dd4XGwp5wqMSg0E=;
        b=Lz9PiDy1InmRQOqu2X84POP6D8d/GXRysuDXJk6ggRNvdB/152I8cs37tLRQRzEvg1
         Tv4AK3ezadbohxYFA9PAb2a9FNtYWyR0Klu/OZvo8lI2aXszLNXIYyvH7/viM02Lx1Yn
         Dv39JdzGa+zr/yLnohmVKWyAs2CkNd3XMRc8PJC9XVWOcGJNKDfoCzie61T93Wcskd0D
         emvdughd501ICh+SPsnhLibwEYfBI/iQQbpvePSZJXTsqRg1j95z8TAwTgON6Mqg9BqI
         E3xpWfY1r8vs76wTJAPhsEWko15RGu7Q7QaHm3MNiDLk4O9hQ+Bg0w3WYWT3pzpstiKO
         0gBQ==
X-Gm-Message-State: ACgBeo28JELPIRyFk8P9f6NbjPjSLzxo/MaldprMpT9HRzvc3Zk7WXPa
        6WMoMPT6+eySrRD1ZLfj6Ib6Bw==
X-Google-Smtp-Source: AA6agR7V29Ev8Tjiea8ZG9KuxzLha718wql0Sq8Ph0UsiqYwTHvcN78mFkUWvyy69pfvCkHGvNHM6w==
X-Received: by 2002:a05:600c:28c8:b0:3a8:40bb:be4c with SMTP id h8-20020a05600c28c800b003a840bbbe4cmr3795642wmd.28.1661766326649;
        Mon, 29 Aug 2022 02:45:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q3-20020a1ce903000000b003a61306d79dsm8616834wmc.41.2022.08.29.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:45:26 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
 <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
 <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock
 controller in DT
Date:   Mon, 29 Aug 2022 11:43:43 +0200
In-reply-to: <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
Message-ID: <1j1qszv0wa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 15 Aug 2022 at 14:17, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Jerome=EF=BC=8C
>
> On 2022/8/10 21:32, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 05 Aug 2022 at 17:39, Yu Tu <yu.tu@amlogic.com> wrote:
>>=20
>>> Hi Krzysztof,
>>>      Thank you for your reply.
>>>
>>> On 2022/8/5 17:16, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On 05/08/2022 10:57, Yu Tu wrote:
>>>>> Added information about the S4 SOC PLL Clock controller in DT.
>>>>>
>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
>>>>>    1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/b=
oot/dts/amlogic/meson-s4.dtsi
>>>>> index ff213618a598..a816b1f7694b 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>>> @@ -92,6 +92,14 @@ apb4: apb4@fe000000 {
>>>>>    			#size-cells =3D <2>;
>>>>>    			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>>>>    +			clkc_pll: pll-clock-controller@8000 {
>>>> Node names should be generic - clock-controller.
>>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-dev=
icetree-basics.html#generic-names-recommendation
>>>>
>>> I will change to clkc_pll: clock-controller@8000, in next version.
>> Same comment applies to the binding doc.
> OKay.
>> Also it would be nice to split this in two series.
>> Bindings and drivers in one, arm64 dt in the other. These changes goes
>> in through different trees.
> At present, Bindings, DTS and drivers are three series. Do you mean to put
> Bindings and drivers together? If so, checkpatch.pl will report a warning.

Yes because patches are not in yet so there is a good reason to ignore
the warning. Warning will never show up on the actual tree if the
patches are correctly ordered.

>
>>=20
>>>> Best regards,
>>>> Krzysztof
>>>> .
>> .

