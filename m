Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815661;
	b=c4rX1rshU+cSSbJb+YpTqKGWN02+c2sh/ymSqxR4X6mxUVeXryLhpl1bSZbBa7eCve/Y
	 61ESJzFICIx/dofaSkwRWEcQKxUldH8N4GjZlavQbbGoyFUuhzTZP/fJu5FrbRX08qMDl
	 jmmoo45/N87ilrqD8Wi3rAVEqUj1IcHCyM3fF3jWvrJS3EIkG+aS5IIrindJEvzgz9IyI
	 qdgrNEXBiMAM6CsCDRYiVupCSxY8GR7i3owX5BOJ86iGFXQi7BHLWuloKyy5UsmZo28pJ
	 gDPDhY9xtFZxt2P4fViSKgkTbVZFSr9u21Ar2VABFFWrTNrOyi1V5dCAjVQr3ifMjmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815661;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BYe3sgLS+96q0sciZfM/YWu/u3jfTHhQ8igiEsW1NWM=;
	b=QuGIO3pLTbbD35O49paNP1pXy1WdM10kR6ma+fhheUjNvkNo4xk9Jo0Xv0/jwKXGNWcD
	 IfDOq+eCF3hRpkkraOTgMhBVXuJ05oOpQZ1j10QX3bBMX0CVJkFyb3b2xIX68Vqkf0Gtn
	 V0h9krcl1yEI65KowNMh+on0C6lh0LGCOfSDs86Rqe/nM4faaLkzkyCOArIgC67/+vtjK
	 zmXo9X1YrQBT6GtUBN8WkkOr1fwxfhhhNX8iy+XnR2wg7czWFJDDAYV5ctzeTE/o1lDpd
	 97FLt0laLuGqoIU4H37jLoZa0zmsB8OEbH+2dRrpx4oLNUS6HuQU4p4dvpG2V28QRqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaFFHEWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432C606A68D;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaFFHEWJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815660;
	b=ZOT0sKABCem5SXAs6P7fAYHDgk+6J3My1i4gK9X5VeKdimOzkMlPqMhYEOWoYwi3fGVe
	 tpEUzmPzqwEFZhMEU04ywiC+hCa/fIE70IxxdCFhayyyLj3/j7AhpGd5wy9+tklFAqpkZ
	 GrkKgFWorQ9uwnEYPev2rCzwKu2upOY6DRw89EDGAI5bAiWsstrEr+fYE5wqeKNEkeyM4
	 p9Am59nPz2G3CBpx5vBdWNmXJeqxKJmLEMAuR6HBOSWD1xHo2wexQr3s8bZrKEWkDMkuU
	 yKoIoRRAX3S/s6HtgGiSUeDgh0u2/1cAt2aiWDi+6h9uKEOyPGmUTEydZe8+v7CrFiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815660;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BYe3sgLS+96q0sciZfM/YWu/u3jfTHhQ8igiEsW1NWM=;
	b=PgDKGDkt3JWdCeSryJb8oxKrYQtIY7drdHSe6gq47otznXJL4ZG9UOYPq/xf1SgmUwfY
	 FOUnSfSvnduBDS0zpuFzh76Ogv56m52EQypORefijjb24NR30YHeVWZy5KdfCLmMbuhD/
	 WAtEJRomO32XypryOWvjDbNrqKBItk1Wflmm1AKII0tj7DHZB2yFzwpeI/elB6T81DpF6
	 IVjyDgIgti4tmG5OwFuBXecbr0il/i7OUmx/TgqxkkkaQoSrUk3d+Ii7cEtjmX0c3g/k8
	 mN9+fzwsU4UJQpXxkfu7L+vDmpVTqyqHbClsT0nOkwRWD9lsFIxIh6mfqA5CmfBwUHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63D671F0093A;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815660;
	bh=BYe3sgLS+96q0sciZfM/YWu/u3jfTHhQ8igiEsW1NWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eaFFHEWJ4zQ8m5OFUufrEZ9YuKKGNq1eFRbgRoVrQsVVun9CPaxC9vvkuQNuxjdqy
	 XLwDLimnXHcjpaHxxoH6eYZy+HpnkymrepSbLsQxL1kXz6xqstjTLEf1zZSmVIGblA
	 59ZB0UxWlxT7/V89xq1veuVbDBPdji/lySmj5Qi9mTqZKvbolHLCSkGRFnCWQoOIDW
	 qIUWf6xxwnDjlyopT1iO1N5GD92b2rtoTgRykxdVPJidmGO/c/92D6zAGFxIk0mdI4
	 mGfB6IQDBAB5dsxGSpNeR9AEf/oPEUKo8qAQR1Fsg6c7XW8reBJXC5SaYqMZQqWwTy
	 am+ihQjPpUfmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CBB6B46F09;
	Wed,  4 Nov 2026 18:07:38 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:09 +0000
Subject: [PATCH 1/7] dt-bindings: clock: qcom,sc8280xp-lpasscc: Add SM8350
 LPASS audio CSR
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
Message-Id: <20261104-b4-sm8350-sound-v1-1-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
In-Reply-To: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1122;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=uLYdELyKXVAh9MvLIYStuylxx4awTFDCq7SbOgzzjnw=;
 b=bAj0U3eEhnrejkKNtVQFKlZ39o42GQzv9CEmwXty9EoSqncyDB2NWQHL8iwk7wg5UlIlwXgiV
 hkHtxEl+usVAs6otEOHuXKKvdxEDBzML3HXm+MYhm93pyQkP3CsT8jt
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

As on SC8280XP, the SM8350 LPASS audio CSR is controlled by the ADSP and
only provides resets to the OS, so it takes no clocks. Its resets are the
RX, TX and WSA SoundWire ones of SC7280 (at 0xa0, 0xa8 and 0xb0);
SC8280XP has no TX reset in this block, so there is no SC8280XP fallback
and the SC7280 reset IDs are used.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24..3d4a794ab 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
       - enum:
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
+          - qcom,sm8350-lpassaudiocc
       - items:
           - const: qcom,x1e80100-lpassaudiocc
           - const: qcom,sc8280xp-lpassaudiocc

-- 
2.53.0


