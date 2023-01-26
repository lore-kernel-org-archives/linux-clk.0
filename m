Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734F9C54E94
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 08:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjAZIYE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjAZIYC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 03:24:02 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFDE46162
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:24:01 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qx13so2972715ejb.13
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVwMEPbXkbzt4NAZBAhNTCsMxl1XIt6vqYOdx4ByhSc=;
        b=kHLa8nhubocQnIw1lPa+Y75mJp1pyjlO+tAa1tkgDUKom6b7lvk0ugV/CFvhxci70S
         IXPyC7Hz/HemRFFWYK4LFm36oaEfdkb43sXABvwesRxt1iqwsjafIfRb0ab6aKuDld6R
         vftbeaQJ+T27ygXaKxM5+z9NUuqCUH5dc9udhg5jKzc/CfMtM2gD1/pJRqx2/Dpw+y4x
         BV9b2eJA7LkO0YkV/8nZ02OXpGzXCJOOJwN+AZF5SnX1lX1RiGp2Y1fV8FNeNAO8xFnq
         QHSmzpLf5yqxs8Zi5Yhnd51/mEfj+KZe5K49B5JxmtRNLrjvKc2ahVItGLKsWEzzLxHI
         2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVwMEPbXkbzt4NAZBAhNTCsMxl1XIt6vqYOdx4ByhSc=;
        b=umDYk9rMCamdPlzNs6tyBoHwXXCvHHLmuRESpc84zQzN3YXHWpufhCFpB5pAprXTTh
         mBLXXqoXm1sxLTvCf0LSg4EmY43gQTVEJSPmD00jpkEhRKvdPN+JeoLX6/TzuZVps/fw
         VGz5URGWOPvwcJdVPuEjuKpY2LboPMjsLHalYzbbhx0xUWf1MuWUzkFzm/MAFiNjYSGi
         BbdMWvFyJEyQu1hIpM5szLuQzq+p5zmsyYM6/EkPoWF9sAYezbF/T+pEj3wn8UAhhohM
         Y9gC2rw0PgXxBJe8nITliHe8XQBqsfu467QLohcfM8M75jFs3+4nupa6v2KN9tK/HdEQ
         XqtA==
X-Gm-Message-State: AFqh2koEQSjUf9kN3OegDbw0aBEpoYuqiAK9p3OSj8rdD1W6kU6j8g7G
        t69v31/DhD945Fc1FclSHgmuHA==
X-Google-Smtp-Source: AMrXdXtoL6ijVRRJV3bH8RnPu4JPF+x9waczF0ZkH4KVPQoA3bCT/MyVxVSZX8hWuAe5kwH1Fleasg==
X-Received: by 2002:a17:906:b299:b0:86e:a013:c26f with SMTP id q25-20020a170906b29900b0086ea013c26fmr36702869ejz.19.1674721440150;
        Thu, 26 Jan 2023 00:24:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0086ffe8a00fdsm243185ejg.84.2023.01.26.00.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:23:59 -0800 (PST)
Message-ID: <fa68b44c-0725-48ef-8b0d-ed06ee4c6541@linaro.org>
Date:   Thu, 26 Jan 2023 10:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 06/12] clk: qcom: gcc-apq8084: use parent_hws/_data
 instead of parent_names
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
 <20230111060402.1168726-7-dmitry.baryshkov@linaro.org>
 <0d7a6821e1825c18db4f6a2efd5bdfde.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0d7a6821e1825c18db4f6a2efd5bdfde.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2023 23:49, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-10 22:03:56)
>> Convert the clock driver to specify parent data rather than parent
>> names, to actually bind using 'clock-names' specified in the DTS rather
>> than global clock names. Use parent_hws where possible to refer parent
>> clocks directly, skipping the lookup.
>>
>> Note, the system names for xo clocks were changed from "xo" to
>> "xo_board" to follow the example of other platforms. This switches the
>> clocks to use DT-provided "xo_board" clock instead of manually
>> registered "xo" clock and allows us to drop qcom_cc_register_board_clk()
>> call from the driver at some point.
> 
> Should probably also mention that using the firmware path will mean the
> RPM control of XO could be involved and so suspend may no longer achieve
> XO shutdown or it will stop working. In case bisect lands here we'll
> know from the commit text that this likely broke power management.

As you've seen from the DT changes, this series is a pure rework, no 
switching to RPM's XO clock.

> 
>>
>> In the same way change the looked up system "sleep_clk_src" clock to
>> "sleep_clk", which is registered from DT.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

-- 
With best wishes
Dmitry

