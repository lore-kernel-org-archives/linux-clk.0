Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0594C77B7D
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 21:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbjEJVCE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 17:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236634AbjEJVCD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 17:02:03 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209D410E2;
        Wed, 10 May 2023 14:01:52 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac88d9edf3so73426861fa.0;
        Wed, 10 May 2023 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752510; x=1686344510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Schew7/1f6L1gKiDAa1E4oOxjUrtaVYHdw6xtsV4v+0=;
        b=kUXtX/zBnGRfU5FP8VpCvwgHddlFiFcMLFSAZMuekeQG1a9e0zwWsSIj9x2W3ev4Wk
         Z0WTtkoZPsjc5Qs/Zw3Sp3ecHk8FvLRTiE1K8xNUoT1edzzqtHPHI2X+c49VHBnFrhhi
         Z7HSwY8tUesYJHYc86fYBy0nZP4PSQ0d13dO9SObEoDS60eeKa0RsJRDycl0rAWeS+tB
         lgfkDTFt09P8sa6D1M0i18SeAESqb/Y4exuxlIkxSfGhoVQGQymNa2mO8pvBWr8lkInm
         vGmwlWc/gs5g41uJwOJSrbYm0SD0dXr94L55u+gydXL9qwjp2eoCV56OJrTdtSOA28cO
         6KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752510; x=1686344510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Schew7/1f6L1gKiDAa1E4oOxjUrtaVYHdw6xtsV4v+0=;
        b=j0dqnh1McqG2jmEEB++xQ8pSCMh+RjtcnzdtmrnW7NVAB42TqHuT/HorwY/yIj+PfH
         FPgIqb66BV8Yuzlv5Twz3Qi6RRTMr0JZJu3nNMfq4k8Bm/yuIlDblXuo/jkqQ+Lb5UsR
         qqGBjwrveGymBCheXbdgJg9TTxxDr8m1ks1DWl9+ZVHatNQ2M6cIBRSY6xHPN2WvOUJJ
         JoonzTCy2tw/mLRBl5dft1O1E24LSAEp3yI+04Ej7SE+KpmjQtDsr5gEx5a8n7FXcx41
         L36XR+9GxuGhOtuXRqiVm4g7yp3RI3LZ9aFU7flSZN0MzoENdi28q21QKE8YkbZOrZTj
         VKsg==
X-Gm-Message-State: AC+VfDxQiy9lUYYyhC3WCPMFOckTnMF3lwdgVicPFHi1IzuRwi78J1ec
        OYM0xvvluvHN0oZBQWN1fTLJnrP2gSySjg==
X-Google-Smtp-Source: ACHHUZ7HN36RSXe1y/LhN2y7JSVz5OGcyYIMQaUDQczYtNLp41YDSovvtoyFOkx79Si5DjsLAjjNqg==
X-Received: by 2002:a17:907:98d:b0:94e:cf72:8147 with SMTP id bf13-20020a170907098d00b0094ecf728147mr17485950ejc.48.1683752074142;
        Wed, 10 May 2023 13:54:34 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906584900b0094e597f0e4dsm3059489ejs.121.2023.05.10.13.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:54:33 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Situation of CONFIG_CLK_SUNXI_PRCM_SUN9I
Date:   Wed, 10 May 2023 22:54:32 +0200
Message-ID: <10272596.nUPlyArG6x@jernej-laptop>
In-Reply-To: <CAKXUXMy3_krgwHMS6TaDZhBePkaHTHigntwBD0WFxMJ=DtgWYA@mail.gmail.com>
References: <CAKXUXMy3_krgwHMS6TaDZhBePkaHTHigntwBD0WFxMJ=DtgWYA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Lukas,

Dne sreda, 10. maj 2023 ob 07:38:04 CEST je Lukas Bulwahn napisal(a):
> Dear Maxime,
> 

I don't see Maxime in recipients...

> with commit 49c726d55c1b ("clk: sunxi: Add Kconfig options"), you
> introduce various build configurations for Legacy clock support for
> Allwinner SoCs. Among them, you introduce the config
> CLK_SUNXI_PRCM_SUN9I in drivers/clk/sunxi/Kconfig, but this config is
> not used anywhere in the kernel tree.
> 
> Can we just delete this config CLK_SUNXI_PRCM_SUN9I again, as it is
> not needed, or did you simply miss to adjust the Makefile for this
> option to be effective?

I think this is the best approach. If it wasn't used by now, it can only make 
further mess in distro configs if introduced.

Best regards,
Jernej

> 
> I will gladly send a patch, once you could give me a quick pointer.
> 
> 
> Best regards,
> 
> Lukas
> 
> Note: This is a resent email (see original email:
> https://lore.kernel.org/all/CAKXUXMzqCktKz7vGN4_QAp4n1SeP0-YHL19evmVSfseZOem
> d5g@mail.gmail.com/); now hopefully with an email address for Maxime that
> reaches Maxime.




