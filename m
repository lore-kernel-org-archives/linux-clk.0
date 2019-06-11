Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D730DC4321A
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA09320673
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="phjikhGj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbfFKMdJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 08:33:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50909 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389619AbfFKMdJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 08:33:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id c66so2770629wmf.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2019 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uTg/7JRU8sUAP9sX9B8uDa8ujHWb6WL/wVRCRAUyFS4=;
        b=phjikhGjKSi4pb2wHWUdw0OzLFiLWsxwJ/Sh2Wee9fPwhY3BtTzC6A9p3w6O20cWMh
         SGM8XSkFjeZmOGEhAJfgjEQikYS7VHtOP3QRqILl3Y+QQdCXqSPdNOzg1dh/rzzz7K2J
         CShcOxGi6/K3xTD6trwGA1HwXRukCQif9pi7gsxkMnP66bFM9FOEtaQS1CM8AxUKNn+2
         BugwkCJM2E5awXgKBqnZusf232XWe5RH2EgJqsUNKRNPwP5aYBC0FEasVPkYoQ7Uf0EO
         KslY2NHRsNu78ZdJ/P2Lo+5TrguVQE7xxGSg7ycI45TXJ7Zp1zKgWkl7+xJ0sD1D/sT3
         8oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uTg/7JRU8sUAP9sX9B8uDa8ujHWb6WL/wVRCRAUyFS4=;
        b=IuH6CTmHubIS7Lmznf8HWVKM1GDeONerVWzCNfmijZn+to5xSeoxZddiJ0vkjGGqKv
         fxBuUhoamO4247ndR7tOF0fvd4EsnqlK28aKD2j40xy4bXlS6q0JeFYG3ODPRBaYQEl9
         v667fxznEtB41ZIkeN6RQs8DmrFeVgboA7p9pW4N8y/6TRFI7LKpkUQqQ/tznpjxJOkm
         smkaeeSVExW1TJBxSxULOkhQuSy9cdJIAbDlS5RyIsHVGmUGfSMbJw2uRpi9gqGVLrmP
         QzAlEMZdf7AyRt7zoC5tkUjE+SDFG7t8+zMpRk91YL6pj40VFe6y9AxeZaDHwUdZ7JRK
         zalA==
X-Gm-Message-State: APjAAAWNFTqP0IEMVbMgwll0BbcUnJYJe9HUceu+gGgpL29abnNwBDsX
        m/BhfJ+M87pb3EfbJLZSwSBZJg==
X-Google-Smtp-Source: APXvYqxLwUw5CKKBFj9Ct1lKarfejnmIdjY4bbArmlPVwr1dFEDnfL4CAH4jWhGtSv1JsgGBR6OCIw==
X-Received: by 2002:a1c:9906:: with SMTP id b6mr17472433wme.117.1560256387633;
        Tue, 11 Jun 2019 05:33:07 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n4sm2205520wmk.41.2019.06.11.05.33.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 05:33:07 -0700 (PDT)
Message-ID: <f19341ab80bcba29d25c3711647d6ff7c96628ee.camel@baylibre.com>
Subject: Re: [PATCH v2 0/3] clk: meson: add support for Amlogic G12B
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 11 Jun 2019 14:33:06 +0200
In-Reply-To: <20190528080758.17079-1-narmstrong@baylibre.com>
References: <20190528080758.17079-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2019-05-28 at 10:07 +0200, Neil Armstrong wrote:
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture.
> G12B clock tree is very close, the main differences are :
> - SYS_PLL is used for the second cluster (otherwise used fir the first on G12a)
> - SYS_PLL1 is used for the first cluster (instead of SYS_PLL on G12a)
> - A duplicate CPU tree is added for the second cluster
> - G12B has additional clocks like for CSI an other components, not handled yet
> 
> Dependencies :
> - Patch 1, 3 : None
> - Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [1]
> 
> This patchset is a spinoff of the v2 Odroid-N2 megapatchset at [2]
> 
> Changes since v1 at [3]:
> - Added the cpub_clk div2..8 and replaces the ahb/atb/axi/trace divs by muxes
> - Added the CLK_GATE_SET_TO_DISABLE flag to ahb/atb/axi/trace gates
> - Fixed all the G12A typos
> - Added martin's reviewed by on patch 1
> 
> Changes since original patchset :
> - Added missing sys1_pll div16, cpub div16 and cpub atb/axi/ahb/trace clocks
> - Rewrote "This patch .." in commit messages
> 
> [1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
> [2] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
> [3] https://lkml.kernel.org/r/20190521150130.31684-1-narmstrong@baylibre.com
> 
> Neil Armstrong (3):
>   dt-bindings: clk: meson: add g12b periph clock controller bindings
>   clk: meson: g12a: Add support for G12B CPUB clocks
>   clk: meson: g12a: mark fclk_div3 as critical
> 
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  drivers/clk/meson/g12a.c                      | 772 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  40 +-
>  3 files changed, 812 insertions(+), 1 deletion(-)
> 

Applied
Thx

