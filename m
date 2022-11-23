Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F86AC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238212AbiKWOMl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238090AbiKWOMg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:12:36 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ADCCE1
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:12:28 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p8so28294140lfu.11
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpScT/PLZhW9m/mc8mS4KdOL1HgAD8oZWMFJX7jIr5M=;
        b=dVw7XBd3kFmPkaiQVhTxkTxRTXfXPM2I5cBO1BHdipcu1xZUATDW3nqvCXHSJHNjkG
         Saq4PQcGqWeTRcsEBw+SoTuEWDyarGTLZS7tyefqZMUT4tfAG9qNjBQPdJBzFFJY4zde
         cq8lLYQqft+3Pp6JhU7YBgBAml7uUKP+8lhWRS2CHTvlFdzTn9QKPaEYPncuHSTY+0Ac
         caMiN5HuJTr7cdk2bBZ+dfO+1kewrN6lfF/PGFTWzkY4N0mMTvZVvDnotGyjVaZ+DeUz
         7jVx5CyB8Iq+8PCQgVa0WFVeihPaEtKsmTU7HmeJ02eGcdn3/yvIDo5oy20WEkfdX0LD
         lVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpScT/PLZhW9m/mc8mS4KdOL1HgAD8oZWMFJX7jIr5M=;
        b=MyJvb4oFLI3CGBkWHJm/G+MqBpx8CHE0pAJ+VT7mRMG+YkXbhlUlp67Z7hcn0HWrzm
         pywO+tCqj2YLJqOqQ4jW/UeGq52FKRMF+03RtWywx8936m6ivCpdt/Elx0AqOWvA9mu6
         o9rMGP0F6n8Bmw6+OsDKfOrplk7W9/2CFf25sPcwmQ4CLOY+4NgiFgsVcR7YO5oKJlcp
         +8gcTXY9J07sizg2TTNgZBD5TTAJgzACIi1X6uSD4U5VdAqpTtGxYLyzdr0meLON0Qyj
         Dd6MxIyyX0vbO8s1KpSyzXMQHerPuakrTJir0cXWVi3D1/DT2MvN2Nomk26U2OAAJGPh
         PkKw==
X-Gm-Message-State: ANoB5pmjektsf8Hh29S+bEL+JlLCROybgVSg7z8YMNpM1SXuqk3cnBfh
        0bDyhI8CKDBFd5Gl/4iD3jc3xQ==
X-Google-Smtp-Source: AA0mqf65irOcr+aB/hyQQfJeHM7Hq1+nPrF12N6FMB1oep9oKnjE/+MQX7mNMHiHEpGS4c3FQkZxMg==
X-Received: by 2002:ac2:4209:0:b0:499:f8e4:6dd0 with SMTP id y9-20020ac24209000000b00499f8e46dd0mr9925093lfh.162.1669212746994;
        Wed, 23 Nov 2022 06:12:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s29-20020a19771d000000b004afeacffb84sm2899160lfc.98.2022.11.23.06.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:12:26 -0800 (PST)
Message-ID: <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
Date:   Wed, 23 Nov 2022 15:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
 <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
 <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 14:23, Yu Tu wrote:
>>> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch
>>> has no obvious style problems and is ready for submission.
>>>
>>
>> This is a checkpatch output. I am talking about DTS broken. dtc should
>> warn you.
> 
> Do you mean I will have wraning in compiling?
> I actually compiled without warning.
> ccf$ make ARCH=arm64 dtbs -j12
>    DTC     arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb
> 

Nope:

../arch/arm64/boot/dts/amlogic/meson-s4.dtsi:105.35-127.6: Warning
(unit_address_vs_reg): /soc/apb4@fe000000/clock-controller: node has a
reg or ranges property, but no unit name

Test your patches better before using reviewers time for trivial
compile-time fixes. The same rules for C code apply for DTS.

Best regards,
Krzysztof

