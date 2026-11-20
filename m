Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160683;
	b=hSVaSKkE+ITbG1ZbFBIvsgG3nbX2/Cmec1EBr19HMVGczFyDNLrDdmHEQdNyKGH58dcF
	 LEv1fp506Ajz+O85noFSWmcL7x+YMQHgwvTm9BoqvimXkbLPHCZMBsnTK2dzU2bJyacy7
	 sGEZZvdC3HjnX5REdo2F72g05Pbp4B4l1vS5FxE15HUG03UYVr7jVYvp+scgZ9C4OxpGz
	 QIvPCX2uLROgShrvEHvsvQ1NicpbM8yuzi6DNm8Rfgy8CLn0tNlF9uu2NVLsNjcqaOA7R
	 FAyPl8GNhcS70xiuOfOE6pAb9wD32ASODUhEfmtcSE2wY+yzZgyikErNd2y6oMeXv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160683;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=;
	b=vrSxU5z4uwBWCprQlqWZ8qr0e5Oe2qSmUNUh/x4me5af2gAxTe2PUCYraYzULKRPUnJ8
	 iiRq4OucLCKbKNtrQHGsuRPa5oIg4CD/O07FBozzKI2/txhiZgvsr677PukVGgdvOoK9/
	 h2mTD8TfZcCktoHeLZ/r+j8k+iZCTKutP+xBb5Owzu2esNa0DtZnLFeoBx1VfKeLjWCGu
	 sJCQlHoQyZ208dEdiEXhNaNnfNeH2uSeIVG1VHCDNxBGt2Aw7w+voUbkXPQA7ya8gBa56
	 RDuwrJXxWdwDqh2OEzm+lROxZfWc7Hih39tHSWF1U9OZEp9ildmVjaq1vRxbqL0Rn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B1606A320
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 07:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so429965e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 23:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160682; x=1795765482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=;
        b=bHApQZX2/T6kfs2Ce1r60PPY14OmrUVZFpQjZC9G5cYbkBE5XT0rAv+V2BietjcUH6
         eobgJ+TeC2m2rHvuA8VDWwI091UInzNAs7pQL5Nf8WH4caHpgqm/u3UbeXW46IGGepoU
         AaWymUg1Hfeaw120EeOWVfjfHz0guhDXpxemqi+zHkgFcYmGrjiBD69zuAZ2cWB+66CZ
         x2DE5K2mT6cm/R+zLpVTWriIrNjpj5m3Aq2GCrQhCxFl24Kco806ON0va0qWj+gJSaIt
         9tBiGg3YulEBGMExe8ubKMdMazbrRpOjXx43qWTWzSN0VICaXblfkYBS6G6ZckPvEBtE
         2lAA==
X-Forwarded-Encrypted: i=1; AL+hErEJXLjbl0KyT/AUvk1RJ0PvI2pKJyuZkmb+9rFihvjWimF7YU7TDLrnXrrAqKEwTTqD/OKbPDptCWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ikon8sN7VHGRxTm+4oT1NG0usxeLFwsnIHUrWTlDN+MiGIly3
	eGuzvVr5A1qr39R4BSB07w64olTFHNzFXeAVlGb3XFvcs8CpXy/CH95jWqE6NS6f
X-Gm-Gg: AZFdTZf0ydUTpVK7/SKWcX360sf/lB9ysd4eCZghiKELiOBYDqb/dhQMz3MMcy1QxZf
	MLARidE+xNDiSqju/5ezw2XwecxTOBRQsSyWLQb3bUWj6cniP79pzIsXBU1cvuUTq00q0okjYkR
	tuiiCcod5bl71kRs4CKY8e4U53l0ioWr/on5LV5Vf0VAh9I5wYmdo/wg63BRyPonb1dZPXpZi0D
	T87fjRCLwT+2hgwiF/oT4TMNMo8UerXveH/ntLo88QdYFTK8gCvvXDX53WeobeFM9rITwe0co8x
	m3WnJf+D+aqz4TAQYbqhfdGCX7z3HoaD+G6VnH5tnfGyJUwvQBt9ZELWooASAbQmGUdoVINFUJq
	XdQEjWyrg2H0HoqDNY1CCQM3DU711cv1aY+i2MqRim95KJA/gyG+iqIE+IX7WtNrNa57++uU4aU
	yl9SPVhNP1MDgXaWhX2L7UEwmNBOT2XVea/TREwG9XikARMTbK8UkRnL3gKBCoa6inDSzS8A+MH
	yykzqLiqi8mBXNfiTdHP+SDdQjleMOShV+ytQWjnAtk4N09RbaaD7ihbnwAic7eYq5hweq2NAcK
	sBf0KRfK3iqoGQ7iDuhZJJtL+aLy7VxfvHQ3kXxC569hcVb8Dm3xNwvTciRtdfcCR7nAzbSy1/J
	h6yTKYpDO7WA+
X-Received: by 2002:a05:6122:288b:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee8aec1ab3mr1375288e0c.5.1795160681879;
        Thu, 19 Nov 2026 23:44:41 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5564a9sm1851628e0c.5.2026.11.19.23.44.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:44:41 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74ab99038afso397520137.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 23:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE0XgQOsW1hvgYO1y27sa7vXbezuxQIo3l6UjdTTneo8ee3FRb1JVHFCYjtryB2LSJpP5rVt1aYmxY=@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:7cb:bda3:27ab with SMTP id
 ada2fe7eead31-7d7393925f5mr941037137.13.1795160681386; Thu, 19 Nov 2026
 23:44:41 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
 <179513882271.284394.17357508909448455391.b4-review@b4>
In-Reply-To: <179513882271.284394.17357508909448455391.b4-review@b4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:44:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
X-Gm-Features: Aa3M54p6yw1Lhc431P_jQfP5g0YMf_od8mct8UUR6SclOJC7dcSgYi-awR9w8qQ
Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
To: Brian Masney <masneyb@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Fri, 20 Nov 2026 at 02:40, Brian Masney <masneyb@kernel.org> wrote:
> > This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> > about consumer devices").
> >
> > This commit added a struct device pointer member to struct clk and a
> > parameter to clk_hw_create_clk(), but the new member was never used
> > beyond setting.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/clk.h
> > +++ b/drivers/clk/clk.h
> > @@ -5,8 +5,6 @@
> >   */
> >
> >  struct clk_hw;
> > -struct device;
> > -struct of_phandle_args;
>
> Did you mean to remove of_phandle_args?

Yes, it was added by efa850487a6b6742, too (although it was
used in that header file before). Currently it's not used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
