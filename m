Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24737C433EF
	for <linux-clk@archiver.kernel.org>; Sat,  2 Apr 2022 16:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358407AbiDBQrO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Apr 2022 12:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358402AbiDBQrN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Apr 2022 12:47:13 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39C64969F
        for <linux-clk@vger.kernel.org>; Sat,  2 Apr 2022 09:45:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ot30so1902986ejb.12
        for <linux-clk@vger.kernel.org>; Sat, 02 Apr 2022 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lMPLaifjlPREZXBjIBwue2MEcz05yGzVfgoyVmaFjVc=;
        b=jcRbVQ7gDzmFwowuWWQ6xJvWYfyqCNL5vGwkDQFJobitvVqY8+B3A0UeAzlBWwjiHX
         Eelggmqlw/iYUUPitF4AH8JGqVD2MwUm/LtRsDHZeGNp4y+A3gtD6mS/PfjX+eA/qHDo
         pz+YxUzoJ63J5yQoP+e/FOQzuNCunTjPjUsPRIdQTpRKU61gZ1zVdwgAXPlXBLGHrfHn
         0wr3/R2O6bIvwo1FUVNQEVuyxlJSrDsF3lQNx2omTxC/VmVyZEW8qHcQTkCbQtjxWiam
         JFQbqsObmgMQPD4gb3s/e/Sn1r9+0iOLhXnDIlZZq1biLZpmg7hMCMpGHyzSlyNf/5MO
         C4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lMPLaifjlPREZXBjIBwue2MEcz05yGzVfgoyVmaFjVc=;
        b=qBgwd1OLxu7ZRBFKXL2VqX2iY41WYaLXghad7J7nyjYgVPHmTiDOZscYxmbO07y9MY
         k9YIZtJPBmnZTOs9pUOyDm61fQ3m+TI2XQSpwVWwMqOzkKJg4nYYKbqvoC++U1le50Gj
         PUS/Ms3tC625rgYNAc2PLmH5UZl3+fp3GZPRDwv8Jq9wOppdamqxCaNYykp1jmVdVn4h
         CK/2ypjiy9JuUKpoOdHoJKnaNDzNcvX3pGO9mwcX+E++h1zEhfWrJ/fd+5brhOj1bKsV
         0luivd3qH9Kx1XGJ6MfRF10oFayGVhjY46rNrhFPAKxr+r8Tdj9nMFgFYmOj+pF5p+pQ
         lGtw==
X-Gm-Message-State: AOAM531TLf+UUHZmjBXXdC2VYTNK+NI+eD6SdnlpGDeIOzArcUmvMrCY
        5wjjNtIGiJBAF7P0+vyyoWd4og==
X-Google-Smtp-Source: ABdhPJzhU+ug0BNuIctU+TjiJXc7sRo/j6vvpcsPZBTc4sus6x/7hOzEVPdrlIgjCgVySW155Cw/7Q==
X-Received: by 2002:a17:907:94cd:b0:6e0:b001:aeb6 with SMTP id dn13-20020a17090794cd00b006e0b001aeb6mr4354843ejc.283.1648917919486;
        Sat, 02 Apr 2022 09:45:19 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b006dfc0fe42b1sm2280633ejc.177.2022.04.02.09.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:45:18 -0700 (PDT)
Message-ID: <553ac698-48ea-d7e6-6338-34395efbf603@linaro.org>
Date:   Sat, 2 Apr 2022 18:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 00/16] Convert Rockchip clk
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220402143636.15222-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402143636.15222-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/04/2022 16:36, Johan Jonker wrote:
> Combined serie of previously converted Rockchip clk bindings.
> 
> Changed V4:
>   combine dts patches
>   add more clocks
>   add clocks to example
>   add clocks requirement
> 

I think I reviewed most of them and gave you tags, but I do not see any
tags. Did you remove them because of some change?
See also:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L543


Best regards,
Krzysztof
