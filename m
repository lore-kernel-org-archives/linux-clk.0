Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6181C433B4
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 13:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2708610FC
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 13:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhDRNBT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Apr 2021 09:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhDRNBS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Apr 2021 09:01:18 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CB1C061760
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 06:00:49 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id x12so28035540ejc.1
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Ow1NlEM7DKtr4mIJK66YbpuR1k+LjlGbnW7/7eKM+w=;
        b=ZAzrDKi0WrNy99E2xve9lRvUjc4y9pEfsTbOA8rOglKFYPdhSZpk9sn41KFyifW207
         mNCMthaZUyAG4M3JuWBar9NVWdsjzL8m6XImXPr5eW79YHfWu11l37h66T1/G1dzr+4p
         d2LnXEOzeQ4rwxCrOgBXAvCu2lJjfeIRBt8zhBIs+8MPUDoi/lwSlqcxVGTwyul8YqM/
         ZtxAgrmNjcvb17Du8X6TWI0UUYuvwnE6oF9Cd6Z76pqffWCMifOe1iJHdTBRNiReagJo
         GjODWwgQ7qZsBHXytLHXYNnEKuk2KUoWU6hxmj79hoOqCJaisYCe05el6SB6U9nd1Mcs
         gU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Ow1NlEM7DKtr4mIJK66YbpuR1k+LjlGbnW7/7eKM+w=;
        b=nc1wMJRWqngo+0wwwgJ75ryhkir6IEC/MyUtAsFa47nP0Je3HCwqgdw38ASfCGhLxA
         aRre8J2zziC+SnL3Nt6HCnP9L7ymgGCoy1BDk6V+MsybT4CYv/d6vaT3HiIE6K1ibwcV
         dOz3l1c9jesQZqufjxIYziXFATJUxeVaD71fBTlIjyBhYGEoGy42r2i+233Jgf5MjELA
         g355u1of5zBJ7LQ4RCDWOVnf8O0KrWa5eV81bAPt8z6rwp4F1kKgFBx0p54EO567JgnC
         EtS5te42Yhb/PQagetiwGZMMjS9++PKF+cezZnpjgmJ2EjysYVmuipnpN4BeoR3cVrZC
         bqfg==
X-Gm-Message-State: AOAM530dYeejHEQOhI/+kkWI9SJ1RexatQzoMMn+yRyu67lPIsTvZdD/
        btAHuePUxnNg6KolDZ+586dYZw==
X-Google-Smtp-Source: ABdhPJynk440pimUYGjeiYWc8ykH5SQkOAlqUmul4ohk1LNdpMwCBfj4JfqjQMI6VpxBPwNUI4EKaw==
X-Received: by 2002:a17:907:76a7:: with SMTP id jw7mr17228065ejc.322.1618750847955;
        Sun, 18 Apr 2021 06:00:47 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id r10sm8436629ejd.112.2021.04.18.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 06:00:47 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 03f6b92d;
        Sun, 18 Apr 2021 13:00:45 +0000 (UTC)
Date:   Sun, 18 Apr 2021 15:00:45 +0200
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] Samsung Galaxy S III Neo Initial DTS
Message-ID: <20210418130045.GA73531@PackardBell>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 26, 2021 at 03:58:11PM +0100, Bartosz Dudziak wrote:
> This series of patches enables to boot MSM8226 SoC in Samsung Galaxy S III Neo
> mobile phone. Implemented clocks are on top of MSM8974 GCC driver because there
> is really little difference between them. UART serial communication is working.
> I have working patches for the regulators, EMMC, multithreading and Wifi for
> this device but they are not clean and ready to submit.
> 
> Bartosz Dudziak (5):
>   dt-bindings: clock: qcom: Add MSM8226 GCC clock bindings
>   clk: qcom: gcc: Add support for Global Clock controller found on
>     MSM8226
>   arm: dts: qcom: Add support for MSM8226 SoC
>   dt-bindings: arm: qcom: Document MSM8226 SoC binding
>   arm: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo
>     phone
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   6 +
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  13 +-
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |  25 +++
>  arch/arm/boot/dts/qcom-msm8226.dtsi           | 152 ++++++++++++++
>  drivers/clk/qcom/gcc-msm8974.c                | 185 ++++++++++++++++--
>  6 files changed, 364 insertions(+), 18 deletions(-)
>  create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
>  create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
> 
> -- 
> 2.25.1
> 

I have sent version V2 of the patches
