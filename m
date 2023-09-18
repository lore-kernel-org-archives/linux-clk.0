Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C705ECD37B0
	for <linux-clk@archiver.kernel.org>; Mon, 18 Sep 2023 12:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbjIRMRS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Sep 2023 08:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241975AbjIRMRL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Sep 2023 08:17:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77879100
        for <linux-clk@vger.kernel.org>; Mon, 18 Sep 2023 05:16:51 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-530e721f077so1766543a12.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Sep 2023 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695039410; x=1695644210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNv1FDwVT3hMnnPhWO3xcQr1aUeDgxmwwA9dkUiq1gI=;
        b=qc95taDBjEAqfD4twunA1NE/fn6b2KKBIJ67SOttxLNUrL3e5YquEC5qHcm7qDijy2
         Jrb2XKRvUEgtFomNNYRz69883mWGWFPWoHUn6aNKBSBtQNDAawjufWcaVRae2DmclFC+
         +LAbuow2Mit0IRCEVorp7YvfNOf9iGj8LwVDfl7q3g9ZLDxZBjV0eABPvLkCoO3eP9rk
         f4ov9EXsK/27l6sVH5Y3VnrW5Q5d2zR3sbXAQ8c2DgVeJb2M3gh+HuhE1tHf5+ur4s+g
         JtFIoQkqbOjeCrOdXnEr6KajkcaZjWrBfDiqNXsBBNP6JQ4e5u+iyXVkepeTDl5MnZ2s
         Dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695039410; x=1695644210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNv1FDwVT3hMnnPhWO3xcQr1aUeDgxmwwA9dkUiq1gI=;
        b=GRcoPJckTOKDKCIxE3nsCEgJkUe22fpKBIIPp+wTU1c0d6Zd6Pw4whmq9exVhlEJbw
         EsNvO3lIrac+36IylS8qWMNjWAF3mNLXWRhyAOzLdisvwLyaCEmf+bdLi+CvtZCbbxHL
         1r+p8SvtczM8TR2/IZccoXPhfIPcBy97xjp9sK0YghBGcv2x/Ykos66iqPVI5NEdBcbW
         9mrTVtw4VV39ZIbXBkuJv/l6muZYPIm/Xq9YrFXft2ODaSUB6OJRUTOI5v74YI8ZqBE7
         F9BwL+nagkTSTS1ywoLHcqWAYaggSWLC6bjkjJB3UTxTAyUMOOLzA7QkSvwomhEnZuXv
         VuDw==
X-Gm-Message-State: AOJu0YxEiL4a7TJ+l0w+JCzfxCrgp5sl0r7kNrCqZ6AAjju6ozVQPrfj
        pKrPj2XiPnsULilarDaOlS2ePg==
X-Google-Smtp-Source: AGHT+IHjEzmDf8sH8wfhuBGiqE680D7tr59P6K14bIMYabWiXD52tF+e9xu/8MVoljBZIxA6w9Tptw==
X-Received: by 2002:aa7:d394:0:b0:525:691c:cd50 with SMTP id x20-20020aa7d394000000b00525691ccd50mr8530961edq.24.1695039409909;
        Mon, 18 Sep 2023 05:16:49 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id a3-20020aa7cf03000000b0052e1959db1csm5962284edy.20.2023.09.18.05.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:16:49 -0700 (PDT)
Message-ID: <1f9cfc55-bb63-92f2-7e22-26d31ad16e96@linaro.org>
Date:   Mon, 18 Sep 2023 14:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 3/8] dt-bindings: clock: rk3188: Add binding id for
 ACLK_CPU_PRE
Content-Language: en-US
To:     Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
        sboyd@kernel.org, kever.yang@rock-chips.com, heiko@sntech.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
        xxx@rock-chips.com, xf@rock-chips.com
References: <20230918073151.7660-1-zhangqing@rock-chips.com>
 <20230918073151.7660-4-zhangqing@rock-chips.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918073151.7660-4-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/09/2023 09:31, Elaine Zhang wrote:
> export clk id ACLK_CPU_PRE.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

