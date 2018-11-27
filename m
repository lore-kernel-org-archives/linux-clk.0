Return-Path: <SRS0=WhJS=OG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1B2C43441
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 15:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F6902133F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 15:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="XxweuVfx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F6902133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbeK1Chd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Nov 2018 21:37:33 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34248 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbeK1Chc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Nov 2018 21:37:32 -0500
Received: by mail-lf1-f67.google.com with SMTP id p6so16802016lfc.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Nov 2018 07:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bm7/ttwhlc9vs3EeWVEmhn3HiiHgs9Du8LbJvQSdhLc=;
        b=XxweuVfxgQbyJcXSfz4RL3mqIJr52nOILzT9px6VkzRX04eLVlNILzikkGBa//2XLw
         V6+EKQbNAVBKOACYtBPnWckUNUpwOZko6DhmLKmzHjbGZLOeCxz0VotZN1IrlmCArIeH
         6GhDI4HMc8GbUlcDzGAq2xe0kUS83QpizXofcubzyGU8K4I1AGUYTTrijhY60xe8wkF9
         3hY45sS54zxazL1FJM1wKAee8aS0zP1OKNw1KEwTRHB2COJa5fYaS62QQVdgYfgmmCPX
         r2gXWq5XUkN8/7FvLyytItNflNU7DWGE4dHrNQzRCXm/wxRCMbjb4flCh2fKGUJo+Ek2
         RJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Bm7/ttwhlc9vs3EeWVEmhn3HiiHgs9Du8LbJvQSdhLc=;
        b=fyG5uimjC/g4/zMtE8sG6qxecXpfUWU2iDtSL6QnS2uXVZnP9BvFj+MOuXkcFO5PFt
         NJ8esK5MLj3z+Hmy2qcu1MkSduI73YLSrTBY6uJiVLELpYJzTo3VGG5BA5W+ySb3YtgM
         +YQD62o404wy7p8rka7GMzHuRVoAoHk5HQgqtr9tuKCig6bgTLkK+Ti9xilgIjRh3WYX
         ukCPcULUJGAXM7tXSIT+4WvXWhqVg3ZK6GcJKU1JSkODmUC/jemQ8L56mSnGAGjAWp1Y
         UVcbb5Sz8ZJZ5x2BjYn32RXyzzBm1Z9RVWFSdb9IUhLqFooZm1IIwu9c2taUHjNQBN24
         jdyw==
X-Gm-Message-State: AGRZ1gJVJQLsCg//50WSDTgIBrf93x5HAvclf/aMJCMf1h18WucLgigZ
        gqG+8zR51v0suSZWL4LG12r37vSL9Qo=
X-Google-Smtp-Source: AJdET5cSzcvKVqwv+DlvzGVHXRXzSVaSjTMAoT5em6tNftImt6B6b1aCPPFku2gosPh8WsE/iQWGfg==
X-Received: by 2002:a19:8096:: with SMTP id b144mr20475988lfd.8.1543333153311;
        Tue, 27 Nov 2018 07:39:13 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.52])
        by smtp.gmail.com with ESMTPSA id 4-v6sm597705ljw.84.2018.11.27.07.38.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 07:38:58 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com>
 <CAMuHMdX4cDC1ML8Wp8oT45YkjHux+uk5NMYX2BAvs=nNgm_oAw@mail.gmail.com>
Organization: Cogent Embedded
Message-ID: <64072661-0f85-9354-7792-fca7214cb450@cogentembedded.com>
Date:   Tue, 27 Nov 2018 18:38:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX4cDC1ML8Wp8oT45YkjHux+uk5NMYX2BAvs=nNgm_oAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/23/2018 03:55 PM, Geert Uytterhoeven wrote:

>> Add the RPC clock for the R-Car gen3 SoCs -- this clock is controlled by
>> the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970).
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
>> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
>> @@ -409,6 +409,121 @@ free_clock:
>>         return clk;
>>  }
>>
>> +#define CPG_RPC_CKSTP2         BIT(9)
> 
> This bit is for RPCD2, so technically it should be part of patch 3/4.
> Perhaps you can merge both patches, and absorb the non-SoC-specific
> parts from patch 4/4?

   Done!

>> +#define CPG_RPC_CKSTP          BIT(8)
>> +#define CPG_RPC_DIV_4_3_MASK   GENMASK(4, 3)
> 
> Unused

   I'd like to keep it for the sake of completeness...

>> +#define CPG_RPC_DIV_2_0_MASK   GENMASK(2, 0)
>> +
>> +struct rpc_clock {
>> +       struct clk_hw hw;
>> +       void __iomem *reg;
> 
> As this register should be saved/restore during system suspend/resume,
> you should add
> 
>     struct cpg_simple_notifier csn;

   Done.

>> +};
> 
>> +static long cpg_rpc_clock_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                                    unsigned long *parent_rate)
>> +{
>> +       struct rpc_clock *clock = to_rpc_clock(hw);
>> +       unsigned int div = cpg_rpc_clock_calc_div(clock, rate, *parent_rate);
>> +
>> +       return DIV_ROUND_CLOSEST(*parent_rate, div);
> 
> Given you set CLK_SET_RATE_PARENT, shouldn't you propagate up,
> cfr. drivers/clk/clk-fixed-factor.c:clk_factor_round_rate()?

   Frankly speaking, I'm not sure when I should set that flag...

[...]
>> +static struct clk * __init cpg_rpc_clk_register(const struct cpg_core_clk *core,
>> +                                               void __iomem *base,
>> +                                               const char *parent_name)
>> +{
>> +       struct clk_init_data init;
>> +       struct rpc_clock *clock;
>> +       struct clk *clk;
>> +
>> +       clock = kzalloc(sizeof(*clock), GFP_KERNEL);
>> +       if (!clock)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       init.name = core->name;
>> +       init.ops = &cpg_rpc_clock_ops;
>> +       init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
> 
> I don't think CLK_IS_BASIC is appropriate?
> 
> #define CLK_IS_BASIC            BIT(5) /* Basic clk, can't do a to_clk_foo() */

   I still haven't found where this bit is tested... and I got an impression everybody
just blindly copy&pastes it...

> 
>> +       init.parent_names = &parent_name;
>> +       init.num_parents = 1;
>> +
>> +       clock->reg = base + CPG_RPCCKCR;
>> +       clock->hw.init = &init;
>> +
>> +       clk = clk_register(NULL, &clock->hw);
>> +       if (IS_ERR(clk))
>> +               kfree(clock);
>> +
> 
> For save/restore during system suspend/resume:
> 
>     cpg_simple_notifier_register(notifiers, &clock->csn);

   Done.

> Hmm, looks like I missed that during review of commit 381081ffc2948e1e
> ("clk: renesas: r8a77970: Add SD0H/SD0 clocks for SDHI"), too.

   Want me to fix this?

[...]

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
