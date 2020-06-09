Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38498C433DF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 23:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00A582072F
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 23:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm/ti9O8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgFIXRR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Jun 2020 19:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgFIXRR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Jun 2020 19:17:17 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCA2C05BD1E
        for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2020 16:17:17 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id u8so50186pje.4
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2020 16:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jgY1cSbg51JRlmAvUqOhJ3cNliPaBUCpIj85KynqCTQ=;
        b=nm/ti9O8f8poWZpBEcS+8GOpZdpuT0QyRbJ0S0ja8g/OwXGCYCXU3dgaTCASJLIGan
         jJM0uezUyaXxaytoh0no8t9AEUlzjxbOV2mlv0H/C3ndKHUcUFzprt0VHhg81UQaCxMB
         Xt9InJNK8Z2zAmtqcoUTCE4ZQoC3LHeJznmMJUMmIgr3Ct7hSWnmZuqVJLQxfFUW7U5F
         K3JgWaOjRdQNO0kceYzUNIFwgoipa4+1AY6e6BF/jJH4470Cc9ffuUnXXtNr887jhAR+
         Rii1bjYaet5JRRmBdwjI4ZTQJ1YHzDrJFkjlzQt5UlM1nJmnd+UsJWAEgTUzyCRJ/dfA
         /HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jgY1cSbg51JRlmAvUqOhJ3cNliPaBUCpIj85KynqCTQ=;
        b=OOsmIdLSLIMiOcoMqxjFEIelSIDxETTsik8q1qsTf04G7qRXTDx2VOAECqunjM46Nx
         s4X9yeAefmumzyiE4MapcVIEo7CtuPfDQNLH1gfPhhLJYYBOKAnBGDyae2cBR0IFc8qu
         dHX1u9qB8YQ0J5D2JZH2kCIEyI1ihe1L7N/iQZZvjevj5hSPArSMOYGMWZX49J6u7B+3
         VNu95t3jb3nFc2QDN74XcnFikbcfymsTEDqqQZr36xZ16zOX0KBKfJqskkvt04TzTMmj
         ZFR5/yK9WZWS6S4vLTtJwphNLGAuJEWwlXHALr2exjY7/62e5qyTx3lZGReQku50Phy/
         MR3w==
X-Gm-Message-State: AOAM531eSr6REynGuEMACetJklYEN4fI4FCn8ZkKwNRgdsmE/PYBMu9C
        C1HLRzYWV/rJLwlNfhpb7kE=
X-Google-Smtp-Source: ABdhPJx8+fJ9TCjldsFTjIdpMfby/xP/NaZ0dZFeiEARot9XT7Lr0S+7t8IdJBWKnC4hPqgrB4g58w==
X-Received: by 2002:a17:902:c697:: with SMTP id r23mr610556plx.312.1591744636926;
        Tue, 09 Jun 2020 16:17:16 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id s11sm10507840pfh.204.2020.06.09.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 16:17:16 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: Re: [PATCH 1/1] clk: add lock protection to clk_hw_round_rate() API
Date:   Tue,  9 Jun 2020 18:17:02 -0500
Message-Id: <20200609231702.29863-1-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609000816.23053-2-sarangmairal@gmail.com>
References: <20200609000816.23053-2-sarangmairal@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,
Thank you for your time in providing valuable feedback on this topic.

> Why is a provider calling clk_hw_round_rate() outside of a clk op like
> round_rate or determine_rate? Can you share the callstack here in this
> patch?
Since this problem is only exhibited in our vendor kernel tree, I had
attached callstack in cover letter and also noted my intention for proposing
this patch.
[PATCH 0/1] Lockdep assertion caught with clk_hw_round_rate()

Please note that my intention here is to not take your time to
help resolve a downstream kernel problem but to take your recommendation
on whether you thought this kind of a call sequence somehow exposed a
locking problem with clk_hw_round_rate() API or not.

Here is the callstack from downstream kernel tree:
    [    1.193088] Call trace:
    [    1.193092]  clk_core_round_rate_nolock+0xd4/0xe0
    [    1.193096]  clk_hw_round_rate+0x4c/0x80
    [    1.193101]  clk_populate_clock_opp_table+0x16c/0x320
    [    1.193105]  devm_clk_hw_register+0x88/0x9c
    [    1.193110]  devm_clk_register_regmap+0x54/0x60
    [    1.193114]  qcom_cc_really_probe+0x110/0x204
    [    1.193119]  gpu_cc_sm8150_probe+0x1e0/0x248
    [    1.193125]  platform_drv_probe+0x5c/0xb0
    [    1.193129]  driver_probe_device+0x2ec/0x420
    [    1.193132]  __driver_attach+0x9c/0x120
    [    1.193137]  bus_for_each_dev+0x8c/0xd4
    [    1.193140]  driver_attach+0x2c/0x38
    [    1.193143]  bus_add_driver+0x138/0x240
    [    1.193147]  driver_register+0x90/0xdc
    [    1.193151]  __platform_driver_register+0x4c/0x58
    [    1.193159]  gpu_cc_sm8150_init+0x1c/0x24
    [    1.193165]  do_one_initcall+0xe0/0x1b4
    [    1.193170]  kernel_init_freeable+0x1f4/0x28c
    [    1.193175]  kernel_init+0x14/0x14c
    [    1.193179]  ret_from_fork+0x10/0x18

clk provider in this case ends up calling clk_hw_round_rate() during probe
with the intention of setting up opp tables for a client use case.

clk_populate_clock_opp_table() in the above callstack comes from vendor's
kernel tree and is not in vanilla kernel.

> This is making things worse. By adding the lock here we're making the
> prepare lock more recursive which is not intended. Probably the caller
> is broken and shouldn't be calling this API from places that aren't
> already holding the lock.
Ok, thanks. Makes sense. If clk_hw_round_rate() is to be called from
a clk_ops callback then in this problem situation, usage of the API is at
fault.
I will initiate a discussion in the downstream kernel forum to get this
problem addressed correctly.

As a very minor follow up, do you think a small doxygen note about usage
of clk_hw_round_rate() API from within clk ops is useful for clk providers
to avoid such a trap? If not, then we can close this thread.

-Thanks and Regards,
Sarang.
