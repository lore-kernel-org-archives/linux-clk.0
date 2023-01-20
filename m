Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6CAC05027
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 08:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjATI3t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 03:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjATI3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 03:29:48 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01348C14F
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 00:29:46 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k16so3400847wms.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 00:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ1kQ6Dc/Aq1ANuf4SsTTOiufClKPa57UzLLGIHz6lA=;
        b=jgParfB21yrZPlsfTLXKtBj85ZlU3hEUYG35prDPSa/wKEWSILYui/Q3N+ntb9bx0O
         ET1RwUNCNFkHjT27224FkDTS/BAKl6L9ih9LE263YlBkVH8M3+mHSmuTJRBGQjV8yGCg
         d26UkidnKC0QT+633G1nO3V5hzfRenrn1rT0Dbn/ii2IGC2zJpKMd7IhuHNbINUeXrlQ
         2++OWg+2lmEUQ04u/MZBXp02tM2VAzigE/6gnzVofKEpp95WW65TNNnK76dvnbsgJgdC
         92VRjB/s+lDxvnOjZETVrDh97aV9sxWfl+dUeYDg9GEkEup6M/SZng4wU8U+zb7GzSZm
         kEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ1kQ6Dc/Aq1ANuf4SsTTOiufClKPa57UzLLGIHz6lA=;
        b=ufNjDpuUjNxH2y7iB29Fn52m3yssa3tgKfZ3767BLcWYlpaShvZlxA6S3X7xuI2WAg
         gGYJ5scWMp2DyeeNxJzUS6ADRZ2ioZhLRloPIOY7pGEyJRk5jOivXwQepfAY8ec8n6rO
         X1J3KVUmp4GfDleo/G3UDjl21p5wmAaahFoLgj7oZdSnKnhnTqrgaXNrtkjbfKRsrIPZ
         VvfMbzTou4yXbY9OJqGirygqkivM8nezmQn03bgdRZ5dwH5kYoPvgMR/Oz8CFLM1rW5+
         qTRqbepdFPSRmJgTvfxuy2P6AqJ84Y0GNTeDofV4UsOKW5+Z1XFO7HSmPVNhIXsII94z
         d6OA==
X-Gm-Message-State: AFqh2krhaIT+txIn8CZHR9xIpoxu6Pd6a7KeW9zE5ZW4V4+Za8xuu3u/
        +GywPR6g3OWTaHoVxM1BVMX2Lw==
X-Google-Smtp-Source: AMrXdXvt2hZOZLqdPD4UWX5LsE6FgLHiW5K1inIkH+ssvdTcXfKQ/nK9NhNqjlexM0zd0IwTVVGTcQ==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr5499408wmp.37.1674203385532;
        Fri, 20 Jan 2023 00:29:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t13-20020a1c770d000000b003db1ca20170sm1485418wmi.37.2023.01.20.00.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:29:45 -0800 (PST)
Message-ID: <402ac5a2-334e-1843-0517-5ecf61f6a965@linaro.org>
Date:   Fri, 20 Jan 2023 09:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 01/19] dt-bindings: clock: mediatek: Add new MT8188
 clock
Content-Language: en-US
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
 <20230119124848.26364-2-Garmin.Chang@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119124848.26364-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 13:48, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8188-clock.yaml |  71 ++
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  55 ++
>  .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
>  3 files changed, 859 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

