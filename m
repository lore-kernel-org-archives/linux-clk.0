Return-Path: <SRS0=iEFu=5E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1D6C4332B
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 07:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71BF520724
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 07:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZyXeHZ6E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgCSHoI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Mar 2020 03:44:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45918 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgCSHoI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Mar 2020 03:44:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id i9so1364058wrx.12
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2020 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=8G6ZnhC76S+a0nX3uIB0o/UbMU7oc2ekBRk4ZBzMhfk=;
        b=ZyXeHZ6E9GgI7PQ3/JNJnGVywJvMuyEuNUPHAE0C3Hrsl2fCjTBQSYRPxZzgj0Q12y
         jUhvnPZ9Y7L1OxpqqPQ5YUEUNzqU6oZFiflxogGT1qYVKz5l4dxn19NQZmF+op4PWyzU
         3GEZw0OETcFOj7b7dcwEpbqRPQKJPxSo1LoJktwcRrCvHgZPvSr4QqJDRI38ZeedOKe8
         z1GxWMcugiheSTKebig9iTziBCUOMI/nc8MsUpQBhUMbP5gWe2Ey6L7tllGwfW27pDbJ
         PPIUhDbHXT1oxzUkqIWFdwVrVnUz9Do/0Qbikeu6Aiyi/2DyZU6BDCfjgN+h2p6qr/KZ
         PHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=8G6ZnhC76S+a0nX3uIB0o/UbMU7oc2ekBRk4ZBzMhfk=;
        b=qcjUvdYglubyCx4q/QPaC7vPCKEe321jgz6Pl2p2H3VLGLVKIYVXvFnAWI/iYJDP7v
         /dkl/WASz3CnSqpL9/4Nh9bFNFV/73uQxo6G306Tf2hLXcy2y4FzrMgtP9YoN4l4XdP4
         Vyzy4x8phWteB4bG+FAgWRFLNSNIbd2PTCe4J9SV0QKQIAEpi2w3lNjaC+n9dU/tEmyT
         lzyD7A2WJXFqCoSJdOVkA9gA6WGLS3kYA98iJmttc9N/owzw4IsKadeg2PcjWM0FNjOO
         kMeyTsk6SYmrnwfUibltNhR+NnSPaVCPo80bKNb0M2Y4IjTyONynXcRqgTgtlJ62SCE/
         t+UA==
X-Gm-Message-State: ANhLgQ0Q5woraKwaQjLgTN6Me/HtycHn/CXdsw3BikREgZ3z/VByUw0/
        toK3RLvPJtpUiVA+bVvT9GJkkEkpoOIvIg==
X-Google-Smtp-Source: ADFU+vuKr+qEFy31VI/80gx52dPSn4WmMzXMLVRosndQlVFjNAd1HfXNRlss+zm7FNEZsfvLhA0lqg==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr2431975wrn.61.1584603844041;
        Thu, 19 Mar 2020 00:44:04 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id g8sm1925537wmk.26.2020.03.19.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 00:44:03 -0700 (PDT)
Date:   Thu, 19 Mar 2020 08:44:01 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        pgaikwad@nvidia.com, pdeschrijver@nvidia.com,
        mturquette@baylibre.com, sboyd@kernel.org, axboe@kernel.dk
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-ide@vger.kernel.org
Subject: tegra124-jetson-tk1: sata doesnt work since 5.2
Message-ID: <20200319074401.GA4116@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

sata doesnt work on tegra124-jetson-tk1 on next and master and at least since 5.2 (but 5.1 works).
[    0.492810] +5V_SATA: supplied by +5V_SYS
[    0.493230] +12V_SATA: supplied by +VDD_MUX
[    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
[    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
[    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not found, using dummy regulator
[    5.310270] phy phy-sata.6: phy poweron failed --> -110
[    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
[    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
[   35.694269] +5V_SATA: disabling
[   35.697438] +12V_SATA: disabling

I have bisected this problem:
git bisect start
# bad: [22c58fd70ca48a29505922b1563826593b08cc00] Merge tag 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 22c58fd70ca48a29505922b1563826593b08cc00
# good: [67e38f578aaebf34fc1278bbe45a78ee8c73dd33] ARM: ep93xx: move pinctrl interfaces into include/linux/soc
git bisect good 67e38f578aaebf34fc1278bbe45a78ee8c73dd33
# good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
# good: [e57ccca1ba33e1d92cc3bbf8b6304a46948844b0] Merge tag 'sound-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good e57ccca1ba33e1d92cc3bbf8b6304a46948844b0
# bad: [983dfa4b6ee556563f7963348e4e2f97fc8a15b8] Merge tag 'for-linus-5.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/rw/uml
git bisect bad 983dfa4b6ee556563f7963348e4e2f97fc8a15b8
# good: [8e4ff713ce313dcabbb60e6ede1ffc193e67631f] Merge tag 'rtc-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux
git bisect good 8e4ff713ce313dcabbb60e6ede1ffc193e67631f
# bad: [b970afcfcabd63cd3832e95db096439c177c3592] Merge tag 'powerpc-5.2-1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad b970afcfcabd63cd3832e95db096439c177c3592
# bad: [601e6bcc4ef02bda2831d5ac8133947b5edf597b] Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
git bisect bad 601e6bcc4ef02bda2831d5ac8133947b5edf597b
# good: [7e9c62bdb41af76974d594da89854a6aba645e58] Merge branches 'clk-sa', 'clk-aspeed', 'clk-samsung', 'clk-ingenic' and 'clk-zynq' into clk-next
git bisect good 7e9c62bdb41af76974d594da89854a6aba645e58
# bad: [0caf000817353cfc5db22363ecdac63b83d3a3f9] Merge branch 'clk-ti' into clk-next
git bisect bad 0caf000817353cfc5db22363ecdac63b83d3a3f9
# good: [5816b74581b45cf086a84ab14e13354a65e8e22c] Merge branches 'clk-hisi', 'clk-lochnagar', 'clk-allwinner', 'clk-rockchip' and 'clk-qoriq' into clk-next
git bisect good 5816b74581b45cf086a84ab14e13354a65e8e22c
# good: [7b4c162e03d47e037f8ee773c3e300eefb599a83] clk: at91: Mark struct clk_range as const
git bisect good 7b4c162e03d47e037f8ee773c3e300eefb599a83
# bad: [e71f4d385878671991e200083c7d30eb4ca8e99a] clk: tegra: divider: Mark Memory Controller clock as read-only
git bisect bad e71f4d385878671991e200083c7d30eb4ca8e99a
# bad: [924ee3d551c9deb16090230b824988bd37e72aa8] clk: tegra: emc: Don't enable EMC clock manually
git bisect bad 924ee3d551c9deb16090230b824988bd37e72aa8
# bad: [40db569d6769ffa3864fd1b89616b1a7323568a8] clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides divider
git bisect bad 40db569d6769ffa3864fd1b89616b1a7323568a8
# bad: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: tegra: Don't enable already enabled PLLs
git bisect bad bff1cef5f23afbe49f5ebd766980dc612f5e9d0a
# first bad commit: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: tegra: Don't enable already enabled PLLs

Basic reverting of this patch is impossible.

Regards
