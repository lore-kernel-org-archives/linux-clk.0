Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C980DFA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 13:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbiJ0NhX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 09:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbiJ0NhV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 09:37:21 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3538818148A
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 06:37:20 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id d13so871760qko.5
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rzUN2Jp8f671eR0lEV54lOr9L1Q/5kabvw1UeEpF2I=;
        b=oOGuc/bPwq8xbd8fBfIxmNf2iCQNkBHnOZgPHf7VT+QH2pxFMwZDIFKN9hMo9lWqwy
         vlDwazNhzXJRKmQt05KbqcaXAHGsy8cAfz0zZi7adgrlNDzCfXT3AoTuQKyAmDKPMfrr
         4drboWNMbGOH7RnFGgDIt9MMKqWk0bRcVgw7p2uNvJDDcOnzgUmIReSsJsdexGfE9T68
         0mEa7PPZCzJaB9YBn868mo+bZp0k71EXup2PylDR4ZOl+EuhyTpsEcZHnYSCr7XDYUnn
         6kQHuXs4OA8jcYUf+WSEM/naNZvn6ybgUdI0T334XYz1pJ22GCznDjUmgi0k6VqvWo8+
         YJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rzUN2Jp8f671eR0lEV54lOr9L1Q/5kabvw1UeEpF2I=;
        b=Lhi2KdkBxgU2/Olb8Cdw09hm4xGxOZno0f4cU54dCN8CBIdHZQ/dOaxXaz71h+piaw
         brVmS72iade2qVJV1hIapKiwiGt/CAfkkgypTY9aBCjXjP8dzW/RVi40U8lrZ09elRzJ
         nWrbK7hwPs+9yLWhwQrqhHXDfDx/NqWFDJIXFBD/aqco0Kplr3Vr/lVnNvJTu9tZafK+
         PQF7495Bd7bb6PHYStHDy3wFID/38rUvr5VtQ1dw9U78Cto4OflZApZ0n1gXhri3bjLI
         SJwoJnmFAXg8AO7MaM17qgJ6jbnKai4awGJaxHXTcY7VecQOehDXl3OHF9yymICrZkuc
         wpbg==
X-Gm-Message-State: ACrzQf0i7xz4VCqHfSx5jm58/c9EqcVSlTWln59B3xCROL9YcfjJf92W
        BxKVJA3IYcYO0Fgg4yUJmY4UXw==
X-Google-Smtp-Source: AMsMyM4mNLk207R0Kgr+IHrftadJ9IOoTu0ugDT2qJ5VjcS2fmHJTVwlh8o78sJAQ2uRd0n59QQUrw==
X-Received: by 2002:ae9:e501:0:b0:6f6:7af1:5099 with SMTP id w1-20020ae9e501000000b006f67af15099mr12750669qkf.135.1666877839352;
        Thu, 27 Oct 2022 06:37:19 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bs11-20020a05620a470b00b006f84ee3a4f3sm998795qkb.48.2022.10.27.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:37:18 -0700 (PDT)
Message-ID: <68d9cc70-04bc-38ee-eaa4-e46aa5fe1760@linaro.org>
Date:   Thu, 27 Oct 2022 09:37:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: imx8mp: Add ids for the audio
 shared gate
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
        abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
References: <1666834442-5609-1-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666834442-5609-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/10/2022 21:34, Shengjiu Wang wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> All these IDs are for one single HW gate (CCGR101) that is shared
> between these root clocks.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

