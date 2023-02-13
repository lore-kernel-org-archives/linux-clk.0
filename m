Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F421C6379F
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjBMNnj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjBMNni (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:43:38 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4731ABD5
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:43:35 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m10so3359031wrn.4
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aopjYrYB6lNxYdmLh60CeH28kAqTJY8+y17BTONkm+0=;
        b=G96Ql8WhMUdl8LmADGnm1ExabL/RlLv9ySNC8GNvvQyzlezQ7Kr70m2MVZmkBz5Fgv
         g03THpQcqCU09HDy5ojOEYHaULpDiPriTblIcr2deFupSKYrMctqD/FMbxDPkifVyJeV
         c5uutP5Pbz8ofHKlnnZ8MCP45vi1QP4q92WrHxAvHcIdWruhZLsWyfsy4TrSYHcFrylk
         5toCIK1+XMiJH+a/kkANBi/p3wv0UZQlueLiLB9pEpGPRjzgF1rd3XS3C1EcYKuQIdEz
         Vs9LfLMu8nPfCs7J0T9d/jjjdk/X/U1koixz1t4d112MsYXnbghp/cl28AVVb2BFCcLC
         zdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aopjYrYB6lNxYdmLh60CeH28kAqTJY8+y17BTONkm+0=;
        b=pXg9zN13CSDQmNcRla5Wkdt2Dj3SGPXileWqC9di7bBYRZ1SKop6W0ijUq0AQcwhDG
         mJOb1fAHy5E0GavCxxsNX+hrxBRn/IlETNMSZkc1t4S9MUF2c+wGoZa0OF4qCMDkkH+8
         ACmk4IU+SaY+yl8XVOc3HtNnHJaJPceIKNBb+cy7DI1s+6NffIpko5O0pL8DB5OBWuev
         +R7Zz+sCGR92R+DewYiqL9MQafdMFjNwCdnIxB0dFqKAys1fwo3iYIDah+toYz0KcUbH
         XDVMvp5f6Ek0MiouA88rM+jxbizAtQ7i5l7H2Av7qRSoUzcZQxi8a3i0ZzT5ODsX0MQT
         ntBQ==
X-Gm-Message-State: AO0yUKXmtUhhYzk4B0DJ59+erq/2mDH5IQuY5f7OEWVFqASf93Cm7Wb9
        19Ipsc/7TGb1c2M5ZJN9jhMP9ZiYTs4HBAbw
X-Google-Smtp-Source: AK7set/x8KbCQcviVr1136A2VxVn4Q9/9dCl7s8Z2qc2gwfD6HGMpAYHATlJvtf9ep+5w/6w8o1ogg==
X-Received: by 2002:a5d:608b:0:b0:2c5:6036:2567 with SMTP id w11-20020a5d608b000000b002c560362567mr700741wrt.11.1676295813865;
        Mon, 13 Feb 2023 05:43:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t9-20020adfeb89000000b002be0b1e556esm10469056wrn.59.2023.02.13.05.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:43:33 -0800 (PST)
Message-ID: <bc0adda7-9636-b1f5-3fe4-67ba6a3ddc9b@linaro.org>
Date:   Mon, 13 Feb 2023 14:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7
 clock definitions
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
 <1b9bb33e75c0a84880035954d500a6e608668b99.1676294433.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b9bb33e75c0a84880035954d500a6e608668b99.1676294433.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 14:24, Jeremy Kerr wrote:
> The current ast2600 clock definitions include entries for i3c6 and i3c7
> devices, which don't exist: there are no clock control lines documented
> for these, and only i3c devices 0 through 5 are present.
> 
> So, remove the definitions for I3C6 and I3C7. Although this is a
> potential ABI-breaking change, there are no in-tree users of these, and
> any references would be broken anyway, as the hardware doesn't exist.
> 
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

