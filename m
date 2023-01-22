Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AE6C27C76
	for <linux-clk@archiver.kernel.org>; Sun, 22 Jan 2023 13:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjAVNtN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Jan 2023 08:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjAVNtM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Jan 2023 08:49:12 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F1A1DBA6
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:49:10 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso6750543wmq.5
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2uRWqFF0r7q2TBMIaKQWmaMLNnBJspMVsHJ2UF06HY=;
        b=A5nrwbz9H/JghFPYjDYxiF530ecHYrVdNXPJISoleEMn961zrzTqWzfeKn88HBVwWD
         swdMlnsnKpW2FAXUsX5SNegxl7ZB/FmB2eHGT7tgaJf/JY/P39W9oSZBZf724q/QCbLU
         2WKi54/8Y1ECJG1KLNuuO5bdukWTWooVfA15Dfn/+yIYSH4mtXLJCoDJsh/wamgTMudA
         vQMlhY9lLBhZmlpZQjGZy6NGyK1JjeY6GjZn3/g2NQgnsUqOgX36aQwG1WPEDYF9rbKR
         v1UYab0dwAKBjHXkdgS3ww4wtTcR8ukC6149Teh8dQJve1NVZgvjqFgFNK2vC9cKvud7
         7Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2uRWqFF0r7q2TBMIaKQWmaMLNnBJspMVsHJ2UF06HY=;
        b=8NKElFDZmb5TMPGOzQQaZDFu/8xqlZMzAEhNjYkak7KovoYlDwXEin2+zMXhd28rtB
         vfR7RLXlwkCZqRCjIg2U16BLRca1Ucucyvr//6pSpOUhL1c6Y2/JwwQdAmpROMpga5d5
         a4ScBLc/xVtcCPb94Ask3p+iF1KjCkTRujV0C0pLBbpKSBIm6IxE693QR7ED77ju5Q4z
         AXVtcajA5k3GwFh64YMsft7UdsdZ1WdT/7O9KgoYwXdaL92V9S0Qc/+U6/MIHdTziE66
         LxBp3O6OjjLV1pZgc2bnMZ3ch0I7/SAIMNBd0dgo7h9pFgH9hE/xdz9a4r8iDeHM2mXw
         8CAg==
X-Gm-Message-State: AFqh2kpt1SVpUQ1R8JAegfElPe5VG4XsPzgKG6A5M862CXg9Z8PVCI0D
        cyDul/Pt5PPourcxvv5jsjpXEg==
X-Google-Smtp-Source: AMrXdXsO8kqG9ZRaMxEGmJ0/tMT938JibYEZWNhJ1g920foowoq6eZiI5F8tqalMzBJU2Pz6wZ9L3Q==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id c18-20020a05600c171200b003d9a145091amr20679919wmn.28.1674395349413;
        Sun, 22 Jan 2023 05:49:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c26d500b003d9b87296a9sm7547873wmv.25.2023.01.22.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:49:08 -0800 (PST)
Message-ID: <bb386e57-0826-93aa-d97c-72d277991141@linaro.org>
Date:   Sun, 22 Jan 2023 14:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add apmixedsys/topckgen
 compatibles for MT7981
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674233728.git.daniel@makrotopia.org>
 <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674233728.git.daniel@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674233728.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/01/2023 18:23, Daniel Golle wrote:
> Add compatible string for MT7981 to existing binding documenation

typo: documentation

(or better just drop the word - it is redundant)

> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

