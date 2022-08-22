Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4522C32774
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 17:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237139AbiHVROp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 13:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236818AbiHVROn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 13:14:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E5B175B7
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:14:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q18so10235840ljg.12
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9himZF0X8uG7VtMtKx5KhDuc0l4LTNicCLHWrXQv1hE=;
        b=iS2E3tIuz/DolNw48VEJUIphAvHcY8QIyWZ3Pmo+JxmJHr3OXQY3p1XvUYjbhfrJ4P
         K1U6plgEYaHU6pio4P1iOWGhjRff7tNpVgUmbqmMj9Nh3tFlxFpk6TA6zxV6I6YhhBBV
         6hzyKPUczerEiY11XdiyCtMm+zsugy5q9HJupUJK7VChiIVF50AwIk/SiYmRgZjkbTao
         vJ4BBLXTEZpSMHQ8IZKIoMkkeObnFQ5GBT352/xr8AA4FCs9eh+xnqq6z7oX5xwUhNrU
         m6FBiEdsgPu6yQSUrEu59Rv6Ok5ppRPsbjiKCGvnMx4gINK7HOFDXh4rJGLl2Mhf8ef0
         B88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9himZF0X8uG7VtMtKx5KhDuc0l4LTNicCLHWrXQv1hE=;
        b=1//87uQ0kmYa3murLvx2XXfZGorLmA1R1Z1PCKkYywA98d2cCky+6GiZZ51MLe80LF
         9xgU3iMnSeT73xUnjIR5qSA6OQtJ3+zbtr55Rpbyfd1D3WSwqcJz0EjNeMkiWQsrVpQz
         zC63SlmMFQ3BdxerAQ5FQzz8rqyi5BrYfdZWYqMLycFMvBuzopKwCbWFSz5/e6wiA8iT
         JWHJG3iBoxn4EJ4aHvDNnqzr026oI+AM/OVxz1FZYqu28Yz39Ydje35wgXrtdHqv98ks
         zl4aAiQqUissp+jTVlUF219HJCYSuHS9Gd2K0l7qY6TezSCMKsNCRykpI1V0P4Dm6KbY
         G52g==
X-Gm-Message-State: ACgBeo2MNhwtIsQspJdGoOJ+hJshzAlyzBjqnOMeidb4nYkH0SQmKC6p
        h9yg75qFwUaSGcSMZkJptBSB4Q==
X-Google-Smtp-Source: AA6agR4/rF449NMPTVcPCDnjORxR1Gu7l2jJVrObqE9vy5//dWkB64tOg0ApwfX70XHvU8csjitKgQ==
X-Received: by 2002:a2e:9d92:0:b0:261:c3bb:2ef5 with SMTP id c18-20020a2e9d92000000b00261c3bb2ef5mr3944163ljj.350.1661188477537;
        Mon, 22 Aug 2022 10:14:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p16-20020ac24ed0000000b0048b1b2233ddsm994762lfr.120.2022.08.22.10.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:14:36 -0700 (PDT)
Message-ID: <090fde69-2d2c-c5c4-79de-c0fc6f5d0de0@linaro.org>
Date:   Mon, 22 Aug 2022 20:14:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Content-Language: en-GB
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Add a reset op compatible function to poll for gdsc collapse.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

