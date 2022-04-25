Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70368C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 18:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244254AbiDYSQZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 14:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244250AbiDYSQZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 14:16:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B1E11117B
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 11:13:20 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g23so12428370edy.13
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7iXUh6w5klPzZmwb5uwLAuLc4DT8QKgVuYqByN0Wq3o=;
        b=dLfuIvuztwY7oZGDEDolqppkr6SYbEWG/68mEJoZoBp4Z5VJ3RUsY7L9CWlSy54GqE
         6I5QpJz3r5cYEimbdAZJzIN5QwEk0BGT8321wJ9DPZ90/Y34FX+lTatOJzGrGU51siY7
         ORTAYBCMTQfA1dGtSbjYBHnB2ZzES9Y7MtYEw5Pq2X7B0+o2Cr2qZYBlbNE4BO/sa56S
         VArRa0BUdsnQijAtLKrw/OqFMpL9bo0EduNxn/yqQdBYzvFbgepPHwY/UnTRx5TG5lyc
         rEX15Qs9D88Qqr+9c0Mb/CsFOfmc8LCEZenrrCtqdeOPPP6W5Sm/GuP3bpewkk+ntqQB
         sHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7iXUh6w5klPzZmwb5uwLAuLc4DT8QKgVuYqByN0Wq3o=;
        b=4NpxIiVMu83AqXPHHVsp2Q/7iUAX5Y2Uqt2l/BXMVgLO0vOuLUt0QFYlUi+AMB9khC
         mDiob7vT95wyaCVd6EsQ27soWhuQOSmUb/w1dpzAeIyhCxGswCwmM71S334sEQGOMfiM
         RWdJUmCsPv/jDnU0CQuv6vPEFlzWj8QE3jU1CI5UpZH/dOHNLlzWPP1qv9DWa0VFAsNd
         BFXToXBIBso3yAGTWqHTeqP2TwXITyRnftQwy4fc+G6mORkr6Ltd8aF4urWM5nofeZ0F
         sNwwpU0rqeL9HGNHp/10OXTl9kzdAazn64e41NHGCt4VPZCTWxWbOJyOGXbn38QjpQ8P
         XrmA==
X-Gm-Message-State: AOAM5324pHQjXrbo5HIqx44DKMLXWemmS6ZJx7PWGhYIj5aEYd+NzTCu
        Bbmm41wpZ62z0LaD5HtJTRa5Zw==
X-Google-Smtp-Source: ABdhPJxKuXeaUAj8ZrVnSgp5aI4Q43HTeLfHUZ/VwVZHs7i0fciNqh+oIbav14YsHrviQQqTDLBXaw==
X-Received: by 2002:a05:6402:2999:b0:418:eb22:64f9 with SMTP id eq25-20020a056402299900b00418eb2264f9mr20130391edb.391.1650910399169;
        Mon, 25 Apr 2022 11:13:19 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006e894144707sm3904428ejb.53.2022.04.25.11.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:13:18 -0700 (PDT)
Message-ID: <1c356a5c-ae85-9aa7-f8cb-e463480c24b8@linaro.org>
Date:   Mon, 25 Apr 2022 20:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible string
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220425133527.3723233-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425133527.3723233-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/04/2022 15:35, Rob Herring wrote:
> The compatible string should be 'qcom,gcc-apq8064', not
> 'qcom,gcc-apq8084'. Found by enabling undocumented compatible checks.
> 
> Cc: Ansuel Smith <ansuelsmth@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks Rob!

Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064
Documentation")

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
