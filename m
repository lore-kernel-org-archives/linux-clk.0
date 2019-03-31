Return-Path: <SRS0=OjSG=SC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64BEC43381
	for <linux-clk@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7460E21873
	for <linux-clk@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554014467;
	bh=IIguCj5+uNklqhCxWQFHd0XoJ2CUhwIGyUwj5N56WOg=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=MY9jIzOFzXe0xD7I+VX+BxH4uUcmxCwWAaDWpuGXbiAWTiCZ1ub+zPpPZ/+0gg8Kp
	 brSCV6ThC+JXxVR/oLcmq8Trh0EveOW0G6BMmgg1cHiG7LLHgAgvfwsvmjWU2wJE8D
	 4fo2kIZOKfkXqfnqZ8yFfUVKn4d3LSF4mMFJzYbQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfCaGlG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Mar 2019 02:41:06 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41602 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfCaGlF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 31 Mar 2019 02:41:05 -0400
Received: by mail-pl1-f196.google.com with SMTP id d1so1241973plj.8;
        Sat, 30 Mar 2019 23:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=bWxos7oH91qGwYYR3AWOk9kpXiXpwHXAw7nLTXETfJo=;
        b=QhFCVPqybGBiesiNhne1ALpWEb+cQslW66Fed5m29jdqBnD21dl2b4pa66FrqkkwdG
         vwXmsV8judQfH7KIOGlphorg/iYWIqq/Y6oVUfEbKz6oLrK5hjAu1qm1vbNLdQ+z0+KQ
         OpoNDJSPpaHsbiptwn00I3bPHy6/mt/Y8LhrnFFNFYZlsUAheVJhHig0fOPoZKRYyq4S
         eaUK60jV1ukXgKvIOIvGK9NFVxYnN1p9o+yayfQXW6fPdy9HcG3RkfywQ8v8rTJcORgR
         qZlBhwHq8Ba3JWLyr1imx6Zn3rsSTnwwyZRsEdWwo8wcHOQRwC8egYjLDM8kBgyN9MiQ
         iNeQ==
X-Gm-Message-State: APjAAAUrF2ksSuE5+tUyG2vvvAxIlBdGyLCPR2GqITGpo61Fhiach/HY
        d++KShvPPThQPHV7yDjhzA==
X-Google-Smtp-Source: APXvYqy6YCNvHBXi1hGaxr+AveHYnnTA9lZjxyJ5+8gy+YPLgFElOsK5pfqSBsxisw48n/wJE9cEzQ==
X-Received: by 2002:a17:902:703:: with SMTP id 3mr23968802pli.224.1554014464593;
        Sat, 30 Mar 2019 23:41:04 -0700 (PDT)
Received: from localhost ([210.160.217.68])
        by smtp.gmail.com with ESMTPSA id e23sm8435485pfi.7.2019.03.30.23.41.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2019 23:41:04 -0700 (PDT)
Message-ID: <5ca06100.1c69fb81.a71f5.6cb5@mx.google.com>
Date:   Sun, 31 Mar 2019 01:41:01 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock definition
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com> <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
Cc:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 19 Mar 2019 22:41:23 +0100, Martin Blumenstingl wrote:
> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
> was fixed by adding a new (typo-free) #define CLKID_APB in
> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
> definition").
> Now that the new #define is used by the driver we can remove the old
> one (because the old one is not used anywhere).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

