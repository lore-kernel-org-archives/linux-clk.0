Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0C2C636CC
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjBMJda (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjBMJdM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:33:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D29193C8
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:31:28 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so8484795wmb.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/JPD/HGFlcGY8pIBqzAr6hXkdmNjgye2Jc6JXxETJo=;
        b=bFObU7jMb43E4r2kfQbGn//VMigCYiTVobtSUGjoUzlrxyjRvcTBsDbi3EmACqqLL/
         /2pTJEm35swfMuXODC0abe7SHHOpbktZu1PBVMqXkXr4j3RwvHibyy7roVtu9nCIG2WU
         bo7eTnvAo3cNl8wwriafJtx5pbko5p4PXV3imfXfFKo+mbg8BLBc30URsyxxi9lz+FEF
         4uDCVNhpljbycR/HqVAefHEYq1cE8zWBQ1rMBC/QS3cBbY7hCxVx2dt13IYRW3EbfqYY
         dcHuqU7ziwD4e4pKeaHkGM5c7G7aRmObe/hqDKy1PHOBkayVLgzgRV9cv4nnFtDiV/iM
         tNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/JPD/HGFlcGY8pIBqzAr6hXkdmNjgye2Jc6JXxETJo=;
        b=asw3x8vz1ywQTN8EPzXad7rlktX3R7L1KEOcGrDzuqAjoCuyf0wANEo3R7WrZIcj04
         YsjL36TzZ+cKV0y+W0rfe1K+88HbxW7fW/YDkV1j/12PS6jBYCNkUTpx2CrX+dC1NT6O
         ijSyGjtKFOXnCy+I87hJNi0X7UUNHNw4dtx30Q3MrWxBn4Y9I5Z8sraFbLH20enThZDt
         GJC7JldI1gkoqiQGeVDcSva7HeejQQyT2L+l8coOFLbk1R+CEBtNzgWW/IzaDMgUpsRt
         a5ba+THdsHc+j0XOnWJ/pTLRklUNAjESCPo8NdO4k/A4+jjb+nPiOV3SEcYzKW25NWjr
         +ONw==
X-Gm-Message-State: AO0yUKUlOle9s1C7r3sU5BVhvzv6KQ/PhdTHquS+gANk4oPNci+n89BB
        OMPKeHcIfYCCJWAJQw5exnIk0D6iuoGRNhdS
X-Google-Smtp-Source: AK7set/3O02tVN540fg79wkPY7NmAj6IESdePQro8rPLH2jh2lj8EcwtxFSfvBKV4Q2GWJGTPLok4A==
X-Received: by 2002:a05:600c:319a:b0:3e0:6c4:6a38 with SMTP id s26-20020a05600c319a00b003e006c46a38mr17604539wmp.33.1676280685520;
        Mon, 13 Feb 2023 01:31:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s10-20020adff80a000000b002c54c7b9c78sm7205100wrp.76.2023.02.13.01.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:31:25 -0800 (PST)
Message-ID: <1ab0b28d-8935-4e4c-ba8a-635de1f5bb8d@linaro.org>
Date:   Mon, 13 Feb 2023 10:31:23 +0100
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
 <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
 <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
 <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
 <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 10:23, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> There was clk already, wasn't it? What do you want to change?
>> I asked why do you call it in the same patchset aspeed and as2600?
> 
> There was "clk" and "dts",

In patch 1 and 2? Please point me.

> where the latter should have probably been either
> also "clk" or "dt-bindings".

Aren't you referring to some other comment now?

> 
> I'll unify the "aspeed" to "ast2600".
> 
> Cheers,
> 
> 
> Jeremy

Best regards,
Krzysztof

