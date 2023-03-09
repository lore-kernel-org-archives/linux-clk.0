Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FABC6FD19
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjCIAre (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCIArc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:47:32 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A536393E07
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:47:29 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f18so286719lfa.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=437PpNVjqYKGEQeD2jkEFWkG9hQyYDlo2SOUpM3Tg1U=;
        b=F3lW2eiTo0jdTD7TJ1mbsCaB+9kIEq2jUobqVXPzuAgYuQDNKtvwFbE14NfrNnuIU+
         UgqmjoOp5EUB9vxuHqzPN9zU5bley54CSsAWwdfqq3PN2Q5LiKFFqM2cIPx9CUY7yXoK
         Cx1yWP2CLRLxfkMW/M71FelIZQNeW0f0B1du7jFJW4E+R/cOe2Y01hUY3W5T5RHow3wl
         XfY40CVYq6jddsig0khTFRcCtJ8/+OIt+0sCBPk8n5fMpVbcI8vcwcOStamwpp3sKkfg
         KjCZuzpOIDNY4jCMY6nlLoo/uHPC4Vv1V2C0lK/TPGDRbaMo5WJgGUhyjuHnTrtFhq8T
         kX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=437PpNVjqYKGEQeD2jkEFWkG9hQyYDlo2SOUpM3Tg1U=;
        b=koZuCQjLNqpQoCnNtc+7+oAw/xfc1oXhmoUjxaU46A1/Fk/6fvyNBGQJ0hRtvYcZC2
         Bn1/eLAf0jyalCChxI+UWbmoBitiSi25OTm0xoPXmbtRHyT5gTT3US/KgRnRrlt+50Rp
         h0gIL+m+fjOCyu6gvfvUFr+1/vTdwAQz3vyb05ubL4tpX+6sY7PpgFnjhmaQWpR6wZ9k
         02f0yK1FSeI/NIlKgXGrg+zEVt1qFuSkeCb1aoA/IRZpJNCTFVorQt6t6bwmEh7M6OB4
         QJ5hOWGDcaKTGaIPxnIohGUbQ/gUBb6gJbWXkzMoWp2nWqWMuyDTQf3vH5r3Lhtl0xiw
         sZ7A==
X-Gm-Message-State: AO0yUKVj9UatTivKaAZPg66PjbgmZk8QA6dN9E7rhs5AxNZ0sP+P91Sp
        pzt31zTdD5epJJk8pAVLzE8PAw==
X-Google-Smtp-Source: AK7set+dXt6SVKUsiSo4NBV/iwMw8JqLsNhmlgyZB+e3Ka8HL9NdiISrvWYGvn3aNdKGHayY1trHnQ==
X-Received: by 2002:ac2:50c5:0:b0:4dd:a025:d83 with SMTP id h5-20020ac250c5000000b004dda0250d83mr5410775lfm.9.1678322847929;
        Wed, 08 Mar 2023 16:47:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020ac246f2000000b004db4c79d845sm2323326lfo.184.2023.03.08.16.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:47:27 -0800 (PST)
Message-ID: <8f961711-86b9-274f-dcf3-84dfebc853ee@linaro.org>
Date:   Thu, 9 Mar 2023 02:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 02/14] clk: qcom: smd-rpm: Add .is_enabled hook
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-2-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-2-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> The RPM clock enabling state can be found with 'enabled' in struct
> clk_smd_rpm.  Add .is_enabled hook so that clk_summary in debugfs can
> show a correct enabling state for RPM clocks.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> [Konrad: rebase]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

