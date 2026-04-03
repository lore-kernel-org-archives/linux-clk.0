Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7828CF77
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217855; cv=none; b=oJZOZWpFeLI47xr631ozlvC++oMPdifhHJFRkr4IH4ILfJt3S/XNOQ9Fsw40AXu9HNMRV9GQI+1leGAxxHmuCvtHdWe5I983JfMwfpIABKg80RDBQFrBSITIVmtgUXLZmX9J164+w7cwokXRtn4NOQnmUqZ8QA6viluCbGnaRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217855; c=relaxed/simple;
	bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWNrVfJCaLQuEpU7eU/0wqHzt3DtFdePniCPcV5Sqhfzw/gYDO2FRYRMVeoZmpvwivP9w1tExIFKznhqY/eLxWPHBL/5LYqdqw3M6uSwmY60xtkLAdA33xnp3ZZIMJ5RdoPrBN+hg6u8gvI3clBpdME0JPCJ7mmiBRuNJ3wNIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uYWO3uu9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uYWO3uu9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso14909905e9.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217852; x=1775822652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=uYWO3uu99fVf/MquaAni0L3966Fsu9UK2im6FODXPuNaNy1VDapOA2PKud+4wQAn+9
         HhKxPmyD1r7soVnD988dUHHytQqB39Z+fy+qgtgxir1wmwH2diXjxzQ5pn4TVS12GflO
         jiekTfdp5xLMfeO9B6aM899hQXTymRkE0RIjzQh+L4mHE74IxGmB2PnQPG98hkY+pVY/
         xDbKfedF5OpxKpwrZ2hkULORFl+rTwtZnKh7dc8aFU+NnlY3olmPKBqhLeVhlmwkT8L+
         V4C8LXpuGHQ3DYT/5SfPOsqmpC4XYQX/DvBCngSw71BQ7ANec7zdL/7eKKknHpKFjY56
         DT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217852; x=1775822652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=kC2R4qhqYn04s+RXWwFIdKFkgL8m6eQonFPRJLZXnBcJ/R6XPAv0K9cf8g6FFq0ZVD
         uTIu3ctYRia/h2uLrKCOJ1B6R8tLDY2SpNmaznp0Cjd+RoHFPM9qxzHpT3PVVNSyZRYw
         LROmGY+ENNMZ9pBE5zYDmF+3acYO9AFGX+4P0l63YQREUjlYQTMXVlubFDnCl5p87oTr
         tjQ1YosIyPETkUFrd5XBj8h0GD3hlorD6olxZf+IYKK0EV+6iiMltY3qKcZY6CpC1TKQ
         c/PDIWgEjGvXPqggqnde7Qq6w+RPG2NV/j4q2Cp+vqz6GHH2LRsK4VZ5dgxMZOGGI2jh
         M0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjMzud/o4JWUbbb3ee3KhukhNTOZQt2WSk5xxcuS+rlhk8Atq5pPsVeBbOGZk1YkFKd/Cu1shkEHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxftQTyd3sPNiHG/5ck2t1Y6hH5/X2k0iHGzyAXalF7GrE/KLHx
	fwUGHQD/wZojJnBWlpWaVEyxgGOveRXUCjt4aWUOetiNF4vClCg+2qupCFb18GTHyPM=
X-Gm-Gg: ATEYQzyJJnHnvu6z8py1jXsMB7pNN+zawZJJ2A9U7YlHgPHXNgHOyXSfP5RBgWmMebS
	zQSLrBOX/4NPSVKMTz2tivYWTGsUxtPj2E3vhuPSVWhmw+8g/i6XstCEcSPZIW8VQy9DgMRpIqK
	x7CTv+xscNQn86EYBadbJVkj3OcsIizU8XmTC7VlWI819alH3nUjyn+S/KaKKOimgOTMu1zyTk4
	T2SRKsXmfW6WX237369KCKR09khgoE+4UQMJqM6VzJX6wSI4inycSdzNt901xJzNIeiWIOVS+uQ
	UwmG7p5cVHYdr06Xm+cWAopzkc9RaMvUFV9ScvYbKFyUcpGULWFTUYkRFqFExOn5npeU0au9kC0
	kq+/Z8E7lniSf0qhpRJScU90vvUKA4sHmEEzN4GKPkCJhsjfjd7wWDdjIow8WCP7TSdmcQE8xfq
	M4VnxPHUY7tZlQfQlaRsMrCWzmtEnd3MQBXw==
X-Received: by 2002:a05:600c:4356:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-4889ed32786mr12200445e9.21.1775217852087;
        Fri, 03 Apr 2026 05:04:12 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for GXCLK for Milos
Date: Fri, 03 Apr 2026 14:03:45 +0200
Message-Id: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jmbc1QFJCV9zAsCgwwEVpsK8EQ7
 m6Ftcs3yXt/VnBkmRwU0QqWZnZsdAB5iqDule5IcBMYJMoUE0zFyINxolvq4Vn7QeQqTzLZpCo
 mhCBNllpe9uCjPNjS6x26/jhCpRyJ2owj+yLStHixty8o4Sf07Lyxn/2hOd6Nf9tzLFAgVngji
 q83ld1bxXbqjaZzGIBy27YvwgCf4OEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1101;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
 b=kLWENhEQXSsTrvRcJkXn8V9hEnXhS0ktYUIqgUKUN81tHFzclgf1ExciJnbmk08N1g06dNZT6
 DUdTWbDeOIxACcU2zbtkdSv3gUyn88rIHQgbzO9tjkFv/XIr/B8bCzL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

