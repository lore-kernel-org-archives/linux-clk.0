Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17349ECAAD5
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 15:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiIIPmN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 11:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiIIPmI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 11:42:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8CCBC832
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 08:42:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f14so2396348lfg.5
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YImkMqsDB4QBZFr3qfoaJFMGDrNj1JUk+BlTGRuyEpo=;
        b=bzAkpKroytpR3qI7sQ0rrB7ib4rQrvIZ2BFv0GFivIKdSOskbu/J6N/pDT8C6/VrSO
         +tjRCci7OYX32xQj/gRBcpqHzZwZIhkI94IbVO+xndI8Pa4AJ3fTVQrBXHv6QAWk3fzy
         MRbQ3NTxpwAS7EoXOJn4HYbKNVqse41sKSmfcqMXpf+UwUE+0OQYz/+yH+ZmtpSttROq
         Dd9YjF2Ejhv8aSAmc+hDhOu9ARlWrDlP2b6xfT+LjdeDd5cYZGDqypvErUw/lrGTG5/l
         +5uaQM5mevmfdImcCUFEkx9fj4sD5y+PQDKwqrPa+XTStK2xugTQPxl/XW3YN5YXKX2F
         LJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YImkMqsDB4QBZFr3qfoaJFMGDrNj1JUk+BlTGRuyEpo=;
        b=EEr4M9aAcP0pMqH7rSZroHtIBhBTa+rw1pecYdvYJXRrbXLikPzpPG6HdKPlD3PF6x
         L4kpNVp0tldc+ULAEV4QK3TH073Roi+BJ003THThgjnJoQRmMPbrY/iS8zSs/a/2GCVK
         mH4YOSZvWawL9DrM6TVVEnIHdqH+5sqmYmOjqXQZ7RKYYXW3diRAFE/ewTm9gWZRrF8i
         j08B+d2nkMY4/LX68VpDEQyffhql/sF2Xbpg7qMifz1fQ9poS2lnyhmNjNTPLyxO8ECp
         06ERDITXRHQy6ZlXjAiIC0OXE7zVGv69ZWy0jUZB+aPJOHYHvhB8e9eiRQJkiItTah1E
         zMlg==
X-Gm-Message-State: ACgBeo2bL55D8CPWKo0a3Tx7EIuelzoY8ysYCSjylMzzBH3gDn8nkr7W
        43xS9OUmil/yoX2LkRQBZIWAOQ==
X-Google-Smtp-Source: AA6agR7ted8a2yjv2Kq3DTMDlx6TQoYmH5W4UmDVYcGZ11H5Q0T2OzMmKPbE9iubCyO1Y7JWs1IxWA==
X-Received: by 2002:a05:6512:1115:b0:497:cd1:463 with SMTP id l21-20020a056512111500b004970cd10463mr4442277lfg.24.1662738125688;
        Fri, 09 Sep 2022 08:42:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a4-20020ac25044000000b004946a38be45sm130063lfm.50.2022.09.09.08.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 08:42:05 -0700 (PDT)
Message-ID: <84cb315f-dd55-53fc-3e3f-1e18f7916c99@linaro.org>
Date:   Fri, 9 Sep 2022 17:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RESEND][PATCH V8 1/2] dt-bindings: mfd: sprd: Add bindings for
 ums512 global registers
Content-Language: en-US
To:     Cixi Geng <gengcixi@gmail.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220909152421.278662-1-gengcixi@gmail.com>
 <20220909152421.278662-2-gengcixi@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909152421.278662-2-gengcixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/2022 17:24, Cixi Geng wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Add bindings for Unisoc system global register which provide register map
> for clocks.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
