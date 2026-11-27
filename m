Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770729;
	b=puNq3/Wr1/Pyp8YU13+Bp7KySTpwugpGTfJnNyxKXVhmtvfrQvC8m7hsMq24gkyYxgaj
	 ZwqORu3rtB2fJCka15nPNLRSNLAydmKXKm1NpTzWDwOZPKOPuBdw9AwOjSOZx+QFYRh71
	 ouct7K0/Apsz2UXsKrEa4Xe/D7Y7VEuVrORLqypLY5dt0CuPBxkXiUPGWuTnaM7L2RDXT
	 aXMJODh9yqUg2rv3TBQHC6BC9mquj0p90lEsZVkiKM33peMvcmbShreReYnrwGNNh2BxH
	 Qeio8xR97sGMrC+NJOs6Z/bpnSArpJOt2/K12rvqGqigYxzJxVq64bQu8WN8Ac0YTSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770729;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2vWBAjVlkWrVVinA/ToKJ8Qc7wsyb5OfEWa0MR6AwCk=;
	b=HJ7Ozm8AQXvkcwIJL0wZZqD1Cj3jQZrQireIpxdgAeyTKUjw9myQXTqbIbjslCPt6vUx
	 kDJisFiTgYhnjmpCO7gHoy0+ECm5DzDDHHGFauhDPaITevb/lC5aL5gr5oeW1OuOCTO/b
	 PEYs7MpFuXRk2rlyPdT004xQY/mUbRY+GTxq6v07L2EbjIu8cKN/ejEhZYn1Gu4zHF+C0
	 CeL+pAzRgBjWV+qRJfR5w2PmysrRVBXG8aD4XebuC5RAfOBv0XrXPMYpQ7mRhoK4QJ+aD
	 RgvhVzxCRgSkSHYi2uPtx2iL3758uTffVeqhKkGPvFZz7j8cFXXdG8CurFihmXqfwOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncPh7f1q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFE606A31C;
	Fri, 27 Nov 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncPh7f1q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795770729;
	b=eoapA/X2U7q5VBIdqYcVqK91pY5mztxNDJLVpFzrC8EG578lirZZpFZYYM5bOeMR3Z6P
	 KRSU61o9W0oUma9B1mTJasZAoyLWEQESpcx3bu8m7h2mdV9y78kwBwCDa3zkkP9UK7S53
	 /adlm8xx0iscOJorjNDn2R9IaZFMNPnP/CT66pUAEoLhGE1UK9JOSXpNA8HtCPA/Inr8T
	 5my7+tskwnGaKL0yYjYPQYBnr7RRvZlqwVYBP4Q7vSjfOf0ySP7gTk8JnyjAujQuRMVRH
	 yt3k8NQF/hn7PI9ZGPAnZzOOWzfmB6hcGRapLYnd4j9gqHSDV9LjK5hpZ60Bd7CTSzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795770729;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2vWBAjVlkWrVVinA/ToKJ8Qc7wsyb5OfEWa0MR6AwCk=;
	b=uPev1YOz4Xy2fZhFE3IFanjV93lKvmzptIiaP/p3KYTL0HQc0L3ycrUE9Gc/HtWHuv4s
	 raBeKUVXMU9XxoKBcLr8zAYSKy8u1cQbFTxvEs3DTUfQnu9Ce4bUxDzBNQZixK8M3vQp+
	 OaR5ssvCEQd8Wu0nAJdNkWk1wmrmFkfyNovg2a+xAIBqIdW0UrvVVCfpDXEX9mbpAVz/y
	 2Mm2uNoA80+wzP4EYTw/luuzBekyJwmXSFjfeAsuRSS2Kux2yRXvl5Owyd4FUfFqDMc4d
	 wzE8HdtTt2vjknvqEv5WG/2Pe3SXfWNUkBBqXadS5kg14I92SR+/uLikzmw9q2LsxFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B81BB1F0089F;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770729;
	bh=2vWBAjVlkWrVVinA/ToKJ8Qc7wsyb5OfEWa0MR6AwCk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ncPh7f1qGEGJB+55/1vIEf8l7csCJwlZhOwW6s97mIq/tQlwSlwqFgbAY2GbvBnRl
	 7BxwENRr1k1INVvqFsDhKwVLquDxaVpJyVzetMHA2AGmdTLtXKmNjS0fVK+mU1bDaE
	 LPWt+WSwA1S3d1nXayYJMIYewedqxopTsk95qtBNO51jHCywXXSmTWVlvJu+Q9d9fN
	 pBJDZCUmAbKdm+GeprrGHy2AYa8Twe4nqQHjzIKWIXJseUaRjoJWXyui6CtiQ8Prx1
	 Yy/AWbjlxxB0bMUnJXUDMh79LXK8Voin9JVksbbMcA2HbuQq8AhMtzJUc0yWKpkwJL
	 0Zt7Y63U+2FUg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 330714B6A7;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
Date: Fri, 27 Nov 2026 17:11:25 +0800
Message-Id: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
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
X-B4-Tracking: v=1; b=H4sIAD1JCWsC/yXMQQqDMBBG4avIrA00WRjwKkUknfy2o2IkURHEu
 xvr8lu8d1BCFCSqi4MiNkkSpgxdFsQ/N32hxGeTeZlKa2MVj4GH1q1egrIV4C1g2RnKxRzRyf6
 /vZvHaf304OVe0Hle7APduW8AAAA=
X-Change-ID: 20261127-clock_audio-76eed7ee7ca2
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795770705; l=968;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=t9o7jatpCUgt1xoj3DYtJg0jt8VnLSQZmNVddOcUCTo=;
 b=UpqLeufWoTZWPnz2qm2CvQdel5yKKS226bkqZcwgQJn5qPiNF14twhN+9YdZg/aLERJNBxsOx
 sriSjv4mAZrCAcf8K130Bj2uTQmzb/2A0pDnW1pO26z3hpnjcH1IfBA
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

S4 uses the existing AXG audio clock driver and reuses the SM1 and
G12A clock hardware. Pad clock and data selection is done by pinmux,
so those pad clocks are not registered. The controller has an internal
reset line, like G12A and SM1, and an audio power domain that must be
enabled before use. The new compatible is amlogic,s4-audio-clkc;
power-domains is required for S4 and forbidden for the other
compatibles.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
Jiebing Chen (2):
      clk: meson: axg_audio: add S4 support
      ASoC:dt-bindings:clock: Add audio power domain for S4 soc

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
 drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
 2 files changed, 182 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20261127-clock_audio-76eed7ee7ca2

Best regards,
--  
Jiebing Chen <jiebing.chen@amlogic.com>


