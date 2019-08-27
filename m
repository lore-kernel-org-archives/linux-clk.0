Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16590C41514
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 17:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA2AF21883
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566926689;
	bh=iK610BpKpycEj3NDut5ZFxo2jMgjWVkBWXCHyJz4E0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lIcT7p+gu1T3vvNJCt6sx2iq6TM3I27Ne9FE6wnsMY36pfqKwXsQv3n7HjTNvQ++l
	 mYeFs+y7rLTo7rF60PxGqlZLyUuBwD03r4F9pfDtQL4D0ShV9RKDjrz7n5zLwGxIAw
	 Z09kDkyDKzLSadGkFMVMY19PntSl2qyRVBc9Rs5o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbfH0RYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 13:24:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34334 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0RYs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 13:24:48 -0400
Received: by mail-oi1-f196.google.com with SMTP id g128so15617234oib.1;
        Tue, 27 Aug 2019 10:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iiSGGVLxiO5dXRiIuYVfYDjgr5BeTYu6HKE0U9IDlr8=;
        b=jLkVOojzvUnaOJNLK1zWL7ggTxkJ0xxYh+P45rqTU0qTbuSnQ6heYOGTFwFz9ON8iy
         y9AjjrKui+W1aNf77vxalVa062hBs0VXjkAoLPCZZJeGP8HO4e81Atwa8LzN38rBJFvA
         jWs6T+mnJ9Z53zP6UW0g6lzyTZSsjobjvADM8XsdRszYywQ0PJlsuN8QYN5ArWrtC0Ee
         H6rOt8v8iPOu2eprlDn3rYc17bDN0AZYGXirG1MXbhyI1xYLPUucoqTMH4yMIeICRcxM
         PQ1HoUmTum52V8bA3oMhUiWGfbkGQNW6Mhf4auovyrFhhWzML97GSqeERHD44ni6DnES
         eYgA==
X-Gm-Message-State: APjAAAV33t0MBT8yFP/YADAsxUIMwExf5Zag9uxchZHM97C7ZjWZfbw+
        K3nUdqqYB141+9Hhpnc+cQ==
X-Google-Smtp-Source: APXvYqw9Z0yuc9c97insSvpXEnh5CIsK0GLVAo7MRbMxts4XopU9ATqRwMv1HoaOdySJh9uI+fvgqg==
X-Received: by 2002:a05:6808:b30:: with SMTP id t16mr4563oij.166.1566926687170;
        Tue, 27 Aug 2019 10:24:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm4377015oid.39.2019.08.27.10.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 10:24:46 -0700 (PDT)
Date:   Tue, 27 Aug 2019 12:24:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v2] dt-bindings: clk: emev2: Rename bindings
 documentation file
Message-ID: <20190827172445.GA15211@bogus>
References: <20190821091516.16372-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821091516.16372-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Aug 2019 11:15:16 +0200, Simon Horman wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to renesas,emev2-smu.txt.
> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> 
> v2
> * Drop emev2 prefix from new filename, it was unintentional
>   and does not match the proposed naming scheme
> ---
>  .../devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt}  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt} (100%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
