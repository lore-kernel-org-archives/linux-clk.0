Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180287;
	b=kStmZGnZcUseRwLfYZrU7qHzeed2pJPDlxmxCj/XQtTzzhzOFh9L6FWspA/RfqF/salj
	 6OJaFaFe6ULMS3LCrZZ0IIOOkxEGktGHD2PzmP6uLQ+DxUi0KrZgRflNEfPal8pD13ile
	 A8JQYwxzr9tPzmvxhMvQTYzcL6JWjqnYYbYMUAXvqHZeEvhuzy+Al2FzDnJ36IenTVyWZ
	 +2ghAtY6WbBmSD4Ypx4Y8fWNcS0becjdBFly/WiF6nZI8OqmwZCPufldpEWf/mcmnhJnG
	 Wfw8kj4D3aKBtET8SgbOZSArm5LOWJxOZhDctObYYtZoNdr4fwx3OjQixzyxG8eZvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
	b=Se94E12K0pmpe2Dz0HXvZVOtcjSIo2e+zNO3pCDf8KZZPfpHyDbuTCRxTqcnCIGnZh2w
	 pqttfe7dwgDsBYu1lYaxNqBgk9gvHxtZuoRBQ7MSgfVDg8g6LPSXgb3IXFoTMLqsALBbu
	 1OAR3B5W3uNQuz32B6zfdmDMD/LqXY4VFkroK/mCcm+Ycz0+ergWPKYh16g3Cfj+8Dm9B
	 YHF3eHYcV2oquK0wgmSJmRE2zXOuYe648P6ee04+UIvPBw2sT7G3YSkLpjdg4EwZORue8
	 kq5/fPysAoZutVDuiWjrYFY2Rlsr0tyizqqRxIZtV0RcJrxejMppX/VJPP3P8d2tVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FE60A3804
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009FE60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so7185635e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180284; x=1795785084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=GyHa3yO9XcmmXHRNWoSYegz5+DaD0NxLYkgoLQuVWReArzev9zK9iZUnF160zbyY1R
         AaYi2Kn9oOyjWn2ek2RAHVemv0qwJcU6jJ1J1ZCmoY0afljg/CCxcxPHc+6g0W/TP6fg
         KQcx1tovEgVuGDmRNTDRogw5sL37aBwPz+sFkm0ye94vNdsT6+a00o/Z/FC/Ey1BWcql
         scRKK0s7xfJhaAaZbjSLDddst69WUIGZ9dr3A1Xd5fv/sZA21LX+z35siG22exq760Oa
         7gaMmE5pR33kM27vug4vIwEL+F6z7Rq3JFSxJLFlrkQB7ePzP9GRY4YSdt+opRaVQuum
         Vong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180284; x=1795785084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=AXzJoruEFaN6FOpjQNo8P69KV/hfJVR3S3pXcIoATRYY+wY2xg3n5+z3yZEnjEeglP
         tcE1ROhB6HYVnn8dRntpO0GtqgLcs1mSzlD/TFYp+NwLxxedFGRdPCOUDJHMmtq9sgXC
         KasY232xuSo3W3O/HinkjQYLwBnHc+cAtdNOkpbDquCOg3BETdUyxf80+LOdIWjx80sp
         eWi4XtfrwY4TryuzqQpRa7wK0hXWL+gI5V5PDWnDDziLhS9CwPJg/J6vdHIkDu5rCaxC
         3WK0UiV6XjMtwToVHogbDQRIkh+wNC181vB/unaFFXSkU75zYcD95cCuGvqXIKVkkNhK
         JOfQ==
X-Forwarded-Encrypted: i=1; AL+hErFABxYPSHkajWKqqLnc9SuupTjawGuA2z7d0ysZ+50dJ0pdhBnTefMxCKPef7YOTPJRqlInPED7Mx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7J2B58GYcElmDtPE7D1W/1L5JbmN2eGC5ZIVzUz/j4gjzqSBz
	IHRJDseLfG2Elhll9Z+7M9D2fpuqyGM+gv2LfkH7TB1tBW93OCx281GvjZrPldZqRPs=
