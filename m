Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D830FC001B0
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 14:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbjHIOXl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjHIOXk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 10:23:40 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B6E1FD8
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 07:23:39 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe5eb84dceso25247805e9.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691591018; x=1692195818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wg6FOxvEEY9L/1IDbso6hZjk5snLMFSLKFKVthCzk70=;
        b=tzUoWCmu9Yd0MiB1ikHpKNW54D0sQmYgCrtM26sPuY+1bE9OG1zLPZWDtJe44OUiOY
         3N3AiZMY8lAjF57klVsolAid+GLWZz5rsf8y3rwQhZgwJTiqhGE9Gzoaw82DIxQUa7/N
         K2ckrJqa1vWs6YBHzfjk5LmFP4N+YMBByWj+Dj01b4UYQhmJaUvQhEsLWhKtvb0BY8JT
         Yos+eFL4kT5P00uFJLs6im/Boq5aBPl4R7FlKYFs8FolHHPDxkDI70376Ls/P9T2ExDf
         BZEv9cLu+QhxYMbtKOlAtvaB+MDi9zBFP9w3c+IjYsYyBgA7Hj/IQLV/GBB2iiQBlEdt
         H6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591018; x=1692195818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg6FOxvEEY9L/1IDbso6hZjk5snLMFSLKFKVthCzk70=;
        b=TpsFXsQYh0tZ4KwWnxZ5H5ToYAGQislkdqCXiwx4+ux4sAiL9I7CgeBDY4avWDfz6T
         eysElrbTxK3em1NrRe+ACUXGFzDKZ7iGNZLAz4EiclWZ+N/tzpNr3zhzunMqnJgM7Zf0
         6QRdULxehnnULCvlG7fHbaJgWJIPo2DIuf6h0OO08SDDxe3LSvLHIFrnQMWB1iIQbvOJ
         5zpawRGkyjujJ2NZenfVYYVeYgwUYzVCJKzn7uiVrnyNQOgUawPaLRWXbAkp/Qv+sA4B
         6nXdFm+Jkp9w00K60defw6XUh4bdenir1MOcLQZinyAcoYycFOBKGU/PlEW2Bv6vAMHx
         mszA==
X-Gm-Message-State: AOJu0YxqzV/eRwHVw+Ef1gZ0BGdBIBVmvbfzg6atMzwsedFRLsltT39B
        PWcCQY8zE9/X+jF+1lUSncv31g==
X-Google-Smtp-Source: AGHT+IHSQ27GTB70++fZ9IGftp7XmKQfx3A05O5KmkT0/u9uY06+p8pAZxpcSPRhaQklr8cocB6Cow==
X-Received: by 2002:a05:600c:22d8:b0:3fd:2e1d:eca1 with SMTP id 24-20020a05600c22d800b003fd2e1deca1mr2376394wmg.4.1691591018130;
        Wed, 09 Aug 2023 07:23:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm2210168wmc.0.2023.08.09.07.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:23:37 -0700 (PDT)
Message-ID: <4462f00f-f590-df44-97d0-a657b3da2559@linaro.org>
Date:   Wed, 9 Aug 2023 16:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <1j1qgcba54.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1j1qgcba54.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2023 15:46, Jerome Brunet wrote:
> 
> On Wed 09 Aug 2023 at 15:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>>> +      required:
>>>>> +        - '#reset-cells'
>>>>
>>>> else:
>>>>   properties:
>>>>     '#reset-cells': false
>>>> ???
>>>>
>>>>
>>>> You need to constrain the clocks per variant. Probably names are also
>>>> specific to each one, so the list of names can be moved here and you
>>>> keep just min/maxItems in the top level property.
>>>>
>>>
>>> input clock names and constraints are the same for all 3 variants.
>>
>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>> the same, then drop the oneOf and make number of clocks fixed.
>>
> 
> As I pointed out, this section is wrong.

Ah, I misunderstood. Looks good, thanks.

Best regards,
Krzysztof

