Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947AF35E950
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839385; cv=none; b=juTCiGQhzSY7bOuewx3rAxK9Yi+MqRCcO/G5kw+D7Gh/bCfLFKRtIJLVkSbTbn2/x6lVvPnbe4kEFnMvtHOTt9j2BHuyPwcTpgR6DisdsnREFHI4mEbhBPdEgKGfgMDJon4qyUgE/OaMhQxa3OPNr/Aci23aFXx6P7GiVm6nWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839385; c=relaxed/simple;
	bh=UBs6rSVwu2cvd48o5hLRwMRxD4BX3o53gvilKXiS4lQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nU+xBHxgL80ZrMamPuXeAA3jgFw6aPH3e1S1Vju2M3iOhWpfl+hbx0potxJAMSnXcFKRAejM7ENAuz9Lp5NAppdt9IJv8DTRSeW600zI0rCSmpZ3gjLOESbe25ujA82oY0MMrSWPeRIH7YhbjPL62sUYL90vj94/yF2RYnN0t1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdeyjA0p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uIr24Ft5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdeyjA0p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uIr24Ft5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J++ZCW8dqkEijbf09txwrO1ADkXCb919QsA4SBHAdHI=;
	b=GdeyjA0pz5UE59gE4n67us2lqcZ9Lv4bGlT5yRz9OAaTlXylt1T4JZEwDfkoQqLysdLXp0
	C29w3jJBAF9oNTDQNEGM4jp1t61+d6f5i9bm1NvbWrR7ZB64db1kfa6DTKEssZQ6ifXI7C
	WIMnPdBhzOyqHne+Q19w/ejVCR2iesg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-weioQQy5MQOvDXLAV4wkbw-1; Fri, 06 Mar 2026 18:23:00 -0500
X-MC-Unique: weioQQy5MQOvDXLAV4wkbw-1
X-Mimecast-MFC-AGG-ID: weioQQy5MQOvDXLAV4wkbw_1772839379
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso103552085a.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839379; x=1773444179; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J++ZCW8dqkEijbf09txwrO1ADkXCb919QsA4SBHAdHI=;
        b=uIr24Ft5PVJqOtceNBe7ING5pTuiuAjx/C3fhEKuBZycrEgJz4FmzdEr2kZljTjlYw
         gn+dn8dpx+QHejeQ6owMzJy0nLPIQjtg0/PB99FsJ1tPW5dux8OBd2tzC+wY32+Bf/nB
         ZDfc33b+fbGwzCJOp3M6TyT1aroCf/7gWwcF7DVKFEEBrmATewX0SCiUeJkKtGkRKK+q
         5eVoaW7H6+2CGSTbx/q/BwpAu1GtMlQ+Jin7gGNmLx9+FoMUVh3ibg6zTCNwfyqgK2hK
         NRFRyGg51qRWFIm8qquq49KONM7U0X7rZi0x2SU+ngYe4f/+POq6KYSrRFv1FMF+Wop5
         tnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839379; x=1773444179;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J++ZCW8dqkEijbf09txwrO1ADkXCb919QsA4SBHAdHI=;
        b=XHg9Z46IKg2qQvf2FFsnnnNpu8GhraPKpGdVOYvtH0O+h3VP1FtykBtJ7Xkc7PbVrH
         40dPIxT9bEsNkOCDE/sGhtDpf7OcKpKxJ7scl8WM139hWETelctFJFbKiL5NmON+THYZ
         Dx6OV/lzStvtwR03yVL1rsFIQVD3ug6sDCJYv0bbHB846UCEPiFzYVDHtrBcYEw3Fth9
         zD9/uelrjbdPgukWD/iDrcI+YEzRXOZSu6YJih/p7gYZnBajnKf2NxCwbC+JshIVdP+E
         bpGyFUqcsp6gFzFu9HIMSwNiTT/rvBB51HiuZmAVGPHQriQBol4luPjFkmEY+tFt5xHw
         SlMw==
X-Gm-Message-State: AOJu0YyBvZp0W9IOKjq1cw/9eWJ0yP2S6PRBqvViKVrzAKa00stSMcj/
	Oy6gtj0mkd3EGv7QIup835beNNhqHXL2WJB+Ou/55rh/A5JnQBJsJxswETebNX/2t9mFsovDPmj
	rJPjQtfbOmtc/BDD7u59f/Wj9F2UW9hjtCbN/UZBGxkfc89GVEWnqt7M3aQc91QmVv6NDHHNlrj
	WDTdzcfugCochIE1MaVk3L0DPdETd79kQ1WjLiS08ns1EB
