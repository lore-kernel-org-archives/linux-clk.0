Return-Path: <SRS0=zV46=WZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1877C3A59F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 07:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3911233FF
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 07:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ff/nPKLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfH2HUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Aug 2019 03:20:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50660 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfH2HUn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Aug 2019 03:20:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so2549926wml.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2019 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=kZc/NHo004YlKF9CIe34sQFWFNpMgylLzGOWgp8K3m8=;
        b=ff/nPKLtnVxG9TQY5+B9yiSQF68cxiyxhZrhp7QzP6eaExpcP8n9L7J6i64ME4cswO
         grktIuVPg/UE9TGXFcqw6bO6+glm5qZ76r73m2ctg3Z5ZDvlO4VZe4akAbz460WlVukA
         qGw62t612/3oqEHSgNEQgO0cQRYgpanlKANbGv7yFnLM0mECCBtBrM/ieWdVEvnPnPox
         21gmNSTPcNGBuf7t4TcWuLgVWw/JId1YyGzO1Uu3aPvPB1QvV56WWSRzNaI2Flq/Rzs+
         uUOdPdLQLJW8QnEuMeOCKzXr2xx0UPgqONGSniPbXp5/55Io40QdcnOR76r4Ck5MLMg+
         oCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=kZc/NHo004YlKF9CIe34sQFWFNpMgylLzGOWgp8K3m8=;
        b=QubjRSwgkzbGVgo+EINNHXp0kEkEWuLcSK1aFibz/rcfLLjhdELe/iylcdXByVi3GT
         K3GHHZLw+vjdMl7lqsCeqRgg2gLkYBXzKfUai9qijXMfwZlAfEQ4gu0LpuVlJCTYx7+H
         S5lktIyDS1neXOfqIv8hbVTF7X0LJrDFxuo3EkZbl4gcZKAtRG3bYX3yQMMqQrn5rmA8
         SP9cO3NiMOtL/9LCYITaUXoIM7QRTyO76KGtFPyylVw+SkSpwGltYk7uBLpVVC5u5Mrp
         gk+VZFNvRvSQCQO9FnxbrtjhpNTMKGAVObboZgfiy4nxZAFiuR3qIc8fUzaF1xmZ9gXx
         NGSg==
X-Gm-Message-State: APjAAAWjQ4p5Y95gHiYA8j9qnlYn2a/dTbXuoZq7m+lCsxCsGutcZlIN
        SO+V0kIyo335RrBo4isHgul+qQ==
X-Google-Smtp-Source: APXvYqwy9G7OpUmHDBaFuQNtIw8jodkKfbRhXnuQTEfJgombFwV2GDcYfIVhu18vyvIWexUDVUSOmg==
X-Received: by 2002:a05:600c:551:: with SMTP id k17mr9659635wmc.53.1567063240935;
        Thu, 29 Aug 2019 00:20:40 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a18sm1604063wrt.18.2019.08.29.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 00:20:40 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
In-Reply-To: <20190828221529.026C522DA7@mail.kernel.org>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com> <20190828221529.026C522DA7@mail.kernel.org>
Date:   Thu, 29 Aug 2019 09:20:38 +0200
Message-ID: <1jy2zcv3nd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 28 Aug 2019 at 15:15, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-08-28 03:20:11)
>> Add placeholder in clock core to save per clock data.
>> Such placeholder could use for clock doing memory allocation in .init().
>> It may also be useful for the save/restore_context() callbacks.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/clk.c            | 13 +++++++++++++
>>  include/linux/clk-provider.h |  2 ++
>>  2 files changed, 15 insertions(+)
>> 
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index c703aa35ca37..aa77a2a98ea4 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -83,6 +83,7 @@ struct clk_core {
>>         struct hlist_node       debug_node;
>>  #endif
>>         struct kref             ref;
>> +       void                    *priv;
>
> Why? We have container structures around clk_hw that can be used to
> store data and clk_ops that should know to deref said clk_hw pointer in
> some way to access that data.

This simple addition give a placeholder to each clock instance that is
hosted under the clock core so we know it can only be accesed from this
particular instance. Seems like a better fit for runtime data, such as
saved context.

It gives a way to avoid mixing the clock description and its runtime
data. In the end, It would be nice if the clock description part could
be made const.

This is a (fairly usual) way to do it 
