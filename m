Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815661;
	b=pXfoc9edXXvyApVeRcEEALmrFWzST2gSYOnZXq/R5sAt29fnCkQTBxCK3lkcicryqwZe
	 WiqAzWd579ZqoP5BB7AMHe7rn0kHqiYZujZGta9rjT+Qg8YQjvGA5nL0hvnN13TA+ANKM
	 3bfeBc2vF0QqAQDCq1vr6mTYsHapSTGlLP+YQucC9URaqcu9Zfir+7obKlhjBfZ2tqjfX
	 xcq2gfe3Lc8PGTqvGqgHC6LqPQ+S399u+XkHY7HaGCVFlHHgDXk4JnNLu2kE7uaRdxX2+
	 F9a5eKYhuA1cB1huqZUJUd0iVt9r3a36tUCvi34etmbJpL2xWbPDE3+DVaKSssdr6sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815661;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CSHeF8CZzspC6ZpG0nTcxIoCIcYGAXvnZzFBsc+IRag=;
	b=MPJpcSdfhpj03iUdBZHOfg3GeWjlZ2dO641ALqMecFkDVAwb8n4QYtBiOpccKwdQOBVG
	 APFTGQi4agl8Gjtgth/5hUxW959rLRufR6pQTXQ8gK8jJZtJblo8xG2lyUxBkRT7ExV8s
	 k3wpmoqSUM8Cr7ZPT+giPka9+yDvFPBp5ADLTYo31iazCanZhXHSpG1/wsafrbMH0OET/
	 gw4ddyWOIOtdiWrb3vBnYkDrVOgRCZORyxpT7jNJvFJY8St+Rf4PhlzrAQdRflP4uihSg
	 fT6oMl03IqkUii9Z5qFHaayVmx5SP0i9JzYyXw87kfpj0as22wVZXfzMQZ2/Co51CzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHM5nL0z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E6606D806;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHM5nL0z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815660;
	b=nOw79fhPFwclbLFjVkU2fgmYYwIrAN0YOKy4xVbIb00d6pvc9bVlBBUB8fLGFmagb9pj
	 puUeM+HDNU7S7iA0DvSbLED8/6P6PKy41lquq0HCDaxXuZdHfWKgBH8zFQ8O5Bx26AlxN
	 WMogTDa/D649O6vzfUrAJgZq9bXKGFUaoDGx6lpxO7A9NpVrzP7YhPcIoBNW/s1ZMomvZ
	 eSjIZaNHq1Xv+I9+RiA7jO8V7pfhgJQ7flvus+F3kkNhun88YEsIki+afs8kolBDFkIcn
	 9Fa4lZMS1dNoyTwjXxWqO1yvY1ipe5jrXwTjOCB9I9R5/zwoxQuDbuB4oaiUbbST52g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815660;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CSHeF8CZzspC6ZpG0nTcxIoCIcYGAXvnZzFBsc+IRag=;
	b=yOPbsPhd6uCnKA6UB+jTbVLE6z8E08J6qH9FBIauLlKIDGuDeSw4tKT0jJOSABCTWTpt
	 6bWxzKw7PcYzvzbP+o1mvitYZ7aFoTEBnkxxOmrFVp1TwmLxOmVlbnrhfeAXM2M7is1BG
	 pRmujxK8oNg0SDPDrzuygqTgQj2c44OcjRSBx103x4b9OB4FcM3ZCj2tW6S7ORmT8Q5rD
	 yiVIvSLZ0XaivaDv2oCMc0OMVVvd64zuHD9zVDAycp9KyB44XCoI2g1r55IFDEp5QaTpB
	 4xH1ickiwKakk5HmKlwxCO1n0S6cfo9H6RLM3dc8wraXdyAoFblC0arOefDx70hXrRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78C771F00A15;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815660;
	bh=CSHeF8CZzspC6ZpG0nTcxIoCIcYGAXvnZzFBsc+IRag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nHM5nL0zvroY2fAQIztoiiZLAmgmWxDc1t1Z8+KUvd8m27iiRM0QTMy/qF+o9tsnE
	 48pVMzkwt2tLQ8nfA96UK9TiOQ+TJFjgo63Lsjw9ThTlUCdTjw2epu3vyHjMe8tp8C
	 4Sq7ppEwS4gJ0RApsxfRKyCU7hGbhUo7ZHQnpQy2EzhrWY9hFjXiA+MBashRbfOQi2
	 uShswLyIf3+f2w22hYkPv0q5pi4YlnZOjnVRgmmLTp+P6XMsQF1mMWLWl1AThmK9/r
	 NceEduSEDztN9dFcVMwjDvUBz4lJamm1dpV+3oSg7mMzQlXpPbnLU+gcvrmrXezgT3
	 cME8yzSDzUIAg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 05D1146F15;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:12 +0000
Subject: [PATCH 4/7] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8350
 LPASS TX
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
Message-Id: <20261104-b4-sm8350-sound-v1-4-4c872df294fa@fromdisposition.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1540;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=0hLjX+UuZseyb7/LGbuCXr+F7fsgUZAI6EHJS7cn3Zo=;
 b=eBdl5XseGfy6llngy+lt6PaHrN/tEzsTHy/Yb7Xf8zmg3pDjPiYQLqghZGGGLZQBHqF1cJokg
 umT2TkOJOo/DDWD+YEFNbHfi/7Q6VHQ+JvZ91AzwPUN5dvMJufO0hCZ
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 TX macro is LPASS v9.2 as on SM8450 and takes the same
clocks, so add it with SM8450 as the fallback. Use "contains" in the
clocks condition so that it also covers the fallback form.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml       | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e..f9702a11e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -19,6 +19,9 @@ properties:
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - const: qcom,sm8350-lpass-tx-macro
+          - const: qcom,sm8450-lpass-tx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
@@ -90,10 +93,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sc8280xp-lpass-tx-macro
-            - qcom,sm8250-lpass-tx-macro
-            - qcom,sm8450-lpass-tx-macro
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-tx-macro
+              - qcom,sm8250-lpass-tx-macro
+              - qcom,sm8450-lpass-tx-macro
     then:
       properties:
         clocks:

-- 
2.53.0


