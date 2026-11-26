Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722756;
	b=hnb/+0Lgr7yLfpNcXrzn1UW9YFzxt7ntsRbyANQlVOhXRT4Xvj88dEcE5XfW0FcbXTbj
	 FoT9VDH8gvtGfWsWWElrP97bcfAIRrUudoFLdm0n/OrJPWV/TEgdqQ9ZnWJoCXKjcvwCh
	 aVdlgpydbzXYAgIlAdXwbqiunWqzoudCQuZ+r31taSkFLP93ZVpmYj4OzlvnddAEd00h/
	 rq92rltuJSH3/iSVVr2qxsPbYA/RcGa7vLnvWFm95w7ekJef8zR0aaMGluR+1+1Y+h4OO
	 fK8gQc6WvXYDLpV+nNl3vv0jik8dNdmbB/EmAHWcOJl6W4E7LSub+A/amoDNy3v9CEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722756;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ajvyWW3DQr1rCnfZEzkj7OTvm1pagyyvWLXifOTGWgs=;
	b=UlCzxDHQ8/XXiJH1by64pu+BW47MXi5UPh4/TJbMX4S8kHZjLOimibTGBzlZRfAcTCUX
	 03MmXF8zYEs6zQFrZtIAUufjhW+CpUK6htD67ZCjs4bTL89QrxcripO6EPF0y9JR6IAm2
	 +/hy56TIYJRGbEZfUAv1GKku5+HhET2T+0fdLEVzo3ApsrqkobI7ObMYEznAjcK72Do5/
	 sobxqnEp+w+7YQNvnXe4Obh+lky97lwqT8SgHWe5v6hK1e6DKFHYhA+8EM0Ta9R2aN+hX
	 9XvvpJFdIJB9DzxOuqF0uX/mHFgS+wxHlSaLM3nrJJFZpxZWQdsP+9pZYuwnMVNrfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euu3ZruD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FB606A31C;
	Thu, 26 Nov 2026 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euu3ZruD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9403D1F000C6;
	Thu, 26 Nov 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722756;
	bh=ajvyWW3DQr1rCnfZEzkj7OTvm1pagyyvWLXifOTGWgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=euu3ZruD/jO/Cz59b2NnQ2b1peKqrTn8kO+SefyayWS1KE4BmNliv+1SGG32IJluR
	 HE+Wnt4lNs2O+p0Sb7CBioN1hsFPgnPtOEqBick/8fnOwSZMmIJMF11Dp8ZQA2W4pn
	 I2nCxfnJ29minJKzmridkdPEuF4ZbJZ32VtmElZZ49wUfn7NcM95JitWOUqKHZwjxz
	 77EG/q/IMuqZJSZC8cSKn6XLotVbvPmi8H6TTceQsPDWbv2NQ62Q0V7G9lIEpN3P/J
	 Tyfuaerh/opGBOb1bUIykjFwNy2VSxqeXCsBKh/QlVUq7sKIj9nq3/0jwh5bigr2dR
	 Odj7yaMCZ4Bag==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jiebing Chen <jiebing.chen@amlogic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Subject: Re: (subset) [PATCH v8 0/5] Add support for S4 audio
Message-Id: <179570534680.142532.3364346752372243512.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:02:26 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dN2PQHo40OLUF6RS5mHEqX2pS3hO9wRkmfDDYCTRwMA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5ev/9cO3b/bdZ+OzM2NssB23Y2pT+fPqzJFJbtbWXL
 8b16UadjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk8itGhv+by9Ott92ZrXBs
 4/Viz6+Xqv6mv3+xtfzMctunJ3y1baQZGZ55TVU4+9H2qNDMKgtH3wmTa5vna26RtplRJ/Hn9+a
 kMA4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 10:28:23 +0800, Jiebing Chen wrote:
> Add support for S4 audio
> 
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
      https://git.kernel.org/broonie/sound/c/145707a7d371
[3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
      https://git.kernel.org/broonie/sound/c/61802135f743

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

