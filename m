Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028162;
	b=boWkaApEptMwJdbEamGWIjP+eWx8n/otiGVSMy0VdkjXuib0mt7mumPy7BJ7mBZNFy6a
	 ka/zvlKQVlYSrs8HsF0SGJrowuSr0lkbIGcS4FyWZrxelxLL8IEiDtNSTYGcdbR47lh//
	 0ky+QykH4RjKYErRYLgRIMuS4wZ/eul2e28Mt5KW81COTzeaVeDHdzyJ1GeHp9Uz6I4UA
	 uoLw+bzw6VbJyqZ9IF2jIGttWNZpxJKlgFMCPuX0VNFwFVSlDGGNUsVeGefdjjLyF0GNs
	 zwK17cdOa9m+6KCxQbL6EmoLEYJ7Xvic9Fe1oXjLrIeZnFK8c14Sn3qlbA6woBYr+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
	b=rA8fevQcYT4ef+Ww9and9/dNdgAscYvmZbF38cjjEVFVvY9FEEJTquZ0k3nsIy1Tk+U+
	 gmJtmb4g+HWdJDuyCs8+1PEE7upUJv0Ga+OCvoCWuUgyBwRwb5g2E3BnmlCCHLicGHKQB
	 qnauHAoLAeaSmFNs9lZOJ5Dc3Koj3IOK/Ap/FnnGBVrbPhyMA7UPcZ7OZ9FahyWr6msMh
	 Nfe9+hnVBTtPEmZ2PGt6d/j0Ut9lFWhk6+z0zkHOUvzLUSv4QADLO4NN1rBFC5T8ph+Xq
	 0VAS3+5y3NbAYSrbVQ0RF8APMSCXe8mI83eVtW5JsSv5//SXXJRqSPgWbvqqNjCz5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A2606A330
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 18:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3A2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJ16PKhA
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so882297f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795028160; x=1795632960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=BJ16PKhARz4s2Bmx4dHGIkvXvP+ysfTMKh0Pb344yReW5izVeLzwpE11JY2MQmmdzb
         D9fOusFnIy34U/SBJBkrm8v/779ctX/QEdyEVxeDl5lbwwJOrIsdvLR1emWtqoA4d7ks
         yNe7dg66UC/RcnoaLgcildHFaZW3E8TViBGRxsUAxu6Rf56hBQrrep+xTKR1lSHbhgKN
         ADuob+YUfULgVnmm9JCfSXjuoo3yB2xjUQsol+gwVnYS+QhKmNhKlwDWaPUnSQUPc9hp
         tmWpqhDkDWGKT+Ju0dGI88hIPlrekzQQ5XOL0HLCzCnYOZf1CLWnMQG7F89+4VezUXCV
         nuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028160; x=1795632960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=eylJ1jMaHb9nGYpeha/BwNQnQDSdbgWYHTwITya+nPHRvDJNAoPa728VZH8oI2EH6N
         938fWd9PpO8PMv4wrmuaNMWDjZvn7mbvsHF7InwmAaQ7MOo9esrMzehBbC/twHQpg67+
         OBJzNGOOfX2bcYRURdyhgMQNkWURV4GpIr0ty4XWGflX59VehrH+IlDNsf3es/zj33tc
         BcmrPC1owxS3iIiYO5fu6j46ex1NPBfpM6GEQHNzpOH7Z0iyXuhxXrXwu6L8ZEqvE/k/
         i5/91xbcDyvv9zQFlDDmX4PJaep5WuzIIV2iIYVAk0Q0kZVxNnjXy3zqbLAPMB7lZemu
         auXQ==
X-Forwarded-Encrypted: i=1; AL+hErFEZ7+uiQXwGVBxTbpheDcq4d87jH3aGzy1yzj1zkSsAJLJNDnNxsPdwveoVeBTsLVrHC2X2v1/Ig0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kCzhtRFAPIDd+vOkovMCal53wb1PWbx0UkVxH9rO8F2K3BjV/
	F1TWz2ZvMly08Earar04jC11fnzHRgA25YU9rzzrg/n7rxgUhmBlSm+V1mbwMG7EdmI=
X-Gm-Gg: AZFdTZen34fhE6EvRr1YQhK4MBZ4OVzeLnlIP5Sl5+neS6ijRdtL3o6HC6Y+eMAYq6b
	EE9x31DSS13As2Uk3kCSJTHJH8wRV87USUO5PeU4zQecRdXFeNTo+N+sgsxVZ2pBngcshmO5+8P
	kZ8SdBtg2D52CsAASZJSLZuZ1/OBiYEOWlJip+sj9gqUsNLnOtfYHeBtLUHkN6Haery89LvHiK+
	6uHpcPN53RUMDWE5vt7fDSPF9PJYQlhzD8be9VNb4mBKvPYLvmYReHJbZgVaO6Y+UCeyPjYHt2t
	R7n5mx+BitUytR2FgQPOUFnFc95cUCdtR5U53pHJ3Wzhu7DuBgehevHBm7xL1r+s6ivylnEboc6
	bS37dABjJ1sVXIzEruKg0BXQYiFtT/dlcWfdlqq4S909usF/lRIGme/XJmbH6EZxohccAOMYO8e
	ViR5Apd/gyARiNeTRc2JwcjK1TzqeSgEiyiWBTGyvrwGcDrOoMXoAZFaR4/dPqXwqHz4mYYY5mj
	bL7B2jjOyjdbJ6KRaufBaHYcnNOSP/zirL2NQlsIsPnvayWB0XfsJItSWQZExfB2UenI+C7qKWa
	wXQOuDEzmZfjagxXlGLY5z8WnI3xLdXRZ9cunjq7p7WNVs4mhR4n9UkiVtmigAVK2ikA07hZoU1
	4juS/mMx+E/kEqmqa1ibTer4LjOp7rUgwC7Grfpbb+ZVb0A==
X-Received: by 2002:a05:6000:4914:b0:491:8462:20cc with SMTP id ffacd0b85a97d-4a63ac6b48emr8023295f8f.37.1795028160455;
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm6144436f8f.37.2026.11.18.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:55:58 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
Message-ID: <av3zyakd8-7QfIk3@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
 <179499607256.413320.17594110166305844754.b4-review@b4>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179499607256.413320.17594110166305844754.b4-review@b4>

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 peripheral clock tree is derived from S4, but its clock sources
> > and routing differ.
> > 
> > Add support for the S7 controller so peripheral drivers can obtain
> > and manage their clocks through the common clock framework.

[...]
> > +static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
> > +
> > +#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
> > +	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
> > +
> > +#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
> > +	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
> > +
> > +/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
> 
> ... is a driver claiming it ? If not are you OK with it getting disabled ?

Not yet. Amlogic told me it gates the AXI data path of Ethernet, audio
and the AUCPU, so those drivers will have to claim it when they get
enabled on S7 (none of them is in the S7 DT yet).

> Did you test with or without clk_ignore_unused ?

And yes, I tested both ways: without clk_ignore_unused it's disabled at
late boot and the board keeps working.

Cheers,

--
Carlo Caione
