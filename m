Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9BCC04A68
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jul 2022 08:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbiG1ITz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbiG1ITz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 04:19:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023E861DA9
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:19:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bf9so1721084lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wiwsOcAFhcP1YnC2hDH+OWeVsqfZDXQ4dmGIGapgvWw=;
        b=c4pF8+u1o2Agi9MOgr9rwnue9oIMJDicYl7ZHap2pJpW52sCqIIh9R99O8Z16XtgsS
         2Rh3ZNm+HjG1Hg/sN1Eet02XeBSScS9wQaX4J2svABt84rSTOkFO3cJDR8dSKC+GgsZW
         xhhmWpTL6Q/oGWKFFkAjDIx5GPw/jyr3AoaB5uE9HvIXVeFYZbBd/MQ8Y0gaWw8JzoIT
         BLjwX3u5JqUl1ftRXBFiBdJC9DDj++z7clnBubwhHKHYLGBhazKEexjG2rSttU95+Lox
         59BZDa5jHz5IXnpTS+TPiL7OKWuRr8L5hiGJxCroJhrNiZ7EvzrF1hD3NDKzK8OgdQo5
         Jiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wiwsOcAFhcP1YnC2hDH+OWeVsqfZDXQ4dmGIGapgvWw=;
        b=62Bwt/GF0Qu9TQdRG71VAOAWAemU5RjS401nXFB6IgqghevCXYUhMnt9ltartmhZJ1
         3GGdE9/snONdOB/hhuEZBgq8g95BUgL3xEon/8muG/sifeTJiw+H33rLj6p0Ps10keum
         6UXOSzBgyAJXLHO8F+w1PRxXfUSnwgT7Sdb0kdHcslRE3voFepN8d6aFlzgw0I8zhYNz
         h21Ui4/83JkzWjYOiQtLDd7n2tkHU5v6iO04tjomA8CZnjOzQhC3UhserFpr0F+ec+W3
         oNFLG8zPuYvKrhxM5v4UUjX+kLBuIZicYk2Z/2D9Mttd6c59nwBgzJoWTbQlqBeGpf57
         WKlA==
X-Gm-Message-State: AJIora8gFnlGu4FoT8ZUHCWBPNlpcpgkgArKtkvnCwA+2nH/FwVQknbl
        MJGh8Kvt891tLqAOSnM2tIsToA==
X-Google-Smtp-Source: AGRyM1vHMBaq7eMyF4IxAZR17D6EnbhMcJWzOBt6bvWihTeFHLQMhm3g7u4o81ewydTQ9GvMVb2lcg==
X-Received: by 2002:a05:6512:2350:b0:48a:794b:382 with SMTP id p16-20020a056512235000b0048a794b0382mr8955820lfu.185.1658996392245;
        Thu, 28 Jul 2022 01:19:52 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id i29-20020ac25b5d000000b0048910301774sm78550lfp.307.2022.07.28.01.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:19:51 -0700 (PDT)
Message-ID: <d78826d8-381a-f2aa-aad4-34f46dd51bf3@linaro.org>
Date:   Thu, 28 Jul 2022 10:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/6] clk: samsung: exynosautov9: add fsys0 clock support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p1e79b8d8bfb9e8a3ea351c4dbd7c42b7d@epcas2p1.samsung.com>
 <20220727060146.9228-6-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727060146.9228-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2022 08:01, Chanho Park wrote:
> CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
> Lanes.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
