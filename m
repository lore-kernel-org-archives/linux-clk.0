Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE2211A05
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638398; cv=none; b=g+N60jv0mUuI6NIUCg9v83WQMOSAUQbFF/qfOds1GdGYeZnUDbY1z+Tk1E/v/iC0KuDeNjSPh2swtZ3VibEKZVVJym7pnwxX2aWlonVq0sgSMlYaRSWjC7Vg3vuzx4byKsGe9C13dJ3HuH4VcvOSebx/MkkJm8kkcJCoHCLBcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638398; c=relaxed/simple;
	bh=j9EbXoSuWTRW4S13uHojnmdjX60lsDhKsm/Ff+KWPLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c50x9jh1D38uL39CTM72gS5KWexwGno7CtarNfUfSYuWGo6wAm3ler4z7xg248S1jPJY51a072lJDbZI8o1qLQTkTgXWmSQBuw28I3HG+vfbSItN4hCqrGUSNZXVhnOqnLzKmhZm0Enm/kvvZVFlH2M/pMK+7UObAn03Vz9KfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzO7OW2h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JzO7OW2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxQDp0IDyzApp/052cL0s/7veaxFSTNbvA8rR+FrLW4=;
	b=JzO7OW2h2bHMX1F2fVPCe/8YWEvCsC+pAj19zUhOeVALYuiPF/rQRTuJ/DMsSc8QzmLcxi
	kW+AeFEtBZj4ha/U9zEdJZ060So8wIshDbRD4vQ5Y2YFXXBttUnVaDcuko5BHXrFJKgWSP
	tz/Zlq+Ifvs+I5t7+DQUIcZL/2SFG3M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-geF-0pKwNe6W5aPxyl_Jzw-1; Tue, 23 Sep 2025 10:39:50 -0400
X-MC-Unique: geF-0pKwNe6W5aPxyl_Jzw-1
X-Mimecast-MFC-AGG-ID: geF-0pKwNe6W5aPxyl_Jzw_1758638389
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-84b9c23b8aeso447670385a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638389; x=1759243189;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxQDp0IDyzApp/052cL0s/7veaxFSTNbvA8rR+FrLW4=;
        b=OWNnJuXNNTbDUbbimqwkN1ZIVTwxiKLaQqd5P9JDoG5hZYwcGTyj99mJW8QQnHyo24
         fuww4bHfsoLhMJGTO6fIYe1mlDvga94FRH5KrlGkQpUzaNjQ8g396Xq60Z2T4T8/BvCm
         wCvn0HTKNztXBqN0Dnk/aNuqQkEg6UZlUucrJZQ6ac2i0R/fk/6G0dIBtpto9B9DdGn6
         MTkUOMCABVhzLbj8HstcgTBqNAojcGfA+w6MyfB/b7UiN2tDnGWhe+sDwUYf7JpyR8R7
         gBkec6fv2yymyeW7VPSENslZWP7P8mYtrF1RYEJDjJHAM0HTQVTCmz+N8oGPZJLSu+9D
         ccIA==
X-Gm-Message-State: AOJu0Yz011IzvHE067ZwgjVYWwnr3pATanNqSyKFUuotobKU9hzhgRQN
	SJgIqLfoTaV7ptK9DYsXGpow+GzwihzxTGAJoKC+jktQAP8US8tgOa9teV39lEWcedaF9BEk+yD
	g8DxTUMmlACFd/2STUDEHZppNLFo4mQdPzYd1Svfy4G983V7sm2MpNRRoYJXyJg==
X-Gm-Gg: ASbGncuzVO/qHt+DpcWME7Cg1faGPs/a3BZvMlSiHLzZ4UuXpsEjNmPflrtf/lxWFF6
	FFU+yx+A60HDZOJRgHobPjOaemQNtOU2Rrjbe43cimrjlCjYssB4QU+Wf78mS6GNWtKq3Ky43P0
	HY5z3PLaW+r7GWicagaZUHAN/nxwY5EjbaZXCdFe1Rb/FEabH/KEb+y95PvBti4XOxaaWHTDPvI
	kf2gQFaqT1Sh9apj9l63gbRPVuIRKFfTSqYK0ljAgpFgiEVMSzsBrsdcytR8TYf9mvYUGtE7kV3
	OV2hIJOOysa645pOayIlwWNrFM7M+80MnPBVWEHJxaUCCMbvvoA8r6W1e2R6hFHepxI3vIdfCmb
	VR9bKS7V7GbT1HDPd+zvCYEZJ6NGuQ9q1lcjY628=
X-Received: by 2002:a05:620a:29ce:b0:850:4384:d1b1 with SMTP id af79cd13be357-851693f2eb4mr325778085a.4.1758638389237;
        Tue, 23 Sep 2025 07:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbl6Ccgcfq4My26UrD2QnlIWNInrCEn8gh2opFWhE6oWFWO0OrXhCproHe9Ov0haqvkJ0S1Q==
