Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04704C2F420
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:51:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA4452085A
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548082295;
	bh=fLdKfOn4BliuN7R6mbtpMmVjZ5MOnLQI5J+WH1z2qHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X/KU2mddlLg8QyAz/oez1WpFg1IBsq5/lxErXX4D8R2wfh1CWedz2x0DnUCoqmQ9s
	 Rbio5RZlHGhrYfEJCaZAykyT0FTd3ESQgbLNIWWYpxfBdJBQD3pLGJWBy7ywqsRnIs
	 EPJlx63rMOA9bt17pIXw/IRDlAWaS84e+Ua52jwg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbfAUOvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:51:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37511 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbfAUOve (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:51:34 -0500
Received: by mail-ot1-f68.google.com with SMTP id s13so20749688otq.4;
        Mon, 21 Jan 2019 06:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y0JrTWtBtKyvw5tUEVkCRYsetRw1li3o7dvMLdy8A+U=;
        b=dtiLkz7yXKnhY7mNd3S9F65HOWgq5F/LOogpHuGcerSpMUNqKGlukKReKpl4ELlU+L
         PuyijziOgU6ywtXTeUqoCBt+9QWX1/5CSNZUb8YrTQfqrTNXSMR26VaD7T8+z92fCNOt
         4+3khRQurhPtXG8GcBY9EtRB1/fCRdbUApdRfEr5G3mylRLTbKGB+OuOL8tg3IlDApmE
         N+6KwXwKyxC9rUmDDiUXmnYbjHryq/fpYTsGUtJZJ8TJUwsQwpJtRtupGylSMT7Z2OxZ
         7izFyastqKkzKV/aWVYRsMYHNv06kZxHwGVBRhNymddTibBRKwTq6bTuFf4XnA2ICROt
         7jTw==
X-Gm-Message-State: AJcUukexK28mCmUmOHAyqZe/oz/L9FjN6qXtQ2nUTqIaLa8kemKq3Si1
        wx5+Lkzm0z81IOcXVl/lFg==
X-Google-Smtp-Source: ALg8bN6Reuy82+PQnRJ6nBNGinYh4PuTBcm5Ixok//dql3F4kJlqkg0UApSbi2W9gZi3J8Xw2BHAVg==
X-Received: by 2002:a9d:3de2:: with SMTP id l89mr20066943otc.239.1548082293875;
        Mon, 21 Jan 2019 06:51:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m133sm6067594oib.52.2019.01.21.06.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 06:51:33 -0800 (PST)
Date:   Mon, 21 Jan 2019 08:51:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chanwoo Choi <cwchoi00@gmail.com>
Cc:     Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Message-ID: <20190121145132.GA19195@bogus>
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
 <20190118131639.17578-1-k.konieczny@partner.samsung.com>
 <20190118131639.17578-5-k.konieczny@partner.samsung.com>
 <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jan 19, 2019 at 09:40:10PM +0900, Chanwoo Choi wrote:
> Hi Kamil,
> 
> This version only adds following two clocks without that other clocks
> be included in imem block.
> - CLK_ACLK_SLIMSSS
> - CLK_PCLK_SLIMSSS
> 
> Usually, the users only refer to
> 'include/dt-bindings/clock/exynos5433.h' in order to get the supported
> clocks. It means that if there are different between the clock list in
> 'include/dt-bindings/clock/exynos5433.h' and the supported clock list
> of drivers/clock/', it make the confusion for users. So,
> 'include/dt-bindings/clock/exynos5433.h' have to define the only
> supported clock ids.
> 
> Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.

And add clocks 1-by-1 instead? The binding headers are a pain to merge 
because they are a dts and driver dependency. Having a complete header 
is preferred unless there is doubt in the correctness of it.

The driver can warn users about unsupported IDs.

Rob
