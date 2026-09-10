Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BA4489FD3
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049812; cv=none; b=agU3HRw6m/ccVjQgGmRCCsTWNJenGwiE9Ke+9FR5+3eytU26fPGaEXxLmsayDKzTG65IfKHc3t5NvMAo1HKS4YOVZD6c3o3BcQJfuebpxOWbrOJ3KrjMNKZ11amGVjQ2oqilxFvuncSk5072I78tzHVkOhq+mPQcdj9jgwbp5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049812; c=relaxed/simple;
	bh=Nay3LPpHkzmUOR2yFLIxbZK/j+WBUazFJ93AhqK7x8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BK04DwwYLNzewCWOvygx9vLPKmXyVkM2hLZnA+MbnASHGm6ju2WXAc427OE/8zmlm1WZYBMp1n7WyBP0ndUTB2gjbK6i3f2KgyzU7+fTzPWTGaoVCUPRMPoe2nTg1mcrtv8nQAw3I4VlnF4AMLnu8bDpMvyh+7jiyRnUBZp9G9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8FwVx28; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8FwVx28"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso10645065e9.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049808; x=1789654608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=m8FwVx288C/QajAORCMOh/BdLO3MtDYU/9rc6uzc49A2JyBcRFhdDiLW4QvMu5v/MM
         DcpYy2srodbZOSzycNp3+GkgS7VToNz56yDydrZsVtboZa2ZA9Cd7HVIT6dWtUH3EySn
         CTMUX2OTquF7iUSJ3hww4LWzYgCL0tQX+cVlzDUyPZ5NsFRbKE2X190YMFZUpI/xCbij
         UHjU4zyV+D2sSE/Rwtxf2s8Lfhp9ahWPXxOyuQDeCvYLesxkBHyNPGfDnTyA0+6xqZBx
         8fVV4juwK5wW0h5vTfSH9dcjqO1kvL1ct4LIT2tPaHfS6V9lKrQhPbpTY1MPbxJGT55N
         UwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049808; x=1789654608;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=IXlc6LZ9F1FfB/Cc0Evmruh1YDVBeVz8haeTneTFEaoj4RcWtBUj+9tOTYWjB4sC/Z
         fqkEVdop18HK8zG+7nfjZIlDI3yF09j7Kczrr4SiNHqdpnU4ApLdYBR2xmJBOnD/nojl
         1k/0TviGL32ObQA4+Tr5XTJTs21qlZOd/0ynUpBvICrXK1rhZXkRY94tc8DqDtk7HRXo
         Wkl61rsOkMmpm1dafZVUQhii0Hi5oWwEB1ttmyqUoC0cnZ8+dd0w0LAgb6mSbURycCi9
         2iS96E3RBvokM7RwhWS6Q2nSiBzi4yqo/H7C+8ZtEgU83unh5/K7AQR/e5XcVTwQUVwC
         CHYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5vgAhlX9f6GwuIS8BrOVMxer804LA2l1ILPEvC8bSdmF06EB/ItUy8v3luzBXgxM3UTyzIa85i2k=@vger.kernel.org
X-Gm-Message-State: AFuF++le32ZqYYiN5RxxAR14TttLwpErsDPaa6izXchD2PEkubVCYQI+
	o6/nd4j5IufxA4UuDHGZ39GDZDjxc7LqYt+cEG6uCId7UbtPdF5RoJ+n
X-Gm-Gg: AYBFou1yMbz7oN3kegmi7d1n2MNwYGeZ6/JKLuxJfgxqlup7C5K6Otu9I/0MNEOiuy+
	WoyRMCqddAJhnzREiD9kDFLWL5kBW3cJWxMmPoLSK98TThdNx3QtGPjPQxJuLgkV2mo2658jFow
	iIyDkyg58FCC4kUJYqtEHDaWhGu3Oo9+Ym/Yzm5wkE82owg2SGzOcCbm8PLLq7aPBbPzQNyD/zr
	7i9rtiuUEGEMFtF+LeATknDLDkOZaKKNpYiD/gdGaFUhCQv9mP/2GIG+xEb1nxLPHOJwxy/prWy
	t/Ubhp/pxl0AhPoI0Ekwy9hwyV80AXiVrIdjxIoaBMYsqxex0Vzrfpx/VQrslvfC+TryopHTV7l
	aAQFIm05pFEsLNkkVbgfI/9uftJE3Xg4UMlgp4izC/2xJZVZz6xT/H+QUBXEyJVJWPcbtn41vKX
	RitaQ8ocnDIRnmY5ymaQSdZE/oqIU81qocbSUhZ3RVqCI/Pfx6+q5KBbeCCwzrQafkccPkEbSsp
	zpvN43jvUng8D52+eTI1vz+s3Wv/dze1qVoNotWjkinjiXL4fSfHzvfDRv6os0Toaa2WDC7aQ==