X-Received: by 2002:a05:620a:29ce:b0:850:4384:d1b1 with SMTP id af79cd13be357-851693f2eb4mr325773985a.4.1758638388561;
        Tue, 23 Sep 2025 07:39:48 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Date: Tue, 23 Sep 2025 10:39:19 -0400
Message-Id: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABex0mgC/12NwQrCMBBEf6Xs2ZWYNJp4EgQ/wKv0UJLVBLWRb
 ChK6b8b6s3jm2HeTMCUIzHsmwkyjZFjGiq0qwZc6IcbYfSVQQqphRFbdI87FuLC6JNjVE5Zs9O
 WrDVQR69M1/hehBc4n47Q1TBELil/lpNRLdXPt5H/vlGhQKHbnrw23nl1yORDX9YuPaGb5/kLu
 AnkWLIAAAA=
X-Change-ID: 20250806-clk-tests-docs-3c398759e998
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4232; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=j9EbXoSuWTRW4S13uHojnmdjX60lsDhKsm/Ff+KWPLU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdSeIBrsmMct/3jx1pPsej5Hpnpwi93N4ea5a3B0z
 sWD71vEO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIUCzD/9TcIBc2g1P3n/1u
 PxMbmVDPtfTKt62ZPPe3tIUIHnDezc7w372MzWKK3Yq1NicLq3VqDifoLV1w3IXzF8+Tp15vL/q
 pcAIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The Common Clock Framework is expected to keep a clock’s rate stable
after setting a new rate with:

    clk_set_rate(clk, NEW_RATE);

Clock consumers do not know about the clock hierarchy, sibling clocks,
or the type of clocks involved. However, several longstanding issues
affect how rate changes propagate through the clock tree when
CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:

- A clock in some cases can unknowingly change a sibling clock's rate.
  More details about this particular case are documented at:
  https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com/

- No negotiation is done with the sibling clocks, so an inappropriate
  or less than ideal parent rate can be selected.

A selection of some real world examples of where this shows up is at
[1]. DRM needs to run at precise clock rates, and this issue shows up
there, however will also show up in other subsystems that require
precise clock rates, such as sound.

An unknown subset of existing boards are unknowingly dependent on the
existing behavior, so it's risky to change the way the rate negotiation
logic is done in the clk core.

This series adds support for v1 and v2 rate negotiation logic to the clk
core. When a child determines that a parent rate change needs to occur
when the v2 logic is used, the parent negotiates with all nodes in that
part of the clk subtree and picks the first rate that's acceptable to
all nodes.

Kunit tests are introduced to illustrate the problem, and are updated
later in the series to illustrate that the v2 negotiation logic works
as expected, while keeping compatibility with v1.

I marked this as a RFC since Stephen asked me in a video call to not
add a new member to struct clk_core, however I don't see how to do this
any other way.

- The clk core doesn’t, and shouldn’t, know about the internal state the
  various clk providers.
- Child clks shouldn’t have to know the internal state of the parent clks.
- Currently this information is not exposed in any way to the clk core.

Changes since v3:
https://lore.kernel.org/r/20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com
- Update clk_core struct members (Maxime)
- Add v2 rate negotiation logic and additional kunit tests
- Drop clk_dummy_rate_mhz() in kunit tests; use HZ_PER_MHZ

[1] https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
    https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
    https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
    https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (12):
      clk: add kernel docs for struct clk_core
      clk: test: convert constants to use HZ_PER_MHZ
      clk: test: introduce clk_dummy_div for a mock divider
      clk: test: introduce test suite for sibling rate changes on a divider
      clk: test: introduce clk_dummy_gate for a mock gate
      clk: test: introduce test suite for sibling rate changes on a gate
      clk: test: introduce helper to create a mock mux
      clk: test: introduce test variation for sibling rate changes on a mux
      clk: test: introduce test variation for sibling rate changes on a gate/mux
      clk: add support for v2 rate negotiation
      clk: test: introduce negotiate_rates() op for clk_dummy and clk_dummy_div
      clk: test: update divider kunit tests for v1 and v2 rate negotiation

 Documentation/admin-guide/kernel-parameters.txt |  15 +
 Documentation/driver-api/clk.rst                |   3 +
 drivers/clk/clk.c                               | 201 ++++++-
 drivers/clk/clk_test.c                          | 694 ++++++++++++++++++++----
 include/linux/clk-provider.h                    |   7 +
 include/linux/clk.h                             |  20 +
 6 files changed, 835 insertions(+), 105 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250806-clk-tests-docs-3c398759e998

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

