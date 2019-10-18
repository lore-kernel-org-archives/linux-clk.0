Return-Path: <SRS0=xutx=YL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46D5CA9EA2
	for <linux-clk@archiver.kernel.org>; Fri, 18 Oct 2019 06:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A75A3222C5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Oct 2019 06:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKMuvXcv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407027AbfJRGDt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Oct 2019 02:03:49 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36205 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392090AbfJRGDt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Oct 2019 02:03:49 -0400
Received: by mail-pl1-f196.google.com with SMTP id j11so2328889plk.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2019 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BSveiQwGviuEcR4ypuqkpKzuxRmA0+9+mStZkF3vzJg=;
        b=VKMuvXcvvGP/FnfbPGGafDTQqvKt58hQ9JwZCL1mJZYoO07SWVM8V0Ao+3xvwMFVC0
         z1szGW4AdBK1zXzKQzlZbjQoBRZaBONjgZQimxNr41BG9T6IeKw/9hkmO9Sqta1bGlzT
         Q5XB32NRXux2YSw9RcXoriHC/Vjhn0qOZ/ISgp0wWDGqbKienY0ipkB7LDONW5/T+jrE
         4dDadRRatqlloFFaGg1WkY05ct4gjFWBfmecZUPSM/VFh7F775hKspvL+1fr7c+1BDyX
         65nI2n4AtKgw8neyAPTA5SpITv6wQmqQqH4QW2Ln9qa/tgsBr895fpJSiQd2CDvuAKdx
         7Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BSveiQwGviuEcR4ypuqkpKzuxRmA0+9+mStZkF3vzJg=;
        b=tiRjbTnAC9xCpPcMrVDMARgu0KUZhPsdGF/83IZpxb8bDRD91sHLzq/HUQXgdadiZs
         6QnKXXYeUbySy9aph1sz0o67enoRrv6ivpY6drsRUJNR9kooC9b7ARkrplhmROWSP1id
         Ss3u14ube4PnD2EXji5p35+sjAqkWMRUwaT1s4tC5fYS7SnrqWaJ6flOn9WsramWD3lU
         2flPhjsyU8k5TdavGp8tpAYLjq+X9WwS2dUdB+1u0F4E+zHW3z2ZwLeBAfyVN59MSIRP
         G8ShRjGirQ3fSbiNwaGzSOn4um74DkqRlZJiQqRdI6aOQqNYfTwLUo6chL+C+IfmwwJi
         /5CQ==
X-Gm-Message-State: APjAAAVS+nZVCU/HJYSJJGUO0epUie3kUluNtQlBnG/3/H1STLcnVvFR
        ogCxP2kVhP88A/WgGUGG6P3gMQ==
X-Google-Smtp-Source: APXvYqwbsGOB5qsGmti/XnQXORN6qlEqa1yTSNYtvcSbP0L/Gu/byaAudi/utDrAhgQkCMHVo3tdpA==
X-Received: by 2002:a17:902:b08f:: with SMTP id p15mr7786915plr.229.1571378628231;
        Thu, 17 Oct 2019 23:03:48 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id 199sm5541685pfv.152.2019.10.17.23.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 23:03:47 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:33:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        edubezval@gmail.com, ilina@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sudeep.holla@arm.com, tdas@codeaurora.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191018060345.wjflngfdnqa3gbsu@vireshk-i7>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
 <20191017174723.8024521D7A@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017174723.8024521D7A@mail.kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17-10-19, 10:47, Stephen Boyd wrote:
> Quoting Amit Kucheria (2019-10-17 05:27:37)
> > Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> > can have earlier access to cpufreq during booting.
> > 
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> Makes me sad again.

I am wondering why it makes you sad ? :)

-- 
viresh
