Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50962 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019AbbFZKVl (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:21:41 -0400
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: thomas.ab@samsung.com, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: clk: samsung: add infrastructure to register cpu clocks
Date: Fri, 26 Jun 2015 12:20:35 +0200
Message-id: <2521313.Iak1gZLfIu@amdc1976>
In-reply-to: <CAJKOXPfyw=1kh4DkC3j7FCXcERecBWgGVcN6bYvrBZQVjeo=Bg@mail.gmail.com>
References: <20150626095444.GA30810@mwanda>
 <CAJKOXPfyw=1kh4DkC3j7FCXcERecBWgGVcN6bYvrBZQVjeo=Bg@mail.gmail.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Hi,

On Friday, June 26, 2015 07:03:25 PM Krzysztof Kozlowski wrote:
> 2015-06-26 18:54 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> > Hello Thomas Abraham,
> >
> > The patch ddeac8d968d4: "clk: samsung: add infrastructure to register
> > cpu clocks" from Apr 3, 2015, leads to the following static checker
> > warning:
> >
> >         drivers/clk/samsung/clk-cpu.c:164 exynos_cpuclk_pre_rate_change()
> >         warn: test_bit() takes a bit number
> >
> > drivers/clk/samsung/clk-cpu.c
> >    158          /*
> >    159           * For the selected PLL clock frequency, get the pre-defined divider
> >    160           * values. If the clock for sclk_hpm is not sourced from apll, then
> >    161           * the values for DIV_COPY and DIV_HPM dividers need not be set.
> >    162           */
> >    163          div0 = cfg_data->div0;
> >    164          if (test_bit(CLK_CPU_HAS_DIV1, &cpuclk->flags)) {
> >                              ^^^^^^^^^^^^^^^^
> > CLK_CPU_HAS_DIV1 is (1 << 0).  We sometimes used it correctly as a mask
> > and sometimes incorrectly (like here) as a bit number.

Fortunately the current value of this flag is "1" so test_bit() still
works correctly.  I'll fix it up later anyway.  Thanks for catching it.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> >    165                  div1 = cfg_data->div1;
> >    166                  if (readl(base + E4210_SRC_CPU) & E4210_MUX_HPM_MASK)
> >    167                          div1 = readl(base + E4210_DIV_CPU1) &
> >    168                                  (E4210_DIV1_HPM_MASK | E4210_DIV1_COPY_MASK);
> >    169          }
> 
> +Cc Bartlomiej
> 
> Although original author is Thomas but he abandoned this patch and
> this was actually Bartlomiej's work mostly. Bart, care to look at it?
> 
> Best regards,
> Krzysztof

