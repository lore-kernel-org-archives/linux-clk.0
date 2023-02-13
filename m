Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEF6C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjBMNoO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjBMNoN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:44:13 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C98683D3
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:44:12 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a2so12277628wrd.6
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YndzVf3v6/PsLB4xK8l0Uo2uF+AS5qRQ1VgyuaYEtU=;
        b=ytH2NJkcPta5r4EPLRm4775bH0r5ADtnJOIFsbPl09/9KNCMgIaz0PZV0BfJeqrnlU
         quS+NGLbT99F2JIBYG6vbpD5/cKVtpifXUqqS6600N+5wH2H9WhF/teI/24Zaf+X8QEN
         1+d7xqvzZ2KsizaauuzRc6Vo7o4hmEjWJcvVM7uvFnTF9lc9mz/nmdDKPJDiKPXpDSZu
         JTVTTi4EJWM1HaPisNF4f4NwI+nv4CUWrfPs3S0TUqz8qUCRcmAoaJgba3NdZyv77XEu
         ede5e4NixFfzGxYTtC6a63WsB2CZDBQhBdoDz3zzOr/XTMYKKSHT4raPwz6A6MLgQAF2
         k0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YndzVf3v6/PsLB4xK8l0Uo2uF+AS5qRQ1VgyuaYEtU=;
        b=iM0tNYDzl3z14IePSxdtN2xogJ/i5HLWkQqWv9bXct9C39H7f4jlaMs4RU8IT0tib5
         YY6KDEDGi+8ceI31yc+7ER0tlGY3gLj6m11MeIKk6aqyYapuKxSRDweSaZyQ6/oWBbNr
         p2rwTX03tTQ2psDkkkE0yiGJKRQAD48IPYBds2XELOB4W0QDJknD+qpf+hq9Z6nSaaEZ
         qyYvkxR2C8P//ft+sxMX790t2rK8srTTgSh+u5L/F9p8ulvWGfTHN12UBzQHTx5sM3pb
         VotOBvfUw0yrAdyqBmQsqIhAKFr7aaGGvCL1SXdGjYuPQkXfBIugwjrw8fvSTeivl9CF
         J+wA==
X-Gm-Message-State: AO0yUKWh5WNe0FBsLOmhr2IpdUrpqBZPw65LPDjIDx2toL1yC5KFu8OZ
        +VJ6nwhSnvKkn1//eBAjIOzSzw==
X-Google-Smtp-Source: AK7set/17SJjnCRcpQIPGHx+EFyoU4FpCGw43e1kOiXX79UznQPjL3PPfrqHr+skXbFC8GK1Qch8Mg==
X-Received: by 2002:a05:6000:1808:b0:2c5:5929:4bcf with SMTP id m8-20020a056000180800b002c559294bcfmr2854910wrh.28.1676295850679;
        Mon, 13 Feb 2023 05:44:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d43d1000000b002c54bf0e9f7sm7801758wrr.117.2023.02.13.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:44:10 -0800 (PST)
Message-ID: <eb0fa8ee-9c14-c8a4-2d3e-6180f5d875b6@linaro.org>
Date:   Mon, 13 Feb 2023 14:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] dt-bindings: clock: ast2600: Add reset config for
 I3C
Content-Language: en-US
To:     Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
 <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 14:24, Jeremy Kerr wrote:
> Add reset line definitions for the AST2600 I3C block's reset inputs.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

