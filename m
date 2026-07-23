Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E75433E93
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799609; cv=none; b=RTGXRWrqAuXEE0wsd8xnvOrQQJhriNsQKSbyYMG15ltuWYKlwg7IupRZPORF+ea3LOdSbYicjGRtNQUPqLE0y47wi5Y9xJ/rn/EBg4bPuXYcA7giMpK9pvBOkR4DBOTLla23haHcq8LJD5zjPHfmqx4Ph6gJa4+4581NSannM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799609; c=relaxed/simple;
	bh=UwKYr+Iv5dMT6tWpdeFOQMRQvOl5qP3zdBgmD8sSnM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zz84O1XKt8PgM5dNW4LAWUBrxU+Jpz6IsGmvrwu/6XQWNi0g1IMpT5oXB5S3JBTafup1A1udou9XrlcPpvv4IDXuGaMRdkRJDEKABkfCjSL9v3aeEaeMswf1dBY8gnARwSDOmHAFu8BiP7aDdS8i9t/8bT5heKmowgDh3bLJYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hhmRhMMD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hhmRhMMD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4758bd3731bso227213f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 02:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799604; x=1785404404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VabuyjMdW/OYetURnHhfMAPevEDNCPNf66QdnXGjvRE=;
        b=hhmRhMMDtIcWKgB00b6WwzDfuYmsjh0cDSDzsuUFx+tyCG+E/YS45rBW4MNGWEP78N
         ve2kmfIi0S2keh3slLqObe9DUQ3yM6bd+wDLl0+ALADuLuVQe4lqdLuDL5K3bW47RxzJ
         ax2reF/z8GEAOoBTCJXqu5EEM3jgRN2GcRd2wRqg9iT6zNyuhGV1FszfeHgBbpyF+AvG
         kG7qTbAtWJ+Y0q4lycGArJITDTflCRdK4QUR6ewoxpy1TvUEjaJmW48ksgzFz/8HuZuV
         Q70c3glwavROzUUmADCrZKQ43qHf6LIEfYtIHD33XVhDtMmFdY39UYKl93usZ2d9RTjs
         CQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799604; x=1785404404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VabuyjMdW/OYetURnHhfMAPevEDNCPNf66QdnXGjvRE=;
        b=MOiUF5H1Q6sBD8rqcx6qt08XcsG1XG6Vyw0apbiJRuUx969qQdE/cQOBhc2xbCmlOH
         Fa74I9YcGaHkr1UPxvSkUfw1rFe+5D9xDuEPGVhUsGw/UbmiiyTvzencin0VkQ7sDpgo
         ifTGrlSyOXuQiRUVc3/o874vwxs5QtfjBW9UyU9JV3gjGEZbmdbnpT0xQP3STt58hmm/
         dW7Q10jhyZWKbCBNG3d1L0Z2RI6HeWnd1+W04tLqJUpwcLF6jojcRJ2DZbgGL8EJgvp+
         z/UCVwxsYhUBmvdE5griPoJo2H+bVVSMd5UKbT2J25FZXqr0ZsVQ0jBQ7bdqU1xco3Xn
         cd6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoEYTaWRduPIaZ4OJVzRfO6buMnxJBo6PGWhbiSz+iZN4kh0ITfvIx6kEZw9IpcE7OOj1nnwQa4wxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdZSbftee9P8HlMUPmAhAk1+/u0NJ+iyhOP3bct6nSgoRugTP
	97lo+4swsiqK8wTE35QQiQvAPqAa3k3VYoZpp9OLVnDSgORbB3hYcsj3fHB9T+eWimI=
X-Gm-Gg: AR+sD13xhXE9C8Ww5ZiOqSjt9/YZXLmJW9VZIZq9vRuHlQ0s3o0E5y901LyhuLf5zqo
	iZMcY5J7H0N9o0B6aW0G3WfYgxcIl+k+KwSzsy4ACxbQBNPBvQGGDyo9twPs8FzS3wnuoJeMJUy
	bUVfblXecVvVidkCFvwURfbu3jpy/M7E3s5q+Hp1miKYKBwf+v8c87AgdL8B+IkGqVlHbDzDVD8
	1IplsHwkYVHXwqipUUv0l+qitgAH6B1RcVbxL4NbbERxznHtAmSKsRqdQTIJIOb+YwfPiIX5zYb
	DFrFgjDdlveTvCeQ6K1oFk4M7y2IF6kkrkNej9jxScSPxYtphy0SafwYPlMRso5uEHcSn5OSKAP
	ugvh6LwKpoOe8PXi6As1iegGX3rIZAHGikxrmu8j8TaGEC19W1859FWgaMZismqBkiitbxjj65f
	Fm
