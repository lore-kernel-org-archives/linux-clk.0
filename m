Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C417CCA47B
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 07:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbiGNHlH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 03:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiGNHlG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 03:41:06 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1578A1FCCC
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 00:41:05 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y11so1436396lfs.6
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HgFqzbnGex/viFGpubqhq0dmXVFonIW0bw0LdRvMvsE=;
        b=OGTPYuUdvmlcQPFyx/Kys+T0o68/AI6USKJuhqgcRdfIKPZ6C502xLBQbmnuv6+GNd
         mgxRDwBlLv0DJsg5GEiC+4SIXv+/wL9hYKCusTv0vpiLtIf8Q/Gk6zRlIeOzWTRuqnaS
         p4AQeE5WpvQbDOOTYHvg0vRFv4OG/2veUz7u62ICUQYzUO7DotDIRhLV2SdT4tZF7Anc
         crDkN08rWDTYmt6r8qkT7YjDRPzO5ZQOGvNr2EBm0udfvfnFV3PTBMmD1Ojo5WKk8lEx
         sWjBvzEl7xaMhv5pW/F3JEPWamnYWyWTjdaCcsY2znAZ1gPfxF5d8gOdi9ni424QV3kT
         z7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HgFqzbnGex/viFGpubqhq0dmXVFonIW0bw0LdRvMvsE=;
        b=6CkDoXyJRp0RjL3RV5sVF3DJV9FPFZpnV20AYliyUeONWNPiMwGlehyAwsRN/EIDgv
         yK2vHYT/hrSX0J4ESKexxsE32AJRfraa/vSJRv72DgmV9i8pRDR45Rsjbc0MarWDNSb2
         9x2IKiWf3WC35V5uSv44q8bSbjBgAhvK1jVE5DsOJ4VCbGNHvQ3/FBqY+Bx9slpNsGRr
         4GxNeMTTkAfFbEmSJmnKjn+AUCPM2JWZP79B/TXAzmpVhqS5krOifPCs2ZcONZtin7Ck
         fcpFH9Cty4nh87FBcosrUuTe26fiZr7HyGHcWuPkIOfnzDci6OM+rnsV80t9iKyXVsKf
         wXBw==
X-Gm-Message-State: AJIora9so2I1nw6i5WOvKydM4kEj3d0cDquEBRE7M3xek3Sz50nA8a8t
        YXGhQp9mxhvhkWjhHOd4HlPxqQ==
X-Google-Smtp-Source: AGRyM1vUem2jmxH1oSZWWgvjndTc6uWdIU3yhZJH4Ldw9SB3oVGbaxs0KwY0Wq1OLiYV1H7G+pd3jA==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4134 with SMTP id h3-20020a056512350300b0048144704134mr4340287lfs.42.1657784463417;
        Thu, 14 Jul 2022 00:41:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j8-20020a2eb708000000b0025d696f5fe6sm135783ljo.73.2022.07.14.00.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 00:41:02 -0700 (PDT)
Message-ID: <50ce334b-4c13-1eb3-0e6e-96c9ccee7e1d@linaro.org>
Date:   Thu, 14 Jul 2022 10:41:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
 <Ys85KUGnlXlUI+zE@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Ys85KUGnlXlUI+zE@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/07/2022 00:29, Bjorn Andersson wrote:
> On Mon 20 Jun 06:07 CDT 2022, Dmitry Baryshkov wrote:
> 
>> Add pxo/cxo clocks to the GCC device tree node.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
>> index 47b97daecef1..61e3ab0ebfd3 100644
>> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
>> @@ -50,13 +50,13 @@ cpu-pmu {
>>   	};
>>   
>>   	clocks {
>> -		cxo_board {
>> +		cxo_board: cxo_board {
> 
> As requested by Krzysztof, please use clock-output-names to specify the
> name of the clock, and rename the node "cxo-board-clk".

Actually I believe Krzysztof agreed (and acked) this change, as it 
follows the example of existing boards.

> 
> Thanks,
> Bjorn
> 
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>>   			clock-frequency = <19200000>;
>>   		};
>>   
>> -		pxo_board {
>> +		pxo_board: pxo_board {
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>>   			clock-frequency = <27000000>;
>> @@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
>>   			#power-domain-cells = <1>;
>>   			#reset-cells = <1>;
>>   			reg = <0x900000 0x4000>;
>> +			clocks = <&pxo_board>, <&cxo_board>;
>> +			clock-names = "pxo", "cxo";
>>   		};
>>   
>>   		gsbi6: gsbi@16500000 {
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
