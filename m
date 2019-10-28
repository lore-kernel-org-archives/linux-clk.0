Return-Path: <SRS0=ANa5=YV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09BDCA9EBC
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 10:23:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B139421479
	for <linux-clk@archiver.kernel.org>; Mon, 28 Oct 2019 10:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SqNuERYU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732818AbfJ1KXf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Oct 2019 06:23:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47524 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732042AbfJ1KXf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Oct 2019 06:23:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SANSfS115219;
        Mon, 28 Oct 2019 05:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572258208;
        bh=Japv/MCgPPjMsNhPNYlSDmLG+Qs9T+nOxuGtOrU3hA0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SqNuERYUFbVZT7CNZEc2P6iBuukBzR/rz7k0lkQf6S9TUYCaUywf8AiyAF1qlNNEg
         Q85ILwXfHgXhcS10G8yrBjElH+VV3InHv3rv4jRm3lqGym7i/LbYg+eGqYS+nEYN66
         enq2ZV0iBqLYYzQk5iJQ9xnQG/x8aRjBxwvu/Wx8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SANSCn002249;
        Mon, 28 Oct 2019 05:23:28 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 05:23:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 05:23:27 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SANPv1023333;
        Mon, 28 Oct 2019 05:23:26 -0500
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
 <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
 <20191028095906.27043208C0@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <9361d516-a92a-39cd-dbc8-10de10fe6295@ti.com>
Date:   Mon, 28 Oct 2019 12:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028095906.27043208C0@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/10/2019 11:59, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-10-24 01:03:20)
>> On 02/10/2019 15:06, Tero Kristo wrote:
>>> Hi,
>>>
>>> The existing divider clock support appears to have an inherent bug
>>> because of the bit field width implementation and limitation of divider
>>> values based on this. The limitation by bit field only is not enough,
>>> as we can have divider settings which accept only certain range of
>>> dividers within the full range of the bit-field.
>>>
>>> Because of this, the divider clock is re-implemented to use min,max,mask
>>> values instead of just the bit-field.
>>
>> Queued this up for 5.4 fixes, thanks.
> 
> Is this a regression in 5.4-rc series? Please only send fixes for code
> that is broken by code that went into the merge window, or is super
> annoying and broken but we somehow didn't notice. If not, just let it
> sit in -next until the next merge window and it may still be backported
> to stable trees anyway.

Tony/Tomi, how much do you care which one this hits into?

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
