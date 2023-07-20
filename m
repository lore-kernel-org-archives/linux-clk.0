Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0748BEB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 13:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjGTNkG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 09:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjGTNkF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 09:40:05 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FCD1989
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 06:40:03 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so6373695e9.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1689860402; x=1690465202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHraClfOgsQuDEhG7LoVlxHfgn7n1hhxIrVLeOTgwQI=;
        b=k5wKAhiGlzWIXosKplzW4sqg5tZMDOzxl2TOzFAQ5iThIPcwzGmctCC7iA7j1csw2K
         NX3MYhkxWPn80zVWrMuGZqM4tQI0oGaMCQAVgrqRsuLIUwYyvcfbeROH/2KZel21hrv5
         wg60emvmeqxatlY5EytYM/ESQrX1maE28NvZAMbxxPpNPv7iV8jf7Xm5mCyYuyqqmbZr
         GblTK7v4DC5ldRoh6z3FsbUZrHni9Qok8m7GGvfPbBnlJnlRvXUhwgwCgUrYsevxDbC4
         blYWPIT4S7JrJJ9UfxB2NtGL0JuHsIAhZ5psEm7bYho1CbvF3uhVsnhMdKWaGWNAmHc0
         3TaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860402; x=1690465202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHraClfOgsQuDEhG7LoVlxHfgn7n1hhxIrVLeOTgwQI=;
        b=N88iOCzGPIU/fV189gi/GLgniXwPfCwqWOkw1KSu0988D+ThVBOur5SSUUR5fSvY/s
         myIY1OJfyo7xlNO5zN5v6YdqYLYU9VqYPfW0Z/+nA6UalQCFhLrMnGBEbuWjnUS65XyT
         4WfB1SRtfD/DFbP6bGVVDTYOe3UNC7GTSX4LGS4LR2Exq9msAxtr6ENARHSzcwylkHeP
         DPQCsoEzIyi/aKu8KAX4ENa2V03SQy7e3JiMTGNna7aM8sA5GVJaGw0PSgqMQoRwH3d5
         TkTojB6kRvuxyeq+kHXH6Ez88UWq2T+L0zY58MDTxSQj+11sh7yM+07rD4Va6u33lC86
         oUVw==
X-Gm-Message-State: ABy/qLbu6Bif7OXl6fO81XlYJLPxodRoj9GWIbJZAp86vY3Fj/PUh2up
        0UXuN3pNyUzgR8/vSGaoEbJmiN8xlcNN+fwuA4k=
X-Google-Smtp-Source: APBJJlFiHBXdXjwOaIIZ2mfFscw5kZzLqyBJzDNh5WGxyszNqzVr4ptz4kTLmXwdVR3/Au0G6TW2nA==
X-Received: by 2002:a7b:c4d1:0:b0:3fb:ab7d:ad95 with SMTP id g17-20020a7bc4d1000000b003fbab7dad95mr1826530wmk.4.1689860401802;
        Thu, 20 Jul 2023 06:40:01 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbd597bccesm3940534wmd.41.2023.07.20.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 06:40:01 -0700 (PDT)
Date:   Thu, 20 Jul 2023 15:40:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH net-next 01/11] tools: ynl-gen: fix enum index in
 _decode_enum(..)
Message-ID: <ZLk5MMjChnRFNU49@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-2-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720091903.297066-2-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Jul 20, 2023 at 11:18:53AM CEST, vadim.fedorenko@linux.dev wrote:
>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>
>Remove wrong index adjustement, which is leftover from adding

s/adjustement/adjustment/


>support for sparse enums.
>enum.entries_by_val() function shall not subtract the start-value, as
>it is indexed with real enum value.
>
>Fixes: c311aaa74ca1 ("tools: ynl: fix enum-as-flags in the generic CLI")
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
