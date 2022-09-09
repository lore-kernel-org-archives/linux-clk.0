Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97351ECAAA1
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 07:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiIIHwU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbiIIHwD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 03:52:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D7B103047
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 00:48:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q21so1383569lfo.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XitIxUHJGo2f9DX5GRhObqjIng6zVOJXz69iBessMFU=;
        b=L97CZRY06nPAVO2OfaqkDh7hDE69MN1yhfPKrXfcLG29+BwLuBPS89NmTsFcq6BkLM
         10kLmFCJchZbP8QD9J7ylceXflafN8M9uNcjDdQDeaeGDuuqbr4UYLEupTrQh2Svb2vg
         wVxaRisZMr/mLbhD8iisCVPxegfHisS9A3NKxtEOa6B23egfycllvL0ipWU/G33fUUkm
         ZbUfmgUWVuglkQ3BT3qcWnYj5wudUnSbZhAYGlBOL/2iAn3/rnTOPKjcrylT8jiGl6bM
         xnlt33Fb3mMA+ueFAHPm7sOqrKj0xvajGQqeapg93ftiY7FnZSnJ1FjYzPmmrxK9U4G1
         CIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XitIxUHJGo2f9DX5GRhObqjIng6zVOJXz69iBessMFU=;
        b=G5Dw3UUUCcOrhFLGwDQbwMlNFknRnxR7iawT6bexz7nuNpoB0viQQEOpkcP7/6UEVl
         R+zTZqHJtYyySvhHjmuSrZDMITueCM6UlJrLPx5kYM6qKI0uy1YuCQ6UxVttZFdQZoTb
         5nd8e0fFodHCcLsfhy/pw7t0M8jYMaeGHQemd7qSiLKqzA4cySKtdZEfGKCsJMlEQxCS
         wbOPgc7ZchAVYZQ69BYMM/BCnt0clyTBR+94XD6q5Z0DrfCPHCnIIFE8Vua0JpMc3Srm
         p+/VPpLU5bXg8sKGzHAXvd5vhtqC9F/TnJgqa/h7B4SC+ygfsU6Qr1pmpZqdMoV9pm92
         LeSw==
X-Gm-Message-State: ACgBeo3Q/s44RG1u+MFekBfUCbGOyyjRX3H0O+w8FtkRu7XtFDAqsFYe
        r+gB2GS6PfcYLwnN9obARBc9ZA==
X-Google-Smtp-Source: AA6agR6oWc/M0ekNF99Kob9d7A0SBRRl/ljeBywJjwfhhHE1nNwdPQYLTS2m9TW6Fz/bTnAm7lNFuQ==
X-Received: by 2002:a05:6512:b96:b0:497:9dac:cc22 with SMTP id b22-20020a0565120b9600b004979daccc22mr3678335lfv.687.1662709699352;
        Fri, 09 Sep 2022 00:48:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s3-20020a2e1503000000b00261aecd1c53sm177646ljd.71.2022.09.09.00.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:48:18 -0700 (PDT)
Message-ID: <6ddc3644-ae8b-38bf-346b-1262063ef20c@linaro.org>
Date:   Fri, 9 Sep 2022 09:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/3] clk: qcom: gcc-sdm845: add sdm670 global clock
 data
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb@connolly.tech>,
        Joel Selvaraj <jo@jsfamily.in>
References: <20220908231224.209020-1-mailingradian@gmail.com>
 <20220908231224.209020-4-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908231224.209020-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/2022 01:12, Richard Acayan wrote:
> The Snapdragon 670 adds and removes some clocks, adds new frequencies, and
> adds a new GPLL (Global Phase-Locked Loop) in reference to SDM845, while
> also removing some GDSCs. Despite these differences, there are many
> similarities with SDM670. Add data for SDM670 in the driver for SDM845 to
> reuse the most of the clock data.
> 
> Advantages and disadvantages of this approach:
>  + maintenance applies to both sdm670 and sdm845 by default
>  + less duplicate code (clocks) means smaller distro/pre-built kernels
>    with all drivers enabled
>  - clocks for both SoC's must be compiled if the user wants clocks for one
>    specific SoC (both or none)
>  - additional testing needed for sdm845 devices
> 
> Link: https://android.googlesource.com/kernel/msm/+/443bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F10
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
