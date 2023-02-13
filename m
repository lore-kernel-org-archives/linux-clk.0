Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C060C636D7
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 08:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBMIpA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 03:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjBMIo5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 03:44:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE6A10C6
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 00:44:56 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r2so11269082wrv.7
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 00:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVhmnyzlvjU6w08QExRu/9m1+Smxo1ZuK+3+ewxQH6w=;
        b=ce9PhkrM8KBdrxGPKkF//JQ72Jf3C86E9bAfdsACY7vkJPlsRQ7U5FLlsbvloeyoDs
         nJdUN7Fwq8SkViocpgckP3Qi00lfpMF1EB+EbRHs4XecO9AqYXfFTIBN5Poex9cLWq9N
         YeQqkri0L9RDT4kXruqMYP/3LByQcYhIx/f8cLzEmCdCeimDovmkdWr5CnWu5tWvFMPH
         4VRItkQhIjgImPfC0P5BlVi2qbXz3JzQe3UwmGW3WXoAA3VhaeBaLm3Ajb0eUGeYfPI6
         5iCw9T1/W/A+6oCvvUmARMyb6/bFisL9czYsHdrxEe2lJKQNX/3vtgbK8OvkdIhXwknK
         YeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVhmnyzlvjU6w08QExRu/9m1+Smxo1ZuK+3+ewxQH6w=;
        b=obwXvQT3zJmFdgFqeRoldjyL5qkaWNIMc3patvOX+Kd5iwmUwm5IxDaJtvo5acae4Y
         FyfYDvpGBc2AWcxo3NYxMGcfTFsJ6u543+iJSdwWWh0oa/hQ6XpUg7dLfpj+76H8m9z1
         YzGJYjYaHNteUl853C3SP6W1u31SeV1Ihj6mh9AwFpR7p3pmySQWC24rp+KxiCrzfV2E
         995F2I8W7rp8q8ALsJO+sguKQqS4QTjQHm49EptIWswEYpmOR4ju8/hxoiDu+8dPa0/2
         I85kDcuyF1Y2C4V8TdeEx6P1tIseQd1h1dR1Kol/pLSdBR+N5KkY70xmGqEbQt8Vbnj2
         49DQ==
X-Gm-Message-State: AO0yUKWBiKt3uT+qnL8nrKuwTuNOmAVI8hIA1w/PptKCqYh+4t+dyziU
        X40HQgJTlC8RpnY82ojKCR5E/w==
X-Google-Smtp-Source: AK7set9Bf8sZZnVH9yHy5eoKdsD65/9rHk/Bl88GUtYBCSU8RhhUWNl+dZb0GhT13B9JLrxh69Xo1Q==
X-Received: by 2002:adf:fcd2:0:b0:2c5:48cd:2f04 with SMTP id f18-20020adffcd2000000b002c548cd2f04mr8157187wrs.6.1676277895424;
        Mon, 13 Feb 2023 00:44:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b002bdda9856b5sm10079519wrc.50.2023.02.13.00.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:44:55 -0800 (PST)
Message-ID: <d0919faa-63ef-0957-afb4-543a05864fc9@linaro.org>
Date:   Mon, 13 Feb 2023 09:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] clk: aspeed: Add full configs for i3c clocks
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
 <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 07:02, Jeremy Kerr wrote:
> The current ast2600 i3c clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.

Why do you use subject prefix in patch 1 different than in patch 2?

Best regards,
Krzysztof

