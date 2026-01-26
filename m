Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B922E406;
	Mon, 26 Jan 2026 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407329; cv=none; b=i4lQE1UTKsZ7foP44hgksSs3l3+7ZPi39gEywfXpJquVrgj9pnOoWtyjP4puFYeiADlxmbtGiMkDqIyj432zya9ZG2Co5UEfOo71pX+dHr5dl21PeX0yq23EAl/jb/Q33NOj3J8Zg7m+ti89dBekXqxmUOET2th5w3viROezcjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407329; c=relaxed/simple;
	bh=jxtcZmmXRvFxetXecCwlHePQ5WuC4F2aOTgTeR++Brg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTOEaZUPsL5pfCjULRtcJGA3zoc3X2wIaPoSO2zfl7qG9/pZdepYmuliifcFEF0Bt6dHNcgGgq0GikoTH1oOQ+VsHahOpDuZqaNL9p0D9Pmw1ye4fzVvUcQ9WAXg15OwWl4KaUT1cFoWWMqQCW7Ne/SqMpoM2/fQCdwG/OFxR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxgsoX77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxgsoX77"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2DFDC2BC86;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407328;
	bh=jxtcZmmXRvFxetXecCwlHePQ5WuC4F2aOTgTeR++Brg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YxgsoX77H8JrFiEv4HyznXewixZZYEthN5QB3NpihQU/WDWHNI+1AvX1XT3ApCu3P
	 HuFqEhDlYIX0mwD/79WXioq+/BCgHw1hiGN2ticv3wKBrHnpBzhG6X5Fq72bRlO3oA
	 SNA2ohUBLfZZVQorgVPTtrwyxFg09pNm0H8Hri+HHvda4ZXezePitgrVIPQTfvC+sr
	 sIXmaSxTdVDffEnP42qt2g5i/eMn9mFfLtzf/3PX9HaU86wUevPSSP/QCz8KdfSuYd
	 fmFbxkUt6vaBJ2CmTE4WWW7rCLEgJ3CpajYOAtFSICU8JGLc3v3S6zucIEDs3VQfly
	 3bAxvm95VTw7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE5C88E4F;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 26 Jan 2026 06:01:43 +0000
Subject: [PATCH v6 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=804;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=6X1OSzRQHl389xrmv+iMGiIJqB/VbuISTBq7YBeGWCI=;
 b=m56U7HCt3M+4P+Y4dUx5wcdFcKrpEn4aqCpLtgvJ1trxe9jKFWPOOwHZdBb+9Lf6P3ClibiDB
 NFo35KoQ4oDAqMI5WhI4qAIKDRyOyZqcZvhWLON8aRCHYpaUSqYc6eD
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 

-- 
2.52.0


