Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85437F8B2
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641614; cv=none; b=IusTcMx4pPJFdCwEFMTe5D4EQwY22BD2kDESH8mrqG7v7scO7whhA0lV9wrsutUUFopwPxJxlVcdmAzQ2vypggxYNU/JV8QIAftbQPChSW1F9Z1Zq2TOkb87pGvHLZskI0uGWoD5dq87fG5TugE7k17w+BPaqUQsv6pVrJt8jg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641614; c=relaxed/simple;
	bh=FwO80H1E3JHTygfTphnHg7nPuRMZdLoWNR8BX9Qlzrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pl80VDu+VMonaBVfAxHa6NIWXfvbxC1lCTUqN9OiRZ4nVYIDFWz4BGQ68h6JjNREtVlUHvyvq8A/gRU/2bbPHTEjqqCRk4gqDT0YBuybVI50a4IkFhQzGGXWnZVtWXE0PUdW0LOV0t72Hw1+qYsyzhcF5cqORTbg8XGQkdrYf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMF/599B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMF/599B"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ac10e337so33945965e9.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641611; x=1782246411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPpoQ7v1yBgGnokyZPjeSn3hpjUfo+LeGZ8fvnOwicA=;
        b=cMF/599BLMWCwwLnwPqQwcBt1kBYtH9YFbPuATwCE3S+g4voHXKTiHvvL9ygnuDTir
         8nMLxBCkuHTnJ3vD/SQjU1606jrV0ikaiFYv+GLveAOVXGA9X2V6yYyFwoRWl9yzoUnn
         fi2rxF4bk8R7iInr8v47uuwVmYWX+ayhRiVmWGetKBrWZ1bVkDb8z58RjdnBOnesgumz
         iDfMYXWdo2a6hYz09epaYZ7FZ97jBss5H/tisrXsaQFXM8Ga1DIiSpgQ6dA79vm+6gst
         C+EtLLooN3M8GbaShFMlEv5o8fIWMeAs5HLxaAwNP6SK1wOZ+pWvOk6l8rF8baLJU1yx
         smuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641611; x=1782246411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPpoQ7v1yBgGnokyZPjeSn3hpjUfo+LeGZ8fvnOwicA=;
        b=C/DW2IsqAH7xPccTnMrWUyBzH1iawLqGvKvJkU6dj4bQBvSnL5WYZoYcUlwHoNwL+H
         V0e0LeeyHtAt/EvrOBHkQ9CnJln6eZKuffJ8Bq6LDrKXH+H4OJ4ts2Ke4wFLlfEqlbAY
         zD2a5CTpqXgDxj9q5eb6912LPrZeoMsWYGlqgP8rux/flz1VlmM9nSN7vdcpduW2CHfF
         SjxzuRAbFK0NCDEoF7TO1KWPGEyec/F/oDdIdZ112GqPUSeaKLJoGmwdt6nzbHpwejb6
         k/2gbrCEt52NhoXZ8zfOW/1P7MtSP4q3jmQGWL75QrdYWrRAY4bKBzJ4eCiTKL2NPorR
         Oxnw==
X-Gm-Message-State: AOJu0Yw+cmF3+hiHpQ1Eb9m6aSz0uW1+mVb1NTNXU8y/4zRUvHOgI7pC
	2Z/VHWFxzJgEurRaiYvafuT9fJGHwecjsutsW0MActq2J3xVlMncb3Qv
X-Gm-Gg: Acq92OHMpvJpcFrnzQg4cbWU1KLgQeVH1qMG03uE3XQVXWJa9QLRpNSX6dWwTXDSbvR
	AQk52eie1werViVCHJZ6MkmF9xzcxrhNLjOwWeBVQzVWdhkkZj/hiW+/pPT8Y9bBv/+/BTFo4XI
	leLweZDD+3FnygS7MdD9nJrtIE9e6VqI4GM+zsdupL5hcDbb4lw5XkKaDe9JKKuMdJ4cMbNIzs3
	cWJnPHA6Ml9qwuvqLsu6oObpkCxWjQlLbEPMjeW8gJXgV2KPUhDxy82SkM/JDFGS/h5KXiOVBIL
	jYDasbINVgqErjJD39CXB5ocY7z7TU+mqfFZBpIMNMnZb/ThDR7lC4rriprJcHosDcnvqvNA9cJ
	ykLs80v8Br/DFu/xeqKc0f6w9nSjP5oJTIFIylDOx6pUN9bWLsrGRhrW+e1o0SW7/9k5CFbOBKs
	/0FWP4orKD4QZ4IQc7TwnjG4IqPjQOfYJo8A==
