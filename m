Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578DC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 13:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiCLNEz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 08:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiCLNEy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 08:04:54 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E150E3D1C7
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 05:03:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id l10so6664728wmb.0
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=F4ZxAMvdyayeBfKvb+RIOxNuxxzTOU9uY/N/Ir8tEVk=;
        b=pxcoqmCCYvT6TkWVajDPrCWVrrjGub2g1njqN41rRxE2cQoVVD0Hxj9u2bEKTfyMfA
         V/xkR7dLfCq/13/tSiu/BlYFUEni1Kl1O3uRap7oRjUoAYYg5wKnS3y/Zc7FDn4eZEqI
         iqkEUgsTaoOJigp9gAy43FQi3KJ8I/c27NowrUPreyBfLEtF4sPNir79r+zW04VIkN+K
         c7pt3ezm+dfpABNb8YmzRiFp1xfa2lNG5Ko4yKo1qDojg5K/9Yg3Pi+gjaO+1a1Hxo0x
         tQ4O9yb+m1PSyZcCKa+Zn69olwiwPRSAsoLZs6BkcxxIk9X/kDCDh5Xw0cbpMSwlsY8g
         V62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=F4ZxAMvdyayeBfKvb+RIOxNuxxzTOU9uY/N/Ir8tEVk=;
        b=YB1yfLEozDOa1fqqDLmTc+YPhs6f1XX4IBxnkVNInM+iTB14Mb3srgAgI9cB4T56wy
         PXTZwQYB23VacDX1jsPgTiktFXe7aPeXV12dJFGlNJJtT03MUYMbcZyiVmMHlM6A0+Me
         AP8Za1cYgCQ9lPsrtNyVOThzGHnc0TU4H6xg7GeBvCccl9h9Jh3I/N4YhORZpox+bXuZ
         wd/tH32uxrCjiSS8F4rC4rMGOeEP7nkoeuU2optuOVTbf/saxC2vUvp8ytHH63dFfOEf
         HW9X0u/ZxrxuirpqsoNV+bBpnapihbSncxSF04D0M2o7iX5eOaCK7qZHF6sum9GMhJPI
         NB8w==
X-Gm-Message-State: AOAM532sY7R46Op8a6Qp8Q7IJs6k64R85gdLgS10YYU/WMpjTERVIAKc
        cWZ4bAoVKLoVZKwKdrRKEOmObg==
X-Google-Smtp-Source: ABdhPJxUGmG844w1SIPn3JsQVTzy6w7HV63dr1JeVPmdac+rE5PxCxyYoZd2BF5SK/sNa3jOBghTdA==
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id n16-20020a7bc5d0000000b00389fe853d79mr1803275wmk.77.1647090226367;
        Sat, 12 Mar 2022 05:03:46 -0800 (PST)
Received: from [192.168.2.222] ([109.76.4.19])
        by smtp.gmail.com with ESMTPSA id v124-20020a1cac82000000b0037c3d08e0e7sm12862918wme.29.2022.03.12.05.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Mar 2022 05:03:45 -0800 (PST)
Message-ID: <05e2fa13-163f-e6ef-4cf8-be6de513f068@conchuod.ie>
Date:   Sat, 12 Mar 2022 13:03:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/1] clk: microchip: Add driver for Microchip
 PolarFire SoC
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        david.abdurachmanov@gmail.com, palmer@dabbelt.com,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        Padmarao Begari <padmarao.begari@microchip.com>
References: <20220222121143.3316880-1-conor.dooley@microchip.com>
 <20220222121143.3316880-2-conor.dooley@microchip.com>
 <20220312033230.5CB87C340E9@smtp.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220312033230.5CB87C340E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 12/03/2022 03:32, Stephen Boyd wrote:
> Quoting conor.dooley@microchip.com (2022-02-22 04:11:44)
>> From: Daire McNamara <daire.mcnamara@microchip.com>
>>
>> Add support for clock configuration on Microchip PolarFire SoC
>>
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Co-developed-by: Padmarao Begari <padmarao.begari@microchip.com>
>> Signed-off-by: Padmarao Begari <padmarao.begari@microchip.com>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Applied to clk-next

great, thanks!
