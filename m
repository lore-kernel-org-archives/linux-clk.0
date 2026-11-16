Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848350;
	b=2KRQVBqX+Pu3SZYi4BaKHTbXxbYjN7fBDRwxw5zcdXNimuh0KmFywKArjpQ/m0qEOW1q
	 JPc38W1mnzpdgQLyrzo5vPH4I3fiWHHAaQPhoY+Rm861YhypJwITWq3yQpsDut3aLB6Iu
	 Ob8N4iFD2PaRxW0Oo5DqSDgWKS2j9luQ88vxpsPjNAlQY6kwsCusUs3hCQfXGQAip4PWZ
	 pZgz0G7w+ozRTc1q+K6V+F2/iRmXqLCpH/7Sx93kPfh9XorRnIiV967k+vL/T+YyX0Fka
	 cu4jhX6C7Cz0UD8Vj33vRl9Fn3i4+MGO8yvR4IEDThw1hoZrosDWk4vKs7Out4eFVOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848350;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=F4ur6QQF1zfwW0GccFtcSQ/AKccCErCW2OP1q88a0fY=;
	b=yqpeYRCydSuah152YZ8mW3WHJ7lBQSrjrmzUP7AZSTq1UZMUYQMkm56uJ1/2KAIUjCff
	 FPlTqzkgwzuK6tgH1YhksnbdNu5QF/kTyew8jdDK848taPfcciOas5ygKg1hl+BDURAwp
	 VA9Ghv2lH8eGYjqPxLFztrDmZ0i8KR9llabzsQmaXymF6qOqkX+3M2su2kdg/3UGRx7dh
	 8jClugH0h8IW3Q4l4XstqqwC+zcbVgcJG/04CT2/QH3mtvfhKTWc8htWSnPuQuJHFwvsZ
	 jZ3DtHMWrtpYa+3qFP6oTxfKnoBNbdLPtRE1bh1t4OBWa/Q9+y1q5uiK90SsZUb2BxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R+J/+BLB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CD606A88C;
	Mon, 16 Nov 2026 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+J/+BLB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BF11F000C9;
	Mon, 16 Nov 2026 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848350;
	bh=F4ur6QQF1zfwW0GccFtcSQ/AKccCErCW2OP1q88a0fY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R+J/+BLBz+v52V9EodmNskSXjI2QqourwXmDMgYvUbT0Ub4f/14FFzmxeLVLTXwDZ
	 X67lDVVo3CPtZYv7EqpPzrhrDECuAP2Yywv2k7CByL57487wrLHryTKwlT/I+Q26zP
	 mhaMxAJWvSgnVQh8Ls3ZPImmprsNBNi2bFt0jmEQhyzFdKq+Kod6dewfhoi0bTZ0nN
	 +AtP0/JKrPvy12U2L8HhD/XWZzfUU9xwhDrT35EnFaZza8C2RBL+vDfqWxNehBavKw
	 DRye2gVa0ew179KbWnn0t9Ryy30XfI0vvFls6xe73+QUZvRWh1NpjR3W+wJVj468S8
	 guvkwKmZ30QGA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
References: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
Subject: Re: [PATCH v2 0/2] clk: sunxi-ng: h616: PLL output gate and GPU
 notifier order
Message-Id: <179484834812.3674093.743014872311780954.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 00:59:08 +0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 16 Nov 2026 08:45:06 +0000, Arun Iyengar wrote:
> Patch 1 gates the H616 PLLs with their output enable bit instead of
> powering them down. Patch 2 registers the GPU PLL notifier before the
> mux notifier, as Ilya Titov's 0ec5e7572ddc did for the CPU.
> 
> No Cc: stable: the patch 1 crash needs out-of-tree H616 HDMI, and the
> old GPU notifier order never failed here.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/2] clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
      https://git.kernel.org/sunxi/linux/c/5aae0639bcc6
[2/2] clk: sunxi-ng: h616: Register GPU PLL notifier before mux notifier
      https://git.kernel.org/sunxi/linux/c/3f8438336a3b

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

