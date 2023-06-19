Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B00BEB64DB
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 09:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjFSJ6C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjFSJ5O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 05:57:14 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC19E50
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:57:11 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f8ff5fe50aso15706775e9.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168630; x=1689760630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TitqDCAZ4k0kUmwWL2ar9UbakjN8g88PZ4eJsoBtptM=;
        b=ggdlD1Fc1EqBybvqJQe0fukI25JfKzFgSzXYqpuHcFK2D2CV0OmeGSi3UGqqlN+6kY
         q8lOJmPNeOM7JStY4ycQm/M4KPWrhqGwph34t1KE533DO428a7tcfJdU5EXJTBRbNUwa
         vQtFztAJkgIXXy3480T605ckmV2Z3xbCl2KzRMyVVZRbXv7gjMnnpyhnVwY5zAhq0cvW
         XaozgORjDTDEVBElEeXi94y2aQoRH6zgp1YZBxIRU865tMb22AP7PX1CCVDpgJJLYrjK
         HhVAt4Kl8ofO1SIWto2V+HJ2uNfhKP6yDlLEy/OaCFYIXF4N4qqSSNtds06rKd6AxmBV
         ZLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168630; x=1689760630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TitqDCAZ4k0kUmwWL2ar9UbakjN8g88PZ4eJsoBtptM=;
        b=CN1+XKDzjZH/VjlxxPXfbbmyHAMOea6AJdHAmQk1GrusO0mx3oDIQhOftJUZ0Grw9j
         xIYnXRYHUqCHiQ3is3tsCLfH3TAmu9vtkiTO36yvcXdCSWRIc11i/eS+y3x73xz0k69x
         3Q87lxehjmGzqhWUEbcPUCnqOnuZmXamNYHLgVp58g2shV98h5iRGGig83pb8TMKr8dO
         PXsVFrx5Y+wvWxzMZS9ZtBda5JDmepVnf+KMK8MMZbTyBtyjJQ1xEMsJPW3q///cPNcF
         y2Rx0cV4MjFUj+j8aywqVFA2aAOuW8ewVR2UViqbgOOPEon0U9ALWE7rMi+OffGrAwAb
         AdpA==
X-Gm-Message-State: AC+VfDx+TDUkhvvEBahpFqjkNmtCwHEciDzDN/q/jeXZ6Ej1aNSuyNHO
        ujxoTTUnA9LSsD56keGg+fwoSywsxJTqfEKOKe8=
X-Google-Smtp-Source: ACHHUZ5aFxxxf68NHso+69usx5VV9RWbpXdqprXQ1ehxbJoVQwsKX8Nn4gCtoWCvFtJClVlj5+wIug==
X-Received: by 2002:a1c:7705:0:b0:3f9:6f7:9d7d with SMTP id t5-20020a1c7705000000b003f906f79d7dmr4561926wmi.0.1687168629876;
        Mon, 19 Jun 2023 02:57:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b003f8fe1933e4sm10891640wms.3.2023.06.19.02.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:57:07 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:57:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Fei Shao <fshao@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: Fix memory leak in devm_clk_notifier_register()
Message-ID: <658d32f2-a71b-4dc2-bff9-649fadf41889@kadam.mountain>
References: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
 <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain>
 <CAC=S1njwxLfw7LcnXkgY7pbiFaqvNQVyAzHVhK9+nYJC63d=Zw@mail.gmail.com>
 <32fa8c0e-26f4-4ee4-889a-4037530c128d@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32fa8c0e-26f4-4ee4-889a-4037530c128d@kadam.mountain>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 12:24:41PM +0300, Dan Carpenter wrote:
> > It was actually detected by kmemleak on an unreleased Chromebook device.
> > I added the trace snippet in the message at first but removed that
> > before sending this. Maybe I shouldn't have.
> > 
> > I can resend a v3 to add that back if that's preferable. What do you think?

The other reason to include stack traces is so that if someone else
runs into the same bug they can find your patch by googling their stack
trace.

Normal users aren't going to be running kmemleak.  And people doing
testing work for companies are hopefully going to pull this fix in via
the stable tree so they'll get this patch automatically that way so
they won't see it either.

But if the stack trace is like a NULL dereference bug, then users
absolutely do notice that kind of thing.  You should always include
those kind of stack traces.

regards,
dan carpenter
