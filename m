Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325EA2EBB8E
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009655; cv=none; b=T2six0Kpd8FqaMD4K3ctRPH34yuusZ+kegMN1mbEPTZ2w+qijUqvCF/QYsHDtH2QaxxvIgscd3L+NMuf3w+ferXGzlJUGArSldKrp66eKE7CNng5j6VEoSYbKqlBJBphVF75gBfGGru+oNLh/GmGCuQnE8UVe87Yt4GpaPYh3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009655; c=relaxed/simple;
	bh=O1BKycRGNthSYb0ohF0X4SEMZkG88dk2jx+ATr4R8SY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qUYw44ogmAaF7tHXQjwV2+5oBbDs6vlsWPVKJIVDieN/0MT2zQr9WRwXdMV9hWQGd+bhtKyTYwSo74WTM3knl00cHjheM9+0jXxQOZRvEgaaJ/MT+2dabUYMj1q7JcYpgMlz1QDd0lRSK8zidlMx8pJkYH3wGuTlD5F3ffJw8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wf8Hx+CW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wf8Hx+CW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GrtlWkPykP2UGhEYZ1mlITFEOfhFQseir/1q2h/KuPs=;
	b=Wf8Hx+CWc/YD67RecB9TQofnJ6XTxJ2Ju6phcTNUnOeEIBFJWNahqYxhxYEq52xaPluPBA
	JgXtG208zVn9/59+Mzk2G6M564MV4VxpmCB5R4zAtvnMXqN/mOA7jllFI91zzBEU/asQJl
	o2D+OypKnyhK6UeRHRBTPcYqWwcskhs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-aZyWpVHNMP-yFxgm3S8F7g-1; Tue, 12 Aug 2025 10:40:51 -0400
X-MC-Unique: aZyWpVHNMP-yFxgm3S8F7g-1
X-Mimecast-MFC-AGG-ID: aZyWpVHNMP-yFxgm3S8F7g_1755009651
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af1a20cbcfso146406311cf.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009651; x=1755614451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrtlWkPykP2UGhEYZ1mlITFEOfhFQseir/1q2h/KuPs=;
        b=k9hu6sLQLfuScz5A31xyqXSjICtz3VrNo3K5Li1hTysJElvpJ1ffs9TribcWEQ2Rml
         sBQ5hFlqPufCcRAQRUYHpHBOjKOEFhc1OVykzc8wFgYJ1754SgIzzRqZuGkD1Kx20Qcq
         kUQgTB0fRFIsezpTiEOSeM+LTiVVpfD+b04+SJ1Io15eifKt6dKNgE/YwgwgVwgZEy6c
         uEe3L5keyX8OApQEWLLKsZenpWDeSDWuzsQnp3Lqh6zhA1a7OLJu6W+g+2FUnSGxKghP
         anfgTxC9XdaG5KtiVAoxTZIQLIM9bM1h8U3z2shzWGYLHieyTL1iQ3wmncnoC/uzDniG
         PeyA==
X-Gm-Message-State: AOJu0Yy7XH0KfLCZJogW4r5llL5jMMaRN494qTzQlJEIiQqnDTQKRafP
	mhMWjofu0eXTvuYekSQk2GcCbpYIi7XRiYaWDbb9mWhbEiVmPohl+CUOG3jFuLFeLtQMHwS2aVo
	TCL6GSMvMzHrGHPs+7j2PPd7mC6ZoH6foaR++wBMr8LwQRn6HUbq61v0ZEHA6mg==
X-Gm-Gg: ASbGncvPdzbyVJP2Mt1tRe5FqtJbZS7VOYonAtXSEzTGuUhctk1+wPwciumw78VdvJE
	wa3Pa58SG+U98oWe3NC2GDtr320MumO8rsGkMU5N80ipSfQhbOimILNPbR07SlcwbN2MvB5qJSp
	mANBy7mmDcBYl5lX6xZypY/TvUs7JLOn4PI2prpoar6LyFV61phb9NI14dns7u3Xi5+kY/sBCQa
	LHnYtNfFZtAyPam499FoavunpKlYZPhpGGxqBZF80hxWyRGTLY8hZnecu6WLaBnOEV0kWXb6lOh
	DQR//rLpSp+ykq3yGWWs6AhXYoJuGzdi5P3C6uXPagjfRyqqefcfWM9qnf1otRbM/soHjupzHZO
	LxA==
