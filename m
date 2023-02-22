Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7D9C6379F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 08:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjBVIvy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 03:51:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjBVIvw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 03:51:52 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1AB37B5E
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:51:38 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18-20020a05600c359200b003dc57ea0dfeso5590093wmq.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfBrhAkfvDzSYQT103CNYwOYRIGgy/xTOer7X5fqJvA=;
        b=zjn0sCN67VEJwRZctIEYtVn6bqNR/M3hjI0IZwQIjoX2V5XJoFLBkc9f4Dc0oCp7iC
         +57BzjI4AlvJ+0mT43nsM9eN3aAxX/9vaIwgyphJ0N+sgjzT+MYRVmxmVWysHJ9jSSLm
         fxYDsMKL4kP4KCn5n8OJfSAvD49da7XfNqyG7VLfnpqqaeigDK/Fx3U4lceyAK0kvwWW
         thk1hIwtPgJqppnAZ6IacXk3+YHwtUMf64jX4qw0L8+2ZsgPJHcYNwh9B2Qu60VSOGXM
         XZPcm/wPsmPl7Buv+xTHvHoKJ+6hpbfEjSMNT5oj1jprHquOUmoWV28DFNW9EW0iLr7U
         jrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfBrhAkfvDzSYQT103CNYwOYRIGgy/xTOer7X5fqJvA=;
        b=CgAlKcTui46tHzNTpahDX84cD6XZc8Q/2NFTQfpB57ytKyC4zusWTdqDxM1PZ/Hcws
         fSbUbOrzMy9Azkn22EcPyqH7dWSdgp+kXeHrUAoa1l1QK2JHKjW10kZ56sk/3R23+HBa
         cmoYGxF8167aKAJUuWUVxyxkRNnx0vuTo/GiP+eB/e0qL31HrHBR74WkmNzAlwVQNn0J
         a/qwwykW1tXBlcHaopwZsFtnzT6IvvIjuhj+/g3/suKQXvsRIwOsQGnuDgbr/t+BJ7q4
         s+zmJD3Wc3xPnWG+dUEnQDsS79LqqEBg3p4vJwNBklgGXOnU1cRq5uE+G24bAWyMm85q
         u31w==
X-Gm-Message-State: AO0yUKXgJjwGI4miYoU02jm3UU8v+xyaURdolonMkmBhc5hY08M9UGdQ
        OwcbX+KB+kcmG3rUlFeHcsRZ4w==
X-Google-Smtp-Source: AK7set8tVs/89bnsyxH9+oWo79Rxno2T1W8Y3MRvURMneanA2P5MWCsjHseMcIOdshsj4bqfAUK+3g==
X-Received: by 2002:a05:600c:1693:b0:3e1:fea7:ab66 with SMTP id k19-20020a05600c169300b003e1fea7ab66mr11704815wmn.8.1677055896971;
        Wed, 22 Feb 2023 00:51:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm8422416wmo.23.2023.02.22.00.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:51:36 -0800 (PST)
Message-ID: <39fbeaf2-6fd9-43f5-d4bd-ba285e29d199@linaro.org>
Date:   Wed, 22 Feb 2023 09:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-4-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221174909.164029-4-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 18:49, Otto Pflüger wrote:
> Document the qcom,rpmcc-msm8917 compatible.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

