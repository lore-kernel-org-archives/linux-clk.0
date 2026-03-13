Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038BB3C345B
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420248; cv=none; b=cwFhkO1Of4QGTPKE8iCZkyTIMf91j2Jd03c0lvtvhwsXxcJcQbTizgG6Or9w7iEnhhMgInjFBVoW1HeB2cviBDG6yqtS2e6GTGLyWogIX8TTNpJ7QPN6mbRFbE4FUtlkPZXHXUWUYlb6bdG5Zf2LqX+Sm2X3U3qjSbN/FQgP0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420248; c=relaxed/simple;
	bh=LbQQdieLciU0yp4/e3tEpRbC5NeMCqzu+O2mVqVmC3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sWp1PtiksTxrENnJGDQBRb5ipx80IcTrtHj9TvrsVHSxnxBEKTws47vKxr46QHGH/48ToBN/jj0ew6wYJIGhi28VuBlmoE+ZyhFkDDzfrU6dBwvRAdz/fzw9SFl3bdA5yHYfliHDVP166t3WJOOMX3tM3Qs2qnhP4LMrExQ0ZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fgiUpyBT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=boxoC1Fq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgiUpyBT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="boxoC1Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7aoPX6tbptQtsH1qI1YEv71fN+cpkus+OxbpnEXEQTc=;
	b=fgiUpyBTd0UhrAad4cIJdDRwT0E8ViW2OzMtawdKClsWsH3Yub3OKUVeYb/85v4EODz2DC
	OuKnIkdrR/MaQi3CIZQSTUIHSGAkhYviV3NFcr3tOSscgTql4msp53NiMy+8CuXI8th7mQ
	bQkOpDBVs/dIumVlSdhQ66rEUs2mE2A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-EWGYDRHdM4y3Jo13ZVHqGg-1; Fri, 13 Mar 2026 12:44:03 -0400
X-MC-Unique: EWGYDRHdM4y3Jo13ZVHqGg-1
X-Mimecast-MFC-AGG-ID: EWGYDRHdM4y3Jo13ZVHqGg_1773420243
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1598315085a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420243; x=1774025043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aoPX6tbptQtsH1qI1YEv71fN+cpkus+OxbpnEXEQTc=;
        b=boxoC1FqUOaL9oNCEFKVo8M9LFu80GbazMWpzwJ2AgQtyBBBK1PVIoLyE7YIWJaqIR
         LGHMVbyTX96iW8DqK+NUZrR9e4I4HMmBVcA5SgEaOOzA+1r8ICt5MfU16AukaZKuHLEe
         1h/X9rJCCrtjgcNlsXb38pcZZUWtx4FUbuZ85//z5hnpMevmTSTYF1PLPUtB+kPG5ekK
         baBtyoyFRkTGQlRGs0A3l+LxfSEKHgp2xCgEusMUs/LCFd0GIpwSwFVqG3Ikkqfz0cqq
         GOCOUM5LSZgI/u0hHWqPM9FpeKQhYC1LFZz2uk7ARzRQQTedrpuKchBAe7SlDnpRvzfE
         SuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420243; x=1774025043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aoPX6tbptQtsH1qI1YEv71fN+cpkus+OxbpnEXEQTc=;
        b=Nu8j2zO7ENt07d9frHhTh73S/jZJacwt+HjA05UTIkavmd2SzydaH2F/bpMZ/GDWm/
         uPr3OAEZJdJwc0ye/z5TqtrsIFj+JBE8X/KKHztqnNzYwDFBrEzn4HySkOKaHxegUnjA
         KKwtvYkyRmBd/OPVaY4DzUc1irmQianpWsJZvoJkwI//fO1OV52wASwJjSGaw9ACf5pM
         UmtDfln9Tq732sNX98tFwOtw9SbIK8f1YLKnRc4fsT0P2P8Qzq3Du+o4TAcZGgXFNsYn
         swK6qxQPA90hXMgYRQkRb0q6+aPGKxZxlKudiR+MmYDoiWLRhe5/yeKCp9d5dJJnBq78
         qPvA==
X-Gm-Message-State: AOJu0YyIXcbdUfex/wQNlF7fVJPLCy8ZiOe3FHubd+4JivH2FPhTRtgm
	K0mRSKFPE5KNyciRq3Z98SmiPw8MJmyxVq/3FARiQCkAu9TIBWXjynyQUXEcLUWGu5M/eXfMdWW
	DjdC38wwg2syyiweW2lX5cOl6udU2Wwlw7cv6bTsiH+/bFHVhOInfTVf3+X8E5Q==
