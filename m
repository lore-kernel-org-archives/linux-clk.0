Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F02F8EA4
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027223; cv=none; b=ayaIdFe7ap+RZYg2eqU9t0VHlnI2eQvc8zcB6HVLv+gZYoP6duEL4aWBixzh0sOPzw4yRpMqW4uXzLF7sY5KiXiw9bOt3Fr7dvOQgAwKC6qqt6roe8tt5go/IMgOEQaomj8S96vS5I5wJUaVNbFnYf1CwdyqVHxaOJJjpLcrrNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027223; c=relaxed/simple;
	bh=o8Rj7B97yNJ2Oe/RYeivKyw6lYvJtZQ2PPPNuBi53pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lqkuUDY1H5YsaeMmkDA4yVz3uPPF/3+nCN15/OaFfr85OpjhGRS+e02FRQUp1tkO8oK1/PUN3gIp68DOEmDkB64sbA3rO93M+zEoqKvibjGWvhDBuWa5ng1rI3GWgUMO+PviC1fqjFc3VHHvUOvol0qKLC0Cpu7kMnSwib58qgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH3wnxpD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH3wnxpD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso1227400b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027222; x=1779632022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=KH3wnxpDchmOk640OrXMpr2n2PQwbiwSdpMCXeFtAt+c+IFmXLEhLEmgOzTFQMA16l
         Tf7s7A/VAQwgMQtAWwy3N6m2GUClFLPN2UghQkyfg5GEbdTsCnEmnoUxipSW0zHjatpD
         y0/DX/eX0CiGUAjYNPV95MhANZToRCN1dmJkPBYv653QMjr2IsYbqaWAbxK3ym/KtZ8M
         xm2E6PsKEI4wL9b7aFBt2ZH9kSL/SIB66V12edtRz42AumwKue8iSh2H3ZvLVDSnL7zr
         3ysb4S8YjgO1QORbnfzMzIQ1kP+7seEyunlHmtCJVk2Ik9nRlOrKkH6MTlfxyZjvteDF
         w3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027222; x=1779632022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk8HOd3Eg0mugUUA+8CSg5qLF5dL573+VzafG0ZQv/8=;
        b=fbhSVjYZfNbkj2Lt4dto2poSEKmdFF/kXgB359O7YBFbIGJo+xEFfMsbNBa9dtbRoc
         Y5lEg2LPnW4COruZ7cClnYF+61ZkoDp2bCZPbA7vJOUuA+FycZuq5mCgfMKfoZsPfPSR
         xDocYCUxE8ZeDpDeBHHpg4G/WD0XEEJoHeZz4wTQFBd0fBtfamlINLnpFIsQMzudcWIW
         nfvPoA0kJeyfuay0VWkB8TEKtt/hWeTjJmMn5/cscpJmcf7XjhgE0ZurFaqx9FyEHQLV
         aKEL4KeOZWrvax6np1hnoDcU4tsd0ZcPrBrqaAiMa6vyWZE37NjMrAXM8YMw7vd3tj1M
         dOKw==
X-Forwarded-Encrypted: i=1; AFNElJ9YRUzYQK2BK1LcvkAc5aNqLYRnWmjG0HFtiXepxl7dD+0Hr0owevSP6HA+QDzYOpIO4SW+18v5Li0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwNm/Te2MAeyesGQyJ/tJ16OG5cPzha+dY1fFi8avA+S7LHsA
	R2GdELJoAThHXkdXaa7QaqxMo/f1S8pi5ca9iHhCyQXUqZbQsksrxPRP
X-Gm-Gg: Acq92OEVvQV176uQsuUiAElG8w5WwwkOvqGcw/ykMOY5ObXIPIW0xo8YZgjYvaGvD8F
	HeosUOeqFkSl2z7rK4c+iPAwejHNrDUgZcgjG5KtlRnasv+Xqgc60Myo69LHgkinwqG7/rI5aHH
	AATI9iTd0LuYO18FjnFz3saB0SBvgwZgIigW1fRiaecdQH5KbHQnqtiswn13RMBxKyLlx0jA1T7
	JUcJ8JHavI0YObqVpo8qPXg1vBfyA/W64s0awu7ywbYMF3ebHTBUV5pRCrtPjJacWHO7M6G8sIK
	aBwdP2S6h7fk9DtC0mZqdlL4R0NyvAVma8UgihLqnhfcHrCPHjLJ6je6ndGzqAI6khjN3vT6SLn
	l9laAh6oYBDcfxLaT1qbHpBdJbim36vmZi6UYqwZ2ddQtbprRzSYv7jX+TSYdlR7ZEiGXqSoIrt
	5ttOiK6l91av45JLep5Zkxqx+vJAbU
X-Received: by 2002:a05:6a00:4212:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-83f33d0356bmr11819618b3a.21.1779027221951;
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:13:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/4] clk: add Siflower SF21 topcrm support
Date: Sun, 17 May 2026 22:12:54 +0800
Message-Id: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3eI0I0PdkvyC5KJcXUMLU7NkA9MkM0NjCyWgjoKi1LTMCrBp0bG
 1tQAa2/r4XQAAAA==
X-Change-ID: 20260515-sf21-topcrm-1856c05b6138
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Siflower SF21A6826 and SF21H8898 are RISC-V chips with quad-core
T-Head C908 for home routers and gateways.
This series adds the initial RISC-V Kconfig entry for Siflower SoCs and
support for the toplevel clock and reset module on Siflower SF21 socs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Chuanhong Guo (4):
      riscv: add Siflower RISC-V SoC family Kconfig support
      dt-bindings: clock: add binding header for sf21-topcrm
      dt-bindings: clock: add doc for Siflower sf21-topcrm
      clk: add support for siflower sf21-topcrm

 .../bindings/clock/siflower,sf21-topcrm.yaml       |   69 ++
 arch/riscv/Kconfig.socs                            |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/siflower/Kconfig                       |   22 +
 drivers/clk/siflower/Makefile                      |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c             | 1053 ++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   |   63 ++
 8 files changed, 1217 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-sf21-topcrm-1856c05b6138

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

