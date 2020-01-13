Return-Path: <SRS0=xcQL=3C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAB8C33CA9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 22:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A77B2075B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578953004;
	bh=5Lk0I84bdIIGN9uM7n135AuqzI73cu9k6WUFDpAYPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fawMuH2ZVWMNWxk1CMxmnzkIo086uzChZLpV9yTDsq/HKLaO/S/4hCq4RpJ1AtIu1
	 C2kehWJ/kzaBEVj4l2L4fHDEna7qkl7TDkRq2skl3Y6SRO6H7SffvRZZSTk4n5hfsA
	 0U2gDswjd0Mv5og8ASWqh7g9dAlVWlfvM9YGWcjA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgAMWDY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:03:24 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45430 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgAMWDV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jan 2020 17:03:21 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so9834547oie.12
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2020 14:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TPVDmHPgyswCSzHUpaO4xXgku0uEWmnDxxOITskBC8M=;
        b=TdBEvZQY0uElp6p/SXH/EhnzWOnQ9mKDmqfEYluExUxBnLYlUKW6aDKzn7ipKwV6u6
         tRbG72V+HrkqEXh5XcIN1WUMwp4lqFqLAj86gr2zXeSE04L4teuHAjW2SXIl1vg6nddK
         eR5/80IY1hmr7/RBvhm5QV5TVTuAYjdo75PVhpuqBTq6/fByvFz/a82swzgdSvomQ99i
         D35jV4UF/1TBk4qphxHPwiXn/V5BqlB7lQnhfRJ8cu4XvlyHsORi+IfdwULQXUS3jJsP
         SYYZJ11WVK7NkLpBdQGxfj1YMjk+RtAtmJ47ZshFFtLYN1ytZa1nhEhMq3Bp3WZ8TD1k
         dYWg==
X-Gm-Message-State: APjAAAVJE/agx4a9QClVOZP2z/28XRj9NKioELJ933m//A1wkyj5pC7c
        un03kFIyRaCJYSJ5jW4dFvcqbW0=
X-Google-Smtp-Source: APXvYqwGfw78ow2S8L99xgYrA3WTGXen4WmfkznZTVwPRNBfMQn93HzfBi5XhkhlvjSAKB+7QUDBOA==
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr14885350oie.126.1578953000642;
        Mon, 13 Jan 2020 14:03:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e10sm4607885otj.59.2020.01.13.14.03.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:03:19 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:03:18 -0600
Date:   Mon, 13 Jan 2020 16:03:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     skomatineni@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, digetx@gmail.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/21] dt-bindings: clock: tegra: Add DT id for OSC
 clock
Message-ID: <20200113220318.GA1891@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 7 Jan 2020 20:24:57 -0800, Sowjanya Komatineni wrote:
> OSC is one of the parent for Tegra clocks clk_out_1, clk_out_2, and
> clk_out_3.
> 
> This patch adds DT id for OSC clock to allow parent configuration
> through device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 2 +-
>  include/dt-bindings/clock/tegra124-car-common.h | 2 +-
>  include/dt-bindings/clock/tegra210-car.h        | 2 +-
>  include/dt-bindings/clock/tegra30-car.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
