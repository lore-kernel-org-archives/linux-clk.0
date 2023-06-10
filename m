Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B7C7EE29
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjFJQiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjFJQiO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 12:38:14 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BE91984
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:12 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso4924643a12.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415091; x=1689007091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hp33yA5HcmdHo6uDlO7P+JfSf1kHY2kxoEjyxwdelr4=;
        b=qpWBaIqFetal+BReZfUxUTyc6Jao3DQNWqNlxdw8JnRTnxNxho/XZvNQz6kE83BBO0
         9AESFhLOtsmkcdaO7cEDKhjp9Euc9dxTmfFl+TDXNt28M4cbF48nxbDmz1V1HRp+KoDZ
         HhU+EAzkqemptHxjze8XJi1TttEK+Gbrn2iRET14U+/o7BYIr/7ycjj4VhaPc63q52ZE
         NDxzsSxac9XDEoVRh9Rrbd4b+b32RV2vVlFsI0z0+nzoP8+w+cHXQ2vUdz/jK7MO6xmH
         2aP2X/06q+4APRPW1I4Ghzrjd9gMWPAwT/t410ZJIMRoflwn8M6B8+OQ4auePe3ImtRH
         +MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415091; x=1689007091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp33yA5HcmdHo6uDlO7P+JfSf1kHY2kxoEjyxwdelr4=;
        b=OXQmCAAkY1w+eA+C1vp6ukhbh2Dc/MvONcHOTeWSsw9s9Bma/XHW0xYQGnx2scZr4q
         ZKAfCJVaDjR9Ibm0XDDqrS3ZFSONReRgcASY4FXUC7iYyU5f3xEbw+SEgYfQA0b1nAOB
         LIYwrjMNFeRBZPV37Wurz023exsVWpwqc0Qc4X78H4ibXHUqnPOEhvmyTXdPxsUPeas4
         uGPdSO+8+4x77gOCpfwTdSeA3Kpd439UT10GXiiRt5uugppuGnWsvK328KBABAeRnPEb
         aC45eAxodzTF24l6SfgZp5vG6MNSekgBxLyBmRzGq5kPjlpeGGZ7LzkUR/rzW/3WcImK
         E+VA==
X-Gm-Message-State: AC+VfDyozg/fF3ZBhYNN31Pq3vhEXQxhWjWxuhedJGIBqx1Aen/sWbaq
        ZjhTozbBwNqO5NElu43RKlNWTQ==
X-Google-Smtp-Source: ACHHUZ5WhgtdYTW5eL6c7P8syI3GQHp0HZckc2U6paAq8Szm4VAUQjVE2jDkIGK6LbHNiZyOsXRPdw==
X-Received: by 2002:a05:6402:690:b0:505:4f7:8a50 with SMTP id f16-20020a056402069000b0050504f78a50mr1600989edy.5.1686415090961;
        Sat, 10 Jun 2023 09:38:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7dd09000000b005163054e330sm2968446edv.87.2023.06.10.09.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:10 -0700 (PDT)
Message-ID: <b18908cd-fe52-8f2d-2882-503460909936@linaro.org>
Date:   Sat, 10 Jun 2023 18:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/18] dt-bindings: clk: gxbb-clkc: expose all clock ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-6-9676afa6b22c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-6-9676afa6b22c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every gxbb-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 
> [1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> [2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

