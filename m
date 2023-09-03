Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817E8C83F2D
	for <linux-clk@archiver.kernel.org>; Sun,  3 Sep 2023 22:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348734AbjICWhj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 3 Sep 2023 18:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348599AbjICWhj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 3 Sep 2023 18:37:39 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C4DFD
        for <linux-clk@vger.kernel.org>; Sun,  3 Sep 2023 15:37:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c0c6d4d650so6840695ad.0
        for <linux-clk@vger.kernel.org>; Sun, 03 Sep 2023 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693780653; x=1694385453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75zjcGnVwfUfJUqEwa2RDdihaMKUFMKRhK0oHtPsQNI=;
        b=n1ur5N3G9t7vJyxmDMMoTCHYKx9FAszjoE+NXscBcZMaSkqyLHj9yW97arnmKFdmPZ
         Ol/qDyeD6yCjpKQ3v0FoSylSvZQ5ck0KuVRcwYieTBhmEUG4K9UT6Co1iHLr2aqqFl6q
         PlxIsFOGrYFvqlUcplUYiCzwrprwTenlmfqk5g2vMOcD1KjyzB4GFvczlrRebFw0rYLq
         CTDQ0QmWt7Lkh3CzL8VGuN3f6G3kKGu3l5JU462iRoygQi3q3x0X4lA8R69gsydc7rC2
         fLydcVOYkYt9Qe8FEsZ8SRkoRz7legC30pREXyzvPMFUJEye0ddRTZSK3fDbx+gf4g6+
         i/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693780653; x=1694385453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75zjcGnVwfUfJUqEwa2RDdihaMKUFMKRhK0oHtPsQNI=;
        b=EGG+lWF4tSnXsfy/KDCu/skvLoupAwVTfinInlMKGheiF3DF5XQKwImMJRV6zPRsTP
         ibtvsPkTZiomHqe4LiyswZaa3Tzx8kQq86RY3EeexXl0W2xjJPcqcl1mkXWuhfaEcQti
         3ffw1GIpsT6o4fxSPKTtekxJ1uqt5NqfMe9ayXkwUrnrlnO3zMJ9AaM+j6dNgXyFOqEG
         3EuwmELRMSvnU4dwz9wFP7Emg6W4i+ruBJmzFNYQQ/jrRTMRu8YdGfjSNPWXjyueojfc
         XXP6yCqw44fZhbrYpRFKqo1VEnlAoCF6SG6b1C/jn1PlhAw/BiSq85JNbhZJ1fq/h0RX
         v8NA==
X-Gm-Message-State: AOJu0YwKDe+3eAbb/NlT4O+IZQVvt4p9W/6mpEAMENWQyafDsBQHfLHj
        QKB0B7lNR/QUltwQ8dSyBBL7kQ==
X-Google-Smtp-Source: AGHT+IFDK+b96i9bQUuJGZtagPUV/w9JXYNNgJkrbO34Zg85edf5iKUpK9zgciN7b4RZ32LgaCKJZg==
X-Received: by 2002:a17:902:ab1b:b0:1bb:9c45:130f with SMTP id ik27-20020a170902ab1b00b001bb9c45130fmr7786838plb.69.1693780652704;
        Sun, 03 Sep 2023 15:37:32 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:e0eb:2a3d:8122:b588])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902a5cb00b001b9cea4e8a2sm6282788plq.293.2023.09.03.15.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 15:37:32 -0700 (PDT)
Date:   Sun, 3 Sep 2023 15:37:30 -0700
From:   Drew Fustini <dfustini@baylibre.com>
To:     Jisheng Zhang <jszhang@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, devicetree@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, sboyd@kernel.org,
        mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        Wei Fu <wefu@redhat.com>
Subject: Re: [PATCH 2/3] clk: thead: add support for the T-HEAD TH1520 CCU
Message-ID: <ZPUKqsEglxC5+Ocb@x1>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-3-frank.li@vivo.com>
 <ZOsnYagqFz6atfw2@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOsnYagqFz6atfw2@xhacker>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Aug 27, 2023 at 06:37:21PM +0800, Jisheng Zhang wrote:
> On Mon, May 15, 2023 at 01:44:00PM +0800, Yangtao Li wrote:
> > Add support for th1520 in the clock framework.
> 
> Hi Yangtao,
> 
> I didn't see any new version of this series in this development window,
> and we have already talked about it several times on wechat, so do
> you still plan to renew this series? If not, I will update it and may
> rewrite the code once next development window is open.
> 
> Thanks in advance

I tried this clock driver on the BeagleV Ahead board and I got the
following during boot [1]:

  __clk_core_init: ahb2 must implement .set_parent & .determine_rate
  th1520-clk: probe of ffef010000.clock-controller failed with error -22

I am guessing this has to do with how ahb2_clk is defined?

 432 static struct ccu_div ahb2_clk = {
 433         .div            = TH_CCU_DIV_FLAGS(0, 3, CLK_DIVIDER_ONE_BASED),
 434         .mux            = TH_CCU_ARG(5, 1),
 435         .common         = {
 436                 .reg            = 0x120,                      
 437                 .hw.init        = CLK_HW_INIT_PARENTS("ahb2",
 438                                                       ahb2_parents,
 439                                                       &ccu_div_ops,
 440                                                       0),
 441         },
 442 };

It passes ccu_div_ops in CLK_HW_INIT_PARENTS(). ccu_div_ops does
implement .set_parent but it doesn't implement .determine_rate. Maybe
that is the problem?

Yangtao or Jisheng: would you be able to share the device tree you're
using?

I added this based on the example in the device tree binding:
=============================================================
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 18761a06c866..8153bf73e8c0 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -313,6 +313,14 @@ dmac0: dma-controller@ffefc00000 {
                        status = "disabled";
                };
 
+               clk: clock-controller@ffef010000 {
+                       compatible = "thead,th1520-ccu";
+                       reg = <0xff 0xef010000 0x0 0x1000>;
+                       clocks = <&osc_32k>, <&osc>;
+                       clock-names = "losc", "hosc";
+                       #clock-cells = <1>;
+               };
+
                mmc0: mmc@ffe7080000 {
                        compatible = "thead,th1520-dwcmshc";
                        reg = <0xff 0xe7080000 0x0 0x10000

=============================================================

Thank you,
Drew

[1] https://gist.github.com/pdp7/b585a6dad5134fc8773e53ad48600fef
