Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EA3019DC
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222337; cv=none; b=U6Q0ILIRRTySekKVVBZwvxPR8GqxhuZr5dIETD3zt7qEZMrZWUj8m1/Ot3vbIATJGHeEkgoOUT04cZQmY+i6PzWD4E19owg8Lk4ihRg3lJHfsqyF8iIUer3ivIwiTyMpGE8sItNAnU8FFxIdTYVjT4+HNB6/OUFKGDMGd6zl78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222337; c=relaxed/simple;
	bh=q6rtuqN+Z7tw5EmIRdDkfYl2/euip2mlqTSfSrZt9sA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=amSL6oq8IrbN/yuy/JuM+KoNYLC1NJhxvF13UVbBsF7FxKP9YyiYF4Mw6EUAgaVkEk5qxLqjTF/PicNlPHpMpLWHeyIIVQvZ0RXgEKXAWuLZvIvPQGdrZOnXiQKNbZQU81NLqgbNRlScb7oUfCjMDDYNhoyR8X1eb9Icv4WwoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Xvt2Wwtm; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Xvt2Wwtm"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782222332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZ4++YxJXc/6SFIqw2u6ldCc2haTxcSXXUeS9bd2ENM=;
	b=Xvt2WwtmOY6PYw8fMMtaKUPwhp00TjzdQIEHqcqaypIosTEKgcmztrkWySTKWpaBWtZTCA
	1L4m4hU0BAGVvOjQ+nMVV0yHMl39CI6/NJfo8JrXcGL71Gtfc2bxxcCIpcQ1/NHm0YSScq
	VixU+qrUJNYvHsjEUT/yHEAyQjSidSJOszChjXClbXTCVq1nBsFVsdfkEQ3XlUrvRKI7Co
	QdXQtaOX2kRLeEiv6rBCwXc0J7rhVqhqtw7KvAZ3ArRpIPUeJEG9l7IjUTcel/3bweDh7B
	moSJILJFXOBN0NCfuwE0orLdYnOz0zgWN6FG/xVbLACwjwdu2UIz6BWcHfUQWw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 15:45:23 +0200
Message-Id: <DJGH34DVKL0W.3T6UB4G4WYYUJ@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniele Briguglio" <hello@superkali.me>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Heiko Stuebner" <heiko@sntech.de>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
 <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
 <20260623132351.4144457-1-hello@superkali.me>
In-Reply-To: <20260623132351.4144457-1-hello@superkali.me>
X-Migadu-Flow: FLOW_OUT

Hi Daniele,

On Tue Jun 23, 2026 at 3:23 PM CEST, Daniele Briguglio wrote:
>> md.l 0xfd58c318
>> fd58c318: 00000600
>
> Thanks. Bit 0 is clear there, so the I2S0 gate is open at the U-Boot
> prompt, after BL31 and before Linux. That matches the symptom: the
> firmware on your T6 leaves it open, and the kernel closes it once nothing
> references it.
>
> Given that, I think Heiko's suggestion makes sense here. Marking the four
> gates CLK_IGNORE_UNUSED keeps the kernel from disabling what the firmware
> already left open, and boards that reference _TO_IO still drive it throug=
h
> the consumer.

My suspicion that more RK3588 based boards would be broken is because NONE =
use
I2S0_8CH_MCLKOUT_TO_IO; they all use I2S0_8CH_MCLKOUT.
(And the testing was only done on not (yet?) upstreamed boards)

> Could you test that change if you get a chance? Just set the flag on the
> I2S0/1/2/3 _TO_IO gates in clk-rk3588.c and check your analog audio comes
> back. The series is already merged, so I'll send the fix as a separate
> follow-up patch, this evening if Heiko is fine with the approach.

I'm going to build a new kernel where I did ``s/0/CLK_IGNORE_UNUSED/`` 4 ti=
mes
and I adjusted my NanoPC-T6 Plus board dts to use I2S0_8CH_MCLKOUT_TO_IO, w=
hile
I keep the LTS board dts to I2S0_8CH_MCLKOUT.
So IIUC that means I'd be testing both variants.

Cheers,
  Diederik
