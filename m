Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA66438470
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192060; cv=none; b=LFYgMyO2LAiqzPs4Yv/8aVp6jta4SvnBbUgff+ft97GUw7OTDHFZ1NaGjWWnWQoAdYYq/f9t64vUSXbprWDLztsbWTOA5JCdLbM8Qzr7qkxh6PevNgiOOJ+2BdHTi1US1oDDSkEQEFimaNwi+1/vWbAX9j0fFyt2oBS/SiSpat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192060; c=relaxed/simple;
	bh=MLYf36H5QskETZxzDq+/MEooa/mfwbkX4pzrx+i1jrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A2obIZUEBgohSATrTZeYbl93yC2yDSvnPONqRHUlIpJxYEzvi3do0DUzyh85cfk4/HpHdlJ1zCvCsUK0mwh8vhGvsSzQBXgIIqPZRmCNglu03MkDLMvKy0vm3NoF1NDDBN3ykOeAz8+gRzjkTol9d4eC00rIQXOXmWQVK5/7Gco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R0jvH8GE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R0jvH8GE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a16bc7ad39so2432295e9.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791192056; x=1791796856; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z40S/ylZZcXE7HA9H4ygNmMIKaIpP+LiRcjwv8oZ5J8=;
        b=R0jvH8GEb5q9XJQbiLF0fD+vLuGgu89vCbckY89Jbcd3RNH0nEEN020q6Rwuft4Wgs
         Sl5YMiFUj8YEDQ+7kBU4TbQcsSn5ogxGG/PeE6zJC3uEyCSbwpOxALlrFs83IaLhMMiF
         ABpPMRQUDLaBhHYX1uus+JxljsI5CeVxHITCuIGQJ6nnM1oY7rw9c/pua8LpCtefSSGz
         JmH4oXU3R8BY9Bp/6utp4YztamcY3Y8UDUsFfn7GcWq/BurX6XaALrKwI8s8uNHrKEGD
         iunJkGOacQKlW/xgbGpNslHMAMWi0MpjFskPAn/xxbiQoXhobE5obFxHyTog1Yy7TcZj
         OlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192056; x=1791796856;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z40S/ylZZcXE7HA9H4ygNmMIKaIpP+LiRcjwv8oZ5J8=;
        b=qKEfqeJr+ieSR4cG3yXEQcY2g/8x87LjWs2Bf7USLymkU+vUAXTFIeedxDt5VcyMl/
         Asa7cZXwQyhm7oBW0p8F/y+2pLa08SxXL3hWqwZRTg580NrhBvssf5YUOcAQo6YVPl+z
         /DeDT+zLXj/EvMAkigjr4/7xcBGI3QIwYIzKUHSzNYNpZudVciDvPvV7JMkgzeHKClUN
         NYdSg+RcRknFHHB7i/0jtogtDoHnvkYgxsoDvzdrsXr6HALGNq1mK9nQlXtuT229uqzX
         USuXKQLLpvRw1OWC1sY0AegKg6mXR53fmAvPP8A9et32HypfRgMo3Tqq1kIzb5fcVikr
         dsMA==
X-Forwarded-Encrypted: i=1; AKwUvBw97nKsUaFnUotchaB+DOtwbzvnTyDPDUsYfE84RGWSGavaxpdBKhyVkZ4zukIde9BlshFze1vsXnw=@vger.kernel.org
X-Gm-Message-State: AFuF++kuqKEu4L/z3kXQgtpmyeoAsTAGDOeeQRYHOi+kkpc8kCyypNN8
	vmNreUwfW4Uo0H4OjvH8Ho0lQWmrvS1UJSjUVCan/lgaMhjpcBqBdV4TA9+hAXFQOao=
X-Gm-Gg: AYBFou3I66FpxxRH/Gbtk0XKFlpB8qizCMZx7ELcJnyKRIvfIdAe0Jh45Wb3cw/mscV
	afKyIKOHKXf6IvWFrw0e3JzX5wTKskfKWvaXHwdrzxsGTI/1bQsQ8h5EV900mDDjn8989gpi4j3
	QmvNTFb1yDJ4k3Kb9XNNclL/9p5u+CwEyRDcIgtQPO/xK9xo3oRDu1DcRuMp6+IY78PfroWlpQN
	8FKn29br1ItAuuCAPEBF9Hxvn0FQ2uV2kT7UmdGborXk1rSnVHZAinM0rFrhGX7RFWMphBfyL1u
	KY2d2HjCBUA/UO9NpsCaLfKOBC+uw5uVp0Tcawgdy+feWw/J3Fdwwz+R4Qk+AlecW7b8dco05c1
	zoPMWdKZSwpmH7sjj+9co8swolosIo08ydQ2elP5CBv1DPxHfwIcJSP1PwYwlTc3q0rpea+y5DQ
	tagot+0eDL/0qlpm+DmRCQSCLRUVGBaycG8VUte8R8GgNgeAeZQTZuh9kYecLyN8XtXTiOsoHaU
	y6hetmrAmtQYOE=
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr162795275e9.5.1791192056124;
        Mon, 05 Oct 2026 02:20:56 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm208756515e9.2.2026.10.05.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:20:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi
 Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
 <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock driver
In-Reply-To: <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
 <179075859479.1471718.5492634704694937513.b4-reply@b4>
 <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Mon, 05 Oct 2026 11:20:54 +0200
Message-ID: <1jh5j07bbd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 03 Oct 2026 at 11:02, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

>> > +static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
>> > +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out",
>> jhb100_pll2_presets,
>> > +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
>> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out",
>> jhb100_pll3_presets,
>> > +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
>> > +		    CLK_IS_CRITICAL, false),
>> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
>> > +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
>> 
>> Please comment when adding CLK_IGNORE_UNUSED so people have an idea
>> why it is needed and how it can be removed
>
> OK, I understand that there is an intention to remove this flag. On our SoC, some clocks are 
> typically not referenced by any driver, but we don't want them to be turned off. We currently 
> use CLK_IGNORE_UNUSED to preserve their hardware-default enabled state. Perhaps in the 
> next version we will replace it with CLK_IS_CRITICAL.

CLK_IGNORE_UNUSED and CLK_IS_CRITICAL do not express the same thing both
equally need to be commented so a few years from now, we are not left
wondering why this was added.

You do not have a driver for this clock today. The fact you still *need*
that clock show maybe you should have one and maybe someone, someday,
will fix this.

>
>> 
