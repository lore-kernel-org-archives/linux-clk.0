Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F2BC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 14:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344588AbiELOVW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 10:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355230AbiELOVH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 10:21:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C7528988
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:21:06 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gh6so10655429ejb.0
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gwwa4KEdZsBSVIiZ/u69uGht/OG8CUxR+7OXw5afM9A=;
        b=kKpsHtTMFWb7QKuSduAjkuTKGuBKLnVZAlGB9pHwkmj6zu0GHNa1piAzog2sZfXWVq
         SsykJv5I7rqCnx2C5Vu+umu7lKGRXsEEwkCZL/JpNSj4vKZqhHYvD+GCPOpT7Gz+O9s3
         q4fuVJINtOwaBuGubVBqax1UabAvSVWiKKzHEC8/DAxcE/UURqPoKahqVCtEETIT8bIC
         ihn0OOTZ0ZjHgcIdy48yrBvSKR47PW/NMP/fMPcqiTDqbdGlO51GtijSmARDMsuhyuwN
         00ADURgTXmcFTpeqM56tT/7R/tGxRxrjRLwpe59SIX+gbavbR9GvxVGJ534dhRomN8wR
         fy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gwwa4KEdZsBSVIiZ/u69uGht/OG8CUxR+7OXw5afM9A=;
        b=NkDjM0hg/kwTu/dYyTvZ4jneV+JPEhnPM8yZbrKwexlis83OLAWoE32CQmzZ00AWQV
         MoifwAS6x1pUwCIL3PpshdbcvXL+d/8SarxDaXMzpWVBIPPGdHB7Y1ync4hc/PPHs4C0
         hshq/TbpwECJ/b22IJU1KGQB6IyyeLwhuhXOHPIqrrVuTRRAifSt/LvqwDRSjlaxAsUZ
         ip2wBAHR8KzuQkLbe5RtMnO5gcZeiuAeTySzOaEI9hCRH2YFGbIbcE5MZVmkeF5/lmHH
         90liwVdQlRcBf4NHy0nRSVhKV5FyzDpht1Rvb5j+a5Wi2IBKPgwxd4d1oQW9PY6xsfKH
         KYqQ==
X-Gm-Message-State: AOAM5323+wySedyNeIw4FjxxDj4u3DohFz+bxvRyI0/OwfZ6mTGD6+y4
        xx0KJ9tTqf/svYgDqXXq77FEeg==
X-Google-Smtp-Source: ABdhPJy6oM6zHB6ogbyacVZojXHJSVoOXoEbk7yyqF8wbuQPWR8uijnU02sDtFjZFSsAMWEdcDB8xQ==
X-Received: by 2002:a17:906:58d2:b0:6fd:daa7:3a6e with SMTP id e18-20020a17090658d200b006fddaa73a6emr176871ejs.0.1652365265105;
        Thu, 12 May 2022 07:21:05 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ws20-20020a170907705400b006f3ef214e5bsm2150543ejb.193.2022.05.12.07.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:21:04 -0700 (PDT)
Message-ID: <82a89be7-ea69-992b-ec66-3fba0c0103e1@linaro.org>
Date:   Thu, 12 May 2022 16:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 1/6] dt-binding: clock: Add missing rk3568 cru bindings
Content-Language: en-US
To:     Peter Geis <pgwipeout@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220511150117.113070-1-pgwipeout@gmail.com>
 <20220511150117.113070-2-pgwipeout@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511150117.113070-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/05/2022 17:01, Peter Geis wrote:
> The rk3568 cru requires a clock input and a phandle to the grf node. Add
> these bindings to clear some dtbs_check warnings.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  .../bindings/clock/rockchip,rk3568-cru.yaml         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
