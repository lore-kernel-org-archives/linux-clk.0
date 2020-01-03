Return-Path: <SRS0=Lhyk=2Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FF9C32767
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0188227BF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578090570;
	bh=cagGhZOxCV0Mw3q8og/AhdWgRjglOTxAWlraDkYvhTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kVq/gYUHAe0NtVw8FgTffmJT08Knlk0FsjjhnSc+MSnSyU3DTyKmSaQr738ebgqYb
	 zSXtkkPXHb3r4ulbTpJIaHlljymXBnSW+czZyKAuYJ5u64sQnX/67jqN/GVlaVg+yQ
	 mPtGMhWoXD9PsEv74DTPnX/KpgU1Pou9JWVtrM8I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgACW3a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:29:30 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:44719 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgACW3a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jan 2020 17:29:30 -0500
Received: by mail-il1-f193.google.com with SMTP id z12so1387662iln.11
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2020 14:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TFDz39ekdeb/43sN0oag/MOWFARZHq5KPLmY9cO79x8=;
        b=PvBFgn1FxABlS1H3LMnGNNVlrsY3Wksdk35VUK336qv9CauFH+PmKSB1wRwmcrtx+X
         90i7IJXg6fyX8bwFpRpEIqaXPlklOG2rc3gWxwUxaQDdl7XAXV6p6LvkcWx315jRIWHd
         nYyjA/5FgR5BB6UZPDdrAGRR5ph0sc1n00rPPRtrarZ0B1VyTUeKKMOclDrd7xwM3Ami
         YuW9B1ZiB6oLgAwMjne9msO42RSVod9ADzBoBe3MGNqhrNPEfNARtgiVhIdU8G6NZbc7
         B8k7Y7ye56Emr4WssG4upegWjnzotLiqtjEaZIqrp/OQNuPVcEGRY5ruu11VUmCzYzmt
         zRzA==
X-Gm-Message-State: APjAAAX3FuVhXvpOg18JY237cSZagdu5TsQBMFHLRQCUkiU6AkKxDg2q
        hyruQWWcclpZ/A/4UONhKIVg/Lo=
X-Google-Smtp-Source: APXvYqxE01YWP5s+w/HEUY+h0Xs8MTXDiLkp1gGbxAyTzCM/T4EMys15F0KDqfClirafE6WluEektg==
X-Received: by 2002:a92:d7c6:: with SMTP id g6mr74349082ilq.282.1578090568923;
        Fri, 03 Jan 2020 14:29:28 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p65sm21353295ili.71.2020.01.03.14.29.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:29:28 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:29:25 -0700
Date:   Fri, 3 Jan 2020 15:29:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jian Hu <jian.hu@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20200103222925.GA654@bogus>
References: <20191227094606.143637-1-jian.hu@amlogic.com>
 <20191227094606.143637-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227094606.143637-2-jian.hu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Dec 2019 17:46:02 +0800, Jian Hu wrote:
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 54 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
