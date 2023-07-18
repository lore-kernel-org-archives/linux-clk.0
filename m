Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E856DEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 13:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbjGRNrB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjGRNqf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 09:46:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D554719B6
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:46:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso9280912e87.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689687965; x=1692279965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnKBW7yye6QuXNJD55LzwMeZTay30fjhiKJ9RuY3aUs=;
        b=ilESjBsdKoTgGKH055J5KBwRCfpNLvPlLlk+vrZFkaUpKOjrB2lM9AzrNMiOwGjH3x
         eST+B7zY+EdJ4pV1oqMSlNNiw+9FYjAOfSAsOrCH1v6Gdof7oo5GlrQodkBk87yFbcj8
         GcyvW/yHdkY8oMwCgmQdoXXeVOCg0g9Fq/5ZfhNhQrJ8b2E/Dwlv0VHX/XdxehQCWPgw
         xP3mYd7vZAtXfWwYD+FA9YrXWrBFyxNvKrAb4goEU6DtYX0HJmOJk1+3MvgyjHLLP5MT
         vNjD30Jnpo1U6vyiWjDcM/eNo920OGZYd33NahtJu7PWpEcnIySNLZPgA0nYdsRRbp2g
         74wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689687965; x=1692279965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnKBW7yye6QuXNJD55LzwMeZTay30fjhiKJ9RuY3aUs=;
        b=D3SPWwneQ0j1CR1xaPl1DzGrJpG2fmFSp5VuAYBvPvN+18h0jmOrg+qynX6L/tVweQ
         oZ8/SdBxqcGq6TkkzgitYg2gHlpu4LxleVV5E2WchRbEqU1QFrHvcHFKftZSvIIluXcX
         6QTDr32Zyvz89Ivih3GPBMzHHhNurbS/vxCEyQKcgeBy/43IqMQvHbWCNIq2UCGJGkDt
         DVtRw0IQxxxOaGE2vA1iQrKFhQLsXgG4ZLFrBHcQPJmzrhO+lcXRXHQva23xB1s0wfvg
         tF+YJjdaV8iA96fBhXIv0B5CMInQMVIjjpN4baGXVvguuXLjMtS5Ez8H/nQXqeP+srmN
         HBGw==
X-Gm-Message-State: ABy/qLbzi6l8KKM54eweG2seUzhYZZfM/CuaPm0tJwwPVB1KVc6NhBkj
        KFKhc1c3UaZl2B7f3hXVSg347g==
X-Google-Smtp-Source: APBJJlE6OoSoxSXBAegX9xpf3nzq6Ie2ropKqv2Sr98dFazxMHT2h5TeezIhq+GHW2af7GFYkNtNMg==
X-Received: by 2002:a05:6512:ea3:b0:4f9:5c89:5b08 with SMTP id bi35-20020a0565120ea300b004f95c895b08mr16166091lfb.21.1689687965005;
        Tue, 18 Jul 2023 06:46:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id y5-20020a197505000000b004fbbe067a5dsm445674lfe.179.2023.07.18.06.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 06:46:04 -0700 (PDT)
Message-ID: <1da2842e-e5a3-e0e5-ea7d-7da5f4b84001@linaro.org>
Date:   Tue, 18 Jul 2023 15:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] clk: qcom: fix runtime PM bugs
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230718132902.21430-1-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230718132902.21430-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18.07.2023 15:28, Johan Hovold wrote:
> This series fixes a number of runtime PM related bugs found through
> inspection.
> 
> Johan
I was thinking whether we should maybe incorporate RPM enablement
into qcom common functions.. The only issue I see is that some
clocks register pm clocks atop that, but I guess we could introduce
some sort of a pm_clks names array to solve that?

Konrad
