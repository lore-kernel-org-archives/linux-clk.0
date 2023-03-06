Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C65C64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjCFWgl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjCFWgk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:36:40 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ED02D56
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 14:36:39 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j11so14752237lfg.13
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 14:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678142197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRKu4v9KZZKcH41d8kbmcTc0ySWe5P8FlK/G+cjkahg=;
        b=l+3+2SwZgi6US76HhdieyvtH/y2ZGGj+fxs/NEaPAkSXTUwyjabn1n8SWEiLWn47Q5
         IJG/1w5l8kC6Vuu/0Ynl4hCmzmWR/heP0C+W2AIAXooodzCa2wg0CQt15zgWFEG5I45n
         0gfZ+BiKQAu2OUam4uvMmpOjU6NI192GO1azVomYat4/1VtlXtPjjQ7zmsk2bbRgdwxe
         ZY5Kp2qKDySuGgIszA9IkJrTDYgFgJ1uctN8fl1y/5gJ0KvUmrXV74ZQBzltpetX7bn8
         E98uPtUpJKptwWeYD1ITzKDECjkCP4gjZHhtDTWWQYwfRwe+mZkJXmSTcwTO/EPRHsc7
         jsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678142197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRKu4v9KZZKcH41d8kbmcTc0ySWe5P8FlK/G+cjkahg=;
        b=8QllW6rTLazwRXDbzJ7Yyka/TbkYhMh6rYaS+c3a3TKKknxgu69vSj1fy7qyE8Wq9J
         1lHBZMNwnxm/iwAW3W3CZBUo2J9K1sc7d4m11pTgZsP5G7SXDwd4QK+KudHW2tEnEdP7
         QRla/sH+QyZriLGdpjCdvWcbW1H+jVp7O4K+H3B5JzFtsR9rJwhgpjE1hFlE5FeGW/48
         Wg5HL3fYK0zQvx0LEAgkQf/3z6g4e2XCTkVr/H2Xys3avb5gdFsPJkX7+nXefxiwNoQR
         uLtIxSXKBynJ4fSvxY0A5SLt8iValms3IUwYTs8vhqR/KA0KMODvsqmCu42k2lOtH6bo
         CZ4w==
X-Gm-Message-State: AO0yUKUtrn1WJlAGQiL2fnt4GieH9LrlKAYjcD5eZIKAVwiXUcLVPnW4
        oUZExTGeEBX99Dvg1BQKsKYRgQ==
X-Google-Smtp-Source: AK7set/6PFEk3mybNHtJmIiIp1XVVjPPyLOVzK/Epk1sPy0t7J30f5KGbBbKXFZ5AM6wqDWX0cLGKg==
X-Received: by 2002:a05:6512:110a:b0:4db:5123:c271 with SMTP id l10-20020a056512110a00b004db5123c271mr3590200lfg.29.1678142197209;
        Mon, 06 Mar 2023 14:36:37 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id a12-20020ac2520c000000b004db4f2f08f7sm1788399lfl.28.2023.03.06.14.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 14:36:36 -0800 (PST)
Message-ID: <e9ee054b-279d-3007-58b4-14dab904a54f@linaro.org>
Date:   Mon, 6 Mar 2023 23:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6375: Update the .pwrsts for usb
 gdsc
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
 <e04a406045121aa31762cacc02b2300d.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e04a406045121aa31762cacc02b2300d.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.03.2023 20:35, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-03-02 18:29:11)
>> The USB controller on sm6375 doesn't retain its state when the system
>> goes into low power state and the GDSCs are turned off.
>>
>> This can be observed by the USB connection not coming back alive after
>> putting the device into suspend, essentially breaking USB.
>>
>> Fix this by updating the .pwrsts for the USB GDSCs so they only
>> transition to retention state in low power.
> 
> Is this a temporary fix? Is that why there isn't a Fixes tag?
Yeah AFAIU the upstream dwc3-qcom driver is not fully implemented
on the suspend front.

If it's a
> workaround then please add a TODO comment indicating the USB driver
> doesn't work properly.
Will do!

Konrad
