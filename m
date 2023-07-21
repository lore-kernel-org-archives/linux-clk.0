Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243A2EB64DD
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 07:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjGUHsf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 03:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjGUHse (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 03:48:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6793C19A1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 00:48:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so2581254e87.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1689925711; x=1690530511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gp5//cguHLYjw2SPD+mbFWg9HVuK6b37FH3cK//qGJg=;
        b=hLtlrdlqzqF1rmhouHJVIM2/ulU5yZ6OhVUodGV3dB5sCGxEi03qj8IVodoF3VgjdE
         xT9OOucItuQ02RdRTF1Nr4yjGteCB8TfFGZ4pgJLwGtw1QI20sM+qsEC83h0dkhtSKvF
         AWJj1hmtJ8q36jijCclAjenQOU7/DkMM7XApHLQ32PCHCGOox4y8l4yCoNlA8MGOK35R
         +ztb4wj9z1+JOe8edDF7s3ss/MFjidhe9ieYwM2IfvClWJT/obF+9tOoK7TjlRYe6LU4
         kTy2uRmx9yCLA714T/i/xPpFtC8ELXM0Xbs5o8EkAhozds1zMemX5V5GB8l8SYEVxP+1
         qdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925711; x=1690530511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp5//cguHLYjw2SPD+mbFWg9HVuK6b37FH3cK//qGJg=;
        b=eAVzNAlhp9npbqjQDF8Kt08fvNVS/+NdCLEUoLLG1/mUx2q/16qfgTP6JaRjGnYOXB
         vOQLznqd4CY3R0GGizlruE5YMi4SDJCVZ7iUmNi0Tr+IPy+Mmo3khCHjlPSARAZ5HmKw
         /y4asUsJ20ZZ9+Zbi6PyLJH328ZXvFim1TOUM2cokzKz0ZmCx9HH1lxNV9lSXnpTNu4l
         Hriehqj9XWbbkll0ouMMmBoxA0qdOjqzcLoHK6g3v1xO8C3IHu0CiBwuIqiToLeIYzTj
         Wv9Lx6oy3f2b3TA5871FyGSi32af+ZzdcTwJ6L3RYYKZnDI+cmiN4OS5j+bgy4QfoKTf
         MBoA==
X-Gm-Message-State: ABy/qLZ49tkzthc+SYaS3F+ceveL1tJL3/JmITniJmjNPA91hlBOHCJx
        YVY9sOdfgxhdcBcZFuH/j5I36w==
X-Google-Smtp-Source: APBJJlFOxnjBRmg+6z6oUJTZxyE5vxzlIUhVGdh6m0Y3/2JEb2QyN+bCyEfgV1Jg78je61sknpUG+w==
X-Received: by 2002:a05:6512:2252:b0:4f8:6d54:72f9 with SMTP id i18-20020a056512225200b004f86d5472f9mr1039485lfu.61.1689925711564;
        Fri, 21 Jul 2023 00:48:31 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id 15-20020a05600c028f00b003fc06169ab3sm5598995wmk.20.2023.07.21.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:48:31 -0700 (PDT)
Date:   Fri, 21 Jul 2023 09:48:29 +0200
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
Subject: Re: [PATCH net-next 00/11] Create common DPLL configuration API
Message-ID: <ZLo4TfaDKlgBVD2N@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Jul 20, 2023 at 11:18:52AM CEST, vadim.fedorenko@linux.dev wrote:

>v8 RFC -> v0:

Just to avoid future confusion: In netdev, the count goes from 1.
So this is v1. Next submission will be v2.
