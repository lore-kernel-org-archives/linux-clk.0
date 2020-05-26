Return-Path: <SRS0=OzFb=7I=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60A5C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 26 May 2020 23:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A079720849
	for <linux-clk@archiver.kernel.org>; Tue, 26 May 2020 23:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="s75QVjRx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEZXaO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 19:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgEZXaN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 May 2020 19:30:13 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E29C061A0F
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2020 16:30:13 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id z80so22688173qka.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2020 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=muYolnYZmufgcHzMuhz5medXrKFllBeZIV0QKir0gLA=;
        b=s75QVjRxg1JImvQV+OJMPp/TgNXfTCYbs0KzsaS+JyUdWLHTSXt07wIK/DyhXy/4Fw
         ngwEw8trvE9ofv4Ss5sJt27CBrf6KW2qUPLwCI/JMw1oVicsBcyjtwRhnDWvtOussLU7
         l3R5cDpM58uiYnvcA9/wD64TafQp+MRCs/7EsFnYX9wKOGZvNQg+IvyyF/TNz3MCCYVq
         wF0QPWYk4znAPrklYVi6kQTnaQfF5hbZkgWHLvBuyHKOOoHlnEe9LBlrN83sDLtZGmS+
         lvTCicmEhZm8xyceiNENWlVhycsgTzO5q9yVOIrDW3ZvhEDeVzmsqQy4TaT6tEy/qtaH
         B26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=muYolnYZmufgcHzMuhz5medXrKFllBeZIV0QKir0gLA=;
        b=SzZ4idmGnhFLLXvw9SfduRLbM0bansm7eIeO3CJgVgAQlosJfq/5grn4fbDmRkj1s2
         xJ1gxbo4SH8vfBj9L3/JwKP+xiiXQ3Eip+HCz1jaTZ4n56HMPNxFip+36l+6JtHRK50o
         JUVHm/gdStoon+EaoUIkmRFx+gNYclZvmLjvul8FCpdpSVDfMB6ubtZ4uLOc2yQEzx5j
         LhD0N3nqL5TBglLcUT6cDEfBFG7gk5oZ2yw2saNdySaCCu0eirIqGVKZtJ29bulq8nVZ
         JYdI9IVV2gggK1GLBf7neLZNFJvVgHcImJHmZ00LO6BXzrtnknbaJe/AL6ObT8Yx/69b
         3yfA==
X-Gm-Message-State: AOAM533FKQxUAskbyTMQtu9fK3y/scpC9VX35yRCYgiaJ9f/CnQHaZih
        UBvR1nF46jj75dlpam2939xfaw==
X-Google-Smtp-Source: ABdhPJwz3LWDpaFCddkPLoA/lLv2hAE0TJMt/S/YcrFyegb0aLfFp9jP+WvWm8sKW3V0K3dLSRV2FQ==
X-Received: by 2002:a37:684:: with SMTP id 126mr1338066qkg.486.1590535812308;
        Tue, 26 May 2020 16:30:12 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v1sm906851qkb.19.2020.05.26.16.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 16:30:11 -0700 (PDT)
Subject: Re: [PATCH 01/10] clk: qcom: clk-alpha-pll: remove unused/incorrect
 PLL_CAL_VAL
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-2-jonathan@marek.ca>
 <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <86a7c49f-44ea-11d3-2983-8443ad7ec309@marek.ca>
Date:   Tue, 26 May 2020 19:30:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/26/20 7:21 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-05-24 14:06:02)
>> 0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
> 
> Any fixes tag?
> 

This doesn't fix anything (its unused as the commit message says), does 
that still qualify for a fixes tag?
