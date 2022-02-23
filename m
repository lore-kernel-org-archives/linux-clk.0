Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6355EC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 08:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238816AbiBWIAb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 03:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238314AbiBWIAa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 03:00:30 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFE179C5D
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 00:00:02 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3F76B3F33A
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645603201;
        bh=0xTh4hFbTPwbf+ePQ8BHMeIBtxU7/uHwVLEfcY4fm78=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=XXBpG94nBYkvSPOPtvuP3dGLRH5InnZ6umkC7oOEsvG/gclfQVW7mWq8cQ4o/KeAR
         Gg+OYlDpr+iSu/k/gxXQpQkSFFUtyDmhsOsaLWczsFOpXODA+Jmmv2kc99MFGzd8aO
         wLK6mpw1Dz6UjgV8isd8Ai6YqdA0VnsDiPDz0Tlzse0aGgAj88wn5LaScqH1BoD55x
         CZ20f5Ep0D+K35o7iij4CKyBRFv0t98uRBqwDttYGwMPoy17arG7ZmOo92mCU9oLwq
         YMQe4OIT6/6px61fqYqbz3m0A4HK/D/zQqgrx5ygMBnR087WulubdroWaGnqbnc1Tx
         I7EmkkkeYgMPA==
Received: by mail-ed1-f69.google.com with SMTP id e10-20020a056402190a00b00410f20467abso13202134edz.14
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 00:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0xTh4hFbTPwbf+ePQ8BHMeIBtxU7/uHwVLEfcY4fm78=;
        b=0CkPL70vLNaPZX8awGJ6Mw01dQ+UxF425KSXyibmQKGWlC9PDPdsVZSQ1LwJr50dkL
         Af/YigEIU71natZ+ySkPMfRxhbHh+FmMsBlsi8Cc4HuxIU3BQGJr/DaPtMyzkTS4c+Iu
         wgs9Xw0pahX0/Vwi0QsrxTu5LDCpWPYgwodfn5VaCK5RSluTw8pz83WvbQyTrbR1oLt7
         T1OznEnjoQbOTZ7SKQZ191uLYGYzW68bl4teoaEUANktgV3WkBDid2QQ9PZVfyr4bP9+
         /c+06jR9NQ/Ef2NOXJwqw3fJTKwLgVKlxBgsJf/1tik40hE92sKkbRQa///r8KXhpVhh
         0LrA==
X-Gm-Message-State: AOAM530NqcrjgUaX7G+SwI1dmqzWpHfuHaAbyF7X4FTTgNf/rez8Ghhs
        pGl4sVSHD3y4PgQ8Pqe4g4maGkjbwgPOeGX2n3LDOpsF9fecn3wY7U7lJgBKTmauWs+Xb218RbX
        CXnqb7fbCCt16Kh+sQw0zxM0prt+ouO2q5zi+9g==
X-Received: by 2002:a17:907:78c2:b0:6b7:ecfd:7b94 with SMTP id kv2-20020a17090778c200b006b7ecfd7b94mr21592111ejc.370.1645603200871;
        Wed, 23 Feb 2022 00:00:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbTuWFvalNHVl71bvqSMslTNLiOjQOQDzYAoctBuKPGYWkAs8WXXS8I9PjQCBFuI0UnVbTAg==
X-Received: by 2002:a17:907:78c2:b0:6b7:ecfd:7b94 with SMTP id kv2-20020a17090778c200b006b7ecfd7b94mr21592099ejc.370.1645603200691;
        Wed, 23 Feb 2022 00:00:00 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id h5sm7085865ejo.124.2022.02.22.23.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 00:00:00 -0800 (PST)
Message-ID: <3abfe9cb-68d7-5644-c422-226ca259e7c9@canonical.com>
Date:   Wed, 23 Feb 2022 08:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add sc8280xp to the RPMh clock
 controller binding
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220223044516.3776637-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223044516.3776637-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/02/2022 05:45, Bjorn Andersson wrote:
> The Qualcomm SC8280XP has a RPMh clock controller, so add a compatible
> for this to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
