Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F352BC636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 08:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjBMIod (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 03:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjBMIod (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 03:44:33 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8D1A5C0
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 00:44:31 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id k3so3651078wrv.5
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YIdYTMgNx2IaCEVJN4jlOnxMUO1xnqAx+6A+uNEAcc=;
        b=YjkXFCRg5TcrOcgL2Fs38nat5ry747T37B6iJUrC6jMA1Z+o0w6Nilc0BCchSy4rN2
         OF3RVtd55sYCgNDu9/l75A+Fj7VAZIwaCBhNWg2dfQm6qzPypxx9OLmcB+dT1SzcZBVA
         XlaFfpmelcHXtUV4OAZXJQvkdHWdsKy33ocb1SW1b4dvXZFxrzfSBdNLH4DqjV9uw7cq
         rY98ChhHgQNg7i8EcT+4Ibe+9F9ro2YqaruhAzSKWov11JxiroCTZn/Q75k4J6DtNzJP
         W17HkjQkVAi/J+Jit4UeI4blF5i2x9EZiZPsjlRJc8ATWjk8hVKV5s4DO+fMUYkII+i0
         2v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YIdYTMgNx2IaCEVJN4jlOnxMUO1xnqAx+6A+uNEAcc=;
        b=e84PR6Zbw/UbOYNw8EMS3OdbGMR9wbgwV81hFSy165MFnyP0aYlzmg9UzyKsdDY/RW
         QiccomS9+aV695UPzngG5STi00z3MVNknc4v5saEA+cKbchE5iGGqCHEDzz5aYEXS22v
         9s4CXID98sf7UmW1wwAgvbB3QgN57lr3t2WcHJnu0fVo2wdBF/a+1znvrZ0VX7dYDYF1
         bzkXsdNjNCqfoHFTWIKmjXK75zIBc1kjLTG3HFF2v8f1UVq1uhQgiVXo4I1fb0DwfwGd
         oo27WQPc4MeIkvSdiTXSVI8F9Yd/ocDHhs3xI1OofbyFTtLyJk+5WH5c9TT1okcsSUaw
         THWw==
X-Gm-Message-State: AO0yUKWF7KRquA2QhtyhT0n+y6SVJhF7o17vbxuvIPl1uMDzsZBoqGul
        rzA3kvxO3bHsU3xJ6dqjF87BvtSyzB0XI7Uh
X-Google-Smtp-Source: AK7set8yVwUTFGFiHkPZPEALwlo9zuu100bG//XEmpcVm+58X/ACQl/dWsW+UshyzwW2OQ5yTF00fA==
X-Received: by 2002:a05:6000:1003:b0:2c4:745:13b8 with SMTP id a3-20020a056000100300b002c4074513b8mr12526791wrx.42.1676277870529;
        Mon, 13 Feb 2023 00:44:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm1353565wrx.57.2023.02.13.00.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:44:30 -0800 (PST)
Message-ID: <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
Date:   Mon, 13 Feb 2023 09:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
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
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 07:02, Jeremy Kerr wrote:
> This change adds the reset line definitions for the AST2600 I3C block's
> reset inputs.

1. Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

2. This is not DTS. There is nothing from DTS here.
Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).


Best regards,
Krzysztof

