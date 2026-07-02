Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8093D75D3
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036296; cv=none; b=pUb9fn4XRQEpq7T31V8RA9w7iMngEGwEJ0wDhJuSSiY2qcK2Qd0tinECXtXpCh+mHQQfiLKHyXSFRP4n5pH0Pq+NPgWfPBWaXCkGrAeFe/2vSVVwSuJK/Y8vAzGXeGHvjjI1UROtlpkbOhWJLAyxEsbYdNUnZwaKxP7G+BLPp0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036296; c=relaxed/simple;
	bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpA0AzOrMe30Zlmh0VmLZ1mRa6XIg2PElSE1EZpTtYBTpKCgSTWFUdSiIqwfqW6SWIFkjfs+Ic9kosPHlYhQ+It93WIgJRDr8X3VG+z2WEB29LfqdhqQ7VoSEsRkVP7hO1fuxcosL/nkubCei1UclMLbQ8y7tLT5P7TSgX678b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXP96XdT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXP96XdT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e533aacf2so66085a.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036292; x=1783641092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=iXP96XdTOToKzaF6Qp9a4gBV8WDbtF1/SydNBJmoN+pRHI6G5IOqWXClcRvly7c6wi
         6lEOxRPkzXSYl0/oape9WgG+TliZqXl9MCfP41DYL+SZVD0LGbN46saXfEQ3MpnDhYox
         FJ4Vx8tM4NW24wLuO5BJcY9q+pl45m1pmpRzIt5sy/PWhKC43S8etATk0F9oBe4kDn42
         Y2/+O8RaoTzYWYqW9ocHeSK3lfBHJr60ZhAFqqbE7PmI5Ovykxbm7JvgnE0HFZEwXHXR
         Am8Mltxt6SLghpGlhaWk9sFlUcl8qlVfOKokhIH/YE2EiQB/BhHGVm5E3fxE1JbQG8sh
         GxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036292; x=1783641092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=nd9VRbIMiULUlzf+ZxWt6+nj10jebhw2TBTR4fe5kB3DUXtBrNggqVZ+3XnzowZeM7
         RKFg9YG/fMgrzkNIPYF/hG1yNFsluVUd2Ny3YfPlfrQPiMYUcnOur2Abc9ez1+WqoewO
         plGKz3h4H/LL9i59/mOCfVtuMpx6rvjwRG8/4YxhQ8SIQallsWMzeE9ymUhy27IdJJCf
         C5kMM4fKzDEbg6jelye2nZQBaHZHf2jZ7IereZjqWL0z8dKmD7xw/V5wYVvJg+VAeWKu
         dj0zAMkbZIRjp+ugYmb8zstn4A9cljd86QhZ87H548m6QI7QshHmYxQkig8zWdK7gYC/
         mafA==
X-Forwarded-Encrypted: i=1; AFNElJ9wv+jCQ9m2xOjZJJDrur/RT/OjtjsBvYtco9cK/57a2NWDOsPBkzm5M5TIq1nO1WuOpaFa+SdTBUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdi4kEZzx/z3cW8ofTRLcprNs+vTZsM6SQIsivXtkwrGoXQPv
	lewehgdxhjvbiSbTvm+x7B0AU5QGt6jguTsrWc0dgXsw3/5ZJWFVO9Yz
X-Gm-Gg: AfdE7ck2McQydkuTibIatGDaTmHuZOw1vexTeOvhDKeBx2tgld3GEyiQOJk/007de+d
	jdVKrcfJtLuoYDGfAxXlv3+KG74oB9wORcTltgOhJ0vlAFoFC098vJlL5HZb8zYjuLQ2C1aJinH
	vlqf4ISGoEOfooI7iMblNCCaf6lk/LLogw/Ggn4H9hVWJ97PaNk2v1TpZv8nLLBhLsi2/VuuClW
	URv6Et4QED8pfs2yU4nAhTwvgFntR1wd+Wdzcuvy3C7j58+QSz1mD/Qr7KlvHywf3vAbeqcDRpl
	gSZkWr6DDUk6El/sOVE38AleOUH5qRpoaffiQWTWErnLaJMDqsHRcOcXOoDzYc+tbqJoIPTG42c
	IgyvYuOkHe9s+iZgLDc9qa6XiOQyXVi6R0EVLvuzPvDLRZHmSMYLTUojFJRArKEPPN1m4kP5RE0
	V2Z9po2W48Zhz0hsSgKfAIpHqZ3msQPARDCLBouwvhwZwe7On94aQ0iXuKA67f
X-Received: by 2002:a05:620a:4410:b0:92e:76a1:96d3 with SMTP id af79cd13be357-92e7b3e82bfmr983241085a.34.1783036292031;
        Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm11476585a.3.2026.07.02.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:51:31 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Thu,  2 Jul 2026 19:51:18 -0400
Message-ID: <20260702235118.1225793-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
References: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Good to hear from you, and glad the series stays in your hands. I hope
the move went smoothly. No rush at all from my side, please take
whatever time you need to settle in.

For whenever you get to v2: I posted register-check notes on five of
the patches earlier today, so they are on the list to pick through at
your convenience. Take from them whatever is useful and ignore the
rest.

One offer, entirely take-it-or-leave-it: I have three Cubie A7S boards
here with serial consoles attached, and I am eager to put them to
use. I can boot v2 the day you post it and report back, if that would
save you time.

On my side I have Cubie A7S board DTS support staged to follow once
the clock and pinctrl pieces land, so whenever v2 arrives it will get
exercised on real hardware right away.

For transparency: I use AI assistance (Claude Code) for the register
comparisons and the test harness, and I check each finding against the
manual and vendor sources before posting.

Thanks,
Enzo
