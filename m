Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023A7B676
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158343; cv=none; b=lgyZ5f0TaGD/kqKk3MEIQQDzCOG2WIzzAhed4ha2EKAt3y/ISL9g2rTVreAFrH/dnq9UW8pw1GG17SjTRh9Ua+VOZPNKghSCgofUnrZ2c69+we20sbOIvaoSGEXvJF2WV+258MGblzyk3QlEgxjrqg50/gogw5Ekr+3LYdCu9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158343; c=relaxed/simple;
	bh=Qnz/sjpRzsRFTkJRZGCysGGpGU/hAxw6QkBY1CZ9MCM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lh4MLCTtkOBWbOBRfdQqzwsJGknLOHfUGhrPK2wkmZT5C0E4cu7ww7fY5WqXS9qmJzFCUN7fHCZrBljGRrHrQ0DlKlrnR73Mx5boANFGKLSe+Y+YjKlUwHCpQ/vUd1W6bxpsKyfoWBe8Myp48Dgz0XGoF1VibTiq9w//FkI8bC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iWt3gZlB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iWt3gZlB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38632b8ae71so9971613f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2025 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736158338; x=1736763138; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrz0lFCuK82Hp07LVC+cIDO78ZFHfxHGrWZYexDodT4=;
        b=iWt3gZlBY3xt0AHQHNFhg8h2thgY6oB0MMepwJfjJILwICWeQ14iw+OOrTaha3WX0x
         ZrVKzgYgQfLYVGo+VrzwqgXlRLr0vChINhcElJpMG/rX/9SALzPnH0HTDnMsE73fhAop
         k1MjyaOlBrF0TSa4mp8cZodjIzI3ece7mZxPaGzPhz4UBTP/TxbHRbHGZ7eA4Qiu9jG1
         eynCSiVUVlH9WLziuMQZ/d21kUR8eaADxUVtyKGdeoYb9j8uoFRaNNwQA8iMGU06gLM5
         OZCWu6H6UAIWSub29T8fkuTljXh/9deAvKQkb500WS7TMN0zm080dMQsGKCTUpjYqo6f
         hqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158338; x=1736763138;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrz0lFCuK82Hp07LVC+cIDO78ZFHfxHGrWZYexDodT4=;
        b=V6CJBmXUuS5KwC/AhdjPRNsazbOhTvs2z2wAaTGw/p1/mOs1TDxPPVNlIXmZBoCLny
         gWl6pzl6rLmpJvveA2X69tC2ReYoqzarztgb90Q1vEYNIACx5p20XiwBQj23r/9hdJbz
         sRxNR4zl+B5erad2dsAr8Fb8PQwfJyKC5Gu81sbGb3WN9AvLY/LWjxZNLaebPHMRla1S
         rbmDdRRtNDjHk4yp9qSCRUOZNSkMtCK0rupp8ECkIM+9RoId4HpnvLuJv16sIGMVh3XV
         DhWOCgDnhvBWwUUltAJPzIs8uYJmShwkS1FR00L6O7dVmgcN/HuWSfz5T5oJxsC9F/qq
         APzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEmgFMPvvkcB8sleCrYWscz21UbZPmEfYxbTyFgRi+bSjEoY0fNCwLr/t05SK3O82zCuTJeIBP6Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YylFGhVIOxraWHLAd/xMOwEHmT54rH9dbpZ3l6d8xl0zJRegziN
	aVVBJvpR7LFUceYyHJ6nkJ6TZEikLe8xVARUxT5UlYuGt8pj3emEAnsXVNj+Z0o=
X-Gm-Gg: ASbGnctnNvpcajtbv5cDWmjtGtVr4sgDaeIXCxYNXPD0nbCwirU/OxrvL8wwlUkH6HQ
	Hm9cnvKdrI1lMef2mKRi1gVNzpFFjblGmwQgfBid5tB01heUwR6cxS/CFeieHpKOBFpMctOAwif
	kglh5EF9bZKtb7V/vgZjecKzHmaQBj8OpI9pCI9tjTGRASBEJpP+VkOz+nEEVG5Rd5ovBr+QK4y
	L6NNKzvkAekAuiyd/ymlgtu93fCpzdm8PygzwIbYLQnj0HBRW/ncR/Y
X-Google-Smtp-Source: AGHT+IFaxGixHUun2XH8nipy7jJnc/zpryL28gv0v5yxv4oK1sYJlkwuVGxq58OL8DC4FuqLVbEAMg==
X-Received: by 2002:a05:6000:1f81:b0:386:1cd3:8a07 with SMTP id ffacd0b85a97d-38a221e2d29mr54182442f8f.7.1736158337707;
        Mon, 06 Jan 2025 02:12:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e375sm48306220f8f.73.2025.01.06.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 30 Dec 2024 17:08:26 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 11:12:16 +0100
