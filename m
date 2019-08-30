Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9286C3A59B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 14:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA65B21897
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 14:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YiPsfSYl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfH3OGd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 10:06:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41176 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfH3OGd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 10:06:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so7097125wrr.8
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2019 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=EsR85JzPdRc14+CRf3wj0nWStazxAOBjegFjmbmj/Uo=;
        b=YiPsfSYlJj5c1kvZ1j6/8kDQa2N0XSh2MsXqSywDhoWYucJkZ62yQjpsJkeIQVhaTe
         YHC5fQVtjLQ/S6ggNxFyPnmd+38kF+7o5SdNzEDa5B+pTyfen66KdEcKvxaiJqvW+qwl
         OkKb37G3vO7lqMsjTyMKrDdaQGwb23RTEDapgalAwyPfA5FiHKDkB9bj+l8DVPDQz+XQ
         ob3lvvz2aJBEj2ir1u6aq+NexBIWfPXp3wPysvq6E8AZv1bdega0bcTJEclbq2hdm4J1
         1D0+1YfGEbjltV/bFGi4HJKm/OCtNDGiKykRnBUA24GtT8amrPm/l7KysfcbQuzx0XYS
         EJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=EsR85JzPdRc14+CRf3wj0nWStazxAOBjegFjmbmj/Uo=;
        b=pzeZ4UTNaj6Yd6E/1l7aKD2x3jcn4UghbJa3ITHo2Wue4Dl5lvQBiySOgaUrv4uZdV
         F8KJJ5jxWts6RYrTK7/WKoELxHVWrfBqAqxkFx+U7eXGKQ1CwoVl+W4PhLHijaajUUD5
         uwrLANbvmyMDz0x/7e1Fe3Dfvl0m2CHdbXqG9YEWyXk2PkOsJP2U5GNxRP8uzDHX1ojM
         dp5rMQn2xedJevKHDkT+tzYcP/QHGuoydStR4kVxfuYqOZmFMdc2qgsnTQGBldN0/q5O
         R4hfYbKJ4rpk574Cu8wLMDNywL0JQzTFeVFcaSwJIOo1M7IoK5w3kpCg9kGmNk4bCxyG
         UQ/Q==
X-Gm-Message-State: APjAAAWLCljBj9zGLe5dJOamWsiHbF/xY/h6aBBgvEuUkgXbLglj5U4Z
        6uJT4CjC8Bbd2HuKMBTeBbaV93pY5XY=
X-Google-Smtp-Source: APXvYqziZJ8gjcsdx9xeS97bCetLHoX2N7MvwTMiy+67EB+n8z/ACILsO06xyjPaZaGMbJ6Fd1H5XA==
X-Received: by 2002:adf:de02:: with SMTP id b2mr19074478wrm.204.1567173990693;
        Fri, 30 Aug 2019 07:06:30 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u6sm6052438wmm.26.2019.08.30.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 07:06:30 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
In-Reply-To: <20190829171743.577932173E@mail.kernel.org>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com> <20190828221529.026C522DA7@mail.kernel.org> <1jy2zcv3nd.fsf@starbuckisacylon.baylibre.com> <20190829171743.577932173E@mail.kernel.org>
Date:   Fri, 30 Aug 2019 16:06:29 +0200
Message-ID: <1jsgpivjbu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 29 Aug 2019 at 10:17, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-08-29 00:20:38)
>> On Wed 28 Aug 2019 at 15:15, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> > Quoting Jerome Brunet (2019-08-28 03:20:11)
>> >> Add placeholder in clock core to save per clock data.
>> >> Such placeholder could use for clock doing memory allocation in .init().
>> >> It may also be useful for the save/restore_context() callbacks.
>> >> 
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> ---
>> >>  drivers/clk/clk.c            | 13 +++++++++++++
>> >>  include/linux/clk-provider.h |  2 ++
>> >>  2 files changed, 15 insertions(+)
>> >> 
>> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> >> index c703aa35ca37..aa77a2a98ea4 100644
>> >> --- a/drivers/clk/clk.c
>> >> +++ b/drivers/clk/clk.c
>> >> @@ -83,6 +83,7 @@ struct clk_core {
>> >>         struct hlist_node       debug_node;
>> >>  #endif
>> >>         struct kref             ref;
>> >> +       void                    *priv;
>> >
>> > Why? We have container structures around clk_hw that can be used to
>> > store data and clk_ops that should know to deref said clk_hw pointer in
>> > some way to access that data.
>> 
>> This simple addition give a placeholder to each clock instance that is
>> hosted under the clock core so we know it can only be accesed from this
>> particular instance. Seems like a better fit for runtime data, such as
>> saved context.
>> 
>> It gives a way to avoid mixing the clock description and its runtime
>> data. In the end, It would be nice if the clock description part could
>> be made const.
>> 
>> This is a (fairly usual) way to do it 
>
> Maybe you can provide an example or usage? Is that the last patch in
> this series?

Yes, I thought that was in my cover letter

> I still don't quite understand why we need this.
>
> I imagine that if you wanted to have a const description part you could
> have a container structure around the clk_hw struct
>
> 	struct my_clk_foo {
> 		const struct clk_description *desc;
> 		<runtime modifiable members>;
> 		struct clk_hw hw;
> 	};
>
> Did I miss something?

Not really. As with all C code, there are many way to do things.
Your way could work, mine too.

As explained in the previous mail, what I propose guaranteed to specific
to each clock instance. It's a fairly usual and simple way to give a
placeholder to the instance of something.

Things gets complicated with your way if the clock declaration uses
static data and there there multiple instance of it.

In the end that was merely a suggestion, so let's spend to much time on
this. If don't want it, that's fine. I'll just drop it.
