Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0482C6FA9E
	for <linux-clk@archiver.kernel.org>; Sun,  5 Mar 2023 09:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjCEJzy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Mar 2023 04:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCEJzw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Mar 2023 04:55:52 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177CB14233
        for <linux-clk@vger.kernel.org>; Sun,  5 Mar 2023 01:55:51 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id i34so26963319eda.7
        for <linux-clk@vger.kernel.org>; Sun, 05 Mar 2023 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678010149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaiCZo/+1YA/uk2vyGLpxGSRliJ9pY9vxuYVZhWCjpI=;
        b=TWvwQKWi6F9tRrBcDHcjKZmTm+Z+ZXiASZY0ROOG1pH+G4cghvi8fiOawjrbjK3JjT
         BRs/SuxOVbnt/3N7pjqy92tlpjlf7AEpYXUHBB+Mw/BQwVqRJ7UrHyIAPKQWJ7GeGADg
         T+UU5BdbruMktGDrtxCNVWzHxBmuaP3KQxM990WkMvgoVJrZNclMuH5qUFy73n4A1nwD
         0PDKTrVuL5FlsSc4vjFnv2QcxbqxNrLFscDN2gzwksXVqWZu8blco6hMA48sHwWwIIxd
         Pz4WgstQhAOx+Q2l2yR/DeKp5CrDMPNmSVwLibfhWWOLf9XEKuEA7JnsKIA7nnSr6hjf
         5Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678010149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaiCZo/+1YA/uk2vyGLpxGSRliJ9pY9vxuYVZhWCjpI=;
        b=fDMRsAUA6+igMgKjGeksQkek4WKAkR/pCb0s58BdAz+s72DZB2kQaI2mXzbU0lpZLG
         GymIqxYKwJWYIHvPjE+OZZXtcKyApb9k6aNFv+ZjNV4mJhhsNVlz3lqiYrulXH5f5QH6
         wGDop9tP5VbMcaKBz5N2W0eyyiGDn5667k9ETCnLKjAnemnap0S4wWiR+NmeMm9Tsxwa
         Oz3v9vD9o9+N3SE0+5IpLYOCr81NLp/eKKk54sF7zH/0Y9aclhiDOP/K4c21Rp+MHWKp
         LireOrgJR5dqD2v8HJ17nZLa0XFnEnDfHuOauQ3eYreBUc0REFqu4fpVvQwYmOXa+YA4
         YDHw==
X-Gm-Message-State: AO0yUKV31nMK6oJpvQr/DwtK9YbSSCKLw41cwX/xcpW3Oy7mWNfJ0f1M
        0eHNuygafcY7Z2pRZ16ptgCrXw==
X-Google-Smtp-Source: AK7set+C3D5+JtstYgkM4mOMlB7yc0ER4V44acEGOOuTGZ8p3QsibWZ+oyRvCVhN7MQ3TVZ+2e7DFw==
X-Received: by 2002:a17:906:29c:b0:8b1:7274:1a72 with SMTP id 28-20020a170906029c00b008b172741a72mr11376470ejf.6.1678010149625;
        Sun, 05 Mar 2023 01:55:49 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id d5-20020a1709063ec500b008b1797a53b4sm3015368ejj.215.2023.03.05.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 01:55:49 -0800 (PST)
Message-ID: <4f6b5931-e023-07a7-d593-d7a0b12499bb@linaro.org>
Date:   Sun, 5 Mar 2023 10:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: Add Hi3798MV100 CRG driver
 binding
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304063333.162309-1-mmyangfl@gmail.com>
 <20230304063333.162309-5-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304063333.162309-5-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/03/2023 07:33, David Yang wrote:
> Add CRG driver for Hi3798MV100 SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---

Same comments for subject as for previous patch. With fixes:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

