Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764652E6CD8
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852995; cv=none; b=HOiXjwIAxwBcKC2nVSgTtkkkArOnaQ6JoZFc+oxWimH+RxmgMa3RqbGWIOMOJuHgHDDO5mASZjhIGxm80nRz/U1J7xVLjsIolYE2k6ImOseAu3nlUQXHFMgJrO9pGW2sjdb0u5z3aKltdwqBaOb2r6jP2wPtY+urBmDJlEqOKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852995; c=relaxed/simple;
	bh=fJ72ZMhavTt/zW71hZxTnZ2SN+OoyfXQg3BT41sI8Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jqJ4hE629O4lJAF+ccA4bSGCmgOSUPEpiVvGnM85jOLkW/XoGigIxvKQaHX4AqwDg1ZFMTviDfAqhez0fYZksuhJHcW4rrrwDkOOD9nxwSnmjmOqOeuk/1OL8m7Dz8Wp0MccP1rThJXbcQ3FcWemfj5MDH9DKAfxXHaxLVSbzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFCCekN9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFCCekN9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso979922066b.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852992; x=1760457792; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=jFCCekN9RwyDqx0qwWloiB2wwjxnod2enfPpmNxf62IebJoXUXrWni7d1z3/EnGHfy
         aNjUnnfzdXYBXMN24SVO9QzcPUDwdeih3LIjXUTaLo5rLJQyZ9VQml+fPbGzSgoT5Ybd
         loMdf0h4Qra0w/hNiQD++yk8JcJ7wz5QLH7DqqYa9/F+5XzltCrB49IxTZpEzjz9pyDG
         BIoqsvlqBbcvI/GJM/sLpM8IMlgP1FTh7bH075VpkQ2xYaw60YQMBJ2X2YJ7JBqSl/6u
         CUNvszkf+5wJEVfvKbnhLSm202BycDdQPadAoVY4BUgX+4BMlnGVCjNbKk6CqM3paVHe
         Zj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852992; x=1760457792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=t7goOWtpsJMaNCc/1ua5mRJL62/AqhPMT875QrwFPOMZb5nFm03AMzqNnwBbYcj+2/
         5sNI+B3EHMb+XspqORrkB0ZSAFC9nXs7fOJeIQlml74ozR56fs48TK/XByyRQARyeOW0
         Jog9CfQnkSZ71cz67d12ixa3HkPsZRubPm9GOAecVPe68I7Dto8NQwJm/pcCnV4jvGbQ
         aKq/PfsiEk10tbGGDe7L9Z651fC7wBf7mnN46AVJImCsl+vp+8FYgLtjPmK44MDlhvsS
         UgVtrJX21PnsxPfXgDvz9wShUZUlsx+4kuTrK5YCjDsppYJtlbn0rKFYKdTApNFfPciY
         9wZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfYmKyc3agP2guXWaVR5QZ0pk46zU6TMocMb9npao77jRvPpr53qapHl4ji6dsQOXXBIy7FVol5LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywtiHIPgBdQKcX2gm6glO9VLNrpZebPdF1h+DfMd/nrsiF9IZT
	dwlJKj2Ha6Q60lLer703QT7FTS0wcHGW+d8xXv+nxjCj1ZPre/oEA96LPG7pzG1XqQY=
X-Gm-Gg: ASbGncsFfIEd0CY5yQjW02FL1/5EoAghDSwFOJb7GRrius/pXz1+B4oAjdj0a/IeOo1
	44x4/IdDDri/fS1FDmkYe5FOoYisL+hTG97nnvmnvlDG8BoUK9qY7Bx71F7v3UugI6KDRQinz0i
	HDoVjFXgFHPSqtHTxG7+FLhLbBu+gbJxDa2P0Pry7j4HcJ/GG5ieEBEDu6NvWQAFdyNV7OnpyUz
	y0RiRVeJHauaqyplDyWnIiEkxws3R2Yu6eIh/Dtlcro2GLfdqaKL0cbVfBoKhs84qMToEg3j3Hb
	k7QotxWUjfb7/ROQIjzqkJwYPZ94UKDYsyPUdEDpXyLq37GKAMJ8/iyoW+Cr7Bo/rjfgHsKlm2r
	4T2s3kn8Ds2Bne05lGzX8/CX7KH9J/cbBpbOsXpFG/2l4CWq1tdFk6w8u9ol0DTkDhxH4ykPPD3
	hIthY+uLNKmW1BxCnSg2aPgDJxPR6JlzsGw4EBrl+q
X-Google-Smtp-Source: AGHT+IGcHy/Jl0g2LAmEkVEntCtICg9hZqb+cVzIJexCEPogdkyReymHfPrFtWwic4ednSokiuHGag==
X-Received: by 2002:a17:907:807:b0:b41:f729:77b0 with SMTP id a640c23a62f3a-b50aa1869bfmr22271266b.21.1759852991654;
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa637sm1399772566b.12.2025.10.07.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 17:03:10 +0100
Subject: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL055WgC/y2NQQrCQAwAv1JyNpCsqK1fkR7qblyDdVM2oELp3
 13E48xhZgWXquJw7lao8lJXKw1410G8TyULamoMgcKBiU642FsqJntOWhzjbPGB2SzPgtmZ+K/
 2gforD0dKQw8ttlS56ec3uozb9gU0JNMieAAAAA==
X-Change-ID: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The CMU can be part of a power domain, so we need to allow the relevant
property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index caf442ead24bda57e531420d8a7d8de8713032ae..31e106ef913dead9a038b3b6d8b43b950587f6aa 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -46,6 +46,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

