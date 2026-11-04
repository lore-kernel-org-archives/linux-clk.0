Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815662;
	b=gUT7yuB2R2kO8kAvFLxZyTDIlZ0YWNEaivptvfLHK7RjLkEGjc1q03SmXMeVrJ9NKGii
	 JosYuSlm2Udomwa9aRcyIfH7BUoygDMYB+y+kdYpnXRPc4blL8+6kQMuylUfOMwwfVJuJ
	 R+tCDrd0dqc0rEMT/hvBj+gPmC9aFGeiyrZFAaw65wIu7oETQQzdoEDTdwE7v5GnRBR5k
	 V6LxpZc6ivegu0ODP2emqCMpWeNLOj92utyjWniIAVOgX05yncWf9QmfGjjwuO2ZYjGu6
	 3RGLE06KiNBOIa5TVWGQ6PVI6OGMU5+7vUF3i427Sk7rGXAyDj2BYD3u9+kHFs/xiXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815662;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=feXw+oZEYdBIRmAK/aposC1kHx2cqbOwiziykHTGEYs=;
	b=ptVvzdRWcTVmFlqs02N5DepGUjvPsZ1O7IL+H48pqbMVbcKFML0to7eGECnX7yDKnXHi
	 BSqvWOMS7FHoR08Yg8lKVKLvHFVC9WxwZUALzjPWpU9H+0aI5uH3KdIHRHe+4rCa/ma2u
	 6BGpgqMbUSHxsmR/X6bY9uYN3nUijoR0sITn72Q0ofIcOFIzF4fyIcOYKSkVMkgRojhjM
	 QhE6ShxPgiiMmBXAlJulKWSbUtokGpPR6K7xhLqaM6QsSt7785YGPTqAHHI4fCAB8df0c
	 TGOcECX3nrTIwtsyCv7xmJxmykq6fV4knqi1txFGYaGv71mH0DnERpDpMLr6PdWMoug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUqqzDEk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38B60703DC;
	Wed,  4 Nov 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUqqzDEk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815661;
	b=p5Nk7PXilOQIdtTZYg2TAKIATMXfvVZtux7ivdBVVxTcy05JEsEYXE7/WuFMt4sxO0uz
	 XsAp/P0nYtL57anJWamHm2Ias8MluVYIcuRiESWlEc+2NJnElAwrJNIz8KecMokEfxmQv
	 GOzM1cKsJcrKLPeiPd5vdJ49CsqR/sn7z+1swlMf3+CQyLZJiYVw4hYG/6EemUjuuElc9
	 KorFtffb7IFZtUgV1foYxBS7DRNthJj7c4UJKIYPFgxmv1Ghsa9aRHFPyPf0coIBv2V5E
	 A65XFsfP4uILYmactA2FJOVoNzbOKdHgqcCBHK+3GuBu5tGZlTkZIJQyjJC3P7HTfVg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=feXw+oZEYdBIRmAK/aposC1kHx2cqbOwiziykHTGEYs=;
	b=dxRZKjtwuba4+hNPtTlZIuziLwvnbPKTMRJSa4ved2bEFWB8gBzRw30GchpSd2yofRkS
	 5mbVunOAEwBuD5FEhDL7zmBHGlvCzMwtQMJnOkgBLJ7Ewm0MwY3OnR0ffiNktpZOG4J6t
	 5WAcOBvWyJVY5hJERqkJs5ZKf6YPYvalgWt2YC9NgJBWkb5QROo1NMWuDerCXEtTX4hjm
	 p7+d9Rys1MwMeqnFh3HsN9L+QdPJ6MLlqIAF4aZnI8Vv6yQmXFBey6O1XZJ3lcOjWHuRB
	 CHnCRc/1gNGpHffKHZ3zjCLgRTNLjyww82fyxQZi9nhKWUFLIMzdWbYfawj39ZTieag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25EBD1F00A1C;
	Wed,  4 Nov 2026 18:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815661;
	bh=feXw+oZEYdBIRmAK/aposC1kHx2cqbOwiziykHTGEYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NUqqzDEknvzq+I+QO0gzb/x0OcWRz13ges+OKxH7yMK8pv95k7jib1mdE425feeY0
	 nbfITwgX9MHxI60zMolG4J7vHDcN9a7lsud5Po5R+67qOdBz1YIvBx6JVxa6++fVyK
	 h0TfawBOsiNEcniqnEl7CFVmEJBvI1KvpBEqbSbJcm/OyN4IyFUZEW66SLxBGWhLgX
	 0/MN6a9MtYprsfqOqIUui5J5cLSchYHrYAXIMfByU7JbQGhR5qhPPmLJBL7JHbi+Li
	 YLNTwXYoqD+ZMRvfGQzCPzAlgQDLpwGNg4KmLzS7hVZIhhPLfr6NJ+9h3hP6YkWWGz
	 yi/th66DceS4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FDB646F21;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:15 +0000
Subject: [PATCH 7/7] ASoC: dt-bindings: qcom,sm8250: Add SM8350 sound card
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
Message-Id: <20261104-b4-sm8350-sound-v1-7-4c872df294fa@fromdisposition.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1024;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=WzyI+H2dXucyfn4YdVhqjW+4BoqlMGa4ke+mqK0BZpo=;
 b=l+qClH2K37db/cfg3zbyViozWf1icXt282DudloAbK5a2uT0ksNh3SyJlT/Ic52OOD+3Q2QTA
 mc5yew/xCaSDfeJX1aRnjXLZohunlLWG450HyEh1WhNGqY89v39ZcRK
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 sound card is the SM8250 one: the same DSP services (APR with
q6afe, q6asm, q6adm), LPASS codec macros and back ends, handled by the
sm8250 machine driver. Add its compatible with the SM8250 one as a
fallback.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e..ccf553f38 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,6 +21,9 @@ properties:
               - lenovo,yoga-c630-sndcard
               - qcom,db845c-sndcard
           - const: qcom,sdm845-sndcard
+      - items:
+          - const: qcom,sm8350-sndcard
+          - const: qcom,sm8250-sndcard
       - items:
           - enum:
               - qcom,eliza-sndcard

-- 
2.53.0


