Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fallback18.mail.ru ([185.5.136.250]:44512 "EHLO
        fallback18.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbeIEOwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Sep 2018 10:52:30 -0400
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: a64: Add max. rate constraint to
 video PLLs
To: Maxime Ripard <maxime.ripard@bootlin.com>,
        Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-3-icenowy@aosc.io>
 <20180905071645.ibhcuq5coc6gl6k3@flea>
From: Sergey Suloev <ssuloev@orpaltech.com>
Message-ID: <5b78f888-c226-8b8d-1064-2e135c82f48e@orpaltech.com>
Date: Wed, 5 Sep 2018 13:22:31 +0300
MIME-Version: 1.0
In-Reply-To: <20180905071645.ibhcuq5coc6gl6k3@flea>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 09/05/2018 10:16 AM, Maxime Ripard wrote:
> On Tue, Sep 04, 2018 at 12:40:44PM +0800, Icenowy Zheng wrote:
>> Video PLLs on A64 can be set to higher rate that it is actually
>> supported by HW.
>>
>> Limit maximum rate to 1008 MHz. This is the maximum allowed rate by BSP
>> clock driver. Interestengly, user manual specifies maximum frequency to
>> be 600 MHz. Historically, this data was wrong in some user manuals for
>> other SoCs, so more faith is put in BSP clock driver.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Applied, thanks!
> Maxime
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
what source tree this patch is supposed to apply for ?
I can't find  the SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX declaration 
in 4.19

Thank you
Sergey