X-Gm-Gg: AYBFou0Ex8X10W4uCnxhpWHyxP/ztmWMAvrWlRlLTiy7W3t12NajVnRDLlOv0gJLBOD
	8D3c0DZbQ3f1nheRfUS/gYIvRq0wMYXyXcJViUVmVlwCuDBlPxt0IzUK8QlNu38fO5BtCqeIbTm
	H3sC23coCAquwPxpcozaUKSbdP5jzjePPHsLL9Q7+bwQEknKucuRdV6DYOdunKKoXsfixfdOqFI
	DM0qU24jVTN/ZVBQXpqQP7f7yTlz8HK/cVwniwftj4IbEutVHV8F6KEWLCxyGbWkWT+6BpLLb+r
	DZeqn9EOpn8zFDALlKudd9pcSj1i8jFG2awMgfMRPSr4bswzGc/l+syOYwZjy/EQq0DEZbltcXf
	zHaSS62JvmYtvP+Carc2qZfyOIT7V/HjQKhkFuSESEJrCtMpTeHF6TQz1duPkz0CxAvquymig+f
	eFqvMKypBxxobLd2fInVqMKbb4PAsqJsz9cDVs3/zXdhVXd2nsFxoGQar+mYNJy9ZYbLN2PN8HE
	LTpWvPFG7LsyLk5EyP2qUW1h/pCz5kYYuJumbueWc+no+H8CmtR2IKpwzrIY7l41eAiyMmo4Pbs
	DhwfG62XUWNmhJQwmz6fNkYCQ78L+9bhnQffSTgBLq7DfYRfg2d6ftXI1lI5hAUaaeVGE1rbHvR
	HPINhzZNSGZZpbi0CSTaoXfwDQelaLaCNhj+b5VkjsVoV1A==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb8881b52dmr64713635e9.23.1795180284211;
        Fri, 20 Nov 2026 05:11:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:22 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Date: Fri, 20 Nov 2026 14:11:03 +0100
Message-Id: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOyw6CMBBFf4V0bU1bQklc+R+GRR9TGeVlW4iE8
 O8WMHHhYhZncueeWUgAjxDIJVuIhwkD9l0CccqIqVV3B4o2MRFMSJ6GjkOIHlRLQ0lN86S50yB
 dnstCWJKuBg8O33vjrTo4jPoBJm4134SH15hU8RerMcTez/sfE9+2h5Kzf+XEKaOlLRi3UkjB3
 VWruUHt4Wz6llTrun4AhMrrGdgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the PLL clock controller and the peripherals clock
controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

---
Changes in v2:
- Drop the SCMI clock IDs patch: the IDs move to the DT series and the
  binding examples use raw SCMI clock cells (Conor, Jerome)
- Use exclusive or for the active-low reset (Jerome)
- Use absolute addresses in the binding examples (Conor)
- Rename the HIFI PLL to HIFI0, as in the datasheet (Jerome)
- Model div0p5 of the GP0, HIFI0 and HIFI1 PLLs as a read-only divider
  instead of a fixed /2 (Jerome)
- Swap the VCO and div0p5 clock IDs of each PLL, so the VCO init runs
  before the div0p5 divider reads its register (Jerome)
- Drop CLK_MESON_PLL_NOINIT_ENABLED from the HIFI0 and HIFI1 PLLs (Jerome)
- Declare one clock per line in the fclk macros and drop the default
  GP0 frac_max (Jerome)
- Clarify the fclk_en and HDMIPLL_CTRL2 comments (Jerome)
- Say why PWM H and J are read-only (Jerome)
- Fold the video and eth_rmii clocks with the composite helpers and
  local macros (Jerome)
- Add Conor's Acked-by and Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com

---
Carlo Caione (6):
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  125 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   71 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   51 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 1637 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  696 +++++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 10 files changed, 2885 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

