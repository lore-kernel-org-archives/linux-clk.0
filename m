Return-Path: <SRS0=oKF9=6S=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE5C3A5A9
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F10F9206D7
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RjPsBETL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgEDIlv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 May 2020 04:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727824AbgEDIlv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 May 2020 04:41:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD150C061A0E
        for <linux-clk@vger.kernel.org>; Mon,  4 May 2020 01:41:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so19841668wrm.13
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2020 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VM7VC+aZxRIIjdCBOQHvIXwbqHzjf4bIXyafLz2UVVw=;
        b=RjPsBETLO2dNrY+Auu4dgqM9exSWQtO1FAqtcTqCzyYkoPRMr7xdWcL+GI9NST02AK
         cHSoATJXpm5e2y7/QNadZUhNWuhOInhSkxjieQ4bSX4Q4RxHtHA6/lNm2CkXcYDqkXLO
         RdP/Y0rQNGRM0dZdAGhIE6nw9MwzIH3+9Vx6gSZ81yiYIH+Yt/uJyqUBDMZlj6L8Wd6G
         zP1h5xerEBmVd69CDoZuYIpgmk5v4ydnGCJq6IyN/2nWBAqEWOooWzQZ+Vj4EnBK8LZN
         fN+KqzuMSVNh1hMxU7Gw5NMEJNE0Nm1vEE0dOIUN91boAbqODzPziN0ZvFsd1jARsv61
         3KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VM7VC+aZxRIIjdCBOQHvIXwbqHzjf4bIXyafLz2UVVw=;
        b=iDWxv+N6pKNBtDM0+w1Qk+gs1aXLe7exsCQiIh7T21KjNLBDWYTngqYI2/dbL8muZf
         qjDTHit44RaANlZOLzyCbyRR2zwHU1tk1g4VV+hOaKSXPpCrkOsKbSCBVIARVwkK6jwv
         +QSioMaqlvMdAZCGYW/t/jmZHki1N/uFE6QYx5ckg+SoB9romkcyhpXJQOc1lcfAPcV+
         L9Pz0lzVfiZn/IMdAVrnNUsdP3IPBkprOZdYjgOMha0sMQeioHc2QjFAaFQan7j44bs9
         tN+eOAEs3iMoJczBl9WyIcEG6TAmcHkCSz7+DRnMaNzGchpNKWIkA6pXVtHq82sb7704
         CN+Q==
X-Gm-Message-State: AGi0PuZXqCQFYQdDxNC8Pq+84ZXrwOWhGH9p6gnACTRHG5Sm02IWMl/t
        XdZflooxFuAHLr/+P/jzRALmHQ==
X-Google-Smtp-Source: APiQypI+t6WMQSWVXziEfHyZzUtFtpAZcKAwAAx++OmvHlF7x5SKQ4lqJsjgLXdlYVbLIoovy6n+dw==
X-Received: by 2002:a5d:4b0a:: with SMTP id v10mr19482111wrq.342.1588581709480;
        Mon, 04 May 2020 01:41:49 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id q14sm6560533wrc.66.2020.05.04.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:41:48 -0700 (PDT)
Date:   Mon, 4 May 2020 09:41:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 09/16] mfd: vexpress-sysreg: Drop unused syscon child
 devices
Message-ID: <20200504084147.GG298816@dell>
References: <20200429205825.10604-1-robh@kernel.org>
 <20200429205825.10604-10-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429205825.10604-10-robh@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 29 Apr 2020, Rob Herring wrote:

> The "sys_id", "sys_misc" and "sys_procid" devices don't have a user
> anywhere in the tree and do nothing more than create a syscon regmap for
> a single register or 2. That's an overkill for creating child devices.
> Let's just remove them.
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Note that the other GPIO child devices could probably be removed and
> added to the bgpio driver. Unfortunately, the model dts files were
> never updated 6 years ago. Not sure if the models really need LEDs...
> 
> v2:
>  - Add missing commmit message
> ---
>  drivers/mfd/vexpress-sysreg.c | 36 -----------------------------------
>  1 file changed, 36 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
