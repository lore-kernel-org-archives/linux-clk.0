Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D1EC636D7
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 10:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjBMKy0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 05:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjBMKyZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 05:54:25 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1470D9755
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 02:54:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o36so8411752wms.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=xabJSuvfnWQ37OhcxWukJ0rXnPEPPnqpfPEl3xZ9fab+kcs6mpfL4TM7e8zIRCjW/4
         cbyiT9qL5tOjl1arDVGpYqSYxESw8hMGf8evAiiZNAOcFams9kls907jCDm/PHJVZuqW
         7a7rIklVAFSV41LWtX/EIADWfNc+dAJA73ppMk9wHuxfVHBAerHdJAVsHQnCr30BNUcT
         gSPhyTZv0MaH6gyT857R0bCz0/kFmca+6WP5vcuxbxTCLZGZrZokHL/U8qKY8LSBk4Ly
         gyHCSC86sq5RuEvEJzyYg62jNjnv75DBnfJCDMB8IwQ03o3CSs+cftV9AgKTewri8keA
         tb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=7fjREPD21hwv1tZesPUrb0427sAaVnSUJATagU/3JLsdwlbSx7OYR1gf0SEdRpdJx0
         PSEUt6OpvA4stbpNsge+cJteRe45tKinW5YXAE7QgX25KmqisPRxFRdsLXGtz8bS0b2t
         yNon8V1mb6lc4VADy3GIjL7G19XJJ8CQfkD3UcyDENpfo5wcjBlwGo4ToLjpVzO4IDee
         YcqgXV6g6hrSBbpkJURXCy6b3df0jbAeMMXzJmNW9vOnKl8ynTJTQ1XzafeIwMmvsiMY
         r+YWbMKz5tUag72ZnRcwVy1bZPXlV5ohXLsjTZlJ5NArN2fjye6XqHQQmxu+XqdeQuCj
         j1iQ==
X-Gm-Message-State: AO0yUKUwpixqhSoFkaZRNnUBcjFC3j4etidXcbHCQqGbimMfpkTSCER0
        h7gWc6O1KvJu5ePBWrQ9kE0C+Q==
X-Google-Smtp-Source: AK7set+dmnC8fFHSMMpTa9TbZ82Axtabej6jsHRu8DYMsSuwhXURadcSWX18R3jADIv3rFMAblj0Sw==
X-Received: by 2002:a05:600c:1688:b0:3dc:573c:6601 with SMTP id k8-20020a05600c168800b003dc573c6601mr20411857wmn.36.1676285662715;
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003daf681d05dsm14507052wms.26.2023.02.13.02.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Message-ID: <28f16bc4-a1a7-9345-10e8-e292b94420a7@linaro.org>
Date:   Mon, 13 Feb 2023 11:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to
 dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Internal Clock Measurer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

