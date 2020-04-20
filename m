Return-Path: <SRS0=HJ9p=6E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F87C3815B
	for <linux-clk@archiver.kernel.org>; Mon, 20 Apr 2020 06:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B96920857
	for <linux-clk@archiver.kernel.org>; Mon, 20 Apr 2020 06:44:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2Pjm9Tj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTGo1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTGo0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Apr 2020 02:44:26 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D87DC061A0C
        for <linux-clk@vger.kernel.org>; Sun, 19 Apr 2020 23:44:26 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z26so8616140ljz.11
        for <linux-clk@vger.kernel.org>; Sun, 19 Apr 2020 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgOqIRpLDJeJNx24vbd2CV+KIapgXOXxX4iBPbrgTik=;
        b=K2Pjm9Tj7zHwiYuKEvfwP7zEG7BkatDtSAcfTeYN4jFzItHyBGcGvx4RxenavagXY/
         Uz/SGDvIdDurFIJWSLmvvbOoxUED4gcDKNuXrNqVNg60GHuJkTm9zSoeXZHfHXGpOWhD
         sY1+IVYGVAUjM1RoLVWRpIaYwbwPcIE/a09AGaP0wNLSRkHMMqpLZJU2hn+m8C3/mrHA
         5n28aqYcyKEO1CDDkGpSzPdCGayLaieagMquIm356hadahuyUNHE73LbxMkmXVSYE0tr
         hei0pLQrHr4BnjGhKch95pifzAoXA5CyEJGTqzSnuOIiUTZR2Hn+wfpur5tfgIWyqROP
         fTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgOqIRpLDJeJNx24vbd2CV+KIapgXOXxX4iBPbrgTik=;
        b=kaRGrOcyttcfpiSzXLzVVZd+6SpY6aLkopkxLQdk5G9jj2Ah5lL/UAgO2rv4uoNfrv
         knIgrfZzeLG87zktMuyvVLCGyxJ7Jhn+qpRiiHX2CQXGA5QbGT6lkaKUTdMU68MLkYRP
         aA4lZryq7SVNZ+EncAln0+/iFVnm+eL6tRvbAVAEmDHDr57ixkph6QRbJ8u6d+rzk548
         tcvD9gsmFjBrLPDajFPdQpcj5oinQ54FGCk4tdbU6lCeUdWOlDrowiBnPo+5NEIdYHFl
         edBxj8ph0nIdqy7mGgNfFPO+xnA2oXkgBjTT1F8cDLkLAPvWdBdRE0g846grW5Z3DVNW
         voHw==
X-Gm-Message-State: AGi0Pubb4ii9QAV+A5LKsHNfgfHW5WleZpoGmguCp9fh4ZSBmRuK61mA
        bFYGXbC0j9HkKlbkf7t7kU58YFezBXHHaCVm3kv5NQ==
X-Google-Smtp-Source: APiQypIWrvbuGilFqwUK4J/jFPRrcItaSJloXE/A2PHW3NnuJWBony0etnuvXn7iJyfUT6gETNUhWZTt7e4q+ysOKeg=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr6983364ljg.99.1587365064709;
 Sun, 19 Apr 2020 23:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200419170810.5738-1-robh@kernel.org> <20200419170810.5738-6-robh@kernel.org>
In-Reply-To: <20200419170810.5738-6-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Apr 2020 08:44:13 +0200
Message-ID: <CACRpkdY7YWQobPt7KHJWkzScag-y608rhc6+vzLo_3hDWT1iig@mail.gmail.com>
Subject: Re: [PATCH 05/17] clk: versatile: Kill CONFIG_COMMON_CLK_VERSATILE
To:     Rob Herring <robh@kernel.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Apr 19, 2020 at 7:08 PM Rob Herring <robh@kernel.org> wrote:

> CONFIG_COMMON_CLK_VERSATILE doesn't really do anything other than hiding
> Arm Ltd reference platform clock drivers. It is both selected by the
> platforms that need it and has a 'depends on' for those platforms. It
> selects REGMAP_MMIO, but really CONFIG_ICST should do that. Also,
> CONFIG_ICST can't be enabled for COMPILE_TEST unless something else
> selected it.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Good catch!

Since this conflicts a bit with other Kconfig patches I have pending for
mach:s in arch/arm it'd be great if I can get an ACK from the clk
maintainers and merge it with the rest in a pull request to the
SoC tree.

Yours,
Linus Walleij
