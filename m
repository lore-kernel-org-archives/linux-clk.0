Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709F8C54E76
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 14:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbjAEOEu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 09:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbjAEOEN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 09:04:13 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6224F113
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 06:03:51 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bp15so55140367lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+2bEOS8sQMLPpamnPGcP7WGEd0XhmvXigQQYpxuAjE=;
        b=Z2lIRZ5oB7h68mXWc6QYU7S7CMKTvmB3VVzyQV3ptprWhE1h2NtQ/eWlpflRdksEXR
         3ZpzRsRL3I+f5Bwf1k5vkUub/lU1ZtsVKVWsGCxfCkADhDZzr+JOf3hGtEbbnvFQhvH9
         KTVUNa4SKRzd51nUhfDu3gpdOS/RK5QmlrLPhXLbJpUlKIdI5JjCDeiyfccUu7zHgfAt
         7ZKxmNTV/9nL6bPCwNPiN7Qtil2l7VEcKy5+TTX8hSUTvwpl6an0iIrw/FmA9KXyDP1o
         fY2lvASoQF2d00QIw3rD8SKbPf4maQ2CalpYqEw8fDiP1Luc6Mn6t9MoOfz9iM2zKWIo
         /SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+2bEOS8sQMLPpamnPGcP7WGEd0XhmvXigQQYpxuAjE=;
        b=b3JYBYcg6ozCpUjXpEjRD7Rn7q10iPdYAurnqO/j8G/hadC5uLeiLZ2Bkp16Kljoun
         8X2hMnStTyoODP9TPp/qXmxRCOgdPjqzMcRu47T9G08X+jorYZITPXQ6bIO4hmm2rL2B
         ZKFU9Sx8KK453BvrBB5dLV0u9vFbQFxlScn5LyQMahhbj2QLcipGb1vUKHwBOkRmPe+R
         Tcpiqz/dq2OZ5Pu72agkZC931iUHckeeDyMx1/pDUIKICavUVZS6nLNk13XHy6HSA0GU
         K3vqdWIDcwsq7zTBOE97YGVrzMEYg9igYZmbeQAXv3so+diCgWbLIW0/oR/r30iizFd5
         d08w==
X-Gm-Message-State: AFqh2koPIE4iw3ZN+LmWkxUsbPUVVj9vpDvWtfr7t0mRuMKbff3bOi9C
        BE7EL8K/s727r7smzdpwZfqGNA==
X-Google-Smtp-Source: AMrXdXttrg/Bi2fpS3ToeT8tr9PPdjj9wlHD9vFvjfamIUyHDyPEMcHzwCPI7IVr9GUmGPZzrbOXTg==
X-Received: by 2002:a05:6512:2506:b0:4b5:b46d:e60 with SMTP id be6-20020a056512250600b004b5b46d0e60mr14866768lfb.27.1672927430063;
        Thu, 05 Jan 2023 06:03:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512390e00b004b5872a7003sm5495806lfu.98.2023.01.05.06.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 06:03:49 -0800 (PST)
Message-ID: <8e761ec9-6d98-53f1-20b4-f08d63a4940b@linaro.org>
Date:   Thu, 5 Jan 2023 16:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] clk: qcom: sdm845: Use generic
 clk_sync_state_disable_unused callback
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20221227204528.1899863-1-abel.vesa@linaro.org>
 <20221227204528.1899863-2-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221227204528.1899863-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/12/2022 22:45, Abel Vesa wrote:
> By adding the newly added clk_sync_state_disable_unused as sync_state
> callback to all sdm845 clock providers, we make sure that no clock
> belonging to these providers gets disabled on clk_disable_unused,
> but rather they are disabled on sync_state, when it is safe, since
> all the consumers build as modules have had their chance of enabling
> their own clocks.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

