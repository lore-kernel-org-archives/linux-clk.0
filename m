Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C6FC04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 08:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F05752146D
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 08:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QkLKbcQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05752146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbeK3T3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 14:29:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39260 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbeK3T3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Nov 2018 14:29:40 -0500
Received: by mail-wm1-f67.google.com with SMTP id n133so4761561wmd.4
        for <linux-clk@vger.kernel.org>; Fri, 30 Nov 2018 00:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0wD9gDshHhzdMFRbHnyZdYitDYxbEvX7sX98YAJ7oAw=;
        b=QkLKbcQZG9okA6AyJaqzD3K0XxmMG4NfQsB63ZEME1duMyj+hhr5o31Pq0F/rFjm5g
         hTFXl25ErABvZxE3/U6tZjDLfSwqFX/cn7+VL3pATA3383QIFEY9Sh/WsRhdX3NBHQAT
         hqjLZf4vY7EJDb+nOFmiTYr6lB76zXdMdpJWCUbh6/9ETCOjVehnZEquUhi5qtE+uMLK
         K3zkO7d5+46/MsR6nrWMG4ZpfWZzMQ7Er5RRqiwrHA2WZYnzBsXjH8jgdMbQbZDtrHHo
         VlN+mk/KgPOG957S3i2VIzSpwf/r0tBl/UQUg1dHo/Eg+xlaw0elIz4oD2vwNNv+TzYC
         qpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0wD9gDshHhzdMFRbHnyZdYitDYxbEvX7sX98YAJ7oAw=;
        b=qJuk49TBLUn/Yh42HIwCgrPp44GeshxIldUOWMqnO6b9ljWXjg8hclAf5qUGQCjIRQ
         Og9WPe9dtLZvZrB5RO2taVp5fbQMIaZcdRE1gCRbz3RdeO/lyttxH4O7UcXhl2NxnytC
         JgxIpg3iagdXdxqhVrn6qM2iojW/qGTvAGPKzWEDeJpV4ZjJB9o/aUQPt77qVLFoABIB
         fD9k9EE6cgIpBHlYPQfWcey0rQB1iYrTf25Id+zPE51rqXq+Dm+ltmFZm+XvXbaFm5Vh
         8NmL/llHfz6HddpRZturGb+RkWW+2cxrSPc7wlZnQ6U8yLkYjlzLlCFeSATcmnRJeLz0
         ERnw==
X-Gm-Message-State: AA+aEWaHYfiZ+VrCcMFKPok8/TCjTx0cMrepa/GqLsLG0NaLaCwDv0Ks
        X+qJQrLPG8kTqhEr425P1mIAsw==
X-Google-Smtp-Source: AFSGD/Ub3L9aGKVDeE6nF13MmqfxEamyMuH5HRXIZHEnYhHxnQSK9/wYHyKMuEblcVsoP+6e9cqwjQ==
X-Received: by 2002:a1c:dfc1:: with SMTP id w184mr4426327wmg.2.1543566068250;
        Fri, 30 Nov 2018 00:21:08 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id l13sm8843036wmb.27.2018.11.30.00.21.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Nov 2018 00:21:07 -0800 (PST)
Message-ID: <42372fe968835e59dae6aa1ce726b694f8a16a39.camel@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: clk: meson: add main controller clock
 input
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>, Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 30 Nov 2018 09:21:05 +0100
In-Reply-To: <154353500665.88331.5525788751558555940@swboyd.mtv.corp.google.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
         <20181129164524.18670-3-jbrunet@baylibre.com>
         <154353500665.88331.5525788751558555940@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2018-11-29 at 15:43 -0800, Stephen Boyd wrote:
> Quoting Jerome Brunet (2018-11-29 08:45:23)
> > Add the clock input of the main clock controller
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt 
> > b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> > index e950599566a9..79454869f96d 100644
> > --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> > @@ -9,6 +9,8 @@ Required Properties:
> >                 "amlogic,gxbb-clkc" for GXBB SoC,
> >                 "amlogic,gxl-clkc" for GXL and GXM SoC,
> >                 "amlogic,axg-clkc" for AXG SoC.
> > +- clocks: phandle to the input clock of the controller, presumably the
> > +         platform xtal.
> 
> Any reason to not have clock-names? 

Not really, I did not bother because there was only one input clock.
I can easily fix this

> I'd prefer to have them because then
> we can easily hook up providers with their parents based on strings. I
> suppose we'll have to support both modes of strings and numbers for
> connections, but that may be more for legacy reasons that could be
> avoided here if a clock-names property existed.
> 
> >  
> >  - #clock-cells: should be 1.
> >  


