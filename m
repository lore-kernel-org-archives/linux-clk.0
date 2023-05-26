Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A87AC77B73
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 16:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236898AbjEZQqM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 12:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjEZQqK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 12:46:10 -0400
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A8DD3
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 09:46:09 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53482b44007so633657a12.2
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685119568; x=1687711568;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ7xESGkDIP+gv/TyxcTjr26EqMcpWBeDTIWa0uSfo8=;
        b=V3H+ZZpWu0yGz4hJSW4l4P2ZSHYNFR1hBBZJ122pNMNeVsXWWOC4KSebELvZeP+aAb
         mS6nNS/u8pbldpJs4MYDPNcBNgpIwv3bjruukJS9TZZZOsa9lpli8hue4DuD6rUWi5xv
         +QPPB9ZKOsQo4fiJD5yNgnDRefMcY2dhkceP78kqHUZPwMf3dt5K2sQD0z0zTO4lxs4L
         7oXJ5GO/IVnnYN24FY369OIzWhX1hYZgcSeNvh4L/9LYr4GHxOPzaTOmY0F/Pi57/yua
         zfe40pOIV2Fj5Ux3BYaBVTBoN2aOktGdIbh/XfV+EnPqfY9Uv/93RPA3HvTomCi5sg0P
         PnAw==
X-Gm-Message-State: AC+VfDyp6UwVJh1v2dKfHF6lanCTi1oyn/svTMt6UdhXa5NCq2pNMEbn
        UbZ7zJfSlmYXJgLFhknsqPp/0A==
X-Google-Smtp-Source: ACHHUZ7Xubhmddh9lHC80YV+z3qVxVDPAYZeGbq4cA+Ll4YhSqJ35CM4QoUFgfB49VTsdGyJNaRudw==
X-Received: by 2002:a17:903:4282:b0:1b0:fe9:e57e with SMTP id ju2-20020a170903428200b001b00fe9e57emr2665913plb.0.1685119568432;
        Fri, 26 May 2023 09:46:08 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id jc21-20020a17090325d500b001afba6edc8esm3481642plb.166.2023.05.26.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:45:48 -0700 (PDT)
From:   Kevin Hilman <khilman@kernel.org>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
In-Reply-To: <20230523114618.laajn2et5nbcxszv@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
 <20230523114618.laajn2et5nbcxszv@blmsp>
Date:   Fri, 26 May 2023 09:45:47 -0700
Message-ID: <7hsfbjxcqs.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Markus Schneider-Pargmann <msp@baylibre.com> writes:

> just wanted to ask if I need to do something specific for it to go into
> a rc? Sorry if I missed doing something for that, I haven't had to fix
> something in an rc that often before.

I think the  Fixes tag is enough to indicate that.

Steven, is there still time for this fix be queued up for v6.4-rc?

Thanks,

Kevin

> On Thu, May 11, 2023 at 03:32:26PM +0200, Markus Schneider-Pargmann wrote:
>> The given operations are inverted for the wrong registers which makes
>> multiple of the mt8365 hardware units unusable. In my setup at least usb
>> did not work.
>> 
>> Fixed by swapping the operations with the inverted ones.
>> 
>> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>  drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
>> index 6b4e193f648d..6d785ec5754d 100644
>> --- a/drivers/clk/mediatek/clk-mt8365.c
>> +++ b/drivers/clk/mediatek/clk-mt8365.c
>> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>>  
>>  #define GATE_TOP0(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr)
>>  
>>  #define GATE_TOP1(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>  
>>  #define GATE_TOP2(_id, _name, _parent, _shift)			\
>>  	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
>> -		 _shift, &mtk_clk_gate_ops_no_setclr)
>> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>  
>>  static const struct mtk_gate top_clk_gates[] = {
>>  	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
>> -- 
>> 2.40.1
>> 
