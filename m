Return-Path: <SRS0=y/Yu=2D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C934C80D53
	for <linux-clk@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96FFB2477E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Wf74l8Ix"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbfLMTiI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Dec 2019 14:38:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40890 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfLMTiH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Dec 2019 14:38:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id i23so121085lfo.7
        for <linux-clk@vger.kernel.org>; Fri, 13 Dec 2019 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z37SzlIoJKStek3sBx3e5x0PeuU+jen6IoWuzj0LlRY=;
        b=Wf74l8Ix59J5juff5EOrHMEvfDWgZW4635XgkUSeInMvgcVvrWf2Pz104rVk7D32Cb
         HrerwrX7j8sXYmax2ZArXtf5XMlbrO4GcNomBFbMdf/rdtPmQVmf9Ea3jXSd+b+qMvGg
         jGGYLN+EOOMOO5FAMtarTeaDuY2E9xS2z8laewA4Stp04oH78eEEG7MRzEE3V7vX+3U5
         objPkM0UbshTJ68gn2FPe9r25ONs1c5FnnxzxXqP7BI/bucWBBNZyDCYh61RU1L/KXF9
         PRL86m3rZuA6mu5+YIprrC5smGRyNLusTbHG2Q0phaokKdvDMri9yI2NaSlkXMkUcpY4
         9G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z37SzlIoJKStek3sBx3e5x0PeuU+jen6IoWuzj0LlRY=;
        b=a1+GFzxN5EFISqyNYDSiSQEFRpvsz+NiR04JznerkRhMfSzGSgl3nRHph0AjPJCU5S
         qPwQiMHPk+ZAMiSEyWT7E2WcnmCmW3PSx7a2zYeD0NeuDrjBMBv0lPeK3fqo6vw55zqc
         JCwqCkS6zV+S60t4ctmCL/X+mn1QFnO8orsIPNPss7rUh83z/2jF8Uo9eS/47rit++5j
         p8un4qJhQw0mIbaucfyiobU79cDV3oKg/Mso/1zeJPG+gxrivQIxjBp3ppKBohbXPqBW
         PdDm7Qqx+4JCwnGAUoHaXAvJRypxPofFGyh8fhgeak2GfZ9M1Ov+kHDjjmhZzNqw1P3x
         z99Q==
X-Gm-Message-State: APjAAAVhm62xNk+ynvAw/Wf0BLX+VL5aUqgV79OelM9eAI0mBoPrXmqt
        3mmNoIOJPkQESB/N+odXDrn0xg==
X-Google-Smtp-Source: APXvYqza2g9G+gSblMpYKp/ErAc7DpeGiFstUvcuOqX/yw4cCkmM4HNxWx5XWhLyB1XO+NFBd2/3og==
X-Received: by 2002:ac2:5983:: with SMTP id w3mr10095961lfn.137.1576265885537;
        Fri, 13 Dec 2019 11:38:05 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:42e:41d4:b11e:4c1d:868f:dabe])
        by smtp.gmail.com with ESMTPSA id t27sm5432628ljd.26.2019.12.13.11.37.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Dec 2019 11:38:03 -0800 (PST)
Subject: Re: [PATCH v2 1/6] spi: Add SPIBSC driver
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-2-chris.brandt@renesas.com>
 <37c13497-d20f-583f-72d7-1e3c8a241990@cogentembedded.com>
 <TYXPR01MB1568ED4D40CEC399E64F6A2B8A550@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdWCgOsj_ZWF-+f-5XjZU9RSCm6Ww3gBmYQeSGz0B77_ig@mail.gmail.com>
 <TY1PR01MB15625260CB3CE48A3FBA11058A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0e0483ff-61ca-b623-7ea3-e8e4999e82e4@cogentembedded.com>
Date:   Fri, 13 Dec 2019 22:37:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB15625260CB3CE48A3FBA11058A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/13/2019 05:45 PM, Chris Brandt wrote:

> I guess Sergei is using an R-Car board (I'm using RZ/A2M).

   Renesas V3H Starter Kit board, to be precise.

> Chris

MBR, Sergei
