Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7337C6FD1C
	for <linux-clk@archiver.kernel.org>; Sun, 26 Mar 2023 17:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjCZRA6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 26 Mar 2023 13:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjCZRA5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 26 Mar 2023 13:00:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617C355B5
        for <linux-clk@vger.kernel.org>; Sun, 26 Mar 2023 10:00:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ew6so26536467edb.7
        for <linux-clk@vger.kernel.org>; Sun, 26 Mar 2023 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679850054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPnAWzVY/xksgwBP8ojOut4p982O2QbdY9NklKgcPkE=;
        b=WTh92vvt/Q6srMiwYPF+4UKDOM+rogaxTYT5T1zjeRbmzOJDBguYskNT+etp4tVUBH
         mi0cHeEhVdI3ZzETmjjk6aDlk/JMFD8MLnpfnvvQlRqMHpwBAZhajeyJf5mO1Bg+gEKj
         7zBLo6mdEkIj3xmeqIBX0Zc7NciwwARL3SgaRoVS8rxMZGT3gAgBuw9p+XOVCE7e1toC
         F9Q1FGcpXOU/IlyatJISMz7mLleJ1rE9crqQn6DO90lmavK3Ni+EjVpfst25gcqddPjf
         TG34X1G6ON/eP3Q3wQkZUnX0nLeUEcAVOHpcOVSvexabm0CcM00GyQmKo7zjke/e8KIl
         bmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679850054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPnAWzVY/xksgwBP8ojOut4p982O2QbdY9NklKgcPkE=;
        b=pEJi44pD6xgXFvaZn4oXv3rKVKpzKHey+UB22JlmDeIqWqeC+3h7hDwEdOfuKmcjiO
         P4KbIiEobHA/F4WOUearpvtSnxn4dZI6RkX3R8ODXsOIsWb7LretsURdDKxkLhPEYaOM
         r89CEO4Qk5M4QtN74hEDfvJTKC++gowuEZiDRGZ8WxHEYCLkVL557nqhlBONvAlb78rH
         ZOMbnM5osxZDPMmYm4y2cuH7prTEkpnJuJgHvG8E9iPbcLDu+0w4J1q+NuRpD+lA5SN/
         GwShYgdLZYieQbRFFq/rxs52VdKh6liB1CdIPlFR6psGDoHjbw0lPAailgtPAIzX+Zzr
         AF7g==
X-Gm-Message-State: AO0yUKX91qMkc1yARk70qFANgpeV0spkhXF6ESnUIW0IqxnaPG1ZaXMi
        aFVgNBiykIdN5P9xv5u0XKoWUw==
X-Google-Smtp-Source: AK7set/QBBdI7j96KAxeucykwgVCCtge1USW2kMfpJ4ZR0dHGLPWwpcaDkH8lPlq9MRGNHnCPpWd8w==
X-Received: by 2002:a05:6402:1762:b0:4af:70a5:560b with SMTP id da2-20020a056402176200b004af70a5560bmr17414875edb.9.1679850053766;
        Sun, 26 Mar 2023 10:00:53 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k12-20020a50ce4c000000b004af70c546dasm13724356edj.87.2023.03.26.10.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 10:00:53 -0700 (PDT)
From:   Jiri Pirko <jiri@resnulli.us>
To:     netdev@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        vadim.fedorenko@linux.dev, vadfed@meta.com
Cc:     kuba@kernel.org, jonathan.lemon@gmail.com, pabeni@redhat.com,
        poros@redhat.com, mschmidt@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [patch dpll-rfc 0/7] dpll: initial patchset extension by mlx5 implementation
Date:   Sun, 26 Mar 2023 19:00:45 +0200
Message-Id: <20230326170052.2065791-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230312022807.278528-1-vadfed@meta.com>
References: <20230312022807.278528-1-vadfed@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jiri Pirko <jiri@nvidia.com>

Hi.

This is extending your patchset. Basically, I do this on top of the
changes I pointed out during review. For example patch #6 is exposing
pin handle which is going to change, etc (there, I put a note).

First 5 patches are just needed dependencies and you can squash them
into your patch/patches. Last two patches should go in separatelly.

Please note that the patch #6 is replacing the need to pass the rclk
device during pin registration by putting a link between netdev and dpll
pin.

Please merge this into your dpll patchset and include it in the next
RFC. Thanks!

Jiri Pirko (7):
  dpll: make ops function args const
  dpll: allow to call device register multiple times
  dpll: introduce a helper to get first dpll ref and use it
  dpll: allow to call pin register multiple times
  dpll: export dpll_pin_notify()
  netdev: expose DPLL pin handle for netdevice
  mlx5: Implement SyncE support using DPLL infrastructure

 drivers/dpll/dpll_core.c                      | 334 ++++++++++----
 drivers/dpll/dpll_core.h                      |  25 +-
 drivers/dpll/dpll_netlink.c                   | 161 ++++---
 drivers/dpll/dpll_netlink.h                   |   3 -
 drivers/net/ethernet/intel/ice/ice_dpll.c     |  22 +-
 .../net/ethernet/mellanox/mlx5/core/Kconfig   |   8 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   3 +
 drivers/net/ethernet/mellanox/mlx5/core/dev.c |  17 +
 .../net/ethernet/mellanox/mlx5/core/dpll.c    | 429 ++++++++++++++++++
 drivers/ptp/ptp_ocp.c                         |   2 +-
 include/linux/dpll.h                          |  46 +-
 include/linux/mlx5/driver.h                   |   2 +
 include/linux/mlx5/mlx5_ifc.h                 |  59 ++-
 include/linux/netdevice.h                     |   7 +
 include/uapi/linux/if_link.h                  |   2 +
 net/core/dev.c                                |  20 +
 net/core/rtnetlink.c                          |  38 ++
 17 files changed, 1008 insertions(+), 170 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/dpll.c

-- 
2.39.0

