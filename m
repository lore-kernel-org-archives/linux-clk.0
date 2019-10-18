Return-Path: <SRS0=xutx=YL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DDECA9EA1
	for <linux-clk@archiver.kernel.org>; Fri, 18 Oct 2019 09:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5658B222C5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Oct 2019 09:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wltgfp1p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633096AbfJRJwQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Oct 2019 05:52:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45057 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632961AbfJRJwP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Oct 2019 05:52:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id r1so3061910pgj.12
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2019 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wtCCjDsxUW2f7hUMgiF/lhUDNP+eblATwyQXoaxQPFk=;
        b=Wltgfp1pRzOmQKZFcjNgOouPgbf2eUSJYhtjDuyyXGv7vJSSTSu0vasW7MlUVNQTD4
         DeUcGwnAuqncGmxTmK2pKrlyRmn2SaKZluwJgIsstd4tmo4Vk9DMmBentAt5U5YDtAd5
         8oL6KTKrp/xc3aYZktEd41bBr+uDOfEerZcF3muup6By6oAx6YybLI67W1ItqWsSww9N
         JapikXnjK6jl1K6iIoAOJzvXJd1g2oWH4ut503hPMwgdAQF5b0aBq+7ZJBshy/ve1bNu
         +/UBnOGIqMlUwL4p5rKeanvouZNG7xCoAjlhqPru9+xZG+VJ8deIr1WsqcJval7/LoQq
         jKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wtCCjDsxUW2f7hUMgiF/lhUDNP+eblATwyQXoaxQPFk=;
        b=mGjGNde1q823i7N4uEAITK0VPP2G6D0pDAQIxha1yDDEygz3zgNXgCQ/12Z/QEW/gc
         Q4AtThegZ5fYyjnaAge9+8ZognKCIjUrvwGIuOzKzeQfTziBfQawrdzBk3SxqDKPvZjl
         Uje0M7eh8ZgeAbejg4waZkNug3suzS/stt8ofh+WJ91gwU0IdQl1QCYxz+D1nRM9eDgG
         3OxOwgNfxSSC5SCl4pBGk9YzMGxtOrAHx77WK5byEhS4arsPKKydGfN1aQJokynspED2
         tboZgpYpt21L+qnIkNdCWF7wcl3WGiKasx2jWEUsoX2PdRV29S5xGxgRivvdJn3p3xn1
         B+mA==
X-Gm-Message-State: APjAAAU3uK6IbsjV8Lojc9RKPoT/HsXnwPQOzZRaHAXla0HPY/Rf7Ne7
        vjwGE4ySo2yeiXjcW6pB0WOJ7Q==
X-Google-Smtp-Source: APXvYqwrm9QohNHq0++rIl5Gykt4pMddHMa4LN9dNpYpqce8aMlV5KSJv4ChUb7fQ5cVJlnArIAL1A==
X-Received: by 2002:a17:90a:fd8d:: with SMTP id cx13mr9965664pjb.66.1571392334920;
        Fri, 18 Oct 2019 02:52:14 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id l184sm5575252pfl.76.2019.10.18.02.52.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 02:52:14 -0700 (PDT)
Date:   Fri, 18 Oct 2019 15:22:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, sudeep.holla@arm.com,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191018095212.7hpherdgzxhqzqjz@vireshk-i7>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
 <a59321a1016de3f08098739b6db5d5190ac1c85c.1571387352.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59321a1016de3f08098739b6db5d5190ac1c85c.1571387352.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18-10-19, 14:22, Amit Kucheria wrote:
> Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> can have earlier access to cpufreq during booting.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c   | 2 +-
>  drivers/clk/qcom/gcc-qcs404.c | 2 +-
>  drivers/clk/qcom/gcc-sdm845.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
