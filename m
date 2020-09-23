Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A2C4727F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBE0320719
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="LDMkD7Dk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgIWQZd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 12:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgIWQZd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Sep 2020 12:25:33 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5804AC0613D2
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:25:33 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id v123so226770qkd.9
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bod+KA++P85pU20jfJ5vwCcsVE27X5/8ush82A6fa28=;
        b=LDMkD7Dksx6sEh5TMPKFRCduNXALi8F1ujxrEamhcNMqTf2RdkFpFlLcRLV68MogME
         b09UtnzuVu2+zzitJFB0HLp4Uub8hrMjkqafMbSNjCqq0f1POJvtQQNJvBmHqj2G5h5B
         7Oj5aG4en1W4p+Km7wPq5M3HL+oq/kcUOLFzi+aTvULnVDLWg7q2Grr9hU+ySWxdM16x
         zWHS2+WPHCLsoGF/nv4P7eI/meB5Uww52K24p0VpzcH3pFFSLZ2+LdlsSThcU4a83KW4
         mMQIn5R1HC3lAunoL0gL3qRJVYwzMjcObXhjUKXpHQ5bAmN5GuUrrRtVojrrmUc2OQ4r
         xH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bod+KA++P85pU20jfJ5vwCcsVE27X5/8ush82A6fa28=;
        b=GEHcKfWV8TWxTI9zd5aWuNCVVfScibWP70HJAdWdihAcgOguVwOxlmaUx9eusqHUiK
         g25g8/D26whITHTHGGM+1BFdgR3ZMKlrWzSpARZDC4iLQzbp1u3JLwDzl7OnbBBTHNCN
         HbuaKqFGC4JJcuHoX8EbDM5FaVcvuGf4yfHIErclleCwz2FVCc45WIU8ohge3uEsKSjb
         C816chWqdBZhRZVR7/mydiYEgMqhwXPHArfP3sXhwZcdeAv0bjt8R++Bb6Nv0YDcelZm
         dgmSy+6oOxPH+mKD1bfMMB5bna6JLpuTTBJwYLE885KxNZDQl7rELsjW7DaW7ZkSguj/
         sKng==
X-Gm-Message-State: AOAM532QJ8SvPx4TTiYy0VehC+3hJApadTTwME7nFQTG//BpjCtO1g1l
        U77T2N1lxtEE3F/IqySzueYhGTgqkufA8138tpk=
X-Google-Smtp-Source: ABdhPJw6groUotwQ8vbhdy/IR1sMD/34/axJnsXXheLrwgCvcSStxI4/PuxfuCq+USg3V9Z5KE7fRw==
X-Received: by 2002:a37:9d86:: with SMTP id g128mr653358qke.26.1600878332126;
        Wed, 23 Sep 2020 09:25:32 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 25sm313336qks.41.2020.09.23.09.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:25:31 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] clk: qcom: Add display clock controller driver for
 SM8150
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200911153412.21672-1-jonathan@marek.ca>
 <20200911153412.21672-7-jonathan@marek.ca>
 <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <3370cff3-9296-74fc-8e7d-ff93c3978351@marek.ca>
Date:   Wed, 23 Sep 2020 12:24:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160080149549.310579.17453759593211612997@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/22/20 3:04 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-11 08:34:06)
>> Add support for the display clock controller found on SM8150
>> based devices. This would allow display drivers to probe and
>> control their clocks.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/clk/qcom/Kconfig         |    9 +
>>   drivers/clk/qcom/Makefile        |    1 +
>>   drivers/clk/qcom/dispcc-sm8150.c | 1152 ++++++++++++++++++++++++++++++
>>   3 files changed, 1162 insertions(+)
>>   create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
> 
> If the bindings are the same for these two drivers I wonder if there is
> anything different between the two. Maybe the two drivers can be one
> driver?
> 

Possibly, the biggest difference seems to be the plls (trion vs lucid, 
different config), which could be resolved in the probe() function. If 
you think combining the drivers is the right thing to do then I can do that.
