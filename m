Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540CEC43457
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 13:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4C3C20848
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 13:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDXq+5dR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408315AbgJPN6B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408192AbgJPN55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 09:57:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55970C0613D3
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 06:57:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e17so3007102wru.12
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D+Oj1pj0xy3pRTG2tbwccw/BvWEVT+/elwc8Xpf2+ms=;
        b=DDXq+5dREgrKBdNS5zYxq9+ypSTjRgAp/ciRqn8b3/yWoQO2NQcZ3qiGzZihicFwzh
         OSKVorGcQ+Nw+fctsSOaK5KbLncywVTX6ZuiK7mYSElwllKamCMVemviNWnqq1mbVdtB
         zerN5dGDQTbe+ce2xHxE+2CB/JjMsaM/DyltB/GU9ugfzCxsKo75b1wnRifLtiv4w11p
         eAw2D0DRUadQ5veCRDIBh+upOxC6bBZG+rOz9YQOl6LAbreGYEdBfQm34Pe68SJzxNxv
         uoDOxmBUXzdEq3n9iM5hslW6fmLNP2BhjDJ3CjLd/ZbibEyBz/Nz/KVVV+rEm13xevMp
         6q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+Oj1pj0xy3pRTG2tbwccw/BvWEVT+/elwc8Xpf2+ms=;
        b=pb2iApOdlg6otKk/AXRhoPkt6hFBlH9hh0+klp9r0CnFgCCwV9ag6PbrXUHuWCMfFA
         zWCeQj+dP6mvPsTKRLiAHe/3OC8Y0ROCRRZZ/PmTKcwWS6Lb/EWXsaSQTDMZJX9fMEFQ
         A3QURBhe5+Lf0yfGKTqj7FRmEJ7ZtG8mbL6Ox60qbQQuUWwbzBniyoG4MShvkj9OyevV
         qpjKRAN0FnV9Ju1fGmD3S2oBmW83dhjlBku/kn/UHczr/EyiXcIkgxr2XOJXvAg8z6HR
         7Zuhrmq7Ul79uMtUHJB/TS0Fg7dvDVCqhniwp3bJ38aUdoc4JzSuGpC5XKLpw2+Obf9d
         i4lQ==
X-Gm-Message-State: AOAM530AIyDxe+tqk/6uFyCZCHBgiX/Mj2pAIcYNwV0QtY1ghITzRukG
        ydc8B5tE84bJQUc7NkaMfp2IAA==
X-Google-Smtp-Source: ABdhPJzQWk0tbOyCNjqeSDXRj8WMg9EHO3/jd1ZjGhTEY6ctOFAVVz4uMWlvIssusgBkeMNP4rmQsw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4220816wrq.106.1602856675984;
        Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u15sm2791368wml.21.2020.10.16.06.57.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] clk: qcom : add sm8250 LPASS GFM drivers
To:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
 <160263991247.310579.116180302037536226@swboyd.mtv.corp.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <19d0f252-924c-eece-0788-a24d9c7b9645@linaro.org>
Date:   Fri, 16 Oct 2020 14:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <160263991247.310579.116180302037536226@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

thanks Stephen,

On 14/10/2020 02:45, Stephen Boyd wrote:
>> Changes since v1:
>>   -removed unnecessary Kconfig dependencies
>>   - cleaned up header includes.
>>   - moved to using pm_clk
>>   - Moved to right place in Makefile
>>   - moved to use module_platform_driver instead of builtin_platform_driver
>>   - add null check for of_device_get_match_data
>>
>> verified dt_binding_check to pass on linux nexthttps://paste.ubuntu.com/p/6nVzjRwvsW/
> Rob's bot complained again. Can you run with

Yes, I think the bot is probably checking against linus master branch.
Now the dependent patches are merged in master.
dt_binding_check passes, I will send v3 with the suggested changes!


--srini

> 
>    make DT_SCHEMA_FILES=<path to schema file.yaml> dt_binding_check
> 
> and make sure the schema is up to date?
