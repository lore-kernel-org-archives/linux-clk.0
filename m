Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815660;
	b=g7Q3xoOOluS3b9K43/+cm3ZOie7xfo3wyh10cNoPGElUtrhQg//RhqF+VQlmqvTP/HLX
	 CBPYsBCqZ6r2f8V+vaaY7ef3SCw+rza79Np+U9lAZqKZGfQcO8h7HqsRFPsLBWn3Ehv1C
	 7Ppu/vHPARyDIL/lC3hY8+gqCmi/QPZH7Kf48yckQ/yjWwfutZe8lQrkqbIK4Cfpi9J0I
	 IWKZl/qZ37fhqYCi62+Xh5qd0als5+Z8GbTJ5xYAv/xuVgpn7WDwNWn8P4kdnQuFFfr+0
	 0u7JGIzFNnj71wVRcuL9+fsSpzWI7z/BfCtGDfJ9KYHQhBZat/wum3xMJSJywPyczuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815660;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=EMkD1pg31XkRNT5X4prEULnhee2/vYIGdX91uOpvaE8=;
	b=GN2JaeyMLuA9TtDADqSjikCpgk7YgmKJV3XFYhjFgaAr5up2O5zUAinJSp+rkLadYEyb
	 XypCDuBAMGvFnx/XiTB3GMBKdDWmFB/pwDW+1aT+uRKS1iMuUBLrBl9tTXgtnEcYHHuTM
	 nc4FbGmutLMGGJX7rlJ0L1HvubO7yATU8SGFBVszxB9K/Q9k7TySLWo+ymWS2FbB/49at
	 MhlcASJi3cc30avVlVMFpTweiJWReOhtb+WgUh0ZQrfBn9K0EYxVtW870CtL/h0W40IaF
	 zymneBQqtLhn7czHkuZI/Su9NWskXfHGS+lYlstV8xUJz3nm7wf3TfikR06Q1COQgIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DbFS/uhh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9C606A335;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbFS/uhh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815660;
	b=160KAIXgZ85JU+a1qVaTKo9RlAOP9j+dfY7VY+6uv/2k/qpyS5+KdW7B9bfouLyJdnfr
	 +ibJQnJ+FzyBZwi+/30DEixwfuyQ5mT3MRtAjXpWnLFPR1HSDmKCHG2hMk2p18uuIW2Up
	 Vi60EGxIfq1cGfsDCR05R1Lu3smAzJ8VL8oZws0SnGis+X7AofkY8QtEjH/mcMjXP9kWA
	 12XC19wZjT4bE61QT1F8vmn2GHfp7k307Q4zE+JejQl6RIDTEw9XteSAvyRnwZTPkmpu0
	 mmQvsN43aOsSVAKGvfsZfQ4I9QMec09QDnzGa/Qg81SiGVg6t9vKcZ9IWmV7OiVRBQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815660;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=EMkD1pg31XkRNT5X4prEULnhee2/vYIGdX91uOpvaE8=;
	b=Yc442eVgC7BVncAvMiRaNoWXeMwHNomlYLdUxkSKLHGIOZTbWGzUj6x0wmUge2gwSf9K
	 BhOX0c+h9cOYAwZPlBRLELbUdRXXE6mz9MzKhsShoFeZNQwldNDXkdG6XXn81JWZn1Xhw
	 v/u7hxfYTj2hsVLGPxt+4jhHWtv+dpPhI0DeuM9MPwtTrWHOOKohW4/PPAtUvvVcsoPdo
	 0mPrhreZyFAaxrhcs+R3lZJW/F1L+RPM191l47QEGk8bWVUI5PtoZqG79Rdq4kL69NAGa
	 oV1rDGFTdYBXO8sakTN9u+gdWTiCu8uHI2gQj4YdiLSgOhM8sALTsysUgUGS37seI0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63D011F000C1;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815660;
	bh=EMkD1pg31XkRNT5X4prEULnhee2/vYIGdX91uOpvaE8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DbFS/uhh9eWu7JLQzcL1TY+sRi7xd7C2BHIXOwXax97zkIGFkFKlKB+zznR3/sPaB
	 I9oG+E0mayP2CKrSeeEzvF4eEZThxbe8W/kt7D1+2xcdgmXnM2hl3ED4Q4BHIzD882
	 EWIO5o/IrED+nhChmR02ZVOAOpqQgRdTezsCj5dGgzrreXpv1ly3w1IUDyl5fSc9YA
	 tzus46Lnksj0n1jAduxVh32TW0y5MwxQCmoBFNGBZg3XSxOhX29jAhypT886l3asWq
	 TyYFdAJdWCG/itrXGs3cTC9MBRXwqvaTGb38pzqvzwI3oa38ysxVeB/noyFth8nvcy
	 WUARt9g6FAlcQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B888B46F05;
	Wed,  4 Nov 2026 18:07:38 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Subject: [PATCH 0/7] arm64: dts: qcom: sm8350: Add SoundWire and LPASS
Date: Wed, 04 Nov 2026 18:07:08 +0000
Message-Id: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQxFS0VykuTBx1hEbJGBHEu
 ze1y7f4/wShyCTwKk6ItLPwEjL0owA/dWEk5D4bjDKV1sqisyifunwqlCWFHqlzplHW+KFuIFd
 rpIGP+/hu/5bkZvLbbwPX9QXVuT6YcwAAAA==
X-Change-ID: 20261104-b4-sm8350-sound-eab29042cf89
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=2038;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=fNBkRx9oOq8JcXG9i2p9apIYE9Yo40nYXqote7bxW7w=;
 b=o+uWwnaZIlViseX7pK0bL3/DF7R5FDEX9+1gjo8H8V16mzfT87FBFOM2NbKaHW53knKx5DsPq
 DCT8rBR2POgBrl1RdDDSUPI4kKF/80aapRv8Iuwo8cOisy/7jfcwP/j
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

SM8350 has the ADSP audio services in its dtsi but none of the LPASS
codec macros or SoundWire controllers, so boards can't describe their
codecs and DMICs yet. This series adds the RX, TX and VA macros with
their SoundWire controllers, and the SM8350 sound card compatible.

Patches 1-2 go through clk, 3-5 and 7 through ASoC, 6 through qcom
arm64. The macros use the data the drivers already have: RX that of
SM8250, TX that of SM8450, VA that of SC7280.

Tested on the Razer Edge 5G: both DMICs record through the VA macro and
the WCD9380 enumerates on the RX and TX buses. Capture from the
WCD9380's ADCs through the TX macro is silent with the SM8450 data, and
headphone playback isn't tested. The WSA macro is left out: this board
has no WSA amplifiers to test it with.

Prepared with the help of an AI coding assistant, reviewed and tested
by me.

---
Demeter Barna (7):
      dt-bindings: clock: qcom,sc8280xp-lpasscc: Add SM8350 LPASS audio CSR
      clk: qcom: lpassaudiocc-sc7280: Add SM8350 audio CSR resets
      ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8350 LPASS RX
      ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8350 LPASS TX
      ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8350 LPASS VA
      arm64: dts: qcom: sm8350: Add SoundWire and LPASS
      ASoC: dt-bindings: qcom,sm8250: Add SM8350 sound card

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |   1 +
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  12 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  12 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   3 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   3 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 196 +++++++++++++++++++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |   4 +
 7 files changed, 223 insertions(+), 8 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-b4-sm8350-sound-eab29042cf89

Best regards,
--  
Demeter Barna <me@fromdisposition.org>


