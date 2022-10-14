Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1F4C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Oct 2022 09:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiJNJwd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Oct 2022 05:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJNJwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Oct 2022 05:52:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76DDED9AA
        for <linux-clk@vger.kernel.org>; Fri, 14 Oct 2022 02:52:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id 13so9358304ejn.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Oct 2022 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=299L7Zs/XJUb9u6JhyOpi3WgUrHdMmQAEsWR3uOjIYc=;
        b=JOTiuopG8km3XtuX5HfQFp6ORVzx7LLvrQ2isr87H2o5ZimMUKe+djV7os1u6GUxAP
         tSKR4RAfbO9EhFwI3uwa+u18qUlWC9nH2ssNu3hbQLb8mIJOLk3wL7WiyhA8kJSGWEyx
         hpvtalFBKFgSm6cbXN8Rl9q32sGNmoUv340a1u3xTJ6AqmYOvWFT7Ruacnf3Lr6Fav+0
         sT2/vAhaRTM1qmqtW6R7GsgGlA8MEIa2exqjVXqfq6uQviD/eXlsqgZ0SrCjNaNuHg7G
         Kd2hP4B5H6zkXVv2FzsaC7r8W5QRauYiVEtw8yC5jEkN0HogjFHHdsGibILaGmY6UZT6
         pm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=299L7Zs/XJUb9u6JhyOpi3WgUrHdMmQAEsWR3uOjIYc=;
        b=AptLEz0Ht7cHm3kHnuzY5BiG8z3laJfVfiiI309DwnLXVBfpTutMgNXEoQ1CiO350N
         W2F85wSSE6jFiQGKXFNAEgSh9UnAAIFyX6WIjJxDkwq6g3pN681oQhUZaZxW1+Ic+rhm
         RDhpYiuuzPXTUYewgUzZiAuUVEZqwNobm4uhY/x6oYeGP0YDqb5pZc55q+l4eQiyAd6t
         wbC4Tg0PgN9qvr+TdAPj96hjSsP6UutuuSsSOPbR0qlifx5a+ppapxK37LaGGDX9XmbS
         /bcS0jwaGZITF+YXS2r9GeLGu1100GpBTkwSI72nAjp3rUcdfIKkaqyp7QS0DQqxwj4a
         /olQ==
X-Gm-Message-State: ACrzQf3AmnofQjb1rJF9RS15H0rBAfbkm12/FWxlN7Xttth44AN0OuEr
        JzFumQzrtYZrG9qBKWVbttvrDQ==
X-Google-Smtp-Source: AMsMyM6e+X4YGgA/fu0UmpKGVoZyo9IBlfy1KHM0430kLf7hh912Jq/15taqlNOl5o46hecGERfePw==
X-Received: by 2002:a17:906:4fcd:b0:78d:8059:17c with SMTP id i13-20020a1709064fcd00b0078d8059017cmr3005758ejw.423.1665741142164;
        Fri, 14 Oct 2022 02:52:22 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0078b4801c40bsm1208101ejj.216.2022.10.14.02.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 02:52:21 -0700 (PDT)
Date:   Fri, 14 Oct 2022 11:52:20 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vadim Fedorenko <vfedorenko@novek.ru>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 1/6] dpll: Add DPLL framework base functions
Message-ID: <Y0kxVJn9EFylJiKK@nanopsycho>
References: <20221010011804.23716-2-vfedorenko@novek.ru>
 <Y0PjULbYQf1WbI9w@nanopsycho>
 <24d1d750-7fd0-44e2-318c-62f6a4a23ea5@novek.ru>
 <Y0UqFml6tEdFt0rj@nanopsycho>
 <Y0UtiBRcc8aBS4tD@nanopsycho>
 <ecf59dda-2d6a-2c56-668b-5377ae107439@novek.ru>
 <Y0ZiQbqQ+DsHinOf@nanopsycho>
 <9a3608cf-21bb-18b1-796a-7325a613b641@novek.ru>
 <Y0e2Zn4pbhPnKGQJ@nanopsycho>
 <20221013081725.501b0f58@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013081725.501b0f58@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Oct 13, 2022 at 05:17:25PM CEST, kuba@kernel.org wrote:
>On Thu, 13 Oct 2022 08:55:34 +0200 Jiri Pirko wrote:
>>> AFAIU, some mux devices are not smart enough to make a decision suitable for
>>> autoselect for the pins they have. In this case the autoselect process is
>>> done in the DPLL device, which selects mux and not the pin directly. At the
>>> same time there could be muxes that are smart enough to make a decision, and
>>> it will be autoselect on top of autoselect (and several more layers) and it
>>> doesn't sound great to me. I believe Arkadiusz will explain the mux a bit
>>> better.  
>> 
>> From what you write in this reply, I have a feeling that these details
>> are not really interesting for user to see. So I tend to lean forward to
>> abstract this out and leave the details to HW/FW/driver.
>
>Are you saying we don't need to model MUXes?  Topology of the signals
>imposes restrictions on the supported configuration, it's not something
>you can "abstract out in the FW".
>
>My thinking was we can let the user ignore it and have the core figure
>out the configuration of the muxes if users asks for a pin behind a mux.
>But it's better if the mux is visible so that it's clear which signals
>can't be selected simultaneously. (IIRC Arkadiusz may have even had
>muxes shared between DPLLs :S)

Yeah, that sounds fine. My point was, the user does not have to know the
details and muxes could be abstracted out in kernel and below.

Not sure why the mux would need to be visible to user. It it needs to,
sure, lets model it. I have no strong opinion here.


>
>Anyway, I may just be confused about the state of the series because
>most of the points you brought up were already discussed. I guess you
>were right that off-list reviews are a bad idea :(

Yep :/ Let's please move it here to stop the mess.
