Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8DCEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 05:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbjGYFih (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 01:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjGYFif (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 01:38:35 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBC71990
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 22:38:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-993a37b79e2so816564966b.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jul 2023 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690263513; x=1690868313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Nfvys4rSiL7Fg4913GVXU51jdnpMLzXuF5OHN3WQWQ=;
        b=DGTKuLy0ugnXwMH1l5XUMT9cQazfkiFWgOjhxMXUX+TKcMLz87XGy6CEDzl7G3kNC9
         tP0SVSKBqTLS/L9uHF6WEahTA70hLYOfQoI7Os159l3gBs1nH2u0vd/tcn814MozLRYS
         E/0q9qviMQf4jui6UjpUG4Fy5soR6oRwqmeEptO5zP3+QeY0blkA8lZIsQPTJEXoqvW3
         CFxiNSdxuOUx2iDNBId2J16CRvY2D8BPdvUJN+j49cvEQ4C1id+ItOR12DRCfUuCes5e
         Tr+yWa6lAr0yvM3P16IBv63LsPl9fP6B/8VtF1xt2E3SI7dHO8PpuVfL0uxr/p+T7uvj
         4Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263513; x=1690868313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nfvys4rSiL7Fg4913GVXU51jdnpMLzXuF5OHN3WQWQ=;
        b=gfp0imgtQMUgOxdKtHpdA4IYM/quHxfAO3UjKvXbuQDpGXPFutuVvgfnGqhpA5prZT
         LD8+I0HUUSyijpxU9w4GaUfUsEIXqYr0/Mq6Wqau325op2oW3M9fPaRGrIMC4SBWfquR
         QH+H9g8OBM9r8vk04ny0abwgcKEsTLbZWtHIJ33liF0F/UYpWg3v15QTDN6kdTVRPilp
         v3u372ddadb6B7bTRYhfEw7B7TJeUDlh8EkBf25elWAhWX/9b7yHMiZIYlipVO0nWyhh
         8BWHE5lVdxQ0C8kVE9luUAC+4B7CawdVLlQ5TBnWfUSeX5USXOzNGmVlK4w5eJqIWvxb
         Jt2A==
X-Gm-Message-State: ABy/qLZr5E51yULXuWr/RZrYY9nUv56umiiOAxV3++p5BKdHhXHH8+MZ
        RBmNQVReQ/GiNXaw2h0O/SFc3g==
X-Google-Smtp-Source: APBJJlFTq2E4alBkthFQdBPgkxNtO6TymuFd4zzjCRKGnOlScPXWmVcaDAXhHKhot9GAxJPDkH4kjg==
X-Received: by 2002:a17:906:7a59:b0:982:be38:a5df with SMTP id i25-20020a1709067a5900b00982be38a5dfmr10986040ejo.63.1690263512679;
        Mon, 24 Jul 2023 22:38:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709062dd300b0097073f1ed84sm7713253eji.4.2023.07.24.22.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:38:31 -0700 (PDT)
Message-ID: <541711a7-01d2-8630-1ae2-5a46ab8ea067@linaro.org>
Date:   Tue, 25 Jul 2023 07:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: fsl,imx8-acm: Add audio clock
 mux support
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1690260984-25744-1-git-send-email-shengjiu.wang@nxp.com>
 <1690260984-25744-2-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1690260984-25744-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/07/2023 06:56, Shengjiu Wang wrote:
> Add the clock dt-binding file for Audio Clock Mux. which
> is the IP for i.MX8QM, i.MX8QXP, i.MX8DXL.
> 
> Add the clockid for clocks in header file.
> 
> The Audio Clock Mux is binded with all the audio IP and audio clocks
> in the subsystem, so need to list the power domain of related clocks
> and IPs. Each clock and IP has a power domain, so there are so many
> power domains.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v7:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

