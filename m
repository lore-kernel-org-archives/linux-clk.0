Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99D1C43381
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 09:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB9623130
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 09:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgLVJQq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Dec 2020 04:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgLVJQl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Dec 2020 04:16:41 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E25C0617A6
        for <linux-clk@vger.kernel.org>; Tue, 22 Dec 2020 01:16:01 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id z21so7998225pgj.4
        for <linux-clk@vger.kernel.org>; Tue, 22 Dec 2020 01:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l8QALzA4i8zX7B1di+fsQ9pXz5BTZwpSgw/mRJC9G3I=;
        b=iNpi5UGBLQA73+p7sshoUk2MKXQ6+B7bN+nLc+PLyRS7Qzc6JQHE5LPyrHGQxOzXY1
         uOtxbpfxB2whAININqJ4SNPQdP/iqcNVaDMTfpwi6jlirHg+TpXFAk8EUfaM+f2LThpO
         ITwA/t+QLxo/gtfFoU6Y1t6N7t+IeYiN4NQyBRuiWeJo1VWI5Wqkou8CGRhI3Ddi6WMb
         hnbtCuE/ASxcgiGOFPqWP03O9KQV73qnkGAu5hCruEh7I3wNKYJN03dx+O01l7K/zD/k
         7cuSdAfi+Fx9eHduQ+ALtP2fw1WpzfC4YnQ/pZ7skehvj4ca2ag34R983WJCOmU+lJGf
         g+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l8QALzA4i8zX7B1di+fsQ9pXz5BTZwpSgw/mRJC9G3I=;
        b=lppovxSOqWXWpB2OGyUePOAEYPvX//+YKWyIMRZrJnlOa3nVYV8HkM0gKf0tGSsO+B
         PnPeVf+ThY4eqERCrXoOlPdjizJPvVMKbtP9Ou8jKUeeJvs6KuqRumV2mi0YJmrydRKU
         rSI07jzoTrm073/G1H4Pr84BO26q4sAaBclH5HPFf9GdbTirmGNh083uRydNha/kAzdt
         5tAPVm1nSphjFvqwhZglBQAIq+tVP30t5SR7c9np7AnDY2NWAXs2XJHzTQ7Rt69CR7ba
         5FeiMCOLjFfD+26O5eoC8Sgtp4hu8UYNKdce2DqV/IRo3K6p9lJpjpUpbFmK5iZ2jh5X
         zXNw==
X-Gm-Message-State: AOAM53075GfsVfJr0vPO6+GHhjaQctQ0kzHq7qQASsXQ342Os2ai95Oi
        78ZLN/FNoq+42Z+pT5SHunIhxQ==
X-Google-Smtp-Source: ABdhPJzoRmGGLI8WVPnxM7oud4VBQbrA5PgTbrGlwdy+hH6OXaJYRZjRb0UVH5lYi+efCVdlFZN7eA==
X-Received: by 2002:a62:1d0a:0:b029:1a9:8b33:a1bf with SMTP id d10-20020a621d0a0000b02901a98b33a1bfmr19012878pfd.32.1608628560561;
        Tue, 22 Dec 2020 01:16:00 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id t9sm13088468pgh.41.2020.12.22.01.15.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 01:15:59 -0800 (PST)
Date:   Tue, 22 Dec 2020 14:45:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
 <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18-12-20, 16:51, Dmitry Osipenko wrote:
> Alright, although I haven't pretended that v2 patches should be merged
> right away since they are fundamentally different from v1, and thus, all
> patches need to be reviewed first.

I agree. I have done some basic review for the stuff.

> If the current OPP changes look good to you, then please give yours r-b
> to the patches. Thanks in advance!

r-b-y isn't required as they will go through my tree itself. So if everyone is
happy with the idea, please submit the patches separately (fixes, improvements,
devm_*, etc).

-- 
viresh
