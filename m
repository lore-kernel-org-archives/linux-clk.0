Return-Path: <SRS0=WhJS=OG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB99C43441
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 17:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B79DB205C9
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 17:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="b0oKEgoc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79DB205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbeK1En5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Nov 2018 23:43:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34083 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731724AbeK1En4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Nov 2018 23:43:56 -0500
Received: by mail-lj1-f193.google.com with SMTP id u6-v6so20850949ljd.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Nov 2018 09:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y8Yfu5ZkEWh1OegY0oj2NFxxQ6IJI9lWU7PmghtIG28=;
        b=b0oKEgociilWkWUU1F+vVSiEtM2sQyuuD1KW7+fbEJMbnAHH9x9XdgrpaC9Eubhatk
         w7HH0tfdcZavm1Mz6GmcvI3e3EwQUEMW2WRqXpsAF0rjjBzB0vmVnMVZgPJAA7Syi79V
         bggqnGNLfOaF9tjZA2WB3A4Rjfm/JmJ3iBiylcjjroI4Y3xgp8E0KjFfvqkGADZ3UQFB
         0Gdj+67D1UKzae8sln5M59CwrssaQtNkwi/wKVmDAzuWnRReCxMhh7icroQ80DFCiOqC
         fJOEcCRZX42UGvfX9vh2gl6jORRG9s+7w6/YjjP0TQURUc6YPeBwamjFE3NPKyma/cXr
         mVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y8Yfu5ZkEWh1OegY0oj2NFxxQ6IJI9lWU7PmghtIG28=;
        b=SqqOVfP+eLMtXe4cgStCu27uaO4dz6BLHBv7224FHwrwN3XGWGVqjF6+GZ1mX6LK+6
         OUeWBDgDgy2paOyBjjjCUIRlwLGJpDZnEgc+oNp31TUlE6i0JZJDwGDax1sggNN+px3b
         uI0xez+/l5rhRaixphT4NPuPBZ5Pe4ghsKMFYjrZsN5rg+MiiZyPoKFffdWl138DHoNR
         QzXW4g3KBDBsQgiba+Y0qwqMjK4QN4DFkHj8OoETHGPL9XcDvXRR5zj8yNcawzMb3mFR
         2xichSp/fmBGj8ANQWjBuyxjQVZN67xkkqkcKksU1yG/nzTuH5D+50tAJHmZLMd4LHct
         kpAQ==
X-Gm-Message-State: AA+aEWa+6Kp5qlB7mVBL18ckIbCdjtKNxS1gYGnzvtd3wVGvFx5F0cVm
        aD1R3LFef44WAZ2PbP/K+A2bF/4pheo=
X-Google-Smtp-Source: AFSGD/X8NtgmSYRdj6lr3SpVa3AW4DnGpd9FguKMXOOY+5f8zu715XxqkXFHEaMXFpBeqROvspjnDQ==
X-Received: by 2002:a2e:3012:: with SMTP id w18-v6mr20300645ljw.75.1543340715804;
        Tue, 27 Nov 2018 09:45:15 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.52])
        by smtp.gmail.com with ESMTPSA id j25-v6sm667216lji.77.2018.11.27.09.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 09:45:12 -0800 (PST)
Subject: Re: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com>
 <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
Date:   Tue, 27 Nov 2018 20:45:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/23/2018 03:59 PM, Geert Uytterhoeven wrote:

>> Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
>> by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
>> but the encoding of this field is different between SoCs.
> 
> Given the tables and encoding are the same on H3, M3-W, M3-N, and V3H,
> I think it makes sense to move the common support to rcar-gen3-cpg.c.

   Done.

> Heck, you could even just select a different table on D3/E3 using
> soc_device_match(), if only one encoding would not select a different parent
> clock :-(

   Indeed...

>> Add the RPC[D2] clocks (derived from this internal clock) and the RPC-IF
>> module clock as well...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
>> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
>> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
[...]
>> +               const struct clk *parent = clks[core->parent];
>> +
>> +               if (IS_ERR(parent))
>> +                       return ERR_CAST(parent);
>> +
>> +               return clk_register_divider_table(NULL, core->name,
>> +                                                 __clk_get_name(parent), 0,
>> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
>> +                                                 cpg_rpcsrc_div_table, NULL);
> 
> Don't you need a spinlock (last parameter, currently NULL)?
> This needs to be synchronized with controlling the RPCD2 and RPC clocks,
> as they operate on the same register.

   Indeed. How about the RMW accesses to the other register? I'd like to place
the lock/unlock right in cpg_reg_modify()...

> However, that would deadlock, as enabling e.g. RPC-IF will enable
> all parent clocks?

  Could toy please elaborate?

>> +       } else  {
>> +               return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
>> +                                                 notifiers);
>> +       }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
