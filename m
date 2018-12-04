Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB43C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A37762082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fc7Ahpkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37762082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbeLDTzP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:55:15 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38403 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbeLDTzO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:55:14 -0500
Received: by mail-wm1-f68.google.com with SMTP id m22so10629456wml.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JCd78kTlXEdX9E5erBY0ilUCW6utRcMvi/ZMHwzOC4M=;
        b=fc7Ahpkr6Q4IuGJdnnWvEgSzucyIFImnF5Hq20JY2aXgcDaD3yemmAVSkgK0fXKQFu
         Rz5WSBuIvu8Qvx0/DIeR91ZZW7BaVouvxzLgWWkMy3fYYvsdHvcMQMoM/1MNoVS7/agR
         RtMlyzAkKa4N866c6RuL7sVNNQdiGjh9NMWSxJ8RCvja5Na4yMaqMYjyDvarDNA5KgNE
         SM8cUzOOYf/1rIiFTbp1hqatyMVDS5AHXwo4+GnLbL6z5mzIbIuKWuzBCya+yHn992Fd
         sGTQHNWGW8DRTp5CaWZdOmtGygWIwCGSEgEx/HmV9O9nQ0CW12Ii555lFCC+NjLjuyg5
         M2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JCd78kTlXEdX9E5erBY0ilUCW6utRcMvi/ZMHwzOC4M=;
        b=s9JbnoOr8mwETd1C2Zzi5NHCgmpJAaVKJXQBkW/pCUOq5H7iUgzZVDf4WTcwaH8sUJ
         wMNk3pQTGq2Oe7pimO7DGBML7fL5NYaRJnSUxq52ZTVj66erRY2qcccO9t15jnllRexS
         hDx8Ygn3o1uxT4ZwWj4AGVBI7+476wOrhZ8Dk7yJvFYfZ/ED5I1FlhBO1BD7HU/x6lYT
         1vQZD/dRCbCICEirsBl6JKEPHi38o7A5NLyCvoNsA64FukyaCB7nVQz1Khhi3t1f3p1n
         xy3O33qacRygDpHq5TJ2Zkh6n6Kv7ed2koU1NqRJfrlZWX9S0TYhnAz3YcPG3hwSDrPi
         T7bQ==
X-Gm-Message-State: AA+aEWb723GzGbH0CRMMTMieTqMzBHcTAmKxLGGqZMnDX48h9p3vHMbU
        qFbAVWBycA5S1ZrxeMRwd19fbw==
X-Google-Smtp-Source: AFSGD/WO2y0DeFxRHpvMnpLLNtu/eTV7pXSpHoIWuT/q4V/VtQO2VTW2DDt3G/0lRUfd+lNa//57ng==
X-Received: by 2002:a1c:4e08:: with SMTP id g8mr13194764wmh.46.1543953312911;
        Tue, 04 Dec 2018 11:55:12 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id e130sm26384574wmf.25.2018.12.04.11.55.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 11:55:12 -0800 (PST)
Message-ID: <38e17678c713c2bde0967ac34349436fffe033dd.camel@baylibre.com>
Subject: Re: [PATCH] clk: fix clk_mux_val_to_index() error value
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 04 Dec 2018 20:55:10 +0100
In-Reply-To: <154394899913.88331.6973889205055781649@swboyd.mtv.corp.google.com>
References: <20181204163403.32321-1-jbrunet@baylibre.com>
         <154394899913.88331.6973889205055781649@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2018-12-04 at 10:43 -0800, Stephen Boyd wrote:
> Quoting Jerome Brunet (2018-12-04 08:34:03)
> > clk_mux_val_to_index() is meant to be used by .get_parent(), which
> > returns a u8, so when the value provided does not map to any valid index,
> > it is not a good idea to return a negative error value.
> > 
> > Instead, return num_parents which we know is an invalid index and let
> > CCF deal with it.
> > 
> > Fixes: 77deb66d262f ("clk: mux: add helper function for index/value
> > translation")
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> 
> Thanks!
> 
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index 60c51871b04b..fc20886ef069 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -550,8 +550,8 @@ struct clk_hw *clk_hw_register_mux_table(struct device
> > *dev, const char *name,
> >                 void __iomem *reg, u8 shift, u32 mask,
> >                 u8 clk_mux_flags, u32 *table, spinlock_t *lock);
> >  
> > -int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int
> > flags,
> > -                        unsigned int val);
> > +u8 clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int
> > flags,
> 
> I wonder if we should just make this unsigned int? Does it hurt at all
> to have it be a wider type even though it doesn't match the CCF decision
> to make this a u8 for the parent index number space?
> 

I also wondered about this but since the target is get_parent(), I just
aligned the two.

In the end, I don't really care, as you prefer. Just let me know if you would
like a v2 with this change

