Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7AC2566
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757978670; cv=none; b=qthbMmaTmhLa4hE+RadY2EZdyFWWcLmNoR7ztEJyLXql8JoGtH9KFrPoJqKDNXJJ24oLnsLSItEXPRn0eUy4U7tIKuKcnHwVrzUg7xJ0gvTNm/NtG5HHb9dmev/4/930Y3Leh3Ov1Jckvq2aoLJ5Y+GWp29Nw7ICa2mh7NbL8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757978670; c=relaxed/simple;
	bh=GKwwThVWN55ZdhLn8yiXh6K4JxO9Mo/TQgLMtJNViiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QgF+Y4eyM6GfUtZkK6+II+KmBBdhS+evs++aHGEG8Jody+Si5qxsF3ca2QJlbm0YuWqs8S5lxkkKJi2C/DULTzlYnTCeW4UevZqA3CmgSw4Qcw+AAi5WyOlsQB1Vh+n3dnidEfe5e7PwkZFIW042+CkuPeeCMcl7h0jp4+jIz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AnNF5SZK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AnNF5SZK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so4061692a91.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757978668; x=1758583468; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=AnNF5SZKv5v17asZT7KXmEVrj+c+cAHFNsqbOyyCckZn84Ou+TpsIyq9M5CNxXk9tp
         wozriOntYhSiUFCQX/n/vTLbuYa1UxAeDgBphC69+e90/WPfG5f9ttB/62oYoZQY8wIQ
         dFXRBNh5B8KDoHLupM0qQAHa1+etF8bgl1mJ2keogyskBZ/n+5OwdiFMhbXGJw/5YVks
         S9lZyMmR5QX176dS50qmD/ygPWC0tVguS33YcC4T1DUjl0lrLk5P8z/H96YhD6PAL8pn
         4FtAA667OE03xWx25OtDuFMjryLGR1dw2RQW1ytemeZGHlyQkpfZWg093TQRbI0MBXIc
         w20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978668; x=1758583468;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=GGCAIeAKx2jlBClsAiXZn/X52MaYjyEI8/FUvH1aFazOv6G91YmucNrLDIS34JLmN5
         29dIXqidWpi22vtSvUnE+D2ajroPz9rIPP+pbPH8pH6Dv/JLdM2mggC5sLzTpp82Jowk
         LkTgZdqYORjDooNgbm+5XDdUKcmlMjrNDSwIPbvM1BZF1CC+hd69lcDlAM0vzqdCrrpV
         IWPX7GWxqpcUQKTKbeSs+xXLB4Y07PUL23pYI3EmjB7pNHbJW5FqqY0dKFMtVB7Yj52k
         njkipDZ1dDk7tOtNfx/WNp+W2hT5xi94knFOgznTEpvY6C+izJyAg3CAZw7rNKiEJy8Q
         PA9A==
X-Gm-Message-State: AOJu0Yxr/9q+fIb8wSaIvTtl3zajtQ6iMQptjRLyDqKOWi9NLbXZwtgf
	0Ekl8OtBzTjiSAcRyYtJeOwjZtcZ6TuBTZZ6WR72+4qKyvuUq20XStNbVg9Fnaze5xw=
X-Gm-Gg: ASbGncsMUybzZV54Z/570AWZ1csijlMkpRI2m3x3yLW9haiEOXUHwKVmCxb5ISkJvTD
	D8RcE/Nu4ntNLkoq1G0K3GYd2JFJCiKOJ1Tv9eb8mSq3XyPog+zcqQ4ZK41HTJK+WklIT0CPPEB
	H3GPsqBVGCypXc0JQzKf476JXU+JPTzISsbjEhaRsX2M0g36tc/d5JU7E/XBqV4OJcJLDJiz9ae
	xgpGEbSU9ugEpPG/Aomho0La8RLVXHf/RliAc9TZRlwoJaGDZgti6mETqMVAmk6NRlY9keVIglO
	uv7DCCF/UEGW0WhItNxsl1C7DCsjZ8/F8kZoI5LpAFIFwb6qoPMu+pn8+sY17v+d9Ov7RG5J4w+
	Fk45cfdICu03z/a0lJtSFqz9nb7vIWfw=
X-Google-Smtp-Source: AGHT+IHW+Ei25gxkyciUKrKbP1B/EsmDVjk/MF+hGzmjRjAtg2y1sc/2CYFiYtv3fYigvlxtLkhu6A==
X-Received: by 2002:a17:90b:49:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-32e528c62abmr7999389a91.24.1757978668587;
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32df315f9dfsm11154777a91.21.2025.09.15.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
In-Reply-To: <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
Date: Mon, 15 Sep 2025 16:24:27 -0700
Message-ID: <7hfrcn8fkk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> On Thu, 10 Jul 2025 19:42:15 -0400, Brian Masney wrote:
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops, so let's go ahead and convert the
>> drivers in the arm32 subsystem using the Coccinelle semantic patch
>> posted below. I did a few minor cosmetic cleanups of the code in a
>> few cases.
>> 
>> Coccinelle semantic patch:
>> 
>> [...]
>
> Applied, thanks!
>
> [1/3] ARM: OMAP1: clock: convert from round_rate() to determine_rate()
>       commit: e2c0510935c5485a2dacfd13af3958536b9d138b
> [2/3] ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
>       commit: bb676996ed583464504123721195e98a708fbba9

I only toook the OMAP patches, Linus W. should take the mach-versatile
one as he's the maintainer for that platform.

Kevin