X-Received: by 2002:a05:600c:c09a:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-492333bf9f6mr15240805e9.11.1781641611016;
        Tue, 16 Jun 2026 13:26:51 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:26:50 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v4 00/12] ZTE zx297520v3 clock bindings and driver
Date: Tue, 16 Jun 2026 23:26:20 +0300
Message-Id: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQU7DMBBFrxJ5jZE9YydxV0hIHIAtYmE749Zq0
 4AdokKVu2MZpEaw/DPz3vwry5QiZbZrrizREnOcziWou4b5gz3vicehZAYCWqGl4F8XMP505EB
 qQEMoofesXL8lCvFSTS/s+emRvf4ME71/FOv8u3E2E/fTOMZ513hJ3gGaYFHpVoOxCKA1ahN81
 7vWkDNDr7rqOsQ8T+mzNl1klf0rtUguOElnfQiBTNs97EcbT/flYXUssOXkjYPCgQmCBo9CBP2
 Xww0H5sZh4XwXSCuy2Pdhy63r+g3mrePpXwEAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3793;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=FwO80H1E3JHTygfTphnHg7nPuRMZdLoWNR8BX9Qlzrk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGA2Nqb6P7bZNY0Jn4Ahgvm54BiflHnww1Wp
 u3KXRrPtbCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxgBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKA+hAAnx40hgB9SBYrpop0r6jTAhXwWFB+/nn
 8O5iuk7DJYzsn3lFHR+tQsG/3cq8O7tocyhW4ubq6jhNbAzdzsYG6+XgURtNbokwpiShr/YAiDb
 4oQ1NC8EXwXA7LgrmX2yZdOmbAyxuRhzMRybynIIdF1njxSpkjG00NV2Zd0yKyQcNzuD2F2YAym
 0FVMdmgtHajdER14GjV7j/lVTxhLlYSWAywYjzo12eOhe46yC2wEpvYNDXwvgnxqp/pWsMHS1UC
 +nK7V4n9pzLusWq0KIbO/QhI5e5ZqmigRzmls9mRjJvpa51E/tzbJCnxJm3JWpHw/ORPl6iMw5O
 gg4JE/Gq2lO3gfmdpPlFhXZ5BTAJWVB1bhiSj1rX+qok978+gl79sn34X1UFOI7leRg4W+bARP7
 UCH19kVRvyS57uxdSj979jBaGnUBk7W9m8YvESecdVtlcvRK47vAR/4QH330wX8kgNkxV9SfAlg
 Uk6pDKy1JQ+Jvq7EGbEIDjbjIPOfukvF4YJm5vu8z+QbLOMA0pimFP9kDsfHb6JDPEW1m83p9HU
 h+eW2BFnEfs75ZDUTn1jsbm/hhRvEGoCqKcq7hvHELRO3NtnT+5Pl/uJgIqMTepp4EDDqeIkjKK
 eP6OcLPboHD1sgSiQp35Tdl+pAfF0drGakTpXhQvSlYivxx4SD3k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 4 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

I expect Sashiko to find a lot of slopiness mistakes, so I kept the 
[RFC] tag for this submission.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Add regmap based clocks
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 clock device nodes
      ARM: dts: zte: Add a syscon-reboot for zx297520v3 boards

 .../bindings/clock/zte,zx297520v3-lspclk.yaml      | 130 ++++
 .../bindings/clock/zte,zx297520v3-matrixclk.yaml   | 180 +++++
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |  70 ++
 MAINTAINERS                                        |   4 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  97 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  28 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 247 +++++++
 drivers/clk/zte/clk-zx.c                           | 157 ++++
 drivers/clk/zte/clk-zx.h                           |  79 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 795 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 477 +++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 224 ++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 219 ++++++
 18 files changed, 2718 insertions(+), 9 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

