Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7193FC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 14:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4409B2083D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 14:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="puQOKMZ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfCSOr0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 10:47:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53451 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbfCSOrV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 10:47:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id e74so17065920wmg.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YzjCpRmDA9wR1xnyZxcnZ23puQ+O+dahoaacjFD0+qo=;
        b=puQOKMZ0IH4UlmFsa1rH5QgDMBI84tDQy/feHxhesTqYUVtnxCXbbiBawDzEGXCtWH
         meiT7fs8tFknGtl65jxRSiYPvmdhOmdyMipizwMkoblW6v6JbE6vimFXsxyeroRQX8ri
         M576S2t1Nv1o/3OoAYiNtvSaCyoplpoo4X+HM3NrZy0x0IFzxBcMNbKZ4MlIvjx5iz2n
         KAZVE9zaOR3SvA+HbZRvOc64v2vwKadrIYVZno+azCjRYlSLgkq9nk/9DUKs4sQW8rhR
         NywGtkS7kvLiCpVJd836howA4pbwXeNZiHokrMVxgjs0rLekFBuISHbmy/VheBAGLJ8E
         Tp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YzjCpRmDA9wR1xnyZxcnZ23puQ+O+dahoaacjFD0+qo=;
        b=hBE90O+1LxC/jflooe4HAjOoGZKwlt02nFPZyw8IJtojYoB4fZFeIzyoHT+Gq+Tjq4
         9zxIBSwvSkUSV1FqCFDCaJoQCvHZiLjuKjL2bzdcP9+1VqFztdUOwu0jrOc1FlXT1/NN
         F2SY6RcFj54cjFuMeL+N7AorpViuIsL+aOrog+yXsgjJ1eqAqz6B2NYlzq95Zz/EMOks
         ENKxQE43AHN/vjE8gh2sOyOWAunpm2pdBnwwKH+QvGb16q1aNuziQIqXNATfx3LXN4C1
         WCoTKljP74zw+DOPQCeMJbA9daC0RZ0CcbaUPeGuqioI5PRZHyidMwkSSCOO7rTfOiR3
         LZAw==
X-Gm-Message-State: APjAAAXPFgOBKfp++vSE+mYnJQDr/l3pPE9c0Nd/yc0/597r8Wy3AYcE
        +nyrF8g7lgz4VJRl9EvUTY07YA==
X-Google-Smtp-Source: APXvYqxcNtjhQ0z3cetH6v1VZ6VuFLNCn9gYpf9j1i7ObgC46aGf6b75xKQFHEKb3Sy18IszK26IzA==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr3895176wmj.108.1553006839764;
        Tue, 19 Mar 2019 07:47:19 -0700 (PDT)
Received: from dell ([2.31.167.140])
        by smtp.gmail.com with ESMTPSA id z20sm2812630wma.48.2019.03.19.07.47.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 07:47:18 -0700 (PDT)
Date:   Tue, 19 Mar 2019 14:47:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc:     Tony Xie <tony.xie@rock-chips.com>, broonie@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: Re: [PATCH v7 0/6] support a new type of PMIC,including two
 chips(rk817 and rk809)
Message-ID: <20190319144717.GG4731@dell>
References: <20190102102002.29245-1-tony.xie@rock-chips.com>
 <36121846.smLYK4jT4q@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36121846.smLYK4jT4q@diego>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 19 Mar 2019, Heiko Stübner wrote:
> Am Mittwoch, 2. Januar 2019, 11:19:56 CET schrieb Tony Xie:
> > Most of functions and registers of the rk817 and rk808 are the same,
> > so they can share allmost all codes.
> 
> do you have this series on your radar somewhere or should Tony
> resend the series? As it looks like it fell through the cracks somehow.

It wasn't, but it is now, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
