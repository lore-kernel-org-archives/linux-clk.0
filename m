Return-Path: <SRS0=ypW/=D3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF9EC433DF
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 09:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C70F920936
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 09:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6eHkmT8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392281AbgJTJBm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Oct 2020 05:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgJTJBl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2020 05:01:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A001C061755
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2020 02:01:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h7so1156283wre.4
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2020 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q4O6c5ivLmf5Ylkh4llF14kt1PENj2Zzl8IB9YFIIj4=;
        b=m6eHkmT8IEJpYr2gcGiLGKBcZkF81y5O8Z+qXZPwHQyM4EyEn/vONmrRSoD8KUP1X+
         +zCT0rHB77mVw1NrAGD4FB0+FjB2+Pml1pNdF4eHUPW6OzP+3RCTaMgWkjDxb2oAtPVa
         Lf9ePlf8LP2nNXfB12DYW7AuoMFitb84Wq47bEvGocLpm8o+k1XlLgeqE4kURGu5SVMW
         nUzOxwwdDkDlDG9sWmobczknUQmwuEw6lSqWewhvb4A8dRKK/2xhkJGxWR73GJgSI2ET
         GaJLk2oN/ShfwRoUSXiKlub1gN9+CJ1Qr3f3iXdnWy/1iKeyvlZIrEzqCLc6V44NvHNy
         94zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q4O6c5ivLmf5Ylkh4llF14kt1PENj2Zzl8IB9YFIIj4=;
        b=a3QS7xfWjgInPzpjWxlNA+qsZ016CMdyQ1Hs9Ch1+uuL5w/z/c3IVpqAs0QR1IrysC
         z61I+5EHHACgs02K4FtCYHdwn1s4IGM0yyvWXyMTDVYRYZwA99KhAYmYmQJY3cl+DR5p
         ObvUM2nK6nbSKEKSTgMIf2u7AWDuD+t7D35SHQ3FTUJUMqPwhhb1eCqaOMuSv6v1befS
         rckNJxZUcquXJFaqq6FMyJRUYf0tv9rt2AI+SMjMUywLcGgWuir8PEbISzbnGLbMKmBz
         qKPHWblJ0mjjKH2p6+Eoz33PYqnL5fs8FrLsUV2AFl2/lA7yC/tCj6BVpPanlY65v9T2
         ZC6g==
X-Gm-Message-State: AOAM530M/adZhKx5KSVddv2Tk18OLv+p42aGJhe6As7wYOlf2rljA74y
        DaSVxfgpq3ucTnDdQ6d/skusrA==
X-Google-Smtp-Source: ABdhPJzTL0aKsgR/snCSdeHOMhJQnqO/Ml9Vj2IqzAyO5HT5bSkRr7fMGxq3FQUW7rb/RaUFkcwrdQ==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr2420156wrk.226.1603184500233;
        Tue, 20 Oct 2020 02:01:40 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 71sm2057313wrm.20.2020.10.20.02.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 02:01:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
To:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
 <160314732379.884498.15569172477533491589@swboyd.mtv.corp.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <af7d64f5-aa30-2965-3c2c-ca72aed1ae49@linaro.org>
Date:   Tue, 20 Oct 2020 10:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <160314732379.884498.15569172477533491589@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19/10/2020 23:42, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2020-10-16 07:12:37)
>> This patchset adds support for GFM Muxes found in LPASS
>> (Low Power Audio SubSystem) IP in Audio Clock Controller
>> and Always ON clock controller.
>>
>> Clocks derived from these muxes are consumed by LPASS Digital Codec.
>> Currently the driver for Audio and Always ON clock controller only
>> supports GFM Muxes, however it should be easy to add more clock
>> support when required
>>
>> Changes since v2:
>> - updated Kconfig text and help as suggested by Stephen
>> - removed unnecessary header file include
>> - use fw_name instead of name for parents
>> - use devm_platform_ioremap_resource
>>
>> verified dt_binding_check to pass on linux master,
> Which linux master? Can you try on linux-next?

I meant linus master branch. However I learned that Bot runs only based 
on rc1 tag (5.9-rc1 in this case) which is why its still reporting this 
errors even though the dependent patches are already in linus master branch!

I will resend this version patchset once rc1 is out!

thanks,
srini
