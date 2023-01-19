Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71ADC38159
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 00:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjASAi6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 19:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjASAi4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 19:38:56 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091885262
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 16:38:54 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id y1so810992plb.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 16:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pSJsyEuQeHOPQujX6GF/hc1kQvX/3d1HVOxLVeB5NM=;
        b=EbNzGLNE7LspsNHRUeA2YlT3UgmXKZeffa6bV9okWj3cd03C1F78DHJ3byO3HluS5X
         U9P4mYAxMdi4HCWA7dW9oMxsu0lQbEcm7uoRyyvK3Lyu8ls8LASbl45C1niy3/s47R8t
         3SKd3HlZX+zreMAT2e1GNSOwHzktglcV9BJDP9J0jb5Uhc4KMHZiT3YMhtTR+KLOB/KM
         aJHvJOfAeM6hH5hzQajWrXy3ErcWhWEaDLsKRALSOXGS1N3FvIQBYU/5GG6mrOWzCKY4
         i8xM7btP73LNWTw7kJ/RYbM6ZgG0EH/BzVRML1iMHjAMzauZCDfmwY26f4YBTKepGHdf
         6F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pSJsyEuQeHOPQujX6GF/hc1kQvX/3d1HVOxLVeB5NM=;
        b=PWnmjwHunJu3CxjUzbjXHsp5z1xfJi1QFaC5aMqL36ZEyppLASSUL6v9aySdH8BQOj
         Pi2FYNQuPZPvWs2SWoBYfTz7IDFPkSlcL47yczKT1TT59pHGu9mGcbUBm/o41+MqZ/EX
         1yC6V+UnX60IJf6hdD+MqfqHe6wLlrDsPMP48D+5CcX+YMB+uJdXgxx5reNClQyJmPG7
         8ssG2NDUu8HxF3U1ahp9fVjAcKrmArprDX8jZYwH1KFPXbtbHfUMKlzgFszWd5/wEAtE
         0EDIS40SuqGWoOY1oRqxm29+kG7QVsmoKOlyZyy3zCtbPCkPgjbpe3rikaVMDpkC/ctq
         kleg==
X-Gm-Message-State: AFqh2kpgsOeA8xSV1XPa47eofAZdJhhcQ/Tdsg/MUTyPiRSOXmpeyN9F
        DzbLeaNZXeRUiQlEawt8ydegJ4DDGkzFV9I8QGs=
X-Google-Smtp-Source: AMrXdXvQq9B8SMDm5SwwnnsawEcii6nO/KyhwuuoqAEsw3lR96thBWo5cUzxR1ocSmk1tWa47XsA5Q==
X-Received: by 2002:a17:903:41d2:b0:189:361f:89ac with SMTP id u18-20020a17090341d200b00189361f89acmr13118308ple.64.1674088733420;
        Wed, 18 Jan 2023 16:38:53 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709027e4100b00193020e8a90sm23531224pln.294.2023.01.18.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 16:38:52 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "kelvin . zhang" <Kelvin.Zhang@amlogic.com>,
        "qi . duan" <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL
 & peripheral clock controller
In-Reply-To: <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
Date:   Wed, 18 Jan 2023 16:38:52 -0800
Message-ID: <7hwn5jqrxf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Yu Tu <yu.tu@amlogic.com> writes:

> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:

[...]

>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> new file mode 100644
>>> index 000000000000..bbec5094d5c3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> @@ -0,0 +1,131 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> 
>> Unusual license... are you sure to license the bindings under GPLv4 or
>> GPLv5? Fine by me.
>> 
>
> Yes.

The rest of the bindings for Amlogic SoCs are GPL-2.0 (without the '+').
Adding the dual-license for MIT seems fine, but adding the '+' is
curious.

It would be helpful if you could please explain why you'd like these
bindings to be licensed differently than the rest of the SoC family.

Kevin

