Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C663B5318;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615031; cv=none; b=MGr1f++bHOD3dOWKSyId2MIoHtyHYuGkvL2jfM0FRm3olUomLOFv9BZTEQKS4MDAhOm6aCfraoTyH/TmoUMqAi3Rbly3ONaKhdmNxcdjYeWAWD3zqZmTNQbAOxmE7odEXd+l4lhue4s5FXGj6ZSYWASvas9kOofo09NS2WlwPEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615031; c=relaxed/simple;
	bh=ZRtgythNUWuTKkqjsOPQzdBTM5sRjHcbFE1i7TFqLZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOt2cQohEV7WhPbI9/jcEBrOTBPr+SqQwpFQMMBZ81U/ouWUkmW70Fx1drvSHT00/qyjm7MoM76leI6P5q43VvaWb+yFzSJFZyJcqu0dCaIoTw6Cvh4WxiHHDNE1SsA2re+gfzkAmFTDuWTo50/+mVNDTUxMkJfZFc3KbTD34sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqV1zZOh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqV1zZOh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35484C2BCF5;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=ZRtgythNUWuTKkqjsOPQzdBTM5sRjHcbFE1i7TFqLZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LqV1zZOhynyWbDZWJ4jcEe9Kk0eTXNf4DW5NBwuEGzjqFa2JEmr9tA5H1b/CBqGJO
	 htIaAJ5PU3Q67iEb+XlqnCQdlfM6B4OGuPuXvcehqGTpSI9qrxMf/JMMiity5CjAqV
	 uG8Xv6YT8B43D7yocFCVT3CMUH/ysLUA7ZI9iiSjLJvaI8CEq0l/75fj+hLZHDhQTN
	 tA6om1ttnNLdXP6K2KFjhHAYZJbWw4MD6CyQO7zIQxSEdcoqMAvdDixNoo9nb4BX8r
	 NEpscYnkfCw/zaUJ/rGOEOMX2hyPm6nobjrL63iPXZXeaNIMzdZNIn9zYXOrFKxXq6
	 3dMjlHEdJwTkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16597C5DF66;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:13 +0800
Subject: [PATCH v3 2/6] dt-bindings: mfd: syscon: add Ambarella CV75 secure
 scratchpad
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-2-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=887;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=7UUWM+HfbNQWDCef0OWKCQrG2Or9h9Cimqi3CyH0cqU=;
 b=B423N+54XHdjRnfbecFiazdfTgyW8mpLgkE4sCs9bmJOzhzyjTV6tukI2rcgCtP2596aLXAn1
 Ozas4RbMAmnBCZuLhbeJqO6PiEQgVC722bDWBGL8ViNJb8llFo0pDKp
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Allow ambarella,cv75-sec-scratchpad with syscon for shared secure
scratchpad registers used by pinctrl pull configuration.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fe882d3f828b..9ebf702c06f1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -32,6 +32,7 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - altr,l3regs
               - altr,sdr-ctl
+              - ambarella,cv75-sec-scratchpad
               - amd,pensando-elba-syscon
               - amlogic,meson-mx-assist
               - amlogic,meson-mx-bootrom

-- 
2.34.1


