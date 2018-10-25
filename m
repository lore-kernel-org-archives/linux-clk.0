Return-Path: <SRS0=7v9C=NF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E70C46475
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 09:36:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B53A2082E
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 09:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjCpr+MD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B53A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbeJYSIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 14:08:09 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40294 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbeJYSII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 14:08:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id d2-v6so8552632wro.7
        for <linux-clk@vger.kernel.org>; Thu, 25 Oct 2018 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=L3yOPiKnnDSVbWHjNCCawmdIYd0llXN182ss2W8PiR0=;
        b=bjCpr+MDbX0Bsi60CVvDSNLhIZsPFitWM8qe5hYZ0fvnymuuKqJuk2iujhaGV0+ySG
         AJuv88iB2pR0zsT4iN3on/0FwlYWUfdcAdc+nO0jIjQe46sevJ+qg+LYdUWdHX8m3jB+
         P4H12zHSKFy2j7sIAcuUs08SCeZBqYelh3U/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=L3yOPiKnnDSVbWHjNCCawmdIYd0llXN182ss2W8PiR0=;
        b=HB99MJRmriN7TOy5+n8zk3rJAB4ewINlSE5bVwrBoltuUGaJ+KCQAeq/ZvPSfNtTSg
         t35s0v2lIh8a34V0//PFsADYOPnl22qgFwC29z6FjQdS/trPVF79QoEmibPext4GDO9X
         SuCw1w8bE11UYjCkQVXJCjd/32We/9wM+DPzJwa/6igJq31mphKF4yLhqpERJ34Q9FzU
         TuxqbLo4YOYFM+dgwq8UlVF6KFcv+Uif/WpQNrOrcMXXIYPAep3QzPmrFnvIisJ70Zad
         zjPWiRge6yrNEbc8Xlu5qTUJZNmF6bCZi0FDIi9Y09hMeNW5ijOY4k3+l15pceMjWQqT
         uhxQ==
X-Gm-Message-State: AGRZ1gJIzGfh8TZH3SEPJQ9mRUuzFBjpbBiGyhRrHhPcuiIZyuLk9Qf8
        hoNGOopzEKRcVq9lS6WRKHhZ5w==
X-Google-Smtp-Source: AJdET5fUVcveOVd/aiEohqTPWTlJJTkc+c6aUywXFNZFJlVfxooZBqOwB38MXA0HTmf/CX9jXxZIVQ==
X-Received: by 2002:a5d:568b:: with SMTP id f11-v6mr1030993wrv.301.1540460170752;
        Thu, 25 Oct 2018 02:36:10 -0700 (PDT)
Received: from dell ([2.31.167.182])
        by smtp.gmail.com with ESMTPSA id s129-v6sm842687wmf.5.2018.10.25.02.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Oct 2018 02:36:09 -0700 (PDT)
Date:   Thu, 25 Oct 2018 10:36:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tony Xie <tony.xie@rock-chips.com>
Cc:     heiko@sntech.de, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: Re: [PATCH v5 2/5] regulator: rk808: add RK809 and RK817 support.
Message-ID: <20181025093607.GO4939@dell>
References: <1540294467-25813-1-git-send-email-tony.xie@rock-chips.com>
 <1540294467-25813-3-git-send-email-tony.xie@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1540294467-25813-3-git-send-email-tony.xie@rock-chips.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 23 Oct 2018, Tony Xie wrote:

>     Add support for the rk809 and rk817 regulator driver.
>     Their specifications are as follows：
>     1. The RK809 and RK809 consist of 5 DCDCs, 9 LDOs
>        and have the same registers for these components except dcdc5.
>     2. The dcdc5 is a boost dcdc for RK817 and is a buck for RK809.
>     3. The RK817 has one switch but The Rk809 has two.
> 
>     The output voltages are configurable and are meant to supply power
>     to the main processor and other components.
> 
> Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
> ---
>  drivers/regulator/Kconfig           |   4 +-
>  drivers/regulator/rk808-regulator.c | 657 ++++++++++++++++++++++++++++++++++--

>  include/linux/mfd/rk808.h           |   3 +

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
