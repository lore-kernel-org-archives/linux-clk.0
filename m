Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B751EC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 874A320989
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YWsbwxL1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfCSKDD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:03:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45752 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfCSKDD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:03:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id s15so4942664wra.12
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=E9BFs8WkH/ZGJB9LSb1nvBGbYjMHBI/Uj54YuFoNLC8=;
        b=YWsbwxL1xjRzrxX+nlNT7HrJJfAPwnHZ5G8QbtwUeV3vUQ84CL2o23if8K8p8w9yQY
         3ir2tlvkjAAEKkzxd3VmequdImIGWBrz5YCjTo0E/H+A/Lgl1PJji3uutyV1qwCFdhCn
         PRuAtW+g2U0JGiNnWZkbT+rMiy9Slb0CBSwTyTQw999SXj+CfRBumgZ92WYRPn1iMGL0
         GIOLYV1RZ9BS4MOaLrGAVIxQ36oBel29a879u6fVG4JL7/7Llzk5+noFU1gd2BBBlAL/
         Pi95ya+tklzngR8goD0JpEUUcqkMZbxBRCoL4VdqYjPHOpQp9U5HOvjX1IQGRXG+74tY
         uoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E9BFs8WkH/ZGJB9LSb1nvBGbYjMHBI/Uj54YuFoNLC8=;
        b=LpysNrUa955i5m16trwGkH3VjLLw8b9gQVVOyjTGqKJc4ZvmkR+8SVPv71Usq/a60Y
         NjW3WJvbEX1J7Py+nZof7Rj5QkMltjq1qAKqDI+xTPnKKhHzJ/V3RqkqDaVE21YfGNSy
         2ZdKcgGa/Ul2T6qNB/1TYRQWr464kC5xt0Olu/RtB2Zlb87gWs43JPCFc+exiHonYB2k
         lfqhfSC0wyfGLsjhXhON0FRP8oTNe2l3atLZD9BE8VnviifntAKDmgWFTWOJcKfZU7oM
         IKHH/nJF1ImBgiQ07OVQy8f+iAZpMV6aais7HBZZyJlt9msP0S9i5RjevzHVMS72Dpc9
         giiw==
X-Gm-Message-State: APjAAAUj7VPPF43OeBWQA5rzgnSUFVD6m/UPkoczM8x6N9CHOpmQdJ5P
        0S7D56BZZvs0XdV/y/3c69T/Tg==
X-Google-Smtp-Source: APXvYqxM1xIccWBhSIGn/XeESj1+Y6oOlzcW2U8kYHiIlGRHafNuFiXUMplGO6PaMfCeGCVm7u5nOw==
X-Received: by 2002:a5d:4750:: with SMTP id o16mr15841745wrs.238.1552989781415;
        Tue, 19 Mar 2019 03:03:01 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id q17sm9257796wrx.38.2019.03.19.03.02.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 19 Mar 2019 03:03:00 -0700 (PDT)
Message-ID: <697115c457a70b458bf7514df72e802fc78e467e.camel@baylibre.com>
Subject: Re: [PATCH] clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Date:   Tue, 19 Mar 2019 11:02:58 +0100
In-Reply-To: <20190304105358.4987-1-narmstrong@baylibre.com>
References: <20190304105358.4987-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 2019-03-04 at 11:53 +0100, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the SAR_ADC_SEL ID was moved
> to the internal non-exported bindings, but this clock is necessary and
> mandatory for the SAR ADC bindings.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

