Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EED1C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjASLZ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjASLZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:25:52 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD5875704
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:25:32 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id q8so1235678wmo.5
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmKi1oAjzk2UoiS3XxEne1iZp6kL62ZaC7XNjem7ZyE=;
        b=N/xho0qcpDEmFFgXmvBj7m8iR8lzd7yK+i7KT3LyMV8eEBpSbhP8HXmGMTqkn/XZFY
         vLB75nsoubJBG+vy+zaNLi+0ZPW3V2qITa5OJIDZWp5MBdttCmCwtPc+L50pkNcmG4uu
         k7N5bPjH5neARwRMno2ZUew2pssc/xWHKrqbB/wwophcXXn13gLi8SEq2mSDL0IeEfBB
         SSCg9Q4cg+sWFZPeB+zbh/MMjc36kK5R9jud70O2Ixcb5gtUiyUQN6hPr5rbOn7dRFHT
         UZS9y4vEeSyCrHIqlKsxLQ6BV4eFZUfhjoYvfly8N6Rj9AzTtDpyzeFT2f6OARUfyr8K
         HOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmKi1oAjzk2UoiS3XxEne1iZp6kL62ZaC7XNjem7ZyE=;
        b=Pe7jhFdnxVTOl7gzbuXeoAMpFtXUAtt6AxbeSq8v0qTuRrS0t0stadh1UCjyXe8hL7
         CjIVeAPT4R+uHL7Ok2YGVcWBhtkmqFNJWrWerNz0uDW3gilmvR92Rsd6yTHQUNk7IF5O
         x18x1dTfPPjW/MxbBfcpPkBbHToI7eHPiBjF/ZTgiXenc9cbRJsTrDpABs3JbvVfpy6G
         ZAF2Mlica75dGEpudx6LR4FwCkkOoTX6WI/ksMrOPtw0x7XMZKW9XHI9nYxwRJpZoPB4
         xy3t0a4BIzKUnWe57CvFLv2pDdwAFO9r+8hiQ19yUjrfQ5/jWecZo3pY50jyGgQla6Ra
         nH5w==
X-Gm-Message-State: AFqh2krtrVOwCZRlquk78amIdjHF8B+YHdeu5qwwT0QjqiKXIHzMP5ip
        Q25RM9VqL2qdjFr2dCPzyJuM1Q==
X-Google-Smtp-Source: AMrXdXsK8OnHUHfr4gUmTrcjA7sXT3BthqBt8VyH5nY6m7WGnBIk3lWIC/CHBb2WzVRBsfptquLByA==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id he13-20020a05600c540d00b003d9fb59c16bmr6001967wmb.36.1674127532463;
        Thu, 19 Jan 2023 03:25:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m10-20020a05600c4f4a00b003d96efd09b7sm4850496wmq.19.2023.01.19.03.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:25:32 -0800 (PST)
Message-ID: <5e280ada-7088-3a0f-5889-03f3cbf37a40@linaro.org>
Date:   Thu, 19 Jan 2023 12:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: lpassaudiocc-sc7280: Add
 binding headers for lpasscc
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1674120444-23706-1-git-send-email-quic_srivasam@quicinc.com>
 <1674120444-23706-3-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674120444-23706-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 10:27, Srinivasa Rao Mandadapu wrote:
> Add binding headers for lpasscc clocks to merge lpasscc clocks into
> lpass_aon clk_regmap structure.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

I now wonder how one tests a header...

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

