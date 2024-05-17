Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0951C4B
	for <linux-clk@vger.kernel.org>; Fri, 17 May 2024 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951797; cv=none; b=K8I9TyB7Au5vjXz0LaX7cfaLDsOOlzNbELetPjmxbvCcMPnOd4LOCg+DAnQlQYYeq/1vWXodpg4WcdQab3nKD0Ty5J5v9xzBLTgrcVtmVE9R2Y4x21/A7er3N1Fj1msC3zCuUUK+XiAi0SGgmAO8CUcPsSXjBnVjVZDzZw0sjts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951797; c=relaxed/simple;
	bh=LsL6/+HEsOXR+sC6ERUzXuGIUNVSxnK0ZFUkngyWS04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po8GglVg5suAzs9eiBRUrUvcPzC3GwaxAwLZtp3kVk25Rb+s42lLwZvmM4u0z+QmjZ5GyghOjuqQnOG1VialJ/XRVzautQXxhbcS+sJtiOKLG5ofLOm9/WUfGVRTl/tRlb7aLiwazyHX8cnLGioDY9XSvQErRf6jH6fjfz88MjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=cjFZN1xx; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="cjFZN1xx"
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8nebunxi/byJgjN/w1ZOJ1kbMfAR+jz+Tg2mpCFNWc=;
	b=cjFZN1xxWW6muiTPhuOb32VS0vyZ9LuOcO+zvrBNxNLG8U6VHm27MIdUPHm2YcY2WbBGR2
	EPXY1WnZqphGg3038eoaj8eBRAmpv+o4sZdnmYCiGjObjOk5riT5sbiPQu+gwdjQyGQOUP
	+x04HHATCbTFUhmZbMVUyZ4ppJCA/gxOBbjUG83xphHhXrgMT7UWF6UwJNZGV2lukqWk2b
	NSQyfvYviWYGNJS1mO8eX3BsZ+Y7awd27gr4U7NQkyYlzSOs+TIcVYBRrWvjqqqnWsiiws
	ZTT79Kx2eK7Gcloo1V3MMM/2x8sXU9GB0+CYd9bTBIVMQ6k9WJ82ShBLgAJ4FA==
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: perex@perex.cz
X-Envelope-To: tiwai@suse.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: alsi@bang-olufsen.dk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 15:02:18 +0200
Subject: [PATCH 11/13] dt-bindings: a2b: add compatible string for Beosound
 Shape node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-11-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The Beosound Shape has the same device tree bindings as an AD2425, so it
is sufficient to just add an entry to the compatible enum.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
index dcda15e8032a..bea29f88d535 100644
--- a/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
+++ b/Documentation/devicetree/bindings/a2b/adi,ad24xx.yaml
@@ -81,6 +81,7 @@ patternProperties:
           - adi,ad2427-node
           - adi,ad2428-node
           - adi,ad2429-node
+          - beo,shape-node
 
       reg:
         maxItems: 1

-- 
2.44.0

