Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CBEC636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjBMJG6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjBMJG5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:06:57 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B386CEB79
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:06:56 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id k3so3716092wrv.5
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLWu10DQx+qn08ahKIWeZviWaNMMEUUkvNpohUv3kkA=;
        b=fX9PXVrAm5lqsZ7DDeuDuYuB065HN7eGeSdRbshfKC7d/HHm/s483w1tiG9a48rQ4Z
         ODaUNB47FYUWxpXWfMQSk3P+/Mtc4aK0dH0EBdIsIW12iLpXA9QW4xix0ADMg2BhD/kZ
         pBhahbHWD1OwrFnZGDUccaweZpcUNtgF40iNJG5C4evgy0gXm6o6TfbRO9uwlToLuTzq
         7K7iZ0TBYHiIxIGWV4tURG2KrR/wkQPm1bPKIy6NHeFIc8G6ORNys9Wcbye/GXhyA7Zy
         vZrgJWwKIwEEhdm0c2qKUfRuQV2lDOpMpnFEAKyno7rkXuu4Z4RsFa5XagVbB1Ez9lOa
         +rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLWu10DQx+qn08ahKIWeZviWaNMMEUUkvNpohUv3kkA=;
        b=mWLKjSWyPRHHqyZVyt6yxD7Sa9lA0gT6MCMrtuA9whjXbH91NfU/WsnfHVZdW9XlSy
         QZmF7oMVlcQP32VWu0LuPqxg+FY8pwcNw6e0qJC6TXsIN8fLiUB4X1vjkWvpv0jr8dXG
         D6jaGRIVuQPOEZSopdtol3KtFLk1zSvMqPS8fsW8aZr27YDPFns8cw3xGlOYJZVeEYNI
         zidVMQtLK+V+QGnf2ympBp5I4mu2ATfHaPtwC21qgavo/ck1Y2tb0snHm2MVM7ORbssa
         0vG1iqwvo1hyAqynUWm/te70eNoCj3yLYm4h4p31MbDyfsEONRivQXp0ysHGTHZhxplh
         DfWA==
X-Gm-Message-State: AO0yUKVrkEtb+G5t4uSwl2Jl1iKf4RcvUGEAfdn2seMaySFNs/+kEo8e
        32tHKYWM61R8m589uDzwnxfp8t/ZX6W1X0nB
X-Google-Smtp-Source: AK7set9nP2WVVnV8sFiOPZH8sacqNGYYKvDF4e5RyL2+QyiRPUw6Dj+hv0u6ye4Q/mBptzv7B1Cf1g==
X-Received: by 2002:a5d:6707:0:b0:2c3:d69a:1da7 with SMTP id o7-20020a5d6707000000b002c3d69a1da7mr18863722wru.0.1676279215317;
        Mon, 13 Feb 2023 01:06:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003dc48a2f997sm16207034wmc.17.2023.02.13.01.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:06:54 -0800 (PST)
Message-ID: <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
Date:   Mon, 13 Feb 2023 10:06:53 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 10:02, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> 2. This is not DTS. There is nothing from DTS here.
> 
> [and from, your reply on patch 2/3:]
> 
>> Why do you use subject prefix in patch 1 different than in patch 2?
> 
> Ack, will change to "clk:"; there is quite a mix of "dt-bindings:" and
> "clk:" on the changes within this dir. I'll unify across the series.
> 

There was clk already, wasn't it? What do you want to change? I asked
why do you call it in the same patchset aspeed and as2600?

Best regards,
Krzysztof