X-Received: by 2002:a05:622a:424d:b0:4b0:8ac3:a388 with SMTP id d75a77b69052e-4b0ecbe0220mr54542121cf.19.1755009650958;
        Tue, 12 Aug 2025 07:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJjQ2WPo3VYUQRWF+jr5lSqQVnMnzVYSgVHk64lWJXULfngTJRBQVPkwUKVYUa2Jx1W0rdMA==
X-Received: by 2002:a05:622a:424d:b0:4b0:8ac3:a388 with SMTP id d75a77b69052e-4b0ecbe0220mr54541511cf.19.1755009650235;
        Tue, 12 Aug 2025 07:40:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:40:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/9] clk: add kunit tests and some documentation
Date: Tue, 12 Aug 2025 10:40:30 -0400
Message-Id: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5Sm2gC/x3MQQqAIBBA0avErBsQxdKuEi3CphqKDCciCO+et
 HyL/18QSkwCXfVCopuF41Fg6grCOh4LIU/FoJW2yqkGw77hRXIJTjEImmC8a60n7x2U6Ew08/M
 P+yHnD7fRrtpgAAAA
X-Change-ID: 20250806-clk-tests-docs-3c398759e998
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=2947;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=O1BKycRGNthSYb0ohF0X4SEMZkG88dk2jx+ATr4R8SY=;
 b=T7Unh4WiIdFvx62ErZ3kQ1ReqmvhteFdVWsKujqYSX2E1vKD+ePlNyx/rUwfDjXSEkUFzJoLT
 khDkX2wlCpuChekvUTQ+na5TBBONHUFUItozo2mIWySt3nX12pcjXYS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Here's a series that adds various kunit tests to the clk framework,
and documents the members of struct clk_core. These tests are centered
around inconsistencies and limitations in the clock framework that may
lead to some clocks unknowingly changing rates during a rate change of
their siblings.

The intent of the clock framework is to keep the siblings clock rate
stable during such an operation:

    clk_set_rate(clk, MY_NEW_RATE);

However, it assumes that the sibling can generate that rate in the first
place. In many situations, it can't, and it leads to numerous bugs and
solutions over the years.

https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

We intend to fix these issues, but first we need to agree and document
what these shortcomings are. These patches are meant to do that, even
though some will be skipped as they are currently broken.

Changes since v2:
https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com/
- I left out my patches for changing the rate change propagation in
  the clk core so that parent rate changes are negotiated with all of
  it's children (and below). I will post a new version of that logic at
  a later time once I finish some more cleanups. The changes that are
  coming will make it so that the skipped tests in patch 4 of this
  series (div_div_2 and div_div_3) pass.
- Make divider clocks one based (Maxime)
- Text updates to clk_core kernel docs (Maxime)
- Convert from KUNIT_ASSERT_xx to KUNIT_EXPECT_xx (Maxime)
- Minor documentation updates to tests
- Drop rate constants and introduce clk_dummy_rate_mhz().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      clk: add kernel docs for struct clk_core
      clk: test: introduce clk_dummy_rate_mhz()
      clk: test: introduce clk_dummy_div for a mock divider
      clk: test: introduce test suite for sibling rate changes on a divider
      clk: test: introduce clk_dummy_gate for a mock gate
      clk: test: introduce test suite for sibling rate changes on a gate
      clk: test: introduce helper to create a mock mux
      clk: test: introduce test variation for sibling rate changes on a mux
      clk: test: introduce test variation for sibling rate changes on a gate/mux

 drivers/clk/clk.c      |  55 +++++
 drivers/clk/clk_test.c | 611 +++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 575 insertions(+), 91 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250806-clk-tests-docs-3c398759e998

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

