Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DCAEB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 08:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjFUIvg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 04:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjFUIvf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 04:51:35 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B091987
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 01:51:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-989d03eae11so112825466b.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687337493; x=1689929493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+VbF1k9dd0zR8M+O8v5QVhhHeg+UsKC97YqfD/3djKw=;
        b=W9VaK97xEUvQskcBtLs7tk+n04BFDJpXeUjX+cYAr5LnylC9aKil7zVrTudDVqQP9E
         QZrci0JsHWuz9APMU8guZZAB5tmazOoxXVYsUjZo+f98KuL53kagG+a65Xs7VosLrg9u
         DwJJCrqzh+8A5HeC5WzQ03Y7Pnn90Una0/AfV5usJcXGEJs0/xvQnL9XP6TS0uBi9hr/
         cpNj9UCp/sl9VqaN54jRvpz1X/faOwY+99aaSqpKrWqNib3tmRQU1tUMvoIQU3pBYF2V
         sFnxtV3SKWcLg2EUPXj7T6C5nH3MFV7Hhk7dnSgDW0Fy25RSnqbcFvcNqQIr9Z0Qv0HP
         s7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337493; x=1689929493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VbF1k9dd0zR8M+O8v5QVhhHeg+UsKC97YqfD/3djKw=;
        b=Hxm9J9RvWnnB1d4rwb0GVNv+JxXqmFmMxQcwLb3JhaV2NZWCwDi3IhvA9W86ESGiku
         QCuDZklV05SNcCpU8mUb6ukNnmSEZ0yZV9RzeFyeUzVUHeDG5IKWgDNv8sQkIrDtHkaj
         MUCiVKLFbPNswb6y2jWF0Z6IIbksSU4YVhXVwdjwzDAIJl+w6swEKsyJlPpjEaPwtMze
         eZ6qs+WjGUmQEya+22rY/EZTnhWBgbJ4K77iCzC03ryZyHvw4Ku0fkcD8kO3lXQoVXnM
         u89ZjRkJe+TRQRxv4jFRG1e9waz1RA7yjvJ3cyXd5GC13l+X4yefHI6aAqd/UiW56chp
         ZJbQ==
X-Gm-Message-State: AC+VfDxlQHR+6FV/A/w6f/VXMa5RhQE5Ad+9PN8+/MsD9VtNgRbYh1IB
        zN/w1fEelxXUNfGvTIo8VCpNWQ==
X-Google-Smtp-Source: ACHHUZ6Enbd+GNv/reZhivVW7l625b/Sh8RzonsXjZQhvpGhNFDvv98VDEanD/um4iUr3kXswgQAmg==
X-Received: by 2002:a17:907:2688:b0:988:4a48:6ff3 with SMTP id bn8-20020a170907268800b009884a486ff3mr9771237ejc.30.1687337492837;
        Wed, 21 Jun 2023 01:51:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709063a5600b00988e699d07fsm2746507ejf.112.2023.06.21.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 01:51:32 -0700 (PDT)
Message-ID: <2156ae79-e092-656c-c357-09807f622474@linaro.org>
Date:   Wed, 21 Jun 2023 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/18] dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm
 Krait SoCs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-2-dmitry.baryshkov@linaro.org>
 <5c750c6a-a0f8-c6f7-64fe-716da434d819@linaro.org>
 <678a3750-0a89-aedf-b5cf-e68da003f4a0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <678a3750-0a89-aedf-b5cf-e68da003f4a0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2023 22:11, Dmitry Baryshkov wrote:

>> Why?
>>
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>
>> You are changing the type. No. It should be fixed instead (enum applies
>> to items).
> 
> Currenlty this bindings are only usable for msm8996/msm8996pro. As such 
> we listed opp-supported-hw values that are applicable to this platform. 
> This series adds support for apq8064 platform, which will add new items 
> to this enum. I think it is not very sensible to list all of them here.

Sure, but this is uint32-matrix, so don't change the type to something else.

> 
> However granted there is already a good enough base type definition, I 
> think it would be better to drop the $ref, drop the enum, add ': true' 
> (is it necessary if we have a description already?) and expand 
> documentation.

Probably this should be constrained to only one value with:
  items:
    - items:
       - description: foo bar




Best regards,
Krzysztof

