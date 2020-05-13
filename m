Return-Path: <SRS0=ZViX=63=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C897C2D0F8
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 04:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55DDB206F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 04:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VZXeZxeS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgEMEtz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 May 2020 00:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725931AbgEMEty (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 May 2020 00:49:54 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EB8C061A0E
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2020 21:49:54 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id n11so14673781ilj.4
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2020 21:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7avQntptbSyfVNcjEHEawGHu0ZA5SFwdwGmNt7UNNE4=;
        b=VZXeZxeSkNdl8aWyx4AKhpe+/+yWw4K1AFsNSfSLvZIPTWB9V3k7ygHClGGUvzus2W
         8Kjj1xRmgufSy5p3p5oBvoY8dwp+Ev2OJRUgQQo0Q55Br3c4Y24CxHrlhnISy8mHK51X
         xWjqOBLcJsvmosULWYiVc0Zjoq/UJildgMh+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7avQntptbSyfVNcjEHEawGHu0ZA5SFwdwGmNt7UNNE4=;
        b=dv9fL0h5jhSe6nsYi6fwJjnV1xJlONdHTYCN0suwPFf9uCDDrlFQHNA5gNCzAmiKEL
         HgMaZGFp1G8At/yzvCBGjWe6A0Mt6jc1CraExDHquh+weKVdvY7I0EYO/W4K2NC/+q/K
         S3qIqVHF1kGPYnKIbCnQCAHhtZY4rstYvuoNsrgGuagmhlb8knolfFcrhe0yC5hh9Nxd
         1xQzSPeJXbEZfNrixMUOBnsF5fJ5ot9BTvf+Qwu0E2b+FOlEDPYGfsUQyNksqz+SAx8i
         q6j7f6Lz9FW5mzcKyl9jS/bxtNew59qu15sCCHL1HhC/smXbL+60z/yrv/T2zABmXyNM
         98IA==
X-Gm-Message-State: AGi0PuaisOiXL2LG1hOlRTmHTKED2F2vq1EhHTD9PbOwV3u0dLu/xXBZ
        23nqQc7BqMRaFk97XYSsTc6y0aXOWWuK3RKH+nRiAA==
X-Google-Smtp-Source: APiQypLW4XrYA+YX10To7LSSFdH/pr6GwbWp+XKOzx9CNfSJM6J+CCr0iqX9Ux4YXkSF3w5tC6rtWCABka5M+lXvzeY=
X-Received: by 2002:a92:1949:: with SMTP id e9mr25726680ilm.106.1589345393815;
 Tue, 12 May 2020 21:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200401201736.2980433-1-enric.balletbo@collabora.com>
In-Reply-To: <20200401201736.2980433-1-enric.balletbo@collabora.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 13 May 2020 12:49:27 +0800
Message-ID: <CAJMQK-hsneV5FdyTHBvLV4pxfGWC=c8mLsH_c5KSq2LsCLGEww@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] soc: mediatek: Enable mmsys driver by default if
 Mediatek arch is selected
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, CK Hu <ck.hu@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        ulrich.hecht+renesas@gmail.com,
        lkml <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>, matthias.bgg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 2, 2020 at 4:17 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The mmsys driver supports only MT8173 device for now, but like other system
> controllers is an important piece for other Mediatek devices. Actually
> it depends on the mt8173 clock specific driver but that dependency is
> not real as it can build without the clock driver. Instead of depends on
> a specific model, make the driver depends on the generic ARCH_MEDIATEK and
> enable by default so other Mediatek devices can start using it without
> flood the Kconfig.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
