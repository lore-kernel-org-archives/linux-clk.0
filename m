Return-Path: <SRS0=q5Yd=OZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2C6C43387
	for <linux-clk@archiver.kernel.org>; Sun, 16 Dec 2018 17:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19B53206BA
	for <linux-clk@archiver.kernel.org>; Sun, 16 Dec 2018 17:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJ9wJRtp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbeLPROe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:14:34 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54627 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbeLPROe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Dec 2018 12:14:34 -0500
Received: by mail-wm1-f67.google.com with SMTP id a62so10106175wmh.4;
        Sun, 16 Dec 2018 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CBmA82j01timjeeuqbduSdDWCwV27ZThKbESNT7LpTc=;
        b=dJ9wJRtpTynrcTMy+TnV/MaIcAPQ/Q36XOYI2z96/YlZsdVvfdunPp6zSZ9Xq4hd9t
         34VSefuG1vX9T5CMn7B0Pao7i9o8SiSamDiPd3B+INow4YA2Q9o+0AOKIVIl87XSKauL
         i3l2UkIOuGBMve/bMTXtVJLxAskXzqXocBpwMkB9PX3586qvg/QamW+tv8YurCnywRQ2
         hj2RpQrdl4MykBrAWEG19/+t71V5iy1dGLpCgSFFRaom2H+2Ee1FifFVw8WKzbbblTNJ
         BwVr8SRw423Dd78ZQrCepWqjPoP+pmR+6PEINgbWYh7YPeaLb85JQEnkODn15GADY6+k
         a+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CBmA82j01timjeeuqbduSdDWCwV27ZThKbESNT7LpTc=;
        b=gEimE8KyVjhThQszBXN9i7sEL4capMwra+by/NO70aAyymkfgfGwiHEgHYR23iVVW1
         tW+waoX9OW4a4E8+Jzvy5/LkYOTuHmG7Dc2rH8aX8m72HclqYapfW7+Q5Cl6Ah1kEi+I
         bokhvV5fQhZjuwea+aTgwcSGmsISXylZPdvhswdXaDVRsFP8bUsVisxZ8pVwdfL7Amvq
         Mm+qCEmqpiqXSRWIRYFZ622KQRDyg7fXOT91r1ReqvZLgfCyiqyyUYJ57AcP5KxNYH9i
         Z4kMfoM0P5rjHpAcSR0cnkZMdI7tuHIrA2IFx5iihqaxjx7bhnSd2fD2r+E7QUiFxLld
         lF3g==
X-Gm-Message-State: AA+aEWYYZLC6bOlp94I8tXeEFNY7IiGzTMYynXPE2ECy2i3s/CRYx0Mb
        vlgMZq0gZ5USw753bFaKSQk=
X-Google-Smtp-Source: AFSGD/W+mAlnHwe9K7VewvFNaQg9iacRtrsn0TjhFuby/gA/FHkqMQvWgcjC0H8ftGBmMustXHRUyg==
X-Received: by 2002:a1c:ae15:: with SMTP id x21mr9012519wme.146.1544980471897;
        Sun, 16 Dec 2018 09:14:31 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id n15sm19485618wrt.21.2018.12.16.09.14.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 09:14:30 -0800 (PST)
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream
 clock
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
 <13438812.kSL9ZioSIq@avalon>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3220bca0-486d-08a8-7575-34c961ed1261@gmail.com>
Date:   Sun, 16 Dec 2018 18:14:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <13438812.kSL9ZioSIq@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/16/2018 08:19 AM, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Saturday, 15 December 2018 02:55:19 EET Marek Vasut wrote:
>> In case the upstream clock are not set, which can happen in case the
>> VC5 has no valid upstream clock, the $src variable is used uninited
>> by regmap_update_bits(). Check for this condition and return -EINVAL
>> in such case.
> 
> Note that the probe() function will fail in this case, so vc5_mux_set_parent() 
> won't be reached.
> 
>> Note that in case the VC5 has no valid upstream clock, the VC5 can
>> not operate correctly. That is a hardware property of the VC5. The
>> internal oscilator present in some VC5 models is also considered
>> upstream clock.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Alexey Firago <alexey_firago@mentor.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> NOTE: This is an updated version of:
>>       https://patchwork.kernel.org/patch/10731699/
>> ---
>>  drivers/clk/clk-versaclock5.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
>> index 5b393e711e94..b10801506518 100644
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8
>> index)
>>
>>  		if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
>>  			src = VC5_PRIM_SRC_SHDN_EN_XTAL;
>> -		if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
>> +		else if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
>>  			src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
>> +		else
>> +			return -EINVAL;
>>  	}
> 
> I'd rather go for Stephen's approach if the goal is just to silence a warning 
> for a condition that can't happen in practice.

Sure, probe will fail, but it's safer to handle the possibility that
probe() is broken and this code is reached by properly handling the
failure instead of doing something obviously wrong (like configuring the
hardware with value 0).

-- 
Best regards,
Marek Vasut
