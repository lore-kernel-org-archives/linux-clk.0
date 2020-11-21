Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52325C6379D
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 13:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21B5722264
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 13:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgKUNbC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Nov 2020 08:31:02 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46277 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbgKUNbB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Nov 2020 08:31:01 -0500
Received: by mail-qt1-f194.google.com with SMTP id f15so5833166qto.13;
        Sat, 21 Nov 2020 05:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DRct7Qiz1NdHJ+XJtu4ATcXpdEh8Oy5keY5R6mGzDQs=;
        b=YS3LUob9jUbXrs9nHQl2mQ40/VQnBNSrxLJ1gQUsfnVGg5ZSRapUJBEG9B9iqOirhf
         ZgQbYXgHKXpeCIxxgVnfsmTsdUrnjHI1EYMMRZYnT5lQ8/2S3wjGYkxifCEapW+F7Uti
         +YgYoKMRFf0NZbGyeMJ+ICdK3E8zc/RCYuqy7kI+eJq7eipYjzyCra1DgIBZ0D+SYnSd
         o0iR15gDnJEi9cZP6Q8JibWnlCSPFAdshARSzzjUdPeESQeqPbBV67S41f6wbMEopcLn
         cX+CfjbKy0h7xwlXHnD0ELFdGlgZk0f686KvBCOIoZqkUg7+mOuUa4GxhZ/uvIO1bUY5
         nQeA==
X-Gm-Message-State: AOAM5324YYchIZUqdxNkoF+AJFVN7Mfdw32VL7kTkJDLFH5YVB2RE1aq
        E1UtV/f7p/C6RdTdFmJ45w==
X-Google-Smtp-Source: ABdhPJwxUXBcSJ0PMTqXgEHiurkz3GntUDhncIYmfII33t3GmLNIS7tspLTDzp4JbRXfF8EEU9bw/g==
X-Received: by 2002:ac8:36bc:: with SMTP id a57mr20501605qtc.193.1605965455403;
        Sat, 21 Nov 2020 05:30:55 -0800 (PST)
Received: from xps15 ([172.58.99.237])
        by smtp.gmail.com with ESMTPSA id 9sm4167517qkm.81.2020.11.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 05:30:54 -0800 (PST)
Received: (nullmailer pid 2129529 invoked by uid 1000);
        Sat, 21 Nov 2020 13:30:50 -0000
Date:   Sat, 21 Nov 2020 07:30:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     john@phrozen.org, linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, jiaxun.yang@flygoat.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        neil@brown.name, robh+dt@kernel.org, hackpascal@gmail.com
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add dt binding header for
 mt7621 clocks
Message-ID: <20201121133050.GA2129481@robh.at.kernel.org>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113154632.24973-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 13 Nov 2020 16:46:28 +0100, Sergio Paracuellos wrote:
> Adds dt binding header for 'mediatek,mt7621-clk' clocks.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  include/dt-bindings/clock/mt7621-clk.h | 41 ++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7621-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>
