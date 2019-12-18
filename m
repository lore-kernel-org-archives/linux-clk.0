Return-Path: <SRS0=818c=2I=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E992C43603
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 18:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24192218AC
	for <linux-clk@archiver.kernel.org>; Wed, 18 Dec 2019 18:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Vg78AXxG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfLRSBy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Dec 2019 13:01:54 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33866 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfLRSBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Dec 2019 13:01:53 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so2370895lfc.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Dec 2019 10:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wbOw61ub2QZR5UfVl5vQOrD9xSXq72V2Ul/qpCmdZt4=;
        b=Vg78AXxGe+bexbffzwNcmQHVU3Hl5ShytUl+R7mjL/uWGW7J09LYQYn8RepvoXG1zj
         JMYePSp2Y2Us6QxSFr8rrAJ1bMeL/gvokggiamGgBF9z8JxUzzp+rU0vNUBMt+kqsXWI
         SAYQxwwn2dwde+spxXjHYD/BI/VuH2PvqD5GipvTZmFpp/NvFKN7PN+hzxKh2hOPcZqw
         0G6DWMf4ZF4A374I0Njh6Ln5MJoKl+zzHhjwGfx+XS/sDsmQy3OIVgjvRi5YvgbFNKa7
         McLXo8zJUVdhUYDOT77u6CBuYYIVYi/OLld+CtoqPU7MMpcRKRR4ysbx7tvxW3aIYtHn
         9wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wbOw61ub2QZR5UfVl5vQOrD9xSXq72V2Ul/qpCmdZt4=;
        b=B1nxunYS/2sS1Hh2UM9oJMqm2R1kdc1e8jRZl5qh2JnVJBAQaExPfSSQ7pbgVggsgj
         3pTHEmvs9iW1SnVnZPb4ZMFmLljxMl1aUOvXLX96vLSY4jvVnrPoNFdxWdp0wwzK1c5L
         WEFGiAfDQy/qE07hIFv2od/UhnwxSmuHRsllcV7E7B8ROrHAnqM22P0xzKfoFfyJrfFF
         EQuON0ux5f/y4s2wu0bPkeBFscXJMBJs06fnhsDEgt0+ZhlROMcT4A2aRPRrnuHy8xDN
         ba7HrkGV6v2WM5hQ/g9HXfb8o7jsKSSnVF/l1svQ7YN82+hBH0huI9qGh5ukxB9XWphw
         ZWNg==
X-Gm-Message-State: APjAAAVLyHgs13Wy3c7CYDVrzW1c4MkgGo8d8pdvqT1fXGqvc+E0bLO0
        juduY6hVwdjgfLmdsTOWGpOcHw==
X-Google-Smtp-Source: APXvYqw7yyxFQAXo7vKA2w7ulRNGvCyv56rfhdpT5ejogTv6wRACLm66i8wHVY98PrQ1Yjcn1Hyyvg==
X-Received: by 2002:a19:e011:: with SMTP id x17mr2462253lfg.59.1576692111923;
        Wed, 18 Dec 2019 10:01:51 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:48d1:e89a:1bf6:a9f0:1b42:e170])
        by smtp.gmail.com with ESMTPSA id i13sm1532470ljg.89.2019.12.18.10.01.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:01:51 -0800 (PST)
Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
To:     Biju Das <biju.das@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
 <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
 <OSBPR01MB2103DDF07C530B24DCD2BE4BB8530@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f22fc0c9-c74c-0d1f-4abd-8969b806b5dd@cogentembedded.com>
Date:   Wed, 18 Dec 2019 21:01:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103DDF07C530B24DCD2BE4BB8530@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/18/2019 03:49 PM, Biju Das wrote:

>> Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
>>
>> On 18.12.2019 14:09, Biju Das wrote:
>>
>>> This patch fixes the typo %s/r8a774a1/r8a774b1/.
>>>
>>> Fixes: 1000393 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1
>>
>>     SHA1 should have at least 12 digits.
>>
> Ok will do.
> 
>>> binding")
>>
>>     And never break up the tag lines please.
> 
> Do you mean ,  do the changes like below and ignore check patch warnings?

   checkpatch.pl doesn't complain to me, even about short SHA1...

> Is it acceptable to everyone?

   I remember e.g. Dave Miller complaining about breaking up the "Fixes:" tag --
I think it breaks patchwork. Looking at Documentation/process/submitting-patches.rst,
this format is even codified...

> Fixes: 10003938a0c64c2f0d89 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding")
> 
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> [...]

MBR, Sergei
