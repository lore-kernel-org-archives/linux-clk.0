Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A673BC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 09:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239671AbiKQJlr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 04:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239237AbiKQJlq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 04:41:46 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF9E657DE
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 01:41:45 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v1so2749688wrt.11
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z0Wfb7P39Ls6o1vTikP3kDg0DD2pl2/X+Xcf/GgiJU=;
        b=c+basX9NY41jv1dSEHigx/BW6vD0S+PKcEFQ2pj1V0Dxtb3XexdVdMoDfNv0Bd4VJx
         w2FqYQHl/0y3EFXMXSUIXrSyssterfSrWD1LxA73nSngoBpDRkqRGVSuLHcg6EcCBWHO
         RHaB7iH7kSAwiTuLhaHK/admu4qQSV8695yvGknK5ZdogqpoAtgw3fNkSEf0PKlvdDux
         LlPlqy7yKJVXK+UcI/3q9iga15Ybd0Y9hQHvLSDNyn/JG97F/GImlrJmtj+NgdgYp23m
         UjKPV01g09J8yAATFrQ0RwkA5zQJT8Z1ZfS7KoScWgSLtB8zPnfU9MVWnhi6khLUOdz4
         vScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z0Wfb7P39Ls6o1vTikP3kDg0DD2pl2/X+Xcf/GgiJU=;
        b=2BJ+UvQIENMYqIglqAnD0VXUZPojSKaOf19jjIXWd7ZQO+Te/O+lKvL8S/TiBVaBmb
         7cFpIgKVALbtNhWFMkmcsPK6BtbpL6lKw08pxtfTce6XYnSuPqiBFOgAPt5Vzq4vFgR/
         tfS1QkKRtfUdnha/i00eiDMgMtpZJMTMZ3p/ztQh7dkZVDAlwMOHwo4jZ1FuaPB39gGm
         Jo3/OrWp69KbA8xp/nbmVL0d6wxHRdzv1xAheOWLSnm4ig86aDfagwhXFkUqoChOMJ7C
         34k5OsOYFndvuVSOufO/X4P5MmEvrP8azYAJZEVS8SN7p/JzYIrdewmbucyMKXG/ow4o
         EpDA==
X-Gm-Message-State: ANoB5plR/AjEnrU1nOs2fS53YBIUY33KiXBHF8zlM4tecV1YVFoTsPhS
        ++izlbflFSC/9WbQDLSZpY5cXA==
X-Google-Smtp-Source: AA0mqf6CuNZhBuhvnP64ry7QS+cy16fi61uR4BfpfVfLS/RRau/bWAzMmA/kuVRQrX+IpAXgpdWCnA==
X-Received: by 2002:adf:f7c8:0:b0:236:720a:e391 with SMTP id a8-20020adff7c8000000b00236720ae391mr910882wrq.368.1668678103704;
        Thu, 17 Nov 2022 01:41:43 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c468f00b003cfd10a33afsm5063153wmo.11.2022.11.17.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 01:41:43 -0800 (PST)
Date:   Thu, 17 Nov 2022 11:41:41 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/9] dt-bindings: clock: Add RPMHCC bindings for SM8550
Message-ID: <Y3YB1Ulrpkw/Yxmi@linaro.org>
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-6-abel.vesa@linaro.org>
 <5897972f-9851-8ac5-6856-464f00e845ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5897972f-9851-8ac5-6856-464f00e845ff@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-17 10:09:32, Krzysztof Kozlowski wrote:
> On 16/11/2022 11:47, Abel Vesa wrote:
> > Add bindings and update documentation for clock rpmh driver on SM8550.
> 
> Subject: drop second, redundant "bindings".

Will do.

> 
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> 
> With above:
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Thanks,
Abel

> Best regards,
> Krzysztof
> 
