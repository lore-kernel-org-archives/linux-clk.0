Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68274C25B48
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 18:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjJZSpx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 14:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZSpw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 14:45:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ACF10A
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 11:45:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-508126afc88so1875632e87.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698345948; x=1698950748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dfq44KtpvVoTi226YXMj5pM9/ZBtfwTToNeSkmatPXk=;
        b=kPPKS60s7Gx2wy9Oj0La519Iquo3rC/zpwmJcUtDPOl5BZFEGhBWliSCdrgodyjYRh
         5jK0IVIlUKlCy7T/KiRJq3wpNhhOOvtHzl3vEOXogyORYqmZ8A/zsCcjfSu11cMMVCb1
         QB4WwNCYdsZbcoxvaXmJUH1Y2CCi//WwH5xmCteeViBlUSyIfL8IKQX9bMEFgQyywuPZ
         JxrL6ONOYBPUkEqIeNveR8YYp/A9El5QSEpUfapEiflCcjd8otSdt5hIbNMlKWQYnkBv
         7pa/Du4IF8WGy4JoSVbFvT2nVkoxolTHhzH/vpi5N76YxQ/QF0BPiE8x/EVOq2d7r6NJ
         UFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698345948; x=1698950748;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfq44KtpvVoTi226YXMj5pM9/ZBtfwTToNeSkmatPXk=;
        b=A95Pxkvli40Z7uyTBjETgXG/KzsnWnA2fSa1LMLH0yPcsIOQ4luVY6mq63sQlCTJFG
         Wk/LSQUdS53FAPWJ0tl+v88w0Qp27+bvBVVY7EXewuHU/UI95fpabpkJ2UvYxR+SfbhM
         p5EBfHEL9z3E6dkK+OwvpMnHiv+pI5FisU/KvNpSuKzZz8r7tZIpRtNiQN5PDUhNS2Nw
         M4Rus4M0+m5An2n+RH/VJCKv7qm6vf049Z0cfVpC07V2ceB8wMvOQmr694KTKTAsIYM3
         5GdgamFNh1TwJbmFGLHfQggRnsBWP5tGffQhi9e09jhbhpf9FF7b7h7Zo6qk8JSyI3a+
         NyEw==
X-Gm-Message-State: AOJu0Yxh7RgzWVh8HdSnBxctN6gHXlkaBO7aHqpK5Ri0lkePsp8VPeF3
        3Ebmueco9Q3lwvxF1gG8abD78w==
X-Google-Smtp-Source: AGHT+IFujQppv52TAisp40xugmwbZaGNvITv9y42W1AvnCP4R391ggguFC+CGFL20f2whKEh/xoHkQ==
X-Received: by 2002:a19:c510:0:b0:503:34b8:20b with SMTP id w16-20020a19c510000000b0050334b8020bmr143296lfe.65.1698345948438;
        Thu, 26 Oct 2023 11:45:48 -0700 (PDT)
Received: from [172.30.204.255] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n21-20020a05651203f500b005079f69e019sm3092962lfq.59.2023.10.26.11.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:45:48 -0700 (PDT)
Message-ID: <1b99abed-6572-4550-98cc-56667a507883@linaro.org>
Date:   Thu, 26 Oct 2023 20:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231025104457.628109-1-robimarko@gmail.com>
 <20231025104457.628109-2-robimarko@gmail.com>
 <77314fe2-2936-4f89-a347-4eb288507c47@linaro.org>
Content-Language: en-US
In-Reply-To: <77314fe2-2936-4f89-a347-4eb288507c47@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/26/23 20:42, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 12:44, Robert Marko wrote:
>> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
>> and drop the curent code that is de-asserting the USB GDSC-s as part of
>> the GCC probe.
>>
>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>> ---
> Applying patches 1 and 3 without this one breaks usb, no?
Sorry, my hands don't keep up with my brain - that's almost another
speculative execution vulnerability!

What I meant to say is:

applying patches 1 and 2 breaks USB

but

the solution here would be to apply patch 1 and patch 3, followed
by patch 2 (unless it will make the USB defer, IDK, it's probably
easier to just test than to dive deep into the code)

with Bjorn taking both subsystems, we can make that work I think

Konrad