X-Gm-Gg: ATEYQzyqaSWIcokN9u146eBT2oUYhKkyZfZ734UAiiUbykoqI9k9xn7ONYQ1GuO+tEx
	d9CGeNTr10QtcxNc4nACpPG6SVJfRWs1Tx66jV1US8GUw/9zGDjyFd9UsIrQ5zddSKaJq5npcXN
	8Wh//Fgs4REuOoSjw0KGFWXJoVK+9Wj7AEnBPHgSTdDtCogEWpky7YDwMGFN3WhNsGmRqxcIs0V
	OXUbR3Bb0yf8arpYrxtIBGnUKKi9d86LbeCWJgEZlAcB2NV8QAQDKdkDKhttRR/aLQwUCoyb/Ny
	c6sZPtbHuQPEEE8+AMK9lcAXih06mqoCmJkgEl1iZvF//G5muNSn714p/7nU22ZEkaiNK3cj9Uq
	FEDTlXM3MUo2oNtp4ZfL0lrnsxOl9
X-Received: by 2002:a05:620a:c55:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cd6d549b1fmr501424485a.75.1772839379527;
        Fri, 06 Mar 2026 15:22:59 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cd6d549b1fmr501420285a.75.1772839378958;
        Fri, 06 Mar 2026 15:22:58 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:772b:4f24:8140:d6ff:f19a:7e11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4856cesm203119585a.10.2026.03.06.15.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:22:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RFC v5 0/4] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Date: Fri, 06 Mar 2026 18:21:35 -0500
Message-Id: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMUQtAMBRG/4rus9XamPKq/ACv8jBzcaNhQ0r+u
 8Xj+b7OucGjI/SQRzc4PMnTYgOkcQRm1HZARl1gEFwoLnnKzDwxb/RMdmCtbJU0GjMlEgjG6rC
 n66vVUJUFNP/ocDtCef+f5nleXrze5HcAAAA=
X-Change-ID: 20260305-clk-scaling-b3b63cae7624
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3809; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=UBs6rSVwu2cvd48o5hLRwMRxD4BX3o53gvilKXiS4lQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXJ55IOSdvdDyuyFVvgiKnCMvHH5F5l3WecJc4rj8e7
 /w867RdRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMJ3sDwv0y8V/SyqPuzzItC
 v5f9DnbROHVA7k78vMUzvxe288WbJTD8ZEys6hU6Jda0yOmuZOak5ybmMxVCf1pcN454kqtz5bU
 5DwA=
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

This series introduces kunit tests to illustrate the current behavior in
the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo
[2], it was suggested to move the negotiation logic into the clk
providers themselves so that only the clks with this issue can have
their rate preserved, and add some common helpers to the clk core.

Note I am marking this series as a RFC because:

- I only have kunit tests, and there's no actual real users of these
  new helpers. (kunit doesn't count.) I'm hoping to get feedback from
  Stephen if this is what he had in mind for an acceptable solution
  based on earlier discussions. In the mean time, I'll see if I can
  get a board that has this issue, or work with someone in another
  company that can test this for me.

- I feel like the names of some of these newly-introduced members
  could be improved. Naming things can be hard.

Changes since v4:
https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/
- Reworked based on feedback at Linux Plumbers [2] as described in two
  paragraphs above.
- Dropped gate and mux tests.

Changes since v3:
https://lore.kernel.org/r/20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com
- Update clk_core struct members (Maxime)
- Add v2 rate negotiation logic and additional kunit tests
- Drop clk_dummy_rate_mhz() in kunit tests; use HZ_PER_MHZ

[1] https://lore.kernel.org/all/20260303115550.9279-1-mitltlatltl@gmail.com/
    https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
    https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
    https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
    https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

[2] Fixing Clock Tree Propagation in the Common Clk Framework
    https://www.youtube.com/watch?v=R8TytDzlcFs
    https://lpc.events/event/19/contributions/2152/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: test: introduce clk_dummy_div for a mock divider
      clk: test: introduce test suite for sibling rate changes on a divider
      clk: add support for coordinated rate changes from the providers
      clk: test: add kunit test for coordinated rate change

 drivers/clk/clk.c            | 207 +++++++++++++++++++++++++---
 drivers/clk/clk_test.c       | 317 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  39 +++++-
 3 files changed, 546 insertions(+), 17 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260305-clk-scaling-b3b63cae7624

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

