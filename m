Return-Path: <SRS0=PmFx=O6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE91C43387
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 21:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7881C21927
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 21:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnM0HfTd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392005AbeLUVpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Dec 2018 16:45:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37066 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390836AbeLUVpq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Dec 2018 16:45:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so6652631wrt.4
        for <linux-clk@vger.kernel.org>; Fri, 21 Dec 2018 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IPvxWyDGn40AW/ybwE+RF5uPIUCl8L1WOlqQ8THFUlQ=;
        b=MnM0HfTd74e7qQ66LwmA+S82wJWAJ4yv+6y73Wio2bLQ5CVdwGt32PgqJcjH+7S2XB
         Y3VFlfe4U74b8aqAlqiK1lKHniWk+xHHdrVjRTSC8D62h0yQTvGpA7a5QfRjeNaSW6ua
         nxhIJioRS/33gNC70NRq3mJvjghJTRUF4nFiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IPvxWyDGn40AW/ybwE+RF5uPIUCl8L1WOlqQ8THFUlQ=;
        b=RsA42xokDYkeGIdq04zKbuT7r7cy3hfY151B+29CYOy7W1ICzhQQJECjp4GrKW5IcE
         BKhlMwyefVad7Awxu2HLl+92vp7zfgQUgs1InpgB+Ug+jWHbo18w1w9HJuXGmKMS60Sb
         inQHhKFZy6V8pXBE8Wk0wsxNpGd/e/1Oz8B3483Q8r+pZPcFUxHuc1E9x3P+gzXkaxJq
         A2eRhwoQfTjINTRp4w0agVKd8luvJ9T1eamI/ALo76ZWuOtPvIJDGoW/9D9Vza8MYUgg
         vNEow7UOdnpJErbthytBp9ZdZUUezRYGGgLyIKYPwZSsi8ANxTGhI+f5xFP9fh46B9Fb
         Y+OA==
X-Gm-Message-State: AJcUukeY1kWqlwOdg+X8DCeq6AXY/IXdeJHSuoYCwE8sLKD284un1qQ4
        GQa2+h+HbTS/H42x26o6v0F2AvKlx0o=
X-Google-Smtp-Source: ALg8bN7d3xmC390m8qd9j4u6JLMgH+J+Oc8P81C/AeBE0yty8l06+1uwYNDNQmEWk6JFlkpLwkLtQg==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr4338977wra.81.1545428744225;
        Fri, 21 Dec 2018 13:45:44 -0800 (PST)
Received: from [192.168.1.2] (119.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.119])
        by smtp.gmail.com with ESMTPSA id o5sm20036921wmg.25.2018.12.21.13.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Dec 2018 13:45:43 -0800 (PST)
Subject: Re: [PATCH 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com,
        vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <e97d9050-effc-56d7-0f9b-768df90dd73a@codeaurora.org>
 <6814777f-1e5f-bd99-db63-a0050dcdd930@linaro.org>
 <874ce15d-67f5-8e55-8b62-73071fe6ae06@codeaurora.org>
 <20181221192823.GA9704@minitux>
 <94b12f58-b586-6b4b-6c0c-b4adad80d7b0@linaro.org>
 <154542841268.13075.13095552962351570142@swboyd.mtv.corp.google.com>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <914bd56c-4470-4f78-75ac-f7bedd83d7c0@linaro.org>
Date:   Fri, 21 Dec 2018 22:45:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <154542841268.13075.13095552962351570142@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/21/18 22:40, Stephen Boyd wrote:
> Quoting Jorge Ramirez (2018-12-21 11:45:28)
>> On 12/21/18 20:28, Bjorn Andersson wrote:
>>> Perhaps there's a better way to define that this particular clock
>>> hardware can change rate, but in this implementation it must not?
>> the initialization for this particular PLL on this particular platform
>> is wrong
>> as the interface does not apply to the platform needs even though it is an
>> alpha_pll
>>
>> if the VCO is not an option -even though it reflects the platform
>> constrains-
>> I would suggest nullifying the alpha_pll_ops that do not apply to this
>> platform:
>> ie: set_rate, round_rate set to null in the probe.
>>
>> allowing the interface calls (ops) to go through to later on make them fail
>> based on some setting would be fundamentally wrong IMO
>>
> We have clk_alpha_pll_postdiv_ro_ops so maybe just add another set of
> those for the alpha_pll itself?
>
>

something like  clk_alpha_pll_fixed_ops?
