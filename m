Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AD9C77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 08:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjEQIbP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 04:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjEQIah (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 04:30:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934C85595
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:30:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-969f90d71d4so66502966b.3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684312202; x=1686904202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBwHznQm8CzxpIL8Db7tiHw17drcLtBwGVeWtLImY5o=;
        b=zDV5NJE6zxpmpAcAoalbbVYFRPnGI1edn47vzk7aPH+IpmmDVTkSOlB2gdA0e15c3O
         q9BL3tKrQMe4I02nfkT7NnWVOCeTb/ul0kyzr4BaOfsi3shF4mycLxl1nbiVFLXHh5Cn
         NYZgdhH272FVRbtJrOHThNi7W6Uw5Y5vTWEVcBSacmKR9ykRZMfEuKRLrUs/YAJS4Xdn
         EjaDvQ+b1YsljmVlm9QW1JXtM8naOcjiaAHAq13ApNNA9Il/ccomoLbQmHNusetIxu6h
         mTd8Wg2zMgjgOPTT5KhkdTlde7Yd8xGNVBLnn3Zmzy6czPu2D1/0+BBsRpQ/IIlr6Iqu
         xmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312202; x=1686904202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBwHznQm8CzxpIL8Db7tiHw17drcLtBwGVeWtLImY5o=;
        b=Qi1y1cd4/l9zuocfk8FvM6j8VKzhxpTNGcwwgrxErC7uPP5ZvGec1dkQ5BjYVxIDpJ
         Hsk5k+E8lclTCOgxYFdDlRLhRopbI1fE72hDiRpccP5HOahqrXBbPTBPrsLZsOFvXumm
         VtT0O3NiU0Kxi8ZRJrykmmSunVrmTf1aGbDOoGNtnA7/BBx3qNymJ50U/1RaJZGarQ2m
         J1sG7wlJmNIdPRFv/XZ1gYtr1HpWKFsEtLJLCaPJ4TQ4EOryDPrpQn2LTaCvevnwD3v2
         2QWX1PHW4KQZGDCj8WvpIx5GnAxuoAzonUSTo5w5u//IvPzP4n5CN5+PhuicdqBmVv7j
         f+Tw==
X-Gm-Message-State: AC+VfDyfxDmdrTDJfECp7YvgMLDFCrRNazFuUHg6L+qbTEIIGxUDadTB
        ouKcrKdGyP/zuL89YoIkejl0UQ==
X-Google-Smtp-Source: ACHHUZ5Yl86YlxSEGmlP2DUjKvLji+nG1QDh1NQclrC+wx7+FyYqE5GEM1fOSZuGX2PwoRo9m6iYDA==
X-Received: by 2002:a17:907:2687:b0:94e:16d:4bf1 with SMTP id bn7-20020a170907268700b0094e016d4bf1mr33235409ejc.66.1684312202100;
        Wed, 17 May 2023 01:30:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id fh3-20020a1709073a8300b009666523d52dsm12025206ejc.156.2023.05.17.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:30:01 -0700 (PDT)
Message-ID: <03764be6-e8fc-c05f-3836-4979c3898995@linaro.org>
Date:   Wed, 17 May 2023 10:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: ehrpwm: Remove unneeded syscon
 compatible
Content-Language: en-US
To:     Andrew Davis <afd@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516184626.154892-1-afd@ti.com>
 <20230516184626.154892-2-afd@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516184626.154892-2-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 20:46, Andrew Davis wrote:
> This node's register space is not accessed by any other node, which
> is the traditional use for the "syscon" hint. It looks to have been
> added here to make use of a Linux kernel helper syscon_node_to_regmap().
> The Linux driver now uses a more appropriate helper that does not
> require the hint, so let's remove it from the binding.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

