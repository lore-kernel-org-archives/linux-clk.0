Return-Path: <SRS0=A1Rx=CX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94B4C433E2
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 23:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B014A21D1B
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 23:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="aJfGo70J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgINX7z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 19:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgINX7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Sep 2020 19:59:53 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E6AC06178A
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2020 16:59:51 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id o5so2390514qke.12
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2020 16:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s+D9XMZ1jPyuXwGqHc+ajg65qFn6d40xSHUZSsGwDms=;
        b=aJfGo70Jabf9ZjvZMb10fhhLl23I8KWpDWnfOFg4Ru48CIqIpSHGvt3W64+QvAZ09L
         eMMy0/7+NuAnCHtAoOAkuZiYBiLJEPSaWezzPamfq1IxrLBS6nfWQ1lPKahi386qsQR9
         VBUS2yvrsMhEDG7Vk2ZNLpHkvHUt/RP0vtV/kbODtXEfRCA+XYK9XrelVE6FokN3Ub7W
         Hn5tL+kZsc0zC+fSmxhS1SFLFcgVOlV5uqKwlSiQTYV5lOcomoHqE0vYNoKXOqYIs71m
         o4S3UCx8B9xMS9dTwKcAosNr/GDx4rJFszDgPvAJuHEud8rxuonk5DxNTCWuAHZP3Cgo
         OYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s+D9XMZ1jPyuXwGqHc+ajg65qFn6d40xSHUZSsGwDms=;
        b=GGGK6v798fS/IvMWCYEbjmYYzqu1JZaNmfwXRX/iZJ0B/6X2kkz4yKg4IZaFEq/N38
         WDOgqegaaDVpW0wTCEZDb7LaJz9qR3nkLjKhGLeq1jo6O6IDF/FFOK2EoD8e8cAFyrGA
         7th55wwz35i0SAXskBltzfx2TaR67SyWTEt/ASyX7vJigE3t8OFYAf6HKkOPoxVELZZg
         ydAI4TiDGXGTNZqvJyL5EDgqDtr1GWDf1ZYvAUOWTAQlp69kJ7nrYOxD5fGoj4ZLSckL
         hMNMwZ+TqR+FLLAIw3RX3P5A2W+Az/CLgfM++LnxXplO4W3ZplLnimjJQj5zdr8nRrEY
         f2OA==
X-Gm-Message-State: AOAM532UuOuUASb/avtS4Vb4D6JvtdfPN5YRNiCPyeo5GR7M04iV7HI0
        +ndwMe5NW49kiYvAR4JmlCW4PA==
X-Google-Smtp-Source: ABdhPJz/EKcPRQd0aezEJWSxXoe5tCiYr5gNZLNu1Xag1+dH6WurzzLTZnYoALFVujHZMCflMhPn/Q==
X-Received: by 2002:a05:620a:546:: with SMTP id o6mr15829768qko.296.1600127990550;
        Mon, 14 Sep 2020 16:59:50 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g25sm15241941qto.47.2020.09.14.16.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 16:59:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] SM8150 and SM8250 dispcc drivers
To:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
References: <20200903222620.27448-1-jonathan@marek.ca>
 <fd5fbe73-e2a5-d877-743c-ad7cc6110483@linaro.org>
 <160012787871.4188128.16710718496771467444@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <540d95d2-ea53-f103-590e-a34d2d0cb8c5@marek.ca>
Date:   Mon, 14 Sep 2020 19:58:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160012787871.4188128.16710718496771467444@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/14/20 7:57 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-09-07 07:25:45)
>> On 04/09/2020 01:26, Jonathan Marek wrote:
>>> Add display clock drivers required to get DSI and DP displays working on
>>> SM8150 and SM8250 SoCs.
>>>
>>> Derived from downstream drivers. Notable changes compared to downstream:
>>>    - EDP clks removed (nothing uses these even in downstream it seems)
>>>    - freq_tbl values for dp_link clk is in Hz and not kHz
>>
>>
>> On SM8250:
>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Can this be carried to v3?
> 

I already included the tag in the last commit which adds the SM8250 
dispcc driver (probably should've included it in the SM8250 dt-bindings 
patch too though).
