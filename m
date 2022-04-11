Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573DEC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 06:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbiDKGcD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 02:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244903AbiDKGcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 02:32:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4725C58
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 23:29:47 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id p15so28696365ejc.7
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0yUNK3ZCKYDcOn5ZrB3/FxJrrtfEl7Fw4Ni9+59C8dU=;
        b=jjzMGMubAeZ1lFmTxBh6mg17L9CLxZ6L/8g7R9OSx4TYbz/WOdXtuowKx72IFtfsqu
         QzoJr3HWFtca8HIdbDFbdTZXW82MRdZMT2Ar6jcdDHsAnJGMC89ngSfFGQuCYwpDE14S
         Ug6W90bCGgUXsKgnl7hZnmTtNIW8V6ndulmmzFdJt7rPureVDtky2zIP/53RouKx+KBx
         6OtU8iOho9QoqPGcRqBrB7pmeU25YiRt5DMgy5Nea6yaNPRCUn1rUqGCMvt6qK9hPjh3
         zx7MTwE56Sj806SWtRi5tsNGl9f73YQGm9ftjcgtWKXlyQ9Z4B8cJtBr1bvPk8UiAFBB
         HhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0yUNK3ZCKYDcOn5ZrB3/FxJrrtfEl7Fw4Ni9+59C8dU=;
        b=TJg0dqftJmovexq6dNndhskCqGCKn1tPOyy64BUxt4SP+fDqqXKB4VdVqXwOG+haoo
         nFRtjQB+KGA1Bf+SJ1DGOjffchTp1Qj9OmsEMfIlWHVFPQ/YOeOe5yMaTXFeOltmovPD
         p1aEeXXbgtxP4uZvvgDj5c6M3xQvlLCJBbQDJVyzZMbzLqO17vW8TmhpmA+fd0iw8WhR
         ynRfzQTYTl3grrp64EHUAYUIYuLQzkKidAAeOplhFBup35sWSyMI/MYr8ty2t8PtzYBn
         MYHDj4rWKAxFUq0JI9GXseYC0znhhJxSL97S+01KJbtBv8NjzSHAAfyxatvbWUJtNFDL
         vPsA==
X-Gm-Message-State: AOAM533EuNk3xFmlfMzHhpc5lMXe0LPtlWP+/S8q45PiY5S4/CTbrZBh
        OwesIDSG9ZaKOHu3LoEwA2zasUjlyzi2hPZe
X-Google-Smtp-Source: ABdhPJwwVLHMPhdrjMNvxkSMXTsMCzYn4URc8/tDzb9b69Ns+YnUQjJlGNFB2RHrq+LZwSrM92Us2g==
X-Received: by 2002:a17:907:b98:b0:6e8:9335:1fca with SMTP id ey24-20020a1709070b9800b006e893351fcamr2990034ejc.123.1649658586482;
        Sun, 10 Apr 2022 23:29:46 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906774300b006e79ea98369sm9276137ejn.151.2022.04.10.23.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 23:29:45 -0700 (PDT)
Message-ID: <1f688a08-1e3f-363a-1442-4c6dd9251f11@linaro.org>
Date:   Mon, 11 Apr 2022 08:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: Add compatible for D1 DE2 clocks
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220411044002.37579-1-samuel@sholland.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411044002.37579-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/04/2022 06:40, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. Its clock controller
> matches the layout of the H5 DE2 clocks (2 mixers, no rotation engine,
> and separate resets), so use that compatible as a fallback.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
