Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B85C49EA5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 20:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B92B613C2
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 20:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhFXUjz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jun 2021 16:39:55 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:44699 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFXUjy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jun 2021 16:39:54 -0400
Received: by mail-il1-f181.google.com with SMTP id i17so7638156ilj.11;
        Thu, 24 Jun 2021 13:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sh+L+Or0x1Q9lQ8W8LaaA0S0KGSl+Q32QlHtohsJlao=;
        b=MjCbFHleFnZYr1ImIB5mL13PkLz5yz7sE2UlclCwfl2O3dErhwIqmmlcQlPKp2qhte
         vx/oulW550a5Te63u3B4T/Rixok3S26bNEdt10eRSOrg+dijnm/3xf96dad+TADXPL2O
         LQ7NWlmyv2Bikg70mVfOAml7+QJYktgrIcPYmyXmvFAGCs/jrkmIC6A//3jtAL0sbMbo
         934OE/aKJDbrt1H6tNZxuG8VMkcYb3a1p4iWe9VA9ELih8wTszlrh+YTLMIlXVsQr+Cq
         SLnRiON/xiCweBL3Gx4daEi041JJAkw4ijD3hd4hVnKmrRF61B1sOqSfQZa6/Kuha52+
         VOTA==
X-Gm-Message-State: AOAM532A5fWN/q5NhpUcq5U/dbMBzC2EWcijVl1hYSZyN5BAT1kgZvP9
        n0wtKjkouAGo38MShKTnmA==
X-Google-Smtp-Source: ABdhPJwNpBoGdcVb6vKPriyfw4+VnU57kZ2RNBHx2DPAMuvzEtn7YnEj3PJZmR7OcYouYQnspKQ4ng==
X-Received: by 2002:a92:c563:: with SMTP id b3mr4997213ilj.275.1624567054985;
        Thu, 24 Jun 2021 13:37:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a11sm1980697ioq.12.2021.06.24.13.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:37:34 -0700 (PDT)
Received: (nullmailer pid 1947563 invoked by uid 1000);
        Thu, 24 Jun 2021 20:37:32 -0000
Date:   Thu, 24 Jun 2021 14:37:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     devicetree@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
Message-ID: <20210624203732.GA1947505@robh.at.kernel.org>
References: <20210614155437.3979771-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614155437.3979771-1-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 14 Jun 2021 11:54:36 -0400, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v2:
> - Rename idt,sd-active-high to idt,output-enable-active-high
> - Add idt,enable-shutdown
> 
>  .../bindings/clock/idt,versaclock5.yaml       | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
