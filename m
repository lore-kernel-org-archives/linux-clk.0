Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211DA4C1505
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568535; cv=none; b=IYdbuc+byEBo+p/gdpfiMehiaeeBIIDb7x/ZA3xF90bL5do4piInkPv/5JjPoNcwm4GJVUKCShVTswV1EFk3RiboNbVV+XEihcsDdxUN4rgE2eeGfojrcxpHDIjUxqGMgVELQWMfZGW7rDtdTVkeXidjXqCfmXVB+H3clR1jeJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568535; c=relaxed/simple;
	bh=tQm+SUjJhqlfSnnyRbTVMTyJzx51Yfv7VQK1ltt+dY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CDLPU0uqKLzSujH1rBaAEv2cSXTESvhe4EwBzA8D2myUou8VVEpcyswdPjbfL8Du9uTaWPY7l+IZ6s7jCc9G638eGaIq81CyQgUDIKNAVrsQSz50ad92zDTb1BmaN5s04UIgvDqM+WBmI00plEh36764+fgKb6XFpTESvF1QbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V8miW70Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="V8miW70Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso9216255e9.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789568531; x=1790173331; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0uZ4BnvDof5wiqfMQXLES5jMiUYascBq/gJHlhVBLY=;
        b=V8miW70QddG/j8ICrGFb0+NrK3xjiZ+j7BL+GQD9R5la3SzC10H/rmq5S/ng9fInt/
         aiB+wlVhZGoUKvIXgLoTqRhRfLsCM8XKwRHgcFEGbaUgw+hiunI1oL4z33SoF6KrLs/B
         2tfzyDdYhR0GdbOcC4b3WRWEJtgkjP/4RMyZGDTezeeDMkbQBL6IlGzv0fV+mD/rO2r4
         rbKS/O1vs5+Bses/nTUHzgzMrIUvO3Z4QidIIhhvm3EmQh4EHIXPG5Wm978w/oZQhCs6
         7FaWy89EK86exb5UCjeatZIy+usHsOl32gBnGCqmD5GUURPGwKKkCNP/ps+k357onnk2
         txAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568531; x=1790173331;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0uZ4BnvDof5wiqfMQXLES5jMiUYascBq/gJHlhVBLY=;
        b=JKXSLms04A4EiUASMVIdxAqqNUuyDhYYGq9kcaObvleCPmmtr4OlVCr7m9LMu0W2/X
         7Bs16pRlkC+x8+kBn0wcgnlzC+bTouKj1PlWIjkaaGnTBdmTgajk8UXaFXKg2mKsnUa5
         sEOK/PSwz/Bch5LCab+aE9nYJGV6HvLRDfZGnVpC7Hek8xyERZKJBsvmbKrSySGRTLqc
         qc5BMwEth10BpxvgziBLPDfdTGl9Yx0YFh0t76vszn82f1VwNJc4iNLAyfJ0k7VfH8wq
         IbeLEkJ9DOHd+QW+C0/bOcJa6+HKJDuhpWjfZ5T8xiNUziMHJiKz3RwP3VsSBYW3KLPe
         F6WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwtLgpPmO9k6dvC3ATthsam1ij3TH06+cOmhx18SpqM6HAjOegCTQTUXQkvJWfQw32UivePM3lhgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kXahXhlRPXKGQ3JThpml7fE9bgaObYJai3/YCitGJ2MpOCDLvN
	aqHBYsJWCpry8jGhQrwOY+qWiv3n4Q3cCeqTBtzE4IaLh96lNzhO8KXXmFK2ru4IUng=
