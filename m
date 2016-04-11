Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36015 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932358AbcDKOAT (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2016 10:00:19 -0400
Received: by mail-wm0-f49.google.com with SMTP id v188so87703951wme.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2016 07:00:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: Add Oxford Semiconductor OXNAS Standard Clocks
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1459520791-13269-1-git-send-email-narmstrong@baylibre.com>
 <1459520791-13269-2-git-send-email-narmstrong@baylibre.com>
 <20160402005045.GX18567@codeaurora.org> <5701210A.4060807@baylibre.com>
 <20160407233113.GI18567@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <570BADE3.8080201@baylibre.com>
Date: Mon, 11 Apr 2016 16:00:03 +0200
MIME-Version: 1.0
In-Reply-To: <20160407233113.GI18567@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/08/2016 01:31 AM, Stephen Boyd wrote:
> On 04/03, Neil Armstrong wrote:
>> On 04/02/2016 02:50 AM, Stephen Boyd wrote:
> 
> Ok. I was hoping that we could make simple-mfd look to see if
> there's a syscon and then attach it to the parent device, but it
> seems that simple-mfd is not actually a driver and it might not
> even make a parent device for the children nodes?
> 

It seems so, I will look at the device hierarchy next week.
Syscon is only used by these syscon_node_to_regmap() or similar calls, and they are the only APIs available.

This call is at least used by clk-mtk, nxp and at91 clocks, is there a plan for these to change to another API ?

Neil
