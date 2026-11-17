Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952088;
	b=YyretfPMyja9Ng02HH0F0RUllPewjbODKI9hWsQcXnIUdZRE7CVDg4080m4mO9p74iwL
	 BdWoAq+kFrwpg5KLxDLGJ1P1jEeVQmW+I1kpKcO6k7ppCpCv2sS01+qMqRVcEyerfNfwG
	 0HDRP+0p2JIA4B4AEUQKp1t5fg97UeksJYw3yflfBpxF/qu40K1vM+k3wVgBhU647QYAl
	 1wuFYFIdA4DfSG5275nEbkwK8m2lBtfiKjASMqSq82z2r2FRip5AcVHYGnv6AfooMWFV1
	 IOzxEefRBDdAtiLGxGT36CiOaNnpdfWwSEz5xE0sffXotx8sa+hNVVz5zII375I2wBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
	b=Tbzo0qkP5Kk7GSkStSi4e45qRiRuJdx821981KS1/0cftLk+NuebTBGDV71hJBZlRDM/
	 wTk5aWS6jTpbOJasA+ythzah/E078NJwOx96hvuUnNM9OFoK33aWfNu2CoCLZ6gwPAg3K
	 Bc7hc+HEX6w6rS4LOpr5vYUKn1L1BUsMdjtlZexFoYveF4+GuQPLhi+nqbhgv6Mbe6XF9
	 bHqDRzSi9hxXYWLJE705hnauMOWfVvri0NVl2UhMcJORFnTT+YIG7+SIrJJvsvHexWSuW
	 RICm9woJTeqFXVLaV68rWGD0tAn195rLYjZfo+jnP1xohA7nYqnY1BLER5BZYXInPmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FD606A32C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 21:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so1806467b3.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 13:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952087; x=1795556887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=e24jyoO53YopgaSfOE/Fbsm5STwcDYn92WEUT2SbYFXEfZbdebuB9Uz4CNO+wMG10Y
         Gv6TLPmp31f0I04qRwADQYTEIymhSy+cER/u+FlolWhft22RQe5c0V9BxS3hE7/b/Cez
         W1CArqkceyzuR9xgeX22jpGyAAuOd0N1aMUX3XYYuv2GJFAcSdgJH68gkZyqVhs9awsS
         mVPFopBZA29M6jIZHeAqYRw+H4g+/zFHUhsbWEuq9eryl/muCInH27hprXKW+8XbARw4
         FmimRJiAEuJmofIyBp87dTHKXUyDm2XD0AGimHObRlVtMOhJB0FdT10oIecAelJM22UJ
         U91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952087; x=1795556887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=l512o2ib0mmZqRXX6UOT14uji+R9vBwSczOB8586lednHPsfAVTJYXhyMdrYy/rF09
         ZnM+Bc0meZfx6867kCba7iIxNTumt4pHH+sRG89tGyBr4ugO8qUGFMUuezyMvQXklc27
         As5AA1MmjObWJQ+1x8X3UXY7DYkKvkxjZCXO6qymB4ET2jugnErdHhedPxqOgIPGi0i1
         6HNUx3RCgJ8OTfDOPUR8gTeN20WNSkZwsXkDVWd38mCju+AT9xvWpBjDYwrgyhc/YtcF
         sryeXINHDglZ6xQEErzdZKeuUd32NfE2GvlDF8AJCOtk3cxKJ0e/9XDvys0ZjBeLCLcF
         xIgw==
X-Forwarded-Encrypted: i=1; AL+hErFtcLookU2zze9hbdUlJ0KOWSsRuP79ZmpdDCTWnrWo9RVGvnk6gZpyUdqgO9DdkMt3RYVJHvSROYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8khFy86yzvQGDjCUoIUddFce3ZsISfUOkArun9Y5Bq4MHKIYuO
	3L6EDM7XWVzUs7OdS6168K651loKvdvebYCxQ/hQ1ccHlWixURZoCmIF
X-Gm-Gg: AZFdTZdR0XWvrIlowfM7sqkEOhDite/Ozhqs1l+1Fue5dcEQS6LZVvFx3e/wgZrksoa
	sPIIao7a7fd7eGhAIvb+b//8CMAN8GOnobekWugGlbv7xBuwZ86CNjKw3OYBbIUCFQ/9YXXTEt9
	MkLIIq+bZaiy4uyKDb46zodnVYouWl5vQxEvVbb3m4vDt3nLBNkExlKsKQZ8ZuNOi97+mi+dG/l
	sQwinB3jPm4dz0fLtJwCz9UHwl3qgBCUwYS1vDcSJG7O7jRoE0PG+Iem5QN9ngLMojs+SuMLafe
	fSPBdywSWhg+j3rixKreAlhqq33e5D0Y9CPbuaJ69QmCI+5rc8v704EcRkjvynNb9vJagpYbT51
	xh5i0Si0xtaOm3U7P+bDLZwI13+Q5t28oy3AxBgBJNOtqka25L/ZeAhWX+9Ao4Cq11tz3xP2mvE
	A3ghl0amw++qP7qWiz8U3xNpz2T980iPaV2f1iLl6uuXQAMVrEixQ2hAkhBFGbYRB8mm/PYGv5F
	Fpd8Cm0xQnScsCi6g7pXE3obEBiLFZW0xH92S1mm5bJVpqZv0xLRzy+roobhgX/TnHkeGz5A+Fg
	sNZu7/jFRPg6I+rmuIzACM7N
X-Received: by 2002:a05:690c:6502:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b4febccf0fmr3038007b3.8.1794952086607;
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm7195267b3.15.2026.11.17.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Date: Tue, 17 Nov 2026 16:48:02 -0500
Message-ID: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:08:10 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> >  drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |  25 ++
>
> Is the slightly different K1 Saturn DPU registers considered?

I compared them with the K1 BSP you mentioned offline [1]. Judging by
the block, field and interrupt macro names, I agree with you that the
K1 and the K3 use similar IP. But there are also important
differences between the K1 and K3 registers, which is why I would not
propose reusing these tables.

For example, the blocks sit at different addresses, and most fields
are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.

IMHO a K1 port should add its own compatible, its own field header
and its own backend file next to the K3 ones. What do you think?
Hopefully you agree with me.

[1] https://github.com/spacemit-com/linux-6.6/tree/k1-bl-v2.2.y/drivers/gpu/drm/spacemit/dpu/saturn_regs

Guodong
