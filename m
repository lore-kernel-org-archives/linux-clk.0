Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174062D7386
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219936; cv=none; b=ekBd1klV6jpZ5zU3rUZXB82sTGamzHKEkocgUwvd4i9Fx8ref+T6XEQGwWBnnnzPv9MySsgoS4sJr1k6CuiB7DQLSr5gP1LjDu7kr14BrgbDySlwpf8haBTy6/hxW6I9M+9xThWKJ7BBQ25gfSvDQoFT7YC65fwHdNAqxjUbeIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219936; c=relaxed/simple;
	bh=JS16SEqqttqvs49aVT3GJzP7J+BJYU63BPbXGc61HCY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DD/IIz7MF5d/BYHaLfnON0/f8E2mjgSXQ08whkfR02RB07WPLsEDXHm3m8uI1kGMwBJpmOlfJT3vEgM5a9oHq6BK6iG1V149erZFCQMoDLKyYO9XLo2gAFA+gkxlakbHvO373tftm+pKNGQDAUFHYURGEbdq9PKioJXe9dh44SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=lfKcgXYP; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="lfKcgXYP"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782219929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvZLtxCTdmfsl/KnIY8j8wP9YXfnB9dj4Qz35L9iEGk=;
	b=lfKcgXYP11Ij1m7jRAJceFdxnHCCvXitNhoys7MqLpzeBWipajjIJ+EQnmbNKEghXqw155
	e4h1XiTRjemhrpX8NXm15y+JgkkqH88slcIoqc7aIlrPdBHidFQSylQIPzxkYwvg8DJXBF
	QFUfCEPmm3izh2FAd7Mb1iwMejK2eXD7w1GdurYFhjjh4aazDa3JAevcn0vSuoAbk9nIB8
	HumdTXNDXWuBiGnq69EGjQ3LHR6eTsA1+MnCXeMwlMd4QqUlbz4XpiRYQcuqbzf3IaUBPx
	u79ZE4J17GzJcK7g48qHJfkEzdkL+0GbxVr8veQPNDHYLxOiWHYblvlRkVK2YQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 15:05:13 +0200
Message-Id: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniele Briguglio" <hello@superkali.me>, "Heiko Stuebner"
 <heiko@sntech.de>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Diederik de Haas" <diederik@cknow-tech.com>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
In-Reply-To: <20260623123316.4111002-1-hello@superkali.me>
X-Migadu-Flow: FLOW_OUT

On Tue Jun 23, 2026 at 2:33 PM CEST, Daniele Briguglio wrote:
>> can you check if adding CLK_IGNORE_UNUSED changes the situation for you?
>> What I assume is happening is that when the clocks were not declared the=
y were
>> just left running, while now the kernel turns off unused (but defined) c=
locks.
>
> That lines up with what I see. The gates are set-to-disable and reset to
> open, so before the series the bit just kept whatever the boot firmware
> left it at.
>
> Diederik, the cleanest way to confirm is to read SOC_CON6 before Linux
> touches it, e.g. md.l 0xfd58c318 at the U-Boot prompt (bit 0 is I2S0). If
> it comes up clear there, the gate is open, and if audio then breaks once
> the kernel is up, that points at clk_disable_unused turning it off becaus=
e
> nothing references it.

NanoPC-T6 LTS
U-Boot: 2026.04-00003-g723f0da896bc

The 0003 comes from me adding patches for NanoPC-T6 Plus support, but
otherwise it's plain upstream U-Boot.

=3D> md.l 0xfd58c318
fd58c318: 00000600 00000a00 00000000 00000000  ................
fd58c328: 00000300 00092820 0fd58c338: 00000000 00000000 00000000 00000000 =
 ................
fd58c348: 00000000 00000000 00000000 00000000  ................c358: 000000=
00 00000000 00000000 00000000  ................
fd58c368: 00000000 00000000 00000008: 00000000 00000000 00001000 00000240  =
............@...
fd58c388: 0000003f 0000fefe 00000000 000000000 00000000 00000000 00000000  =
................
fd58c3a8: 00000000 00000000 00000000 00000000 00000000 00000000 00000000  .=
...............
fd58c3c8: 00000000 00000000 00000000 000000000 00000000 00000000 00000000  =
................
fd58c3e8: 00000000 00000000 00000000 00000000  .0000000 00000000 00000000  =
................
fd58c408: 00000000 00000000 00000000 00000000  ....

I'll let interpreting it up to you.

> If that turns out to be the case, CLK_IGNORE_UNUSED on the gates is a
> reasonable way to stop the kernel from closing a gate the firmware alread=
y
> left open, for boards that would rather not switch their DTS to _TO_IO.

I'm not so sure I agree that CLK_IGNORE_UNUSED is reasonable, but I'll leav=
e
judgement up to others. I'll do the test regardless, though.

Cheers,
  Diederik

> Where a board does reference _TO_IO the consumer holds it open anyway, so
> that path is unaffected either way.
>
> Best regards,
> Daniele

