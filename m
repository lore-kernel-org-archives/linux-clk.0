Return-Path: <SRS0=M9OD=ZZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89423C43215
	for <linux-clk@archiver.kernel.org>; Tue,  3 Dec 2019 16:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A1E02080F
	for <linux-clk@archiver.kernel.org>; Tue,  3 Dec 2019 16:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EpZg4MNf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfLCQFD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Dec 2019 11:05:03 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33605 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfLCQFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Dec 2019 11:05:03 -0500
Received: by mail-lj1-f194.google.com with SMTP id 21so4483270ljr.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2019 08:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ISxgLk82KYg9gcCYMQW4c3ORz6YkAHuAhHBO9CgaMTE=;
        b=EpZg4MNfgVquGvO4fH/X5H+3P+UFIyXs1dvDST18rfRasIrdEob3Vz7delQ08QikL9
         HwLUZjCnZcsKyEi3G8SToHRvBaZdnFFcsPnG4k/5YWG/cwZB1DsyOMnn3iHOgJ5jBhRF
         0/tv0b27SOMfdHAAS9uvvyzYHSvJz29jXZ8Ghn8P74JIXgbqiQ8Xmf3E7xd0IOJWjYpt
         v9k8TskKjI/UpljG8OYXfqRkCLbkH8b4DSia7T8a+v1EfZoGxKC3CBVYnqYDmqJFopMg
         3Xur2LBWPfoAUY+YgoW9CnTNt3+RV4Uwq2EleIYU8L5WljjTjJj4DuITTMBVU0AW9mEM
         J5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ISxgLk82KYg9gcCYMQW4c3ORz6YkAHuAhHBO9CgaMTE=;
        b=P3DqmKeZnq3V9RRalGnZqiHCku1QGxG02OWkro/B59LaHBLKug2pxE8ANyYDVWDujU
         KxGRUBAYP5r/kHk8paVzbOSU4/zQJxliEI7X705QOWIGUf2s6VmCxN3Fd4RzpoBZfGMd
         y3iS+aYQ8RIWG9Y58wmUUzXawOvRZIWLH5wFFeDBrnbSbbAjKmHCloyAJjTQFe25FCBi
         CQQWBuwn8SmzNZRttNqYiDtrqB3gFvmNOsT+4ONB1AYU4zsjUL9PoIW3BxVvwvlFYs06
         Qxwpw2oJPdAKwnSClXWHoU+GzFptXOdNFlAdlcTHk7xWCdeQxseomQritbwnoQbqv1Vh
         BJOg==
X-Gm-Message-State: APjAAAWqT9ljJzwdKYw7/iW5Ov8XGiyjCfAobhtggJ7xAYwJaq47UoAf
        zdhvfb4z5p6Tmwq2YyohEXAONQ==
X-Google-Smtp-Source: APXvYqwyp3PFALxnKddtKsL8vY1KS7etYmE6Qhye0Iq2Sqts4Tc5bj5UbJeYQy+vhfctVJQU7uj6RA==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr3018520ljj.243.1575389101408;
        Tue, 03 Dec 2019 08:05:01 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:6d1:3848:12e:c7de:68cf:5575])
        by smtp.gmail.com with ESMTPSA id y192sm1791884lfa.63.2019.12.03.08.04.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 08:05:00 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 6/6] dt-bindings: spi: Document Renesas SPIBSC bindings
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191203034519.5640-1-chris.brandt@renesas.com>
 <20191203034519.5640-7-chris.brandt@renesas.com>
 <17e66541-41fb-26ed-c87b-15c59ab57bef@cogentembedded.com>
 <TY1PR01MB156262E8D33A0624457CAE248A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Organization: Cogent Embedded
Message-ID: <6c2cb15b-896c-e749-8b33-02da46fbc222@cogentembedded.com>
Date:   Tue, 3 Dec 2019 19:04:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB156262E8D33A0624457CAE248A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/03/2019 04:27 PM, Chris Brandt wrote:

>>> +- flash: should be represented by a subnode of the SPIBSC node,
>>> +	 its "compatible" property contains "jedec,spi-nor" if SPI is used.
>>
>>     Are any other flash variants supported?
> 
> Do you mean other types of SPI flash?

   No, I mean flashes connected via different buses, like HyperBus with the gen3 SoC RPC-IF.
If SPI's the only bu supported, there's no point saying "if SPI is used".

[...]
> Chris

MBR, Sergei
