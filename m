Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685ADC10F13
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 00:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 307AF2084D
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 00:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WrH4Tyuh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfDLAQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 20:16:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37486 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfDLAQ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 20:16:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id 8so4236343pfr.4
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 17:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kiqyYUMZ9qVojpaA9oegXcRH8qxMfk04TQs34dsuglw=;
        b=WrH4Tyuh/Frm/SaPPClTf3lHZKO3Niv/jPrE+khcFUrjtOl+helY6fffcwL2M7yF61
         QpD2FXsbmkesOXIlNtcrLsUCP45M4ICT+4lzvaH8wSN79SnLnu8zbXEvH9iOFGs0L4X/
         cs9M+ftOH3IaTsGozAOPKFMn6ieLDLiNZxJh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kiqyYUMZ9qVojpaA9oegXcRH8qxMfk04TQs34dsuglw=;
        b=TpWJp0O63BqN7xSrFTCQNUSYVaj6XdLiwE6mxptqol2G9ErTYnjoTYEFyZzuQ8Cn3v
         n1/1LgswJ5kACatny7MEiLnXWLrqWD0blSBzDa4nPfFBpKWH0VMV1pTE7w1Hp/U5A5Df
         MX6g4GNDNdrQPZMeYnIfafEH1Mw28ruyMeHwWfOu23wdHnskSFHvZkeMEKt2Qd5sR1V9
         6ocJ3X+lTkLCWez+EZ9h3rETM2G8SU1wmH/Djz3/0LLGOJm2+dcHeAopcklob+S1FJfw
         VyVf0I8wNVD9rL1+t63QU2WnhdqgcDNiYrhEFWWtqUsoSsqm6YiY9TT7MghCx4UCq5zS
         3tmw==
X-Gm-Message-State: APjAAAVgI5f+EIR6JxLpyCd8zxePXdsQavO7uziCgYtAX7iv/F928NAn
        ANymjWBtUd/z+jYisn6KJ303InlmVTjpbw==
X-Google-Smtp-Source: APXvYqzH0FHYcedKZvjD7YGxSud4cMTjygbPHAJ91hQNTp7PGDU5OSK2qQYLscY76Hfb6mtFZ+IKow==
X-Received: by 2002:a63:5ec2:: with SMTP id s185mr50792590pgb.27.1555028218606;
        Thu, 11 Apr 2019 17:16:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id a85sm39198891pfa.166.2019.04.11.17.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 17:16:58 -0700 (PDT)
Date:   Thu, 11 Apr 2019 17:16:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: rockchip: rk3288: Limit use of USB PHY clock to USB
Message-ID: <20190412001657.GV112750@google.com>
References: <20190411175917.173566-1-mka@chromium.org>
 <3787637.WUkDPpUsF8@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3787637.WUkDPpUsF8@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Heiko,

On Thu, Apr 11, 2019 at 09:03:07PM +0200, Heiko Stübner wrote:
> Hi Matthias,
> 
> Am Donnerstag, 11. April 2019, 19:59:17 CEST schrieb Matthias Kaehlcke:
> > The USB PHY clock can be configured as (grand) parent of uart0_sclk and
> > sclk_gpu. It has been observed that UART0 doesn't work reliably in high
> > speed mode with the PHY clock as input when certain USB devices are
> > plugged to the USB HOST1 port (see https://crrev.com/c/320543).
> > 
> > Prefix the name of the PHY clock with a '.' in the non-USB muxes to
> > effectively remove the clock as input from these muxes.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  drivers/clk/rockchip/clk-rk3288.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
> > index 5a67b7869960..677bc5485201 100644
> > --- a/drivers/clk/rockchip/clk-rk3288.c
> > +++ b/drivers/clk/rockchip/clk-rk3288.c
> > @@ -200,8 +200,8 @@ PNAME(mux_aclk_cpu_src_p)	= { "cpll_aclk_cpu", "gpll_aclk_cpu" };
> >  PNAME(mux_pll_src_cpll_gpll_p)		= { "cpll", "gpll" };
> >  PNAME(mux_pll_src_npll_cpll_gpll_p)	= { "npll", "cpll", "gpll" };
> >  PNAME(mux_pll_src_cpll_gpll_npll_p)	= { "cpll", "gpll", "npll" };
> > -PNAME(mux_pll_src_cpll_gpll_usb480m_p)	= { "cpll", "gpll", "usbphy480m_src" };
> > -PNAME(mux_pll_src_cpll_gll_usb_npll_p)	= { "cpll", "gpll", "usbphy480m_src", "npll" };
> > +PNAME(mux_pll_src_cpll_gpll_usb480m_p)	= { "cpll", "gpll", ".usbphy480m_src" };
> > +PNAME(mux_pll_src_cpll_gll_usb_npll_p)	= { "cpll", "gpll", ".usbphy480m_src", "npll" };
> 
> In general I like to have things like the clock-tree described fully
> and let the kernel handle correct sourcing ... but:
> 
> As you write this seems like a systemic problem when just connecting
> random peripherals can create unstable clock source frequencies,
> so I tend to agree here ... but:
> 
> Can we please find a more "talking" name for this ... because as with the
> above someone will find the "." and submit a fix for it ;-) .
> 
> So just name it "unstable_dummy" or so?

I looked for some common pattern, but couldn't find one. I liked the
'.' since it leaves the name of the clock mostly intact, just hiding
it (similar to a leading '.' in a Linux file system). But I agree that
it might not be expressive enough. I still like the idea to keep the
clock name around for reference, maybe we could name it
"unstable:usbphy480m_src" or similar. If you don't object I'll send a
patch with this some time tomorrow.

Thanks

Matthias
