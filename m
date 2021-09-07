Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4886C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 16:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B80C06103B
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 16:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343837AbhIGQi7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 12:38:59 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43766 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245595AbhIGQi7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Sep 2021 12:38:59 -0400
Received: by mail-ot1-f41.google.com with SMTP id x10-20020a056830408a00b004f26cead745so13485980ott.10;
        Tue, 07 Sep 2021 09:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Gclh/xQmNnX7m+aM9vAxlEmZbwqo4NlYu42YuYNtugU=;
        b=K5PHNfYj8iMFgt72VM8Hvix4aSar/WmJTDcq/niySfCaTlukwrVxKLPurVHVsEzb6S
         ZwEVHzsvdp+sNLBkSI4mdFbYA2rLxHQqoFp8jZ8PArvPNmmzwxQPZtzFAFtnKiZX/9KQ
         f5L4ZGy8na10NaBxbTyGyjKr/5QgyhE/pRVKaTo50zjAuT9ruvz8VN7EraGrKkwGGmji
         Jkg+tM1E6XDVVTyOT4kVw+R0ChGK0yRzKiK1OK4iHjNGNaU/l9k7HVGV7eB+iIQcAUWe
         64/XX4nmOXl4ONYPsYVl3TeNFGNsIAE85nj55RWoXI1sh2EPAMArv6kxsphSgsRwPu68
         o3vQ==
X-Gm-Message-State: AOAM531kl+Nlome8KwEvWwEZiMHWxO56UqQWrGw5YeWl61m5JcG43Iy2
        Mpy9yHlstd4NwnGdp8QvcLQcUIDZbQ==
X-Google-Smtp-Source: ABdhPJxhJLGGAPjwCwRlo1AFguj4YidhSgOO+HrTStyirpQo9WvGMraJrgBk5TrIwUWL1PY5NL7SRQ==
X-Received: by 2002:a9d:5e05:: with SMTP id d5mr15412900oti.61.1631032672282;
        Tue, 07 Sep 2021 09:37:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b11sm2313449ooi.0.2021.09.07.09.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 09:37:51 -0700 (PDT)
Received: (nullmailer pid 4121281 invoked by uid 1000);
        Tue, 07 Sep 2021 16:37:50 -0000
Date:   Tue, 7 Sep 2021 11:37:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Jan Kotas <jank@cadence.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clk: fixed-mmio-clock: Convert to YAML
Message-ID: <YTeVXuZhwmuQ1YfE@robh.at.kernel.org>
References: <20210903152615.31453-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210903152615.31453-1-kabel@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 03 Sep 2021 17:26:15 +0200, Marek Behún wrote:
> Convert the binding documentatoin for fixed-mmio-clock to YAML.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../bindings/clock/fixed-mmio-clock.txt       | 24 ----------
>  .../bindings/clock/fixed-mmio-clock.yaml      | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