X-Received: by 2002:a5d:5885:0:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47f9029dcf1mr2238623f8f.29.1784799603785;
        Thu, 23 Jul 2026 02:40:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85a2573csm13114936f8f.0.2026.07.23.02.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v7 0/4] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu, 23 Jul 2026 11:39:50 +0200
Message-Id: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbhYWoC/23Oz2oDIRDH8VcJnmvRGZ0xPfU9Sg/+20Zos8EN0
 hD23evmEil7/ImfL3MXS64lL+LtcBc1t7KU+dwHvxxEPPnzV5Yl9S1AgdUAJD0jynqNMlpNnCZ
 tMmXRv19qnsrvI/Xx2fepLNe53h7lBtvrFiFFcHxGGkglOTBoDezM5N6Dv32XUPNrnH/E1mn4t
 KxgsNhtDmCdQjYp0441ox2Ob6bbCVExuBQw4Y61g9U8WNstOjYxAvkw8Y6lwcJ4M3VLqGP04GI
 8+n92Xdc/UdA6iZMBAAA=
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UwKYr+Iv5dMT6tWpdeFOQMRQvOl5qP3zdBgmD8sSnM8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFqim8dihHV4JlgFGkOuF4DXC+e1/OfG8SJ6
 h6ae6F1xnKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhagAKCRDm/A8cN/La
 hVrcD/9KTm8iu7kzukjjHIcuYjzHlD5oNQm0eiKqiSyv56YgpS17Q51om3A+QwhEA+EylMs3fqx
 0LwyNjwjEY0HxcXjK2bLuIE8LH1Sng3QCWH46izGMfa53Lb8Qgk4zyQWpURoRDnVJHpKQBcVHCd
 ZwuOvyTf27LTuQ/fLOKacIKoyjfXdZwXIz39iQO0IhccvD8JX/rPpd6zlQJyQu8Uwdv6fgz36hd
 5sNbfeFSAWPxQuBb6HkVup45RQbx/U3ZbDlFMOSQzPtTf8fo19EY+BiWT+XxnKYOMTzfsTiS5tf
 5ZbkILJKCphRx3Qi3uKZfKoBc/STq/DVc8TWLaF8Ysw48N2NaPaG1LyabMvprL0/z1sKwEYqkzI
 pbI/7Ujy02Mr26uWUZUDvOndyr5FoM6/ijeRcJlqa21wNeyTozfvvVMciwT6RQtTGenq8wnb8cl
 Iv3J2WNp0YOUNXHo5VB4AdE3NUmGFj5YdwM7O1acQ4i542ZHX3qP+uhxQ4uYZax8oU6Rfefnpyf
 smmIjST47TLAQMsjDkAfXnbW0fRpLt0KDyGJxHeQcwaMxCiI844R0ZQauPfu1/AhSM9C7r//GGX
 /rtCGNdzjo+oAZ03Yl4shKRlxbWEIvY/l+HkZAfJTrauu+wsip+kDtfz6Sk3doOZDy+7L1R7DGR
 oRFkUMgxfDmJIQw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v7:
- Droped left over unneeded change to ccu_mux_helper_unapply_prediv()
- Link to v6: https://patch.msgid.link/20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com

Changes in v6:
- Add .set_parent callback to the divider RO ops
- Link to v5: https://patch.msgid.link/20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com

Changes in v5:
- Droped already applied changes
- Fix determine rate mux helper calculation
- Changed clock split commit description
- Added a macro for the clock number without gates
- Link to v4: https://patch.msgid.link/20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (4):
      clk: sunxi-ng: mux: fix determine helper rate propagation
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate
      clk: sunxi-ng: sun6i-rtc: add a733 support

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 89 ++++++++++++++++++++++++++++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 +-
 drivers/clk/sunxi-ng/ccu_div.c       | 31 ++++++++++++-
 drivers/clk/sunxi-ng/ccu_div.h       |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c       | 57 ++++++++++++-----------
 5 files changed, 141 insertions(+), 40 deletions(-)
---
base-commit: c52b5090bf1e3b88745f8a81f264f34100ecde42
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome

