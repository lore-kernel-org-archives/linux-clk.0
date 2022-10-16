Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199CBC4332F
	for <linux-clk@archiver.kernel.org>; Sun, 16 Oct 2022 14:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiJPO7A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Oct 2022 10:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJPO7A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Oct 2022 10:59:00 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2633EA4D
        for <linux-clk@vger.kernel.org>; Sun, 16 Oct 2022 07:58:58 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id x13so5327029qkg.11
        for <linux-clk@vger.kernel.org>; Sun, 16 Oct 2022 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94t2xqe+OdxH6nw1RLn5l9VcdIlkbERgEyRMK1tKi2w=;
        b=YKj7a3O2h/GPL5DUSw91DN6kJVWQXbE6UOg1s7oJxa7RnpUfmN8D5ThBxHpQFFMejq
         SmkKXNgQuV/BqEcX5UuvL3pkTqkj4gPBFREQ3mYZr5jYMzqGuHDoBN7hkVUoLJgnw5S0
         toAPuskX6OiTTNlkuEksrcXInUpPOdtvr+IPVuQCKzJWHD8Erv9JaO402uVHMT+aEGzc
         9HMcnyTnd9jFNCe3ljOn+G5eV3QMQpro+/kSwwakCnkU1yNEa5MydzCz7tqkw0ZofsaI
         2rGf7VBPFH6wmWnzggm6aXWBVYCVEnscKXvSsXiXpmHsHPyqA8YI6+kes+ruo8ygrSsM
         AZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94t2xqe+OdxH6nw1RLn5l9VcdIlkbERgEyRMK1tKi2w=;
        b=EkTuBV+m3KNu8aWjV78gNt9xr1xjrk8nRUvtcx/l80IYlGxHl2HFUINWHX2lEnbuQF
         kBH3a0IV6BEYJAIhAHnmTNdooDRjOXvuZtSaAIacQVntCv3io4G5szFfSPOLs/7PZB56
         bFCUIuWDBv2wvXB8VeXo94x1vudnHqLQmTH9WM4oXKmeUGB3omPy+/+/qA2uF7RAv74/
         wFsYqYU4jW1rxEBI9GwpzORiEjh4xe493NKC8D7hE6cd91q/GwgfjEAsvRXCoaE8iCYw
         M1RUMp+P2WlgNCZC1gr+JLCQJfYHNk2XEALGPoXJHxeg6Zt60IlBmgcsYcjEPcEcvpD2
         eU1w==
X-Gm-Message-State: ACrzQf01ZsJbYnp41zfClIDbDb9iC/8N0CeJMErgdgHv08CcP0ljDrHD
        uet8u7nFpcqow7QtC2Psbnn1Tg==
X-Google-Smtp-Source: AMsMyM7YcaJPdtLkvsnF8IXbx4ROovmFXQGdB2Gk6CwIqZuLBcofIIaN+KPOdiIbm9AXT3KFn7BgkA==
X-Received: by 2002:a05:620a:40cb:b0:6ee:79ce:e985 with SMTP id g11-20020a05620a40cb00b006ee79cee985mr4800621qko.219.1665932337681;
        Sun, 16 Oct 2022 07:58:57 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id cn4-20020a05622a248400b00304fe5247bfsm6017682qtb.36.2022.10.16.07.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:58:56 -0700 (PDT)
Message-ID: <a1a5f90e-f3e6-acfd-ab95-dfdc5cfdd855@linaro.org>
Date:   Sun, 16 Oct 2022 10:58:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] dt-bindings: clock: Convert qcom,lcc to DT schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221016143514.612851-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016143514.612851-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/10/2022 10:35, Luca Weiss wrote:
> Convert the text bindings for the lcc to yaml format. Doing this showed
> that clocks and clock-names were not documented, so fix that now.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> - drop minItems for clocks (as it equals maxItems)
> - drop "binding" word from title


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

