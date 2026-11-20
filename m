Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187713;
	b=N2nGkwQ+y2n4SFaY3JT5Gf8hTnqoTLp/hz2R8yYmKzXYweVrD2h8p9bptp7qbT4pGYyi
	 hGHahRmwn9nUHjJ+A1OEdyEN62d1Vcy4HkzXFfY9RjRj76iZ9SdI2n1SNu/FrIcT76hQQ
	 zQgqKWLSLb26Q2WFVXlyMGgHG1mUxsDomDO7CZOcvIqskiPMzAwLIH72jKMg3W+Tebx90
	 QAau31Q6DXVqEbirN6lGxYsn8cwaG92ef1EYVWVCN/62urfTErtXBQ6k9PcYds9ikXMwp
	 AWbB/nUwVecyvLTvrQqPMtoEPvYfCZp0Y7ZwbblC0dCYw5FjRFmaOda9ojlC5+3tHEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187713;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ctb1Jv59qIphIUTiA76EUOJsYvs5jg8Gp4OuvrA3/o8=;
	b=GeDm4G+5Pz5PWwoL7MFfpHLsHv3+03qvLCL2fTkeKVIpLO4Igb0YzsxClwSzHhdb7Xx4
	 csqvzxwo2I7llKSKnh7cSXXp7kjUS0WSQCuJc6YKaGy1JpO3Qbqk44fL8JElyFkFJYHTb
	 OKPv8naN/RdIVgNYjWtYSi+aWyrRWOKk7JMJ1SXUDhBqqebFHltFdVyoz5u2S2XBp5MoB
	 vIQty1Gu28dV6ZM+Bv3F9s6efIIOB1gf2r4GuAxFdbtfqF8zuKBhnLigBTHrI4Y0hVFSf
	 i0oGDWSNZMUu4rfXRxgWTlqO7wipW/ZbGbiBuZtxhA5UTYClods2aQhOXUz3vokYnVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiQD9vMR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261BA606A320;
	Fri, 20 Nov 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiQD9vMR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E891F000D2;
	Fri, 20 Nov 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187712;
	bh=ctb1Jv59qIphIUTiA76EUOJsYvs5jg8Gp4OuvrA3/o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TiQD9vMReX7MxulOHgIp4t1lAlYcg8Q6bEZe2CoRbS8R/9mIteUeSkYgPKmeIEDQu
	 rmmr0JvsyJFDo4K8WhriZ2eAgcX2x+2HbWes+mTXJ7ECFc4KZKBSyb4TZ5aYXQfSso
	 +2A7M7kU14nBIGXo/z5RWUlO1G7u3u5DNR+QTWGQn+zuIYWA1ioG7ps1S0Lyi0Spqj
	 VMG6VEc9iyxEzN/WEdLtb15EIXEpYgQno86Ng57cKsxBCmBEhxNjNQZbpgxALBFmdm
	 aYmFI2Y80W+Y3y2zo2G2fYmqwX47DW9+Px0tEnhudym+rZa5egtVn5MQrtmIl0anKv
	 4iVPicHcNNm+g==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Demeter Barna <me@fromdisposition.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: qcom: sm8350: Add SoundWire
 and LPASS
Message-Id: <179518673827.6016.6677815995841367128.b4-ty@b4>
Date: Fri, 20 Nov 2026 14:58:58 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YgJBtkWW8iWQG2laY8hnj1dOGRj0c+aLITIppNNt1Gk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZkv+wHWdj3HBx+6w8lwubg9ZsPNvQ1SHz2O3ESb/VM
 hd5zv1501HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJTJ3K8L/6OhP3l9CT6zqP
 HbdefX+V5gXRBfPeu5fxpT88uYzbsHQuI8OXFqfDx16+sXByvVOVxtpnw7Lyqzen7j8f3qodaxs
 n/OMHAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 18:07:08 +0000, Demeter Barna wrote:
> arm64: dts: qcom: sm8350: Add SoundWire and LPASS
> 
> SM8350 has the ADSP audio services in its dtsi but none of the LPASS
> codec macros or SoundWire controllers, so boards can't describe their
> codecs and DMICs yet. This series adds the RX, TX and VA macros with
> their SoundWire controllers, and the SM8350 sound card compatible.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[3/7] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8350 LPASS RX
      https://git.kernel.org/broonie/sound/c/bc7f78224043
[4/7] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8350 LPASS TX
      https://git.kernel.org/broonie/sound/c/f1184077e11d
[5/7] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8350 LPASS VA
      https://git.kernel.org/broonie/sound/c/991a76f7064a
[7/7] ASoC: dt-bindings: qcom,sm8250: Add SM8350 sound card
      https://git.kernel.org/broonie/sound/c/a5b5d062b40c

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

