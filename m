Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA825C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 06:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239784AbjEOGcT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 02:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239371AbjEOGcS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 02:32:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C2D114
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:32:16 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so22319112a12.2
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132334; x=1686724334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8a1pVM0DGaS6W157+gRqo4eM7NjJYx+JRCtEwK9RVc=;
        b=X95T5aNKRiJwuBsbVb8C0GoOMrInmKOp5JQPOcKq6pUuAIOUxsSvf7wS2Ve/SCuLYG
         FCFhplDCdm3cIshKUJ7Oc8xsJXrxT7zHF3wFKxAx8sQQSq1We2ikruwy0I6QTaN5a5Vx
         5MklXle+9kdlCHyDlpcjVkO4aWp7MrEzJgd8pd9a84Ie/DVbVPKGRzbee152l7CJKP4d
         c0aZ4lp4j2MKNBXXMqZTsCxXvgeY2IMIcQkcE9HqbHo6Wll4UX0dkkOlkzHiZENfUwU9
         Ilo/rXT4fnsKi9KGdurJqUXLZeNZF90LaFAcKfOQeS0026JDQrPdqF1A8P77SRaT6MpG
         KVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132334; x=1686724334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8a1pVM0DGaS6W157+gRqo4eM7NjJYx+JRCtEwK9RVc=;
        b=HxrRwZ9dK5SZLZlwupWwoxioztdN1uSsxmnmmiofwsqYAGhdsiMLXQUMFQskBcPDq/
         JKYZYstxy7YdHfuyxAiUQNjLIqzM9IQEmAM+BiJnP9gS8TNPQhm7iDtOGtXoJjVR+blz
         S46L43b6BaVovkWbsEtWGnT5Yf9r+wAw2HBr27O9IoxcQXAS/UM3LBeNu6z+BDYsV0oG
         sgqpUjKIe2R3lhRxeGnrw9Za+7HzPRqpklKGIsTLRB2EIDE5TjjcpBVB2/zZXSGe9cTv
         4EgHFmF5i2dohD7gVxXuV7Co98ajJq/EcRLeEOmOOJKI3vIF+6NgPEZ3IXrkvkEoQQ6O
         wShw==
X-Gm-Message-State: AC+VfDxBbBvtIy/+BMUnw+WNNpOAhIwSN5yrG4aDHhvpcigUw5SbIGoN
        ycpX9lXuhcEwYoRxm5u0tjKBmw==
X-Google-Smtp-Source: ACHHUZ6sKt1eBJkYlCxRQgz0lccW3BVyRVXju0DAlM9C3GIp+OCy5RuvfUTTAHCZJzcT/to3hYZalA==
X-Received: by 2002:aa7:d853:0:b0:4fc:725:e670 with SMTP id f19-20020aa7d853000000b004fc0725e670mr22863203eds.11.1684132334593;
        Sun, 14 May 2023 23:32:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id l1-20020a056402344100b0050504648fc4sm6870988edc.80.2023.05.14.23.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:32:14 -0700 (PDT)
Message-ID: <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
Date:   Mon, 15 May 2023 08:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515031557.31143-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2023 05:15, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

