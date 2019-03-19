Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE25BC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 09:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F0F620828
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 09:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2HDQVaSp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfCSJL2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 05:11:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37535 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfCSJLY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 05:11:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id v14so7071684wmf.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OBhyq4n5SGWqCjrfChQye9qgetfLwZTxQxDkttOwm/Y=;
        b=2HDQVaSphB4nvyB/uQwhD9tnS7lpasSGWli592aXD4STjpWdylTeG1uPju1aZWUzNK
         liGTrB0DuRL6CP/F4Zp7w2Qw5L7UeajEJQHcjNqvAu9ZPiYNVRxOro2t/m0OcH6HJ7JX
         9+7lkQENacwneEr/25PR7/oqAtkKekGTQeVZf/H4M4bjBhWDPemZa8B7Q1qeAKTGc48q
         9lYBrpWGWGmG1RBcGZoxZkgcpkYyZ9Dvno/u8ThczTq0Xzc0m1TZQvMXlN3SPL0XnjCe
         hnfibX5oLAFcgbijQD96PWt8hlSKVwZQeBRmGNplkhZgZXZT0psmJU01x2klpV/0fcg+
         4s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OBhyq4n5SGWqCjrfChQye9qgetfLwZTxQxDkttOwm/Y=;
        b=Bnn1dR25y4SU5/JQ/ZVDO3pvpUMoWV3AwHO/2LjmUAJ/341hP0AuufYXTB2o4uaPut
         sPTOhb3HxZ5evdBjTZJ9VetauJOUp/qP1o4cDBc89Ta47GWvN+bIVgh1RdzFSHY5fJ66
         upsp7/LFu94G7qDhlmH0VJIPNQr5kVP98PfKVpTJBCszd8R9xNkLmT58TV2GbQh6tyxO
         CC9fYCveA0F2ikhVLtRhr2cbYJ6boZ27/VHven/+AkEasxmbGvhgdRy/URvVrRjYoLx0
         Ir1yvHOY7ytfHU+ybUFBOOj9/Sda9h/c24Vygx7QT+ax68ZcpE5xc0Cw+uVzbUvmphXk
         z1UQ==
X-Gm-Message-State: APjAAAUWehAGFaHYcgs+3XCKIHFnCnsDo8GF4K5qjeBEmgQz7+RCjaQk
        IPSR66BqUAeDoStYy897nqyONDHinUI=
X-Google-Smtp-Source: APXvYqyi7fJAhGJdYC/s+9y4g4QBbh9uvb+AjHuL2QeXxI2vyzaZk3IBRQ+iqJNss5t6tLR9LCZjiQ==
X-Received: by 2002:a1c:7a03:: with SMTP id v3mr2564249wmc.59.1552986682564;
        Tue, 19 Mar 2019 02:11:22 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id r15sm9084274wrt.37.2019.03.19.02.11.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 19 Mar 2019 02:11:21 -0700 (PDT)
Message-ID: <3bebbae829d0a0e1e3ad26572e91ed141dbe5f20.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson-g12a: fix VPU clock parents
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 19 Mar 2019 10:11:20 +0100
In-Reply-To: <20190313135503.3198-1-narmstrong@baylibre.com>
References: <20190313135503.3198-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2019-03-13 at 14:55 +0100, Neil Armstrong wrote:
> First two VPU clock parents are wrong, fix it here.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

