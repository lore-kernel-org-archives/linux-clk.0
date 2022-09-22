Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF716C6FA90
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbiIVHNz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbiIVHNd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:13:33 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A52C88A1
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:12:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k10so13171243lfm.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
        b=MhBkMtNFvRKB+E48vrLoICpKm9sgw+cleIPWAZdLL/Zi1TbaAIdQ95hT//NfG41w3e
         CI4FfhpaK1pwUNjEUDFFqLN2WW4uCqaJy2iaA0/BhawC0nYmq58tsVXzRIn2D14awddP
         mHTBZAtcEBQJF6I9/XNAchneT562u5ZnnDjlX/uJ16P4/th4pGWksVDx6vpENafmdGhg
         ieVTp393OQtS6QAxqdIfc8g2WjzUdqt/5lMb5W56Nyxsh4LMRw1sKV5eN3a1PRZoNwmb
         H5f2yYPHjs0GnoIDHP4T8bY/lcFFUJ4rYUnDPPvGbWNK3chXy+JlrWlultv+vJjBPnDi
         qYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
        b=xtpC+jzXpI77ETSc5yLBigCwJieNmqZb9pAkLJXojcr1zQJNuf95QpkvnnB5AILTqP
         NrF/BOJ7vs7xQThfAxi+B/y1FgsizgtUwc0MAB01DbPqLRLu7pvA95/1Y59SRS0fb4gI
         IbG5yWwYPdBexq5dWlR/uptXOCcMiC/FlRs8UXovcobqQ7/AbHsWAjpsYVweQZ/y/i4D
         IEwg/La/KpLLVR210lC3akw/jwMnI5MVzN6tYMG1pwas24IYDErWsEYy3HNpGsZlRJYd
         e9Ban90OSafc7h7HJ2bWzP9cI6K7Y6YzdtIBP/FQojUJQnDktkWpCvRC9XwoVkUc4BLp
         2TLg==
X-Gm-Message-State: ACrzQf2E4CM7/98CHZJwRBKb4YbZWVqlttCyYFoOwflHnqCSNmNnyeWa
        XCgICcnbIEZjHXSjY8l2VaiRnw==
X-Google-Smtp-Source: AMsMyM7tSmDdOf9yUwEBPNVo4LJveoksYmGyeRKCvdI8La3tpcO4vDQdzuT8eLiZWZvV10EZkCS7KA==
X-Received: by 2002:a05:6512:260d:b0:492:df5a:e4f9 with SMTP id bt13-20020a056512260d00b00492df5ae4f9mr667074lfb.90.1663830768385;
        Thu, 22 Sep 2022 00:12:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020a056512370c00b0048a8c907fe9sm794191lfr.167.2022.09.22.00.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:12:47 -0700 (PDT)
Message-ID: <e583c9d1-b936-3c19-ab6c-8fab4704ca45@linaro.org>
Date:   Thu, 22 Sep 2022 09:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-3-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-3-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

The same... maybe it works, maybe not, I don't know. Any reason not
using standard tools and producing standard patches?

Best regards,
Krzysztof

