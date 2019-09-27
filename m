Return-Path: <SRS0=fPJi=XW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A24C4360C
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 13:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16A2E21841
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 13:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jib1Vio9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfI0N6l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Sep 2019 09:58:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44123 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0N6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Sep 2019 09:58:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id i18so2832114wru.11
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2019 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=gII68bP4dZ9iYMhUx7xHDSWnoKBKHppjR8OxdRxuXBw=;
        b=jib1Vio9p2uFXLtUzi6lfZKzVGWkziSLDW2+TRSJFGk6PgvdnLiOEh2A4ORdDfaL/6
         3uLg4fyINURnKSKJATlRUCzv07Rs/SJISz5rR4j4akSghw4SPPBtkiWOwIJpajnSVcOe
         WHWuUrGtYlk3nahK60v2BFXzYfA+3KFiaIkruKQVCQcTIZImNru0PuBFCBa4DJyDiGKa
         j3C1qJdA3ZniSFVahofA1sTCU65ji40vYu/fNYmhnq/b6VbO3ChdzOBrzGJcgLwz01MP
         /+bgNfXwtE+4D6EGE8iVLI9zTgAaSoW/bkxNCuYB2Djz3f+WpwX+Ury8d+/SsQQ7Zw0S
         2swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=gII68bP4dZ9iYMhUx7xHDSWnoKBKHppjR8OxdRxuXBw=;
        b=tvOi8hdQ7EywVlatOI9K0D9Eq4vNiBNMk5qvu4RFHfZABitWiLrCqNZnfNIWs+Ia57
         vCUc2f2rlxg/EPVTvGeXjpOnhbOx/qIF3teqtAf+cvvaB/BVfpzqQATRvYu/N9y6tPjH
         QBQJZz3gxH/IrQNVqkwATiyC5v4Oe5QOMZnbuzyIjxK/fEJR9AZeCGpNPmbaJ48sCqw4
         Wou5d0nFfY8cFoBMacOx0u1rKwh9AUaZ2RckjY1KuLjZNJGgqMYNRjd+enqWJeEIqtWb
         VIXzQ7PXxXqFcs8GGA80novyZiwhB1AZQ90uyevVhiT98oqEapkYmUT+F1LLS8g5uEv5
         1IVA==
X-Gm-Message-State: APjAAAVVj7q5ECJpwqxV/71hhKsP4HtWxy5lmQfWok84+dPrITErPAh7
        0L8W4bSm2KQi3u1tccvtv2BoOg==
X-Google-Smtp-Source: APXvYqwuSdVoFqaJkOuDyzzg3VoL6LNVdgNCAOB7KF6CRtWFJZG1jZiUaDvFOdDugpzHJK1GuGAddg==
X-Received: by 2002:adf:dc01:: with SMTP id t1mr3093951wri.222.1569592719413;
        Fri, 27 Sep 2019 06:58:39 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b7sm2920872wrj.28.2019.09.27.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 06:58:38 -0700 (PDT)
References: <20190924153356.24103-1-jbrunet@baylibre.com> <20190924153356.24103-7-jbrunet@baylibre.com> <b328b0c7-9449-172d-a1ed-7449023ff516@baylibre.com> <1cd21d60-5ded-2f70-3c99-02b70f996870@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: meson: axg-audio: provide clk top signal name
In-reply-to: <1cd21d60-5ded-2f70-3c99-02b70f996870@baylibre.com>
Date:   Fri, 27 Sep 2019 15:58:37 +0200
Message-ID: <1jh84x2642.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 27 Sep 2019 at 11:37, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 27/09/2019 11:14, Neil Armstrong wrote:
>> On 24/09/2019 17:33, Jerome Brunet wrote:
>>

[...]

>> AUD_CLKID_TOP seems to be missing here
>
> Oh, yes it was exposed, do you need to it to be exposed since it's
> dummy for G12A ?

It is a bypass clock on g12a and axg yes, but on the sm1.
It is the leaf of a block on sm1, for all I know it could be used
outside the clock controller.

Of course, I could wait this until there is an actual need for it if that is
what you mean ?

>
> Neil
>
>> 
>> 
>>>  /* include the CLKIDs which are part of the DT bindings */
>>>  #include <dt-bindings/clock/axg-audio-clkc.h>
>>>  
>>> -#define NR_CLKS	163
>>> +#define NR_CLKS	164
>>>  
>>>  #endif /*__AXG_AUDIO_CLKC_H */
>>>
>> 

