Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71935EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 05:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbjGNF22 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjGNF20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 01:28:26 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEDE19B4
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 22:28:25 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-cae0ad435b6so1475885276.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 22:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1689312504; x=1691904504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IFEjZXU3eSdRPNIXfyXM5z+iMQpziRAe96oQZyCPSwU=;
        b=PIcINIE7B3KCORiu+jwYAfyerDDtgsIlXu3t6O8YLprAwl7lcdjrGfRggkgqFK5TFw
         z2o4oLDtF8jhxZcU8+YMyFUwtei8PBoBXl9B1AmQakS551FlD24ZxV9czElWGwbZeCiF
         olzxTqQUr2AAbakkmwYbfmRIg5QLSrnDm1aiESeM2rv1L9AJNLqRuPFP6IQ8zZQdtanD
         uASvbtd9m1rQbWVSszCorK6Kyoz5uj1VqJ58AcCBEqoN+mnSFDxngTxI5ab4+/fnU48M
         DCwl7F67wv043k50515erRto+rn2TZcy5swlftLPmuwwSXWHx5Yv7s2Cq+asAaRtnkap
         7Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689312504; x=1691904504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFEjZXU3eSdRPNIXfyXM5z+iMQpziRAe96oQZyCPSwU=;
        b=bCnj+apgdGBDn+e78NPHp+TZA1JLFqppgo5coZOEiwjinNfI2oBij57K8dp9l/FkJG
         yTCDBvIYKfaU/BhJdiTISBloR5vTe0o/t+wthVVVvWptl3eRW3eLU17lD81AEyYmN8Vo
         4e06QS/XKFwl9narU6SkAv0mUCCWIyvavlb5TYDs5znwbHRSDfEaGqhXjcQYOA4D60+K
         951fG3Da9nR+QqMFCR/cQq2apZwkLDAqvH/OvUbCNqUiS+8crsQgz0PL5eGCiMDIdzNh
         wfJxsCnzCaXXIFyMmHBui0Mx2JvMn3v1FME+NjNnZmJw3EzCDYSpzKDElTxZTs9QDGHA
         pQ7A==
X-Gm-Message-State: ABy/qLaqx/IEGEsU+ah39ZKBjup4VIR2WYZYT7xcqehE8ItpMH1u9/aH
        U3yCBxdKIZUU4Er9pU6Fek3NSokJk4OHFuUesbdVgA==
X-Google-Smtp-Source: APBJJlEaiU/h7ySqTpivDQRsTd9uubAuwpwPzJ8MHaA57MOI8Wnpw21sa/tg3EBhmE4guSsrlJbZB3RuiOrWwKSQ4bE=
X-Received: by 2002:a25:d0d:0:b0:c61:e44d:c08e with SMTP id
 13-20020a250d0d000000b00c61e44dc08emr2990126ybn.19.1689312504662; Thu, 13 Jul
 2023 22:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230403193250.108693-1-sebastian.reichel@collabora.com>
 <20230403193250.108693-2-sebastian.reichel@collabora.com> <CA+VMnFz4USPcXmQMyUB9n5EVmvQrJARDvnpO7iBrXZ8q2xcyAA@mail.gmail.com>
 <20230713193812.px7q4sdfdppuywsg@mercury.elektranox.org> <20230714091150883537486@rock-chips.com>
In-Reply-To: <20230714091150883537486@rock-chips.com>
From:   Jagan Teki <jagan@edgeble.ai>
Date:   Fri, 14 Jul 2023 10:58:13 +0530
Message-ID: <CA+VMnFy0Uix64PxLECFK9D8KBF1o34yo3L1t1zQrhV+N2Dipig@mail.gmail.com>
Subject: Re: Re: [PATCHv2 1/2] clk: rockchip: rk3588: make gate linked clocks
 ignore unused
To:     "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        heiko <heiko@sntech.de>,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        pgwipeout <pgwipeout@gmail.com>,
        "finley.xiao" <finley.xiao@rock-chips.com>,
        mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel <kernel@collabora.com>,
        Vincent Legoll <vincent.legoll@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, 14 Jul 2023 at 06:44, zhangqing@rock-chips.com
<zhangqing@rock-chips.com> wrote:
>
> Hi Sebastian,
>
> The clock needs to rely on two parent clocks, which is required by design.Refer to the attachment for details.
> Our internal branch is implemented using clk-link.c. Recently, I will implement the real GATE_LINK API according to upstream, without modifying DT.

Do you have a solution to share or any pointers? I tried to use
clk-link by dropping GATE_LINK from clk-rk3588.c however the issue
remains still as double-parenting is unsupportive. Did you add
double-parenting to the mainline clk tree? Other than that, I have
used existing clk and try to attach the link clock in conventional
clock way like

        vo1_grf: syscon@fd5a8000 {
                compatible = "rockchip,rk3588-vo-grf", "syscon";
                reg = <0x0 0xfd5a8000 0x0 0x100>;
                clocks = <&cru PCLK_VO1GRF>;
        };

This also seems similar issue.

Thanks,
Jagan.
