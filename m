Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB76C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 12:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiKUM3v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 07:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiKUM3e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 07:29:34 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF770BC24
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 04:29:32 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d20so14272047ljc.12
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9VGbTdcjI69cJd6T5Y29ZL4qR21t3iDewkJqc/IFFM=;
        b=RaIJxLHPHfZLewaejHUmvriS4VxxpBoof7yZWKTrgpjq6Ir/W09iujWKS5p3OiGHS+
         Vx7kc5ntQkhhRmxNIrRjTZk32fghdrZeDHlPDyS1tBCteYLPZ02Cu5G6Tw8zF5htvjwT
         79rZ2t8Ey429gHYI2ahP4bpIXdvn0SprNttDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9VGbTdcjI69cJd6T5Y29ZL4qR21t3iDewkJqc/IFFM=;
        b=sH80zibuTaj1ICr86Rle3SDCzJRjje1VAG2sBV/UtkAOyA7UyRPjpH+1Y3q1ttZXJ0
         yMqKUjqbKqLt3yhhlObhz4givH0xV0nd3ml8Gyz/0wAbXN6oDqT740Y9VFsSMwHDRKng
         a89FDWOJBi5fnP2ILPubcvlcL7yZFP6gAyigT5TLe8FdDnNNb0WR4AU2GfnVyZipVHvJ
         nVi6KrOjnZIcPjkaTt/z/k2eHk7QmB3Q04LPAMWRVp1KB1OkXxu/V2G5THKpsWqBRECL
         f2ey9fkKLe+eupUsirprnzs75a3zRMEvCfnzuPjxLJncUeaDFycZfz+LE+InjnqpEjxO
         kyMw==
X-Gm-Message-State: ANoB5pmJ8IH46dpYzkQSD2U/C4B6lBTN/gtaWt3ZwcHoVWCJ4HZvsy7L
        xCNcBHbVwfqf0s+MKRh1ICajxQ==
X-Google-Smtp-Source: AA0mqf51hj0SKvLVLo/DraL1FBcN281aZZjpuwKu3knVHO3tQJeb/JyG/6HQAU7XsEVZAAM8y9EvRw==
X-Received: by 2002:a2e:bd17:0:b0:277:50a:bd5c with SMTP id n23-20020a2ebd17000000b00277050abd5cmr5622192ljq.6.1669033771111;
        Mon, 21 Nov 2022 04:29:31 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512200f00b004917a30c82bsm2006521lfb.153.2022.11.21.04.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:29:30 -0800 (PST)
Message-ID: <2cb72f22-3e9d-c146-734a-ec0b306bdeb1@rasmusvillemoes.dk>
Date:   Mon, 21 Nov 2022 13:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Content-Language: en-US, da
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
 <CAOMZO5BPtEU6VCZXRk5FTHXDad6cegF=+oHTTA0wgjBuoh9-rQ@mail.gmail.com>
 <09611b2d-096e-058b-5349-627684e3a13c@rasmusvillemoes.dk>
 <CAOMZO5AXSSkHpeuHNRQ6qkFoe2uiFLVxndz1u7_y7s9cLD9ppw@mail.gmail.com>
 <8cce4dae-c653-515b-1a5d-024986afbabf@rasmusvillemoes.dk>
 <CAOMZO5CpFXjm1a2C01=uiHLjcNSe4MzgLUyfDvK0LCdQ8+KNEw@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAOMZO5CpFXjm1a2C01=uiHLjcNSe4MzgLUyfDvK0LCdQ8+KNEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/11/2022 11.59, Fabio Estevam wrote:
> On Mon, Nov 21, 2022 at 6:44 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> 
>> That doesn't seem to be true. To test, I just built the imx8mq clk
>> driver as a module, and I could certainly both load and unload that on
>> my imx8mp platform. Sure, no "bind" attribute shows up in the
>> /sys/bus/platform/drivers/imx8mq-ccm/ directory, which is exactly what
>> one expects, but the module can be loaded just fine. And since it can be
>> loaded, it should also have a proper __exit call for deregistering the
>> driver on unload.
> 
> You are right. Sorry for the confusion.

Thanks. Does that mean I can keep your R-b for the patch as-is?

Rasmus

