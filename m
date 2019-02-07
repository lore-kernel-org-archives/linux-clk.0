Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A20C282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 07:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 984282081B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 07:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsmqsGP8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfBGHuR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 02:50:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40875 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfBGHuR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 02:50:17 -0500
Received: by mail-wm1-f67.google.com with SMTP id q21so5546875wmc.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Feb 2019 23:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mKEu9O1n6B6PRYxAJTgnoP1xDI5OxjIQtAFWlZuuxZE=;
        b=gsmqsGP8OUW0BLrE5sLONvJsFa8P60EigPscEMSNTRlvZueTUlMlXkox3KRywqpXK8
         t7DQZPBYRKRzAYSGFSjpR6wrPE+1yfI8dT5H7G/jrIvoUKZJxpMBT9byATbWZ/rV8IsD
         8lBIfircshq50yqtEy6krph/Ts/opaK9kOQFEodoJz7oWpXyeJsjRh0V/+49I0dfTQuA
         Kr4rnSTNdUpHUDIeUNEQDAMVfa9X+FhmzfHvA+S1jfYSDJjBR/FlEYTuKOQPNpFKlxuU
         RbHsWn2FcPdeTyiHXONzrkY/PjWWERcZVi1e7K/o330b+SqD7QnoS7OKCzDR2ndo0jQg
         C7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mKEu9O1n6B6PRYxAJTgnoP1xDI5OxjIQtAFWlZuuxZE=;
        b=qC1sSypyjF4+eFlqjgG5BwpXY89iTCRme0HJN0wDml6ke4D+1Aox23narug+DSzDMv
         PuOh/poVI0GjntyzU0HrHfFrCcdBoAAo24rXMYxpVitQIZNxfY1phtB9SXXPY0UzrWzg
         5Evk2slCVYN22JZIvgLlZp9z0todlYlp8UF9ofL59SCBab41dZwTl7Q3C9Nq+NYtvNoK
         j+uNn/bSLKo0BolQGoBSM9IdIGqOJrMi6oyCmrACDwIqVMSPGpIpCaFUhT9yHtE0NdYh
         fggptSFQsjy5ZAdiQ6m1CcoDPhubVYlven3FUcu4KHqzLZ6T38XGaaotZxFBo05O3h9z
         bKXg==
X-Gm-Message-State: AHQUAubtZbbq2iWS/Dbh3RcDSkHTSBCKiVZRMdKF/qBh+wXizjq3/ooN
        0Dmz98h8BPYOzC8TJBJn3iXsDA==
X-Google-Smtp-Source: AHgI3IZvnh1zPRE0209V7wjkHJgy2lfGEDslcKMHexYDyDqjR1vvO990im61C9BR3l5NcRcogfBaSg==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr6048970wmg.32.1549525814537;
        Wed, 06 Feb 2019 23:50:14 -0800 (PST)
Received: from dell ([2.27.35.171])
        by smtp.gmail.com with ESMTPSA id c129sm17062168wma.48.2019.02.06.23.50.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Feb 2019 23:50:13 -0800 (PST)
Date:   Thu, 7 Feb 2019 07:50:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 4/6] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Message-ID: <20190207075011.GC4672@dell>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
 <20190130114128.21083-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190130114128.21083-4-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Jan 2019, Charles Keepax wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board. Audio system topology,
> clocking and power can all be controlled through the Lochnagar
> controller chip, allowing the device under test to be used in
> a variety of possible use cases.
> 
> As the Lochnagar is a fairly complex device this MFD driver
> allows the drivers for the various features to be bound
> in. Initially clocking, regulator and pinctrl will be added as
> these are necessary to configure the system. But in time at least
> audio and voltage/current monitoring will also be added.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v6:
>  - Added a couple of register that will be needed by hardware
>    monitor patches that will be send in the near future.
> 
> Thanks,
> Charles
> 
>  MAINTAINERS                         |  17 ++
>  drivers/mfd/Kconfig                 |   8 +
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/lochnagar-i2c.c         | 398 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/lochnagar.h       |  55 +++++
>  include/linux/mfd/lochnagar1_regs.h | 157 ++++++++++++++
>  include/linux/mfd/lochnagar2_regs.h | 291 ++++++++++++++++++++++++++
>  7 files changed, 928 insertions(+)
>  create mode 100644 drivers/mfd/lochnagar-i2c.c
>  create mode 100644 include/linux/mfd/lochnagar.h
>  create mode 100644 include/linux/mfd/lochnagar1_regs.h
>  create mode 100644 include/linux/mfd/lochnagar2_regs.h

Looks quite suitable now.  Thanks for sticking with it.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