X-Gm-Gg: AYBFou2BsqgMPkdF6hiNyOIelE6LN4nrc4OcNN8XUn/1Y5loUgfpR+R/r3jV5mr+3KS
	ohlyK4BDsbg2q1FAqj10hEp5ZacOO2KU2z7BjBzcKVvvF6oqLQ/vo9huDu9ctYMAZk9DkiFZClm
	TRR0/DWveMut9W+7ZcOFJpE7VtDvwz+9NFGFSoc9iOF4dtE8Kwsnaj+4Gxx8fcgkKCNnrBy3/1p
	xnkWKrvwbcKxkDS4oW2lXVavqgDUz4GhXgHKA7wOEBLiaVS5QmzwDZAnpJrGQTleLDP/XjDD12d
	9B+IgmGTB501xVSPvIuS+Per76MOjwJqpNznbfhUupqecTS0f3DJXzvonpRPcIe3V3vzCd/rts1
	z+zOcxTcorV2lz3FP/v7UHAHQa1MN/XBqXkpeuzz/8xvnrr0Hp85sN59NVVZPvkNTwGMddpk+bU
	/B8Ad0PQgewH+XNc5rPXp2LYEN5C7aQNR6qyw++EFaCnXOddik6CAFjKzQBoRVyaCjlJQVlwzgO
	XkrUmknNpSERrNjRA==
X-Received: by 2002:a05:600c:1f96:b0:49d:243a:e4f9 with SMTP id 5b1f17b1804b1-49eb6e2c8e4mr31133135e9.10.1789568531214;
        Wed, 16 Sep 2026 07:22:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm92828195e9.7.2026.09.16.07.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:22:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
In-Reply-To: <aqpJ_pupkr8HDIz2@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
 <1jzexhd58n.fsf@starbuckisacylon.baylibre.com>
 <aqpJ_pupkr8HDIz2@stanley.mountain>
Date: Wed, 16 Sep 2026 16:22:09 +0200
Message-ID: <1jqzitcm3y.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 16 sept. 2026 at 10:49, Dan Carpenter <error27@gmail.com> wrote:

> On Wed, Sep 16, 2026 at 09:28:56AM +0200, Jerome Brunet wrote:
>> On mar. 15 sept. 2026 at 19:38, Dan Carpenter <error27@gmail.com> wrote:
>> 
>> > Callers should test the return from of_clk_get_by_name() with IS_ERR().
>> > The function returns a valid clock on success and an error pointer on
>> > failure; NULL is not a valid return value.
>> >
>> > Document this explicitly to prevent callers from treating NULL as a
>> > separate failure case.
>> >
>> > Assisted-by: ChatGPT:gpt-5
>> > Signed-off-by: Dan Carpenter <error27@gmail.com>
>> > ---
>> > There are a few other functions which look like they return NULL but
>> > never actually do.  This is one which has caused some confusion in
>> > the past.
>> >
>> >  drivers/clk/clk.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> > index f1756fe59372..a71bcf780de4 100644
>> > --- a/drivers/clk/clk.c
>> > +++ b/drivers/clk/clk.c
>> > @@ -5430,6 +5430,9 @@ EXPORT_SYMBOL(of_clk_get);
>> >   * This function parses the clocks and clock-names properties,
>> >   * and uses them to look up the struct clk from the registered list of clock
>> >   * providers.
>> > + *
>> > + * Returns: A clock pointer on success or an error pointer on failure.  This
>> > + * function never returns NULL.
>> 
>> Thanks Dan. I was about to apply the change but it feels a bit strange
>> to document what a function never does.
>> 
>> Is this a documentation that should be added everywhere the return value
>> is to be tested with IS_ERR() ?
>> 
>> What about being more direct then:
>> 
>> "Returns: A clock pointer on success or an error pointer on failure.
>>  Caller should test the return value with IS_ERR()"
>
> First of all, I just want to confirm that actually it's true, right?
> I've read the code but this isn't my background so I might have been
> confused.

I think you got it right. Instead of NULL, it should return
ERR_PTR(-ENOENT).

Looking more closely, It is not entirely impossible to get NULL. If a
provider returns NULL instead of ERR_PTR(-ENOENT), we will just pass it
back.

clk_hw_create_clk() has this

	if (IS_ERR_OR_NULL(hw))
		return ERR_CAST(hw);

I could turn it into

	if (!hw)
		return ERR_PTR(-ENOENT);
        else if (IS_ERR(hw))
		return ERR_CAST(hw);

>
> If it only returns an error pointer then, it's obvious that it should
> only be tested with IS_ERR().  I would be fine with just saying the
> first part:
>
> Returns: A clock pointer on success or an error pointer on failure

Even better. 

>
> regards,
> dan carpenter
>

-- 
Jerome
