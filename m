Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7B9C7618A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 12:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCSMXF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCSMXE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 08:23:04 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C31231C0
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:22:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so36774142edb.12
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLR4LWH/SEibOh12DRO8823NjnhehlvqpaFntdr6IBc=;
        b=BaGvJopYVCk3/1Du8VDyB/7EahUfkn1u+obdgIYhAAWCKZn0LmJ/2MInNnGoxareva
         gUhRIOUieweGthkw/zFsYwrRWhaTFnrhC9VfbNJSB9+KdA+J7ckEXiS0CizThCeVUrYM
         yTH7MyjbD4sdgTBrwB+59WeDFpwXtQI/bY16nCx8PLwIt+dmeRuKbFW0MRPpBvce3rZb
         0qyOVzTJMkDeixrev/LD5f+SQIaCDNyGpZ+g6NjSnKXW9gVBQMwlDyYkHUCGZ8PY3Yyb
         k2odni7UtBuFEL46+y9LfWbDwm5Nw6MAEgknawZXjEms0rWB1IPlamqbRfg+yt8SutEQ
         uwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLR4LWH/SEibOh12DRO8823NjnhehlvqpaFntdr6IBc=;
        b=yp7ldaNpXU3oPD67dfgY/+sJkN1pLq+JB8MRFGAf+A6BTi5BxceC93djL6JR4aAMlr
         M4/6HX28NHVr8jKA/JYSwc6DlstO7TWaEQdb1HIsQ7gvOMOris4SvvEUyfJIxIEHNuW8
         KUIOIvQR4CTZW45kd115Zi4rHnMkHRPqSHYLvWa9BAudZ0IAWwAlqDg3vRAsiwYwxLx2
         HqwjpXeM5UxOJ4KX3iqnIcH+21nJDlafHF2hAuIJQ/AtXxT7WpvrojuCHzvwvIe39b8A
         h7Wy21gQ+jbheOQjWIEiV6eXgyTF+8f6MixNxhLB+00GGnYGtZFRgciBbxZdFot11oHG
         EG8w==
X-Gm-Message-State: AO0yUKXG4p+q9OdFaV19O0d9inmJXWa6XBRveI1NY22+qTYzCJMs1roN
        o0LtofAYBdj26xFBbQkj4H5OGQ==
X-Google-Smtp-Source: AK7set/cKJxZGrZkBkAa3PIs+HYiS8gzKrsBzUIceteb1K7qEumRotlLR1CNftiwjvWSmddBXxXJjA==
X-Received: by 2002:a17:906:e08c:b0:931:d36f:8965 with SMTP id gh12-20020a170906e08c00b00931d36f8965mr6158222ejb.13.1679228569443;
        Sun, 19 Mar 2023 05:22:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id x93-20020a50bae6000000b004fbf6b35a56sm3459266ede.76.2023.03.19.05.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:22:49 -0700 (PDT)
Message-ID: <5a42e212-f03b-70ce-898e-ca0402565a44@linaro.org>
Date:   Sun, 19 Mar 2023 13:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add Loongson-1 clock
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230316104707.236034-1-keguang.zhang@gmail.com>
 <20230316104707.236034-2-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316104707.236034-2-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 11:47, Keguang Zhang wrote:
> Add devicetree binding document and related header file
> for the Loongson-1 clock.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

