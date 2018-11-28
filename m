Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA2CC43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 09:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36CFC2081C
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 09:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Im1m/+df"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36CFC2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbeK1UTn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 15:19:43 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42309 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbeK1UTn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Nov 2018 15:19:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so25484043wrx.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Nov 2018 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fbXR8KePKS/cptrasl/TEP0Y21ycc5UmMC0HPKaMDwI=;
        b=Im1m/+dfgPxcMWXAvcQMoiF6IA325AUqhEUYZ6NbOWN2MqrTYk7djY/1WDSv6QlGeK
         H0zEI59NRdT4Ii7h0kZmI2YLWAd7AqrfdOkMqY6TJR0/vBBNie35XnwpyEd7s5TLbkZb
         y17vvEhU6atHosyMo/uGZwg99jb8RgECMUS20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fbXR8KePKS/cptrasl/TEP0Y21ycc5UmMC0HPKaMDwI=;
        b=FJCWwbQHgORtSOsmLA6VJc2dL7cBr7R9DphkFZkU+g4qjkTA26auU6vhdH+kBSwP0t
         cPWiOzKudw1JjHQaTydnG1x4ba/EyEZrxbRWFhAvmbGrlp/W7FHQp6zdx+nB/73qzQJ2
         Rf4aV8ZJM7h8IqlF085PUVpnxkK37guksKEzE1SQ9cGtjjddssqaByMOUpq++RQU2lc5
         vs1X3juzz7iHG3Pujn5NmgKmol3kun/qWOihbmMJ3uQGERhulE1ykM8Z4g2kYjQ3HSvx
         ko1fUZJ8aJNX2r5aQAXtZ7vQTtr8DnvLpu+B/UR3Ak/VhRu+apeKS0cWipYlYsK5b61H
         9K/A==
X-Gm-Message-State: AA+aEWYC7GO+X4JDWdnaAapsZ86jfdiSRLf5R8VY+Znfr4gsMphbidJU
        OqNBPNI8AaIWhaJC4z2VJuAhXw==
X-Google-Smtp-Source: AFSGD/VZj4j90Qba1d4awPiSsJRV65kjQ4rtR+M786zfiFoS3WMGW8rCt2obw75yzaVMxdenCrDNwg==
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr29707651wru.291.1543396725630;
        Wed, 28 Nov 2018 01:18:45 -0800 (PST)
Received: from dell ([2.31.167.233])
        by smtp.gmail.com with ESMTPSA id a17sm9763731wrs.58.2018.11.28.01.18.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Nov 2018 01:18:44 -0800 (PST)
Date:   Wed, 28 Nov 2018 09:18:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lgirdwood@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 2/8] mfd: lochnagar: Add initial binding documentation
Message-ID: <20181128091843.GV4272@dell>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181120141631.18949-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Nov 2018, Charles Keepax wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v4:
>  - Move sub-bindings into separate documents
> 
> Again incase Rob missed v4 I have dropped his ack due to the large
> changes introduced in v4, see:
> 
>  https://patchwork.kernel.org/patch/10673891/
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  71 +++++++++++

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
