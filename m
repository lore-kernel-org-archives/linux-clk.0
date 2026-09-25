Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983A49E156
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346147; cv=none; b=FZm/9fsrLKOOZDNw+Ws9yQOTR7ggwe3CRhfrzqF0y307jDtfupqy0mKjPaWG+wLUyx6D0OfBgrXVliELERZ31npEn2Fob9cr1GxWw4UwohuM02oUQUvL6PZVzwa6yye+frsxtwLOHnrjvjvZzfQpETOQZiCh1zkSl1y2TdDLBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346147; c=relaxed/simple;
	bh=d5uDDZqpgCCF8ojhypKkg1mxed2A2EO+LI5JH4IuU90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ag68mtppSTYrhTiUzKr/Gw8DcpIxz/cVPzzG69EyfQ8OwfkXyozVAfOYapzNT7k/73Bgjkc6Le8FhTkR6DI6Qmxlpt5Lpo3MwicGjOAMTw603XDee8oLpSsgjP9GVA1MZ+nvxM9s14F0ly29uN1tMm1NB8JiYdaJ9UNhA6ZGRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HubwWeC7; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HubwWeC7"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso362017f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790346140; x=1790950940; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPNL1M3jOjQFzxSJPuEX1QG7QhoNHxjdxEWAOGyxkfw=;
        b=HubwWeC7jF+9b/IB2A+RGD8cWmyBpNGrMhldVdU3rCcVRwHrMmlhaIoWm7/qu3v7PO
         SAEAvknUCue7nQBGnx0jEDEudwP5d7PlM6hMSlxus/iGWfhTM00fQM6ElkgOqmNMElF9
         v6DGW9mb445hjlGTfL+L3BbwCyYftEalOz91EagrSqLvItR3rBXWII/QJcNg7dbvVBVX
         3AutFrKg+2BoviaGMvtasyTVRYhkdMlalWraaUrjcDq6z3kO8jYDeKF6bKIq/pjGeXft
         26smmi2eSD3GGvLK47Sd2EWQpezFVyMugsz69Zi2iJd/72mIsM++eGW32bEpZMMVAnWj
         oVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346140; x=1790950940;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPNL1M3jOjQFzxSJPuEX1QG7QhoNHxjdxEWAOGyxkfw=;
        b=B8rVw8ukH64pdpGfZVUA44akkbaLQmuz0E/g0l55XnXTpZzGS6mFfoQO/FzBTYIYeO
         r43EDiYfSkaOdomUpaIKy1k1744vceuYdIiAu+Q2KIsDmFphmjPO5ES7F5XUvoGIXB4+
         AGbxQxCeiy8RqSXFM3Mgeyo0TRttaDgWnUMQGt9g8vrTSCOj5na23Qq8pOLPx7WvAA+Y
         4E8lzEZGQRx1E2GQvRrUNMafls4bBeHI1m2X1qM4qhrLYCf81EUc0/YwxhHIJxnkmGz2
         ufbWlVtHDckGyXRzd45fnT/ZD2ux8u9NNDpiHDvbs4wA8tKCqf1Qu67z57YFgdpB5YuS
         Isgg==
X-Forwarded-Encrypted: i=1; AKwUvBxHbXUhybMMs49ZMt+i3H4h2WNi3MV2jXM1t5+A48NjKkJzrGo+ohNLEtzdfrP3nDAdg5T7z3MMTeY=@vger.kernel.org
X-Gm-Message-State: AFuF++mCWKJTDsi44mXNHp+IViM3R7aurSGbhe+QubL+vyb1bNURc7ln
	bSIYbxPn3flntrp5PxhEj1F3n4Dk6iOdZ2P3DWV6oCjV6ovn0RS3UG/SVSz7nTmPfxc=
X-Gm-Gg: AYBFou2JqPRjECgrDk6dWmaYGjY52CHW3ElaKK1+7GNN8Ar6dN58o5+3vslXbEL8VX3
	xjhvfEk2IwwgJBf0P0RTmACyebysYvMBBB92dXdVWxAS0AuOQlugFcctvavqr29TOLPl3LMtKhc
	Fu1c2ASbWpB2TlYKMysfH8UuRtgRC3Cdcnxx8KKD7QlHXE1lw0mxNfl2LG7Lvp2rVWT4zqCYUYv
	6BhdKCliuKKagu/aitj14b64hOwaPIa6rvK6BSZNjAsNl/KYsRSIxe3ZDFv3+1BVom3HOicvtFE
	HsIDlc102T9RT0RmPvQKBVipf0YpLu3q1Wy0BL2Bk4rSW8QctRJiOrL8s9kp4H00GyvLropMcTF
	Gmx/N2MjXnmmKm4zYn0tmhnho85n9KN+z81ToMDgID29HlwqtCkcNrsf7fl1Cfnb1MkHHY40fAf
	0Lu0U5PgZd1Cnk6C4+2frwaDtnFdVZ/h5cOqBMaEkVPInBsIOH5oHF4t2nw6mc/m3hyniIWXnpG
	hGHNVXug0VHVjbw/Q==
X-Received: by 2002:adf:e186:0:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48880d089e8mr3037468f8f.5.1790346139942;
        Fri, 25 Sep 2026 07:22:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm6834677f8f.5.2026.09.25.07.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:22:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
In-Reply-To: <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
 <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
 <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
 <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
 <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
Date: Fri, 25 Sep 2026 16:22:16 +0200
Message-ID: <1jzex576nb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 15:15, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> On 25.09.2026 13:57, Jerome Brunet wrote:
>> On jeu. 17 sept. 2026 at 19:05, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> 
>>> On 16.09.2026 15:57, Jerome Brunet wrote:
>>>
>>>>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>>>>> + * enable() not is_enabled()
>>>>>>> + */
>>>>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>>>>> +}
>>>>
>>>> You need to explain your problem a bit more because this is not OK. Your
>>>> clock should really just provide .is_enabled() AFAICT
>>>
>>> When a peripheral driver uses devm_clk_get_enabled(), this is resolved
>>> to clk_prepare() and clk_enable(). Neither of them check for
>>> .is_enabled(). Is that a flaw in the CCF or expected behavior?
>>>
>> 
>> .enable() does return an error on failure. It is up to the provider to
>> return one or not. In your case, it will be probably be necessary to on
>> the gpio a little.

it will probably be necessary to poll on the gpio a little. (sorry)

>
> I'm not sure I understand what you meant.

>> Note that if the GPIO can sleep, interacting with the gpio must happen
>> in prepare (think i2c gpio devices)
>
> In other words, I should only provide prepare/unprepare instead? Do you 
> think is_enabled can also be replaced by is_prepared in this case?

It depends on the GPIO API used. have a look at clk-gpio.c

>
> Slava

-- 
Jerome
