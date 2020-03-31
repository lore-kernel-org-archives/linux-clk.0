Return-Path: <SRS0=I1Rz=5Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EB2C43331
	for <linux-clk@archiver.kernel.org>; Tue, 31 Mar 2020 09:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66EC4208E0
	for <linux-clk@archiver.kernel.org>; Tue, 31 Mar 2020 09:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCvC8Ipl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbgCaJa0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Mar 2020 05:30:26 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39491 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730235AbgCaJaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Mar 2020 05:30:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id a43so24259643edf.6
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2020 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cRf4XSMOaFJMe4go+8/QY1e2A8UYJy3i4Zzxrup/Gvo=;
        b=TCvC8IplBOkkC30T28VopRqymYOm2EFbGBHCP3eLUbu602822NIwK4+4dLt2mqYDTi
         w+kQjpM1NkbPdazJD9AhAZs5U737ydDNfX4/zSgrVMK9klM0YaPIIdCfy1wyfP2vZAgB
         U0kuWggt4Yldeb3LCZidaaAJW5VmrGPPLXthzX5AsNHP8jU0oIDlcmCiKwfaOTqnyqwW
         caCTpIc6iDfy9tQd0qpaIkPWyMYC0pnuKneKPzPO+UpJCS+eFtCXi1S+QYCrmrXezLat
         7buOEnP6awrLxpXkcnh5EKIIl6phVhG1mfn8gWhRCBJ8odlBJHcnBWwMLxLrZKKlfqBx
         hqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cRf4XSMOaFJMe4go+8/QY1e2A8UYJy3i4Zzxrup/Gvo=;
        b=Oh4eT2+5EB6Xfy1qIdDc3drnFqkkiKyyLi8V/hvv8YnO8DWhpwy2NjS6cMw8H+zbpw
         3vSPp9EY7cUS4BPCxdl1X1PkLp84Z/yLX/TNwhWlG5nmGNeWCOFlkS8JgcOFqktNzmWE
         vVELfofgAqPbLHYqvJiV0US/94Juv8O7t/rIkrRE9JSfePWgtChPvlwbvRIQg3tWARsI
         46fYe3CXwwoC4zVRDRkKGKA8DFUSeTbL0Q6ywF8qSfQ47AaxdpENzPx/Otzy1TYy/gTC
         UrKOspQkpb7/8alYF59HCRR2Of8Bmum/f+TBYahS4KRPY4wfbe5osVQhVyO7xrgORBEt
         tX6Q==
X-Gm-Message-State: ANhLgQ3i6Cl0Cb3WN7YseFqS1kax60g5EUHKKdsJxKaUxDRr04dKqjUV
        iAiwMRtUluI8xcvFPnlwq8YlqA==
X-Google-Smtp-Source: ADFU+vvGYvR25pBE8ZqwnJMdn+n24oyddUIhZdPZjNWvdjL9iMK/eUeZkt/q7655brjEjlcis9v7Sw==
X-Received: by 2002:a50:d613:: with SMTP id x19mr14653371edi.61.1585647021690;
        Tue, 31 Mar 2020 02:30:21 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u29sm2200201edd.47.2020.03.31.02.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 02:30:21 -0700 (PDT)
Subject: Re: [PATCH] clk: qcom: msm8916: Fix the address location of
 pll->config_reg
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
 <20200330204149.GA215915@minitux>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <b542e78a-9fa2-c7f8-460c-6cffa47d4ef6@linaro.org>
Date:   Tue, 31 Mar 2020 10:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330204149.GA215915@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2020 21:41, Bjorn Andersson wrote:
> So while your change is correct, afaict it's a nop unless you fill out
> the other fields as well.

Yes it shouldn't be a problem.

We cloned the 8196 driver and then started adding bits. In our case we 
need to start PLL3 and PLL4 from Linux, similar to line 3452 here

https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-gcc-8936.c?h=APSS.FSM.3.0

which does end up calling into the PLL recalc logic.

---
bod
