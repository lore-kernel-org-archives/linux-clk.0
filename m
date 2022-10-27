Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FF5FA3742
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 17:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbiJ0RKB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 13:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbiJ0RJ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 13:09:59 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5D023148
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 10:09:57 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id c8so1891911qvn.10
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0CzUU78ASYJPEUJmqoJ7WQR9Oo/CD1rQ+thdM+m9juo=;
        b=jm66h1HuzuOM0Wb9hcWPtflQw/r3URd9dOkdnFd8+GNhghDTClw5h6m7eEQgN5EV8G
         n0+IuQ8NjFjT/KcIROvNwHW1t49OsSVRWy6BeiPzn7CcFdRp+9Ajluapm5C/rApYy77W
         lTpFHBdtbZWFQC+n68vjPmzobsuybSfgcyj2kFh+AqMzC8rT5Q0gPdSOXiLsc+ZW/kkE
         d/7Tep0HmZgXmvLz0qc155m/rELoJQ9n0XZNyd8llzYP8njiL4EVLbJUWrTejQNV3NlX
         AQCqtl1KAUqJC9orHYBL0ko4G7yPQyoagzhtqwgt7fGjZdYqOIb+JWL+HnxGvAsmwl/7
         KC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CzUU78ASYJPEUJmqoJ7WQR9Oo/CD1rQ+thdM+m9juo=;
        b=JWrixM9pVP1uhlpDovWz7pJJ9JueTeanGWPmB/3Fzawj4OKaBC2uFvmc7lUeoy/d3x
         RoTrb7Pjnjs3sSvK8qsRtyVTlntWB/85ntzsph5ojGtOs5OlLaIXNERFRQfSm6koLJ4x
         bIWNN5aj/gli1WpRrWzn2+oYPZm1CBqfO8YveQ/e8xXYZC7OVhH7unutV6/JgzsJrarn
         VT9/S34Te/nTwJCXsbG5PmfR9vX1S6J9sm64MYIZIqsu5Ir0lbSUWWlD9zYTnO78BicK
         8EwlPLeDEtT45mt+U01iormlhqnpF8efUq+ggohq8hNQ3oLBQFSWkHIhPaG/zhtZJwKu
         U9ZQ==
X-Gm-Message-State: ACrzQf0yc1x50AEvZR0XFLj9vK82G7m8uS/gUnLGEp2ZcoSR0o8giUeM
        /OSC6w0XQ2ArHYfKVO/LQbOl7eJoOf+ijw==
X-Google-Smtp-Source: AMsMyM4WYrl4qRZ7IaBNZv2E+86nOo+HFR3CsuGO84JFn7hrxVAjCddUChKYzAzGgLItV8HqJNQBFg==
X-Received: by 2002:ad4:5be6:0:b0:4b3:ff39:7ad4 with SMTP id k6-20020ad45be6000000b004b3ff397ad4mr42055384qvc.126.1666890596620;
        Thu, 27 Oct 2022 10:09:56 -0700 (PDT)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id m8-20020a05620a24c800b006ce515196a7sm1330838qkn.8.2022.10.27.10.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:09:56 -0700 (PDT)
Date:   Thu, 27 Oct 2022 13:09:55 -0400
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Repair grave increment error
Message-ID: <20221027170955.GA67412@maple.netwinder.org>
References: <20221027163057.37257-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221027163057.37257-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 27, 2022 at 06:30:57PM +0200, Marek Vasut wrote:
>If condition (clkspec.np != pd->dev.of_node) is true, then the
>driver ends up in endless loop, forever, locking up the machine.
>
>Signed-off-by: Marek Vasut <marex@denx.de>
>---
>Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>Cc: Phil Edworthy <phil.edworthy@renesas.com>
>Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
>---
> drivers/clk/renesas/r9a06g032-clocks.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Ralph Siemsen <ralph.siemsen@linaro.org>

That's a nice one!

Regards,
-Ralph
