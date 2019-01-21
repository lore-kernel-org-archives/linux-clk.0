Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095B5C37120
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 21:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5A5020861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548104692;
	bh=zAIZz96Mjr8ueax7k0hNtGkOEvg9TC6mfVwD1oVJAT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jwrXDc2Co7IN6vcfespN9sI5MscgWocHdr+M7yDtlW4TjDtJa2i4tPqfCcq9ksiu6
	 yao7i7iir+MVvYw+4xtkBkcFGNCn+7xhHq6YmiBgx9YvJzVapqf0tJhqtmYO3GBmm0
	 1MhKSYUW2LaeIuBdxuYXoBn2MVIejwttPTyRQzlU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfAUVEw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 16:04:52 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37369 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfAUVEw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 16:04:52 -0500
Received: by mail-ot1-f67.google.com with SMTP id s13so21760308otq.4;
        Mon, 21 Jan 2019 13:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v4yzYvAFmjYSXucy1AcnsqmlP7OsOTnOYguk8hvUVyo=;
        b=r/3uZin/dVWh+k3+9R2+stQRv4rGlcomElx90SX5CMKTu63LAO4XNYTP0lbgI2CwOd
         wAYiYLhFjf3IiokX3i9vmY+uECqPzqHKOZZk9tvYCmk3VtsPmXq0PRpZacyWgSeIAi22
         q6ZMYYyOzDRoug/OFXdui5FlAAvaFCDWBssYTSzd+lJ4PRJIWprtZRUuALsVL8/BgiGP
         B5BFizmAjtCeUOGP9Qh+5HtOtEBiKor8qn9gzkRPqr7nMu3Fh/h7zjnR0DAc7mLmejc6
         YuNIx/KlsHmD1h9LTymV5M51SwRwoV6wAuYIxfnCUTZNGi5MGmOzpSnY1Mn+nh72YtpS
         G7eQ==
X-Gm-Message-State: AJcUukfQshojEs/9yn2ok8RhD1KYI4y/KYGShyDngvZcUA4GSwIuhg+e
        x2PGP+iUAlsRc34oFzrMyCS8cKRODg==
X-Google-Smtp-Source: ALg8bN7WGPqEXqoSBCUcw4Eyvblt6N2iYUD762Y8i0ZeEM4p9SpBqvaGCwhfhMAIVt18ox08NBajGg==
X-Received: by 2002:a9d:42c:: with SMTP id 41mr21486488otc.41.1548104691140;
        Mon, 21 Jan 2019 13:04:51 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w62sm6069766oiw.34.2019.01.21.13.04.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 13:04:50 -0800 (PST)
Date:   Mon, 21 Jan 2019 15:04:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for
 parsing clock info from DT
Message-ID: <20190121210449.GB7851@bogus>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546954223-9738-2-git-send-email-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 08, 2019 at 03:30:21PM +0200, Tero Kristo wrote:
> By default, the available clock info is queried from firmware, which can
> be quite a lengthy operation if there is a very large amount of clocks
> available. Add option for parsing the used clocks from DT instead, and
> only register these which can improve the boot time of the device quite
> a lot.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
> index 4e59dc6..c757ae1 100644
> --- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
> @@ -18,6 +18,13 @@ Required properties:
>    and clocks IDs for 66AK2G SoC are documented at
>    http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
>  
> +Optional properties:
> +-------------------
> +- ti,scan-clocks-from-dt: Scan clock tree info from DT. By default,
> +  clocks are queried from firmware, which can be rather slow operation,
> +  especially if there is a really large number of clocks available out
> +  of which only a handful are ever used by kernel.

At first, I thought this was an either/or thing. Use firmware or use DT, 
but it is really only get the clocks used in the DT from firmware.

Why wouldn't you just always do that? I can think of 3 cases: 
reparenting, debug and overlays. This breaks reparenting and overlays, 
right? Debug could be handled with some userspace trigger to get all the 
clocks.

Why scan any of the clocks up front? Why not just create the clocks on 
demand? If an unknown clock id is requested, then create the clock and 
query the firmware at that point. That would avoid the DT scan too. 
Maybe there's some issues in the clk framework preventing that, but 
that's not really a DT problem.

Rob