Message-ID: <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 30 Dec 2024 at 17:08, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-21 03:09:28)
>> On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> > Quoting Jerome Brunet (2024-12-20 09:17:43)
>> >> Remove the big clk_regmap tables that are used to populate the regmap
>> >> field of clk_regmap clocks at runtime. Instead of using tables, use devres
>> >> to allow the clocks to get the necessary regmap.
>> >> 
>> >> A simpler solution would have been to use dev_get_regmap() but this would
>> >> not work with syscon based controllers.
>> >
>> > Why not have two init functions, one that uses the syscon approach from
>> > the parent device?
>> 
>> That would duplicate all the ops and would not scale if anything else
>> comes along. It would also tie the controller quirks with
>> clock ops. I would like to keep to clock ops and controllers decoupled as
>> much as possible
>
> Hmm... Maybe the init function should be moved out of the clk_ops and
> into the clk_init_data structure. It isn't used beyond registration time
> anyway, so it may make sense to do that and decouple the clk_ops from
> the controllers completely. Or we can have two init routines, one for
> the software side and one for the hardware side, but that's probably
> confusing. If anything, a clk hardware init function can be exported and
> called from the clk software init function if needed.

The .init() is really for the clock itself, so it makes sense for it to
in the ops. Removing the init from the ops would just be another layer of
controller init, something we can deal with in the probe() function.

What I'm trying to do here is properly decouple what belongs in each.

>
>> 
>> > Is the typical path to not use a syscon anyway?
>> >
>> 
>> I sure hope there will be no new syscon based controller but, ATM, around
>> 50% are syscon based in drivers/clk/meson. Those are here to stay and I
>> doubt we can do anything about it.
>
> Ok.
>
>> 
>> >> 
>> >> This rework save a bit memory and the result is less of a maintenance
>> >> burden.
>> >> 
>> >> Unfortunately meson8b is left out for now since it is an early clock
>> >> driver that does not have proper device support for now.
>> >
>> > We should add a clk_hw_get_of_node() function that returns
>> > hw->core->of_node. Then there can be a similar function that looks at
>> > the of_node of a clk registered with of_clk_hw_register() and tries to
>> > find the regmap either with
>> > syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
>> > node for the clk.
>> 
>> That's the thing. It means encoding the controller quirk of how to get
>> regmap in the clock ops. I would be prefer to avoid that.
>
> So if we moved the init function out of struct clk_ops it would work?

That's already what I'm doing actually. I have the controller part which
position regmap so the clock part may get it regardless of where it
comes from (syscon, io or something else)

> We could have helpers for the common paths, i.e. the device has the
> regmap, or the syscon has the regmap, etc.

I think this is what I'm doing actually.

>
>> 
>> With what you are suggesting I could make an ops that
>> * Try dev_get_regmap() first
>> * Try the syscon/of_node way next
>> 
>> I can make this "trial an error" approach work but I think it is pretty
>> nasty and encode controller stuff inside the clock driver.
>
> I get it. The difference in driver design while sharing the same clk
> hardware and clk_ops causes this tension.
>
>> 
>> >
>> > TL;DR: Don't use devres.
>> 
>> Using it makes thing nice and tidy. clk_regmap does not care were regmap
>> comes from. It just picks it up where it has been prepared
>
> It doesn't work for early clocks that don't have a device.

This is why I left the possibility for regmap to be "pre-populated" so it
continues to work the way it previously did.

I admit early clocks is a low priority for me since I only have one
controller like this and I do not expect more.

If cleaning up this particular case is important, then I could add
another level of init:
* A callback passed along the init data of the clock to get the regmap.
  That callback would be called by the .init() ops, if set.
  That can encode any quirks without polluting the ops.
* It will grow the init data so the change won't save memory anymore.
  This was more a bonus so I don't really mind. Maintainability is more
  important.
* If the callback is not set, then it goes through the default, as
  proposed here. This would avoid patching all the clk_regmap clock of
  every controller.

>
>> 
>> That approach could be extended to support controller with multiple
>> regmaps, with a name that does not depend on regmap_config and is local
>> to the clock controller. This will be useful when the name if defined
>> somewhere else (syscon, auxiliary device, etc ...)
>> 
>
> I think you're saying that clk_ops can be common things that aren't
> device/clk controller specific, while the regmap config is usually
> device/clk controller specific.

Agreed

> Furthermore, the name of the regmap is
> also usually device/clk controller specific.

The name registered in regmap_config itself is device specific, not
controller specific, since it can come from something else in the
platform (syscon or even aux devs), that why I think an independent
namespace is desirable -- Same goes the generic solution Conor is
working on I think.

> The regmap assignment
> doesn't really fit with the clk_ops because it's not operating on the
> clk hardware like the other clk_ops all do.

I see what you mean and I agree. It does not operate on the hardware but
it does collect the resources it needs to operate the HW, and ideally
it should do just that - without controller quirks popping up there.

Anyway a callback passed in init data takes care of 'io vs syscon'
controller too, same as devres. I can go that route if this is what you
prefer. I thought devres was a more elegant solution but it is indeed
restricted to 'device enabled' controllers. 

The change will be a bit ugly in the syscon ones but I don't mind.
Is that fine for v2 ?

-- 
Jerome