X-Gm-Gg: ATEYQzzGgIK0fOGDwDXvLt4EdkmukLDX+mO4q0415d1jTXIeqWL393ObJs0Ff592icC
	4udKrIkdbSw/gCS8uOpevcWCsscubcC8ndRgHaAyrdMsXXpZm376AUgU7oPTXQ/Jo+k7uDYwxjm
	JWI5mTlEKPRvFgy+WncdUkyrupyW+gyDjF0t+tnOeDdOWb3EgLX/U6s7gvRAxlJoffsZZeautrM
	pPV7oGil/Hpa8yk4cTfSzuz+AJktiFMmKnCUMPJjHGClMwSydS1ieJiXY37/3JxKXYx3bmvlWYe
	RBqEWXaGrQQdQ3+YNIaCgrahbNnH9RPcrNz6c1Zt8QafOPbyMkSXbLgX8M/tEsHeEJSR8zSninj
	iusFknmYsCu3ENBj25vT9JchxLTS1xOa4Es6CXtUS39rn8/nfmn1bzkClS9L4
X-Received: by 2002:a05:620a:1583:b0:8cd:b6b7:1e63 with SMTP id af79cd13be357-8cdb6b72286mr376673985a.34.1773420243185;
        Fri, 13 Mar 2026 09:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1583:b0:8cd:b6b7:1e63 with SMTP id af79cd13be357-8cdb6b72286mr376670685a.34.1773420242724;
        Fri, 13 Mar 2026 09:44:02 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v6 0/7] clk: add support for v1 / v2 clock rate negotiation
 and kunit tests
Date: Fri, 13 Mar 2026 12:43:07 -0400
Message-Id: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6CMBAFf4Xs2ZpaaDGe/A/DoZSFbkSqbSUa0
 n+3YozxOJO8eQsE9IQBDsUCHmcK5KYMalOAsXoakFGXGQQXipdcMjOeWTB6pGlgbdmq0mislag
 gL64ee3qstVPzYY+3e47Gn7QUovPP9XGWb/uNq7/4LBlnndi1+wpR9aI+euysjlvjLtCklF6uu
 8U9vAAAAA==
X-Change-ID: 20260305-clk-scaling-b3b63cae7624
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4660; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LbQQdieLciU0yp4/e3tEpRbC5NeMCqzu+O2mVqVmC3Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32O0UNir9LhXwuIw9+16Za7f71NNXlN4eUJ8uf3PjH
 33rPY1lHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE6RvD/0SHW3ftiwPLzk65
 Fbh0npVlA2Pg1NIZ7i8qTM41K/g/62P4w7WiTaLYgs12qUVBVGMbt8Rb9zef1hzjnnx7W/t5rwM
 3WQA=
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

- No negotiation is done with the sibling clocks, so an inappropriate
  or less than ideal parent rate can be selected.

A selection of some real world examples of where this shows up is at
[1]. DRM needs to run at precise clock rates, and this issue shows up
there, however will also show up in other subsystems that require
precise clock rates, such as sound.

This series introduces kunit tests to illustrate the current behavior in
the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo,
it was suggested to move the negotiation logic into the clk providers
themselves so that only the clks with this issue can have their rate
preserved, and add some common helpers to the clk core.

How to test on real hardware
============================

I am interested in getting feedback about testing this patch on real
hardware, particularly for scenarios where CLK_SET_RATE_PARENT needs
to be removed like this:
https://lore.kernel.org/all/20260303115550.9279-1-mitltlatltl@gmail.com/

1) First ensure that your board uses divider_determine_rate() or
   divider_ro_determine_rate() from drivers/clk/clk-divider.c.

2) Boot the kernel with this patch set. There should be no change to the
   existing behavior, and everything should still function as is.

3) Now boot the kernel with the parameter clk_v2_rate_negotiation.
   Trigger the scenario where the clks get in a bad state, and it should
   not occur with this series.

Changes since v5:
https://lore.kernel.org/r/20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com
- Dropped all of the helpers, and complexity to the clk core. To solve
  this problem, we don't need to chain rate requests together.
- Add more unit tests
- Convert clk-divider.c so that there's a real user of this new API.
- This series no longer has the problem where large numbers of boards are
  moved over at once to the new v2 negotiation logic.

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

[1] https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
    https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
    https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
    https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

[2] Fixing Clock Tree Propagation in the Common Clk Framework
    https://www.youtube.com/watch?v=R8TytDzlcFs
    https://lpc.events/event/19/contributions/2152/

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (7):
      clk: test: introduce clk_dummy_div for a mock divider
      clk: test: introduce test suite for sibling rate changes on a divider
      clk: introduce new helper clk_hw_get_children_lcm() to calculate LCM of all child rates
      clk: test: introduce additional test case showing sibling clock rate change
      clk: introduce new flag CLK_V2_RATE_NEGOTIATION for sensitive clocks
      clk: divider: enable optional support for v2 rate negotiation
      clk: test: introduce additional test case showing v2 rate change + LCM parent

 drivers/clk/clk-divider.c    |  28 +++-
 drivers/clk/clk.c            | 118 +++++++++++++++--
 drivers/clk/clk_test.c       | 300 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |   5 +
 4 files changed, 436 insertions(+), 15 deletions(-)
---
base-commit: 6a2abc8018be1ce9a03470ebb1c526f814903452
change-id: 20260305-clk-scaling-b3b63cae7624

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

