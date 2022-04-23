Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C294C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 10:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiDWKcB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 06:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbiDWKb4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 06:31:56 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B291C0488
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:28:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bv19so20764358ejb.6
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2m9kAORld4iDB2KAPLh1iCsQe8VM2IonNBmHniXB+aI=;
        b=abL3ZQ0jUA/UmIqEWJnORrPPfRhiBNtkKHGmN2VHZBZ4eLUI57QXL2YeGyD/UWdmw4
         /PvZ6PoNwnmTYaJhZq7ClQMH2dHTn/quieJqvwegOB2EjRvWzvU8Sa4LJ629A3GG8pcE
         vnwTF8Qc4+JhGtJ1LhWoHlORilVZ5qrChcfnsAlm/ddCPaRJ7tr8PATd6D8MqrnyE9P/
         nYB0KB3NpBJXZWsCop8opcKElkfJxWNFgi2bvFFptKKE5qlpMhtor6zB6I1WiVUfgah7
         451fMAWKE/vZvmly83beGV8CKvg5zZznrCim5huFff5u/7y8JeqMtuEgHz3DgynT0doo
         XdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2m9kAORld4iDB2KAPLh1iCsQe8VM2IonNBmHniXB+aI=;
        b=PBNLSCwiDc/8iHIoTM1WEbOfof5NVwlLoZbrfWPpPYHbOWbIixafOjWgeGHkjFjv1Q
         TZKZPwKD8AYTbJiwNLTqTi+JVKDwLxp6mf8rOuqIJ12AkO4TkTMp0TH1iruFDcnEiFtt
         oCsSHP4+vg6fWsLLdegKU0Zxrfgpkt3HWs1/924V8vnJeG1ZD3hB3o86lCNFQm9IMVLo
         qfoRd/04cOptXJQ4fZLwzalqUB3ZnEkwZ2pMRp2cR83tNKPMej9M4FSLE+SOhXVmisje
         sYiBFXFeYuTgbfuC5MrajA9s00+zNF0DWmRCgFQ55UJmwovuM9mG8/qLyAjRb55pAvXZ
         xwbg==
X-Gm-Message-State: AOAM531ThZJVYTykGv1ILtt4mN28AQKnKXCwCeBMQQ1EbRRt7fmAzTUI
        oNvDRi6RfLOoBJ3fbiX7h3ryrw==
X-Google-Smtp-Source: ABdhPJzNLgOfjlkn71D3XLc+z6mdb8U6FtuDFVeolu/miVVPX/dSL5gctTkJCIyZlGTqP6JpYcLBqg==
X-Received: by 2002:a17:907:ea8:b0:6f3:72ef:2397 with SMTP id ho40-20020a1709070ea800b006f372ef2397mr2184159ejc.201.1650709737125;
        Sat, 23 Apr 2022 03:28:57 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906380a00b006a68610908asm1558632ejc.24.2022.04.23.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 03:28:56 -0700 (PDT)
Message-ID: <00448326-7bee-8cf4-5751-d967bc424aea@linaro.org>
Date:   Sat, 23 Apr 2022 12:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 13/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8195-sys-clock
Content-Language: en-US
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, wenst@chromium.org,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-14-rex-bc.chen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-14-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/04/2022 08:01, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8195-sys-clock.
> The maximum value of reset-cells is 2. Therefore, we add this patch to
> define it.

Same comments as your other reset patch.

Best regards,
Krzysztof
