Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3627CC761A6
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 09:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjCUJDA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 05:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjCUJCk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 05:02:40 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7D037567
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 02:01:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id cy23so56665198edb.12
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679389285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxUfjmrR83f/eWKndlnoluEe9nId5yJ0ezW/bbuG6h0=;
        b=QrqVwWfMHhBDDVkhZb08b4C9opfPLvw6XgpI4yRRjBBBah8tfxR/5r1UDwEYf79f4s
         l6cyMi0Grsz0KhSGbys7wLQwD5skmTWmlttKLbu66ATdpqm8bPPTcG0UoWVq3mVR1Is0
         +BufFTJzbleB0ihklKHhPTXvlIoowvMPZ55EM1BnS+NDD5u8nUZOmpE3l41ny0PPLD71
         fEFZI1rKD6ClFDkeIpS9WP3mc6F01+852YXO7ciCjzxyLGeZZmS7KInMp1cTnmsP7zTE
         hmNvBBRoyG6LqmU0YbMToZK1/xkbPPCoFbAM3ca9tLKgWavo+q7ueHY3KJjIQWoJiO69
         luWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679389285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxUfjmrR83f/eWKndlnoluEe9nId5yJ0ezW/bbuG6h0=;
        b=4XZcxn32mOoeW+NCCAsgTWUl4Fx7u86vgVjSfPUrCj8VLCCvv0yjB6FBzNYTKV5cud
         v+b2BJbioKDXzdoMiCuFIlnmBl1nP+E9Qgl4YbNo/pYvyesBskXpLmHW92uuV+K9wVj4
         cls/LWuAR02Ol5kLF8qdn19L2JVlHSHjIiAbvllx8DEEamJibyeWqT/KSmRHujBaVuGA
         mWMypxXzLoX77uITshGcir4+D9idSPOJS72Rxf+hsk9+N2oT8R12KPVGztMuGBnUvdUM
         KxnV4MkKgvpM4GAiZYMZf9jIinVyGubNgN4lfFImQIY0UZaNhGHZEocrGaMFo5eWnvES
         r8ZQ==
X-Gm-Message-State: AO0yUKVIkUx7eZGmheFBLxTeQpry/CpKl9Z55QHxJo8JTwHjXovm1ACT
        XkTJasgGGbXQWJOTudMT2TUiBg==
X-Google-Smtp-Source: AK7set94TVmcohbUjC/oW4eo6etAi9vYBb0C8oqRM6UySprXJ+vAZbtzQRT/D6SgvMMcPGXe0JCudA==
X-Received: by 2002:aa7:d68d:0:b0:4ac:bd84:43d8 with SMTP id d13-20020aa7d68d000000b004acbd8443d8mr2523886edr.8.1679389285674;
        Tue, 21 Mar 2023 02:01:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id d28-20020a50cd5c000000b004fbdfbb5acesm5969966edj.89.2023.03.21.02.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 02:01:25 -0700 (PDT)
Message-ID: <9f8e7a74-35c6-6db5-4960-1efa79a23983@linaro.org>
Date:   Tue, 21 Mar 2023 10:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <bdc82b4a-f1a9-0372-5a57-200a422b1b70@arinc9.com>
 <21a90597-78c9-4d46-7b01-257702e7afca@linaro.org>
 <525a6388-a4b8-3052-fe81-5aa21d8f424a@arinc9.com>
 <507f79cf-acd8-5238-031a-fd71024e0c6a@linaro.org>
 <CAMhs-H8_S5eO7B+dZ7jeq7Jjnw71QBmSo4M+woe3U5sH7dCADg@mail.gmail.com>
 <39ba681e-5bab-cffc-edf7-4bf86387987c@linaro.org>
 <132de602-6467-536c-c66d-657f22a59bd5@arinc9.com>
 <40e3acac-b58a-7af8-b025-3678f84434da@linaro.org>
 <CAMhs-H9AWXvtbg=qz06HN3piUO0E5YF3RmrdRLC7qH2n6KjrSw@mail.gmail.com>
 <d598f5f8-f998-2a31-bb21-97e641793dda@linaro.org>
 <120663a9-aecf-4a43-d1fb-779cd52802c6@arinc9.com>
 <3d2b8a1a-99c9-f53e-4bb3-a8b938e2672f@linaro.org>
 <543ad00d-4171-ed02-0d31-676c6b003e54@arinc9.com>
 <82f517b5-6697-3379-8d71-163b0d17735d@linaro.org>
 <d640a929-b6a0-1552-e66a-3a7bbabbc69f@arinc9.com>
 <2150938b-5433-6f51-c404-2c0f6976f864@linaro.org>
 <1c279b0a-c814-2fe3-0432-2aa6b3dff16e@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c279b0a-c814-2fe3-0432-2aa6b3dff16e@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/03/2023 09:53, Arınç ÜNAL wrote:
>>
>> I do not see how choosing one variant for compatibles having two
>> variants of prefixes, complicates things. Following this argument
>> choosing "ralink" also complicates!
> 
> The idea is to make every compatible string of MTMIPS to have the ralink 
> prefix so it's not mediatek on some schemas and ralink on others. Simpler.

Which is an ABI break, so you cannot do it.

Best regards,
Krzysztof

