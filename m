Return-Path: <SRS0=xcQL=3C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59ECC33CA9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 22:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6493207FF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 22:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578954615;
	bh=MCYl5+iszRacdvCIlul+eosv/qxb+MyzampfLJoxvWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=C6V1iLifatEH9C/ayMPQ1DXN7ANdDST5CVKp/ZdoNZ/RmnlfbGYyGZ3D3Q0g+5H5D
	 IA1INX8wCKpw0+/175FXTHStk57HRtduNsU96rX7Plfd+dbZXiFZSnV7l5Dzqj8zir
	 TXhuQyMgvdtKfTBf57Nvsew4yQpu59WMTAr5RfoY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgAMWaP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:30:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36301 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgAMWaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jan 2020 17:30:15 -0500
Received: by mail-ot1-f66.google.com with SMTP id m2so5745887otq.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2020 14:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2aqbv7Gs5aPw45r0A4Glmj6TozevE0VvRNxou586VsA=;
        b=VtJUqv3HaxMzEo4JT7OSEVc/Ru8ULRZtiJxOUAorMl7c0tV6FHYl4eQMTxnGB6kuMW
         6hxKg4HThkfmxzsTym0UHG6TZdl/eZnXyZaV73ZH8LUav7kBuv/jIzQoLjQ/nIoinW/K
         KBizUtbNMMpKhouctBLcJRGlftwsg3bXKeRrYF4GtiO9XreaiTp6GxR+n1AjmQOrjafU
         xZQJs8O/pFfn1iaLeAASDGL2NQQzguHZsUjTihXqq6TerbUyWG0RmDn4QS/UkFnr8lVc
         SVe7CjYjtNbLeeOfHd2yDAQV/GvtpxssIGWIoxT2Cfb04T+58rZ8jTATnZj/4p1GaCX5
         b/Eg==
X-Gm-Message-State: APjAAAUrgUSjbkCGlsjBs94R16IpCi/KjPUdqRO93rslwYmmOvAlxhTP
        h8k4SFfyHLkwtEJhxzGftpzeb/4=
X-Google-Smtp-Source: APXvYqwtNxw6Yu9VCQo3wyk+IUqWM4OVgH8gQ2PuryihGa11xH01FJpFVAGNRj9MpZ7zXbw35nztMg==
X-Received: by 2002:a05:6830:451:: with SMTP id d17mr13987194otc.53.1578954614024;
        Mon, 13 Jan 2020 14:30:14 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e10sm4635589otj.59.2020.01.13.14.30.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:30:13 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:30:11 -0600
Date:   Mon, 13 Jan 2020 16:30:11 -0600
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
Subject: Re: [PATCH v7 06/21] dt-bindings: tegra: Convert Tegra PMC bindings
 to YAML
Message-ID: <20200113223011.GA18406@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 7 Jan 2020 20:25:00 -0800, Sowjanya Komatineni wrote:
> This patch converts text based Tegra PMC bindings document to YAML
> schema for performing dt validation.
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ------------------
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 340 +++++++++++++++++++++
>  2 files changed, 340 insertions(+), 300 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
