Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA6EC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 11:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C3A361164
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 11:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbhJPLxE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Oct 2021 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbhJPLxD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Oct 2021 07:53:03 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4231C061570
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 04:50:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e3so30883275wrc.11
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 04:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GxuQ+eT7yAcMMVIqOW/HE7B+CKZk1hWICAp1ERekyN4=;
        b=qQ7syaSM5utqLppoMR7q18Uw6emez17vBJJEkqPCGwdy1ZJ1J6NpdHIePg3ZbvUQWf
         DYJ8KCsf13tXx+fL1pOUFXRNsgaRPX0rLKs49TJo0rL6YXVc1keb1p264qKz/9mSN4Yg
         7ls972YGCpwifwNRBHgsGpDorY6gpY3dRLWEHu2Mdb+O8FTjACh0twgijrnWdYMkQ8bB
         Q5m5qUMVqjmVm/pUj34Abup4B6Cl+7EfyIxrfGFbq/o22Vm5PIi3rAbD24k2HtMrMxtY
         0PJ86W0lLebB62vd9qVeHvqbN8PJtkul74hCbWD6i1Uzg775EH3ZRIEvuIygAAL41BCB
         0yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GxuQ+eT7yAcMMVIqOW/HE7B+CKZk1hWICAp1ERekyN4=;
        b=2c4YbEGhj+LFyISCQGgCPetWpRMmjBgp08f/AYhnqQhL6jxRWXbtJ0M0xbACcihXf7
         oDFu+/abygYdca2bp3ynpxM6MSx8SnwvShDxqWO9ph3OP6EW+tJkmoT2WrDhl65bek5m
         zjFNYBmZ3OkICHMg07T421C5yl4uN2RWQRfYWvzCBce9hJYTyx1zYxyShQ9VZuYSHiDs
         zq0a1iINzQNmloFM1j/HwfwQFVFjiXc1/t8yYoamH6V5rKTeeNpC63jeTRTPv++RMX8h
         ND+46caR6cHKEbt0A+yFKc5fjPD6kxhnX39eXIhRsIDuS8SnonAy1lVag7ahYhMev8tp
         S1lg==
X-Gm-Message-State: AOAM533xUNZ47rXidUV+Qby8S+MH25dY9rIRDGdgkP1hlTjLhf5hzx/Q
        zDfmusj5vJDnP61RigQIYw==
X-Google-Smtp-Source: ABdhPJyugfZNm1YXyYk6Pc9vZRBOCTnlRO9WHvRAXcpoJOk3PzkT0dvzRl0dIXmTPBOVVyNUHIls+g==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr20773834wri.161.1634385053322;
        Sat, 16 Oct 2021 04:50:53 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:4200:7887:5f80:a73a:4769? ([2a02:810b:f40:4200:7887:5f80:a73a:4769])
        by smtp.gmail.com with ESMTPSA id w1sm12875547wmc.19.2021.10.16.04.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 04:50:53 -0700 (PDT)
Subject: Re: [PATCH clk-fixes v1 0/2] Fix clk-composite to support
 .determine_rate
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <128bdf6e-f613-048b-4397-88f9ba8fd023@gmail.com>
Date:   Sat, 16 Oct 2021 13:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Martin, Hi Stephen,

Am 16.10.21 um 12:50 schrieb Martin Blumenstingl:
> Alex reports [0] that commit 69a00fb3d69706 ("clk: divider: Implement
> and wire up .determine_rate by default") breaks Rockchip platforms
> because the parent is not considered anymore. This is because
> clk-composite skips the "best parent" selection when
> rate_ops.determine_rate is set. Above commit does this by adding
> clk_divider_ops.determine_rate by default (then the Rockchip platform
> drivers are using clk_divider_ops as rate_ops in clk-composite).
>
> With these two patches a revert of above commit is not needed anymore
> (which would result in a revert of five follow-up commits as well).
> Instead the first patch changes the order so clk_divider_ops which
> has both, .determine_rate and .round_rate are supported by clk-divider
> (again).
> The second patch makes clk-composite use (and even prefer)
> rate_ops.determine_rate when available.
>
> Special thanks to Alex for his patience and helping test these patches
> off-list (since I don't have any board with Rockchip SoC).
>
> At least the first patch should go into -fixes.
>
>
> [0] https://lore.kernel.org/linux-clk/4eb964ac-4fff-b59d-2660-2f84d8af5901@gmail.com/

thanks for looking into this and fixing .determine_rate + mux as well 
for making this future-proof.

Both [PATCH 1/2] as a standalone fix, as well as  [PATCH 1/2] and [PATCH 
2/2] in combination are

     Tested-by: Alex Bee <knaerzche@gmail.com>

Regards,
Alex


>
> Martin Blumenstingl (2):
>    clk: composite: Also consider .determine_rate for rate + mux
>      composites
>    clk: composite: Use rate_ops.determine_rate when also a mux is
>      available
>
>   drivers/clk/clk-composite.c | 76 +++++++++++++++++++++++++------------
>   1 file changed, 52 insertions(+), 24 deletions(-)
>
