Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6D6C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 20:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbiGFUJM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 16:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbiGFUJK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 16:09:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D0B186E1
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 13:09:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y16so27678437lfb.9
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=L8DTfq0A17haA8PrzESImW0A0vAqb2TTX88eAMxkKSs=;
        b=BaNAZAN8Ey3DxRg4kZ1FW0Knr+92LENOOrVvEW1b7mEpGbZtBjo6ZKoXdgZERe4j2f
         +EohmvdmnP0KXho1Ux+wHF+zvqgZg/a9DCNbk86vfgrKJ4aYVlqdPvyZaMO5dXerOGL6
         Jc9P5kacpUNDKRipouaPFFFBigel1xZIkBLvzBmDHkpO6p76cz6HTGVTj37Vr6ke74ob
         RQr5R5cr+vfWOrYwOUOQCm1ivgcyl4uEu+wJn9ZAxbt8OecFKgIPyhDyH47MVQuxmIfe
         WX63XPJtz06tRUYg9oOeRICMsOrnKqAbRJi201rfpNWdX6amBUw+tNBHbUIi+avzDl9X
         AyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L8DTfq0A17haA8PrzESImW0A0vAqb2TTX88eAMxkKSs=;
        b=4HrEElz5l1BNg6JeODEi8tlgYekLaOzLyhaRZuWsKY/WZlCLw8a0RijiMvFionhx+Q
         uoL0wLseBkyCb2uOMUJozueUAiXKb8tGDQTShuUwqW5KQSRZ87WHeBPZ/f0fPpkJ9LvO
         Fh2ygbJ1k+MGcHUNlLRg5P+m5FbIzKAdTeSipCTGYtisomfUOck57lCuR+ozJJEeaKU1
         tx1c1f9X3CDDxNOtLt/4yF9FlBVDWeNNA3D9dHnvxjp98fFz3I7DqmkZmHlHzL/5jN8l
         1CbH7+7sEGe7kR9WZO0jdtZA8mdr5SDbgjC02/21fCOyfHxwOl7qH6yHC+p5zOUMJfmB
         hnOg==
X-Gm-Message-State: AJIora9HhciTiI2nrfXktWd5zyROHOMeFA6P2S+7XcqAn3ofz9fNFrr7
        fC7jnX3B6zwtQAxhGsQONEZ+VA==
X-Google-Smtp-Source: AGRyM1tJTPfDmRl23fBqdP0m32ujrkJ0ZHgPEbSUIojL6Gcc1siGm1BZ2LGNfZluNXw7Sd4UGqL0Yw==
X-Received: by 2002:ac2:5b02:0:b0:481:286d:afdc with SMTP id v2-20020ac25b02000000b00481286dafdcmr25785099lfn.24.1657138147418;
        Wed, 06 Jul 2022 13:09:07 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id 2-20020a05651c00c200b0025bd4ec3ef2sm3472926ljr.81.2022.07.06.13.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 13:09:06 -0700 (PDT)
Message-ID: <e1fed734-8629-5bf2-60ba-ee62243def6f@linaro.org>
Date:   Wed, 6 Jul 2022 22:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] ARM: DTS: qcom: fix dtbs_check warning with new rpmcc
 clocks
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705202837.667-1-ansuelsmth@gmail.com>
 <20220705202837.667-3-ansuelsmth@gmail.com>
 <18e40247-7151-b50a-97fe-00ee88f47d9b@linaro.org>
 <62c565dc.1c69fb81.a4566.e9b2@mx.google.com>
 <bcb64218-2d2b-2f6b-dc79-303bac8c3bd3@linaro.org>
 <62c5de27.1c69fb81.c73fe.02c5@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62c5de27.1c69fb81.c73fe.02c5@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2022 21:10, Christian Marangi wrote:
> On Wed, Jul 06, 2022 at 05:07:12PM +0200, Krzysztof Kozlowski wrote:
>> On 06/07/2022 12:20, Christian Marangi wrote:
>>> On Wed, Jul 06, 2022 at 09:44:04AM +0200, Krzysztof Kozlowski wrote:
>>>> On 05/07/2022 22:28, Christian Marangi wrote:
>>>>> Fix dtbs_check warning for new rpmcc Documentation changes and add the
>>>>> required clocks.
>>>>
>>>> There is no warning in the kernel, right? So the commit is not correct.
>>>>
>>>
>>> Oh ok, the warning is generated by the new Documentation.
>>
>> Patches, especially DTS, might go via different trees, so the moment DTS
>> is applied there might be no such warning.
>>
> 
> I'm still confused about this topic...
> With this kind of change, I notice I sent Documentation change and then
> rob bot complain about dtbs_check having warning...
> 
> So the correct way is to send Documentation change and fix dtbs_check
> warning in the same commit OR keep what I'm doing with sending
> Documentation changes and fix DTS in a separate commit?

Binding is almost always separate from DTS and always separate from
driver. The order depends on what you're doing. If you bring ABI break
change to bindings, then the order does not matter, because each order
will be non-bisectable. Because you broke ABI. That's the case in this
patchset.

For other cases, usually bindings patches should be the first in patchset.

How it goes via maintainer trees is not your problem here. Patches might
go together or might go separate.

Anyway it was not the topic of my comment. Comment was about not
specific commit msg which does not fit the Linux kernel process and does
not fit git history once applied by maintainer. It fits even less when
backported to stable kernels, which you commit msg encourages to do.

Best regards,
Krzysztof
