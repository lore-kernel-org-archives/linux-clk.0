Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA4BC001B0
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 09:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjGEJqT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjGEJqS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 05:46:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D381719
        for <linux-clk@vger.kernel.org>; Wed,  5 Jul 2023 02:46:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51dec0b6fecso6319763a12.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Jul 2023 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550375; x=1691142375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqspCPIm0Y18aFwSapitTrRXi64FYkjHzT9nhwi04EI=;
        b=oomo6HIYcSDBWklrchZkpjYQjHdYru4rIzVzjRZpcroT7q0LdEDUOTPGf7qpd616rl
         uGip2h/R5t02DbSBZnWyMy3yf3GeB1/dXPHAeQKjmGL97tC0kXXl+c7NBSwZApQkNOxP
         vTqlQS8Ak3gb3+hYoZXcX9ZMQUlyIKenP9wBSL1crCXH3aQnlsXn7y6or0x0zAz6g37x
         FuJQS2CberJN7AbkFvtoOYBtH8k/cNALUYKhNU21n+Sq/SigLzqKRtz8kHh8ZBwRlIZT
         ovxUX5pivs7QfqdQruuaq9dLRFNrudLOQDVZokHAXM1441CVAg1qnJuKOnglSb8E4rm5
         /RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550375; x=1691142375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqspCPIm0Y18aFwSapitTrRXi64FYkjHzT9nhwi04EI=;
        b=O8KOUakcTGLNGUqTAk6wArnemsdilWmYYlRIH6zuttBGVl10WN7K54rTm/vxKh7nh5
         pH3T55Pr/5dcRuoIvTGB2IFB3dFclYW3H8uZ0OUte1ezjA9RrRyhqc5xIGljuVe1BJAv
         yccPxMRVoCdq9rZX5X2oY0vJ/Hg5Cai0oKsi9JZ2IIwFWuX5BucUlwkVLYIciUIct3C6
         0HEIO7mKzN5J2hTNksHuIPT68pGpYndsDHdhIprqeCYxeVD7cKxcP5naezs51mqQ8aBh
         5n5cH2OQW3eetCkbzGfqdTOHdyxm6ozk7vN/PcWttLAE522dg7MX45gS+UDw5TcibX9S
         HCpw==
X-Gm-Message-State: ABy/qLZ7EMkZYPzjSyRIB3oVLD+V3d1U7QUQJm8g1OctcKbT+Q7d6y3E
        U50HLqz/p4db++4r0Oozb0Vgaw==
X-Google-Smtp-Source: APBJJlEYHN6qlzkEw4ZEb4bn+/uINB7RAw2r3lLywW+D2hUJwfqAZy9/WrjiW/HdP3YgzdPpE/+D3A==
X-Received: by 2002:a17:906:8699:b0:94e:e30e:7245 with SMTP id g25-20020a170906869900b0094ee30e7245mr11398445ejx.8.1688550375465;
        Wed, 05 Jul 2023 02:46:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bu24-20020a170906a15800b00991faf3810esm11333132ejb.146.2023.07.05.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:46:14 -0700 (PDT)
Message-ID: <a0bd842d-b6d0-e126-7b05-e488357330ab@linaro.org>
Date:   Wed, 5 Jul 2023 11:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/7] dt-bindings: arm: qcom,ids: Add SoC ID for SM7125
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        map220v <map220v300@gmail.com>
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-3-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-3-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 18:31, David Wronek wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add the SoC ID for Qualcomm SM7125.
> 
> Signed-off-by: map220v <map220v300@gmail.com>

We accept known identities, but this looks like a nickname/pseudonym.
Are you sure you got such SoB from map220v?

None of the commits here:
https://github.com/map220v/sm7125-mainline/commits/a72q-6.0
have signed-off-by. Did you add it by yourself?

Best regards,
Krzysztof