X-Received: by 2002:a05:600c:5307:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49d25871d73mr162962375e9.0.1789049807967;
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] of: property: Make fw_devlink follow GPIO, PWM and
 clock nexus maps
Date: Thu, 10 Sep 2026 16:16:41 +0200
Message-Id: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMm7omoC/3XNQQ7CIBCF4as0s3YMkEiLK+9hukCY2olKG1Bs0
 /TuYhOXLv+XzDcLJIpMCY7VApEyJx5CCbWrwPU2XAnZlwYllBZGSOze6CnfOdww0PRKGMn6GV1
 zMLXQFyGNh3I8Rup42uBzW7rn9BzivP3J8rv+SPWPzBIF6qYjaYymurGnIlhP094ND2jXdf0AE
 E5L/L4AAAA=
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This series fixes an fw_devlink supplier-resolution problem reported by
Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
resources routed through an LVDS connector. Consumers referencing the
nexus could remain deferred because fw_devlink linked them to the nexus
rather than to the providers selected by gpio-map and pwm-map. [1]

GPIO, PWM and clock consumer APIs use of_parse_phandle_with_args_map()
to resolve specifiers through gpio-map, pwm-map and clock-map
properties. The corresponding fw_devlink parsers use direct phandle
parsing instead. Given a consumer which references a nexus, the consumer
API and fw_devlink therefore resolve the reference to different nodes:

  consumer API:  consumer -> nexus -> mapped provider
  fw_devlink:    consumer -> nexus

A nexus is a translation node rather than the resource provider and need
not have a driver. The link to it can consequently remain unresolved and
defer the consumer even though the mapped provider is available.

Make the fw_devlink GPIO, PWM and clock parsers use the same map-aware
resolver as their consumer APIs. The resolver also handles valid direct
references by returning the original provider when no map is present.
Use dedicated exact-name and suffix declaration macros to opt these
bindings into map-aware parsing without changing unrelated property
parsers. Retain GPIO's existing exclusions and compatibility handling.

The regression tests call the OF add_links operation and verify that a
mapped reference creates exactly one link to the final provider, not to
the nexus. They also cover valid direct references. The GPIO tests
exercise all property spellings recognized by fw_devlink, including the
deprecated singular and unprefixed forms.

Tested with:
  - The new CONFIG_OF_UNITTEST fw_devlink cases under QEMU/x86_64 all
    passed
  - W=1 builds on x86_64 and arm64, including the OF unittest data
  - Toradex Verdin iMX8M Plus hardware using a connector nexus for the
    display GPIO and PWM resources: the display probes successfully

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

---
Changes in v2:
- Split the unit tests into per-resource follow-up commits
- Added clock nexus as well because the clock nexus series was merged:
  https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
- Link to v1: https://lore.kernel.org/r/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com

---
Ernest Van Hoecke (7):
      of: property: fw_devlink: Follow GPIO nexus maps
      of: property: fw_devlink: Report unsupported supplier linking
      of: unittest: Test fw_devlink with GPIO nexus maps
      of: property: fw_devlink: Follow PWM nexus maps
      of: unittest: Test fw_devlink with PWM nexus maps
      of: property: fw_devlink: Follow clock nexus maps
      of: unittest: Test fw_devlink with clock nexus maps

 drivers/of/property.c                       | 53 ++++++++++++++-----
 drivers/of/unittest-data/tests-phandle.dtsi | 63 +++++++++++++++++++++++
 drivers/of/unittest.c                       | 79 +++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 13 deletions(-)
---
base-commit: 91b1b8d437abe0cd83210d8f257b785a63047aa9
change-id: 20260901-fw-devlink-nexus-ready-c859706b019d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

