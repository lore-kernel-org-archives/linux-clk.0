Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4981FF1D4
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958054; cv=none; b=pq3rOqEJ5HKeNecS130kltZGv5JupC9nt80LLCGtBBAoCWakeCsOLrhRLsL/efYg0BbDjBfzooxDrBIgpIK2WfJ9PmAIJRqKtQcBqxII3tQbm94n5F9uNsPUEGsOKxY3j4HCoRC+7+iG4LuX9NwwNz/Os32dfmBhyq3AOpzfOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958054; c=relaxed/simple;
	bh=USi+CMS+pYT7jjBnq4t44Ylq28DQAK3Yy74AlHQBMMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=genG4QPzkiQp+YVaUBGY2e7MnVMY3yYQN6oNu2ar31DdsXcUvbPWKJVnKS5rPlFdtXne3wR+JE+5AQaOZRekgDMVyBGpejzR1ToW/6Xh5WzhxPJGdrZiRoYprV5iWKIJ3syG5Sd+K17CSNHchZAF4UDPNRXwwVmieMmIf+zEkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVYj66/h; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVYj66/h"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso450060766b.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958050; x=1742562850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBxsh3MyztApzu3sfrmXdWbHDOZhz+WJuApv9phuemE=;
        b=wVYj66/h6qgzMME+pi8IAAukT3SuKvXeJSL4X9ohEpjWQjdvgAxyfXRllqSzX649k0
         AFNGc2A9yDyDEAOtpbNH5hBU1zXpYe01oVXYYKAGFuG95GWA9TIBEMmZbBG4ypuVwG88
         TkEE3SYed/fSfFSfOplV4W9nQKEi7BAWIvAiL+lweJoWa+w+pfIespLmcE9D7f/UN+P1
         NfNjiJLJxVcbZygKg4/v3nVn8vT7w24zBDdAJUEiBv427iLKqx4JlCxc2yT6pfYrgvwj
         wLXkbDpl1ajIi6rm8FT0hMsjVj1Mx6O20qkZEEhFiJTdJn2tmIV1hXGDWrerQeEYzGv1
         MOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958050; x=1742562850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBxsh3MyztApzu3sfrmXdWbHDOZhz+WJuApv9phuemE=;
        b=WEpt6vMa6TwLQLD5gtPiwvYSQueGZxdPCUEE96oPwBVNrkzYK5KquCXAgKy/HnjoMS
         XcSnXtMs1Lr18lXcqGCmVc8GZXukeuWZ+g+xKs8AO6Md40YvESXUfZhO6X5Ou7JNtqJe
         SAITyqoJaoKdDwPGDHmLIS0aGud+/WBPChFZBzmWfo1yJQSvsI5FoEgGh8SaOx4VFGcY
         5mz37wE4LNhUO41d37ynu0u9KX1hXtVzf/SwcUyKunDPzWfi8AExb88y6ybkLDj9Bw8E
         3SFUP2sxVVcPEfspV5xMZceU7HmknPgUskx92Vss3SzWQwJ6bhXVySWU7WP/fKisjCPh
         Uexw==
X-Forwarded-Encrypted: i=1; AJvYcCUo7vZaa/9iVzJBH5q/sEFi7GhjeTtBJqAvy7yb8o7EqrIuGeeN4FtjwI38xXckKGgVuXl7I0Uyc/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCQIfyXXhqus5Z94sYNFqqkok9roYksH6pW2vU/U6SwbH83Gz
	GelylitROH/4mZJNqFTy11tx19pSZBHDEP82nKlkRiBEDgTjYM+pAUtsALvETaU=
X-Gm-Gg: ASbGncv+of4X2IvDaJhAa+Qd1gJlFy2oWiCegt/CvlXP8ZnZjODTaZKQSc0S6lkkOZy
	DDvs4dZJYVOI5ky7KOGHh6eRT5+bO/3FjPWDnxgM8dKb8TCXWh4QFvf5S5wp2uXaboRfnB55UZe
	5o2AmRBv1aaOZoemU6LFRtp03d9+o5XibszC/qSvT1GKHNvO4Mt6c0Ft38uEmwpaas3tPMEFudE
	Mdh0OB5A+oGJjyprMxT/OdTxbXGqembQGPZzPK7ZKKiIAG/iQu+G124Dm/H20f500o7eJiwQ2Ni
	sodr7KFBlmz29gKp941smQAaQt0MdKyqgOuUAWMp84RcQEaqiOwCHQGHCiNyn13Vd1Mlf1EhC+L
	7OzNIdkGaWdhCXv7Q5VKxJ/1DlbaPDf8n2xpInulP+r15NySrE+H43jkdne3GlpXyCCPF
X-Google-Smtp-Source: AGHT+IGAHvzcGzmRRyhOQBjS41OZCHYaqecqpSueuh/ovyYaA9FLKDO6h23ifUgrFUnPs1Ko46jLWw==
X-Received: by 2002:a17:907:3d87:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac330258bcamr267372066b.15.1741958049473;
        Fri, 14 Mar 2025 06:14:09 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/5] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Fri, 14 Mar 2025 13:13:58 +0000
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYr1GcC/52NTQ6CMBSEr0Le2mda+iO48h6GRYECL9HWtEhqS
 O9u5Qguv5nMfDtEG8hGuFY7BLtRJO8K6FMFw2LcbJHGwlCzWjHBBfYSH+TeCZ1NK9YKmcASj2s
 kTNw2jDOGg3nGiFwxPV1k34/CQDl8BTtROmT3rvBCcfXhc7g39Uv/0mylxEbqoTVatsI0t7I0w
 Z99mKHLOX8Bn977SuUAAAA=
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Changes in v6:
- Removes 'A phandle to an OPP node describing' per Krzysztof's comment
  on patch #1
- Drops Fixes: from patch #1 - Krzysztof
- The ordering of opp description MXC and MMXC is kept as it matches the
  power-domain ordering - Krzysztof/bod
- Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (4):
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

Vladimir Zapolskiy (1):
      dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   9 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 352 ++++++++++++++++++++
 3 files changed, 724 insertions(+), 4 deletions(-)
---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

