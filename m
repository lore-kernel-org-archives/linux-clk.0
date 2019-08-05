Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C17C0650F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 08:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B45FB217D9
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 08:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfHEIeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 04:34:06 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:58473 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfHEIeG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 04:34:06 -0400
Received: (qmail 4030 invoked by uid 5089); 5 Aug 2019 08:26:43 -0000
Received: by simscan 1.2.0 ppid: 3971, pid: 3972, t: 0.0512s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 5 Aug 2019 08:26:43 -0000
Subject: Re: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
Date:   Mon, 5 Aug 2019 16:26:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2019 11:19, Phil Reid wrote:
> The cdce925 power supplies could be controllable on some platforms.
> Enable them before communicating with the cdce925.
> 
> Changes from V1
> - Add devicetree updates
> 
> 
> Phil Reid (2):
>    dt-bindings: clock: cdce925: Add regulator documentation
>    clk: clk-cdce925: Add regulator support
> 
>   .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
>   drivers/clk/clk-cdce925.c                          | 34 ++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
> 

Any more feedback on this series?

-- 
Regards
Phil Reid

