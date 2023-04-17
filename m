Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C5C77B70
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 06:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjDQGaJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 02:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjDQGaG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 02:30:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD98DC5
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:30:03 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so19030363a12.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681713002; x=1684305002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rbr7dITfZlBNrOU3sgoC9hFuL+fFrZv65zzAZtIBsq0=;
        b=SrWjsobloflYb7f6BmyVdO/YYtFDDB9pO7XiY0wOojUUVk8iSBQ63xasHG0VfazS6+
         1xnySMqqRmRzDRynGmGqOheZrm70j93MkBSVBhDBIU70vBOdm2jSs6tDsafxiWvbg8ph
         ToJ1RPr77U0ZIQS3S+ARaodQ/JRxbhbCjcMsUJWHiSLwE6h3O2tyCafvd6Mzk7btMX3D
         NwiUWYlDKS5b2bsKCwgA72P6PLWi8AvQOlGLa/9QsaoDiPLeyUQEd1AvDPrQwnza0rkX
         Jh0kGbjfW3G1aY5q1x3/ZztszBj19MNZKNdr+joWV/zfDJ3XqGQeKs1w7DEJUCvI6WsR
         epMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681713002; x=1684305002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbr7dITfZlBNrOU3sgoC9hFuL+fFrZv65zzAZtIBsq0=;
        b=kffUqEFYbIkBkJ8NRYN/jIJdrhm3J495KwiG2auMjTYASRG8gtboM67F8kKtfsfHdc
         wdkiqxD+2dQ9KZZhTa89leVoZH+ARLD88tb7CRQTkYfAmlkVwV1MozvqzXqg8lV6QcnQ
         HdZR1mH+DedZCbEfA4rjsPaaLYf2mIYTwV2OFJeFuE9Q/3EnN6+EW6uaiR9ZNkhZyCY/
         4wtAnjstQQR1JKG6qHXnwC1lxQmRVhfL1QcRM6GNAfNZyIN7pWJEXFOh8t7LJJLIaEk9
         X4zQrv6Xmx7c2N4wMfa6/0RcVQUoJwmXn7s6HQROp5hk+v0kfT6yTkS9SnThAbNcC8pm
         K6Gg==
X-Gm-Message-State: AAQBX9cMuR6Pfo9O3HwLeOnv5H6X6UdPZq9O1/ZJmR0qyy1XgJzbna4z
        T3vhiSj98WDCAnzCEk3dpAFjciY8QyNhAEa8eQ0=
X-Google-Smtp-Source: AKy350ZhGCI4nKB2rNBLO5dGxX+qcrNO6ZBdzl6bN0SQV/cayNGubQvkofnZFqJlnl4AGISWYdpnig==
X-Received: by 2002:a05:6402:4413:b0:4af:7bdc:188e with SMTP id y19-20020a056402441300b004af7bdc188emr16627552eda.16.1681713002258;
        Sun, 16 Apr 2023 23:30:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id ta15-20020a1709078c0f00b0094fa472a7c4sm140808ejc.161.2023.04.16.23.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:30:01 -0700 (PDT)
Message-ID: <94e776a1-a927-ac3e-6f16-e9e71d71f3f0@linaro.org>
Date:   Mon, 17 Apr 2023 08:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add simple-clock-controller
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230416194624.1258860-1-mmyangfl@gmail.com>
 <20230416194624.1258860-2-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416194624.1258860-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 21:46, David Yang wrote:

> +patternProperties:
> +  '.*clock.*':
> +    type: object
> +    description: Clock devices.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ffff000 {
> +      compatible = "simple-clock-controller";
> +      reg = <0xffff000 0x1000>;

BTW, this is just incomplete example. Fill it with proper children.

Best regards,
Krzysztof

