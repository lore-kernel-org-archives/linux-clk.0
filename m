Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C33644C3
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005297; cv=none; b=jWnMQomzVcmmM6+Jf34gpLm6Ng49mcEetjdkDAn4qS/QoEFvTtCqLQpxEwJ+YwtuLDBdU/QW3E83EPgibu7wBY8DRCnx1a3eQT0MNKyVXyFhLvia8qtERXzWCZJ8aJp944umuBIFw8813EBxOn/aVPLqRaq457V+RjW6UnAnERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005297; c=relaxed/simple;
	bh=oe7aOtu4GlLFmto5XpUmD1HhhFhBv9aUVHHre0u6Tjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iOzU6RQ3r/UF1zHnYQHXqXUzhL0IkEio25cFkcjk8UCTT9FFp1wrRM5CctJQBepTW5Ff4YTH7X7YCu794vNPceG1Zy6arpXRnq/j1VJ+a/jhuESkC3qPsMs+gFmgB3obmS1mq1wfG3VD10xUU8YG5a1oq684FoX0UrbXO5/6d9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDXM37ep; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDXM37ep"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso115541225e9.2
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005294; x=1780610094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4sBWMdT1v36UhZue+fcmldfG4lEYl0qYcSf1IPTfs8=;
        b=KDXM37epR+bW/67JWPSn8EaFPfWmIb93Bye3OKV92SULJdOPjvOqk9chj6Bg39Wk/S
         S6diGlSVZf9a0FaMCRjA5C4S7HMoAsTwoZSpaiphV8tha96RJEJW2Qt48X6fIbNOVPTX
         8Az9Nxaql9C92/EaKHj4R05m5VWvD53zbtLQMoItL598uakMEfjfuigpsBdw/uLJdwnb
         7JYgLfcmu0FtVXEYKf3hMXc3zfTLLqrf1JQebMLkryEBmTTix+BzvvKZ0q18qJZBxWgx
         awi74kmiqTIOzl8m5aS7qa4JPm7E+Vdtzh5F7P6faA/1mGsMUYmvVwdu9evGkuyp48JY
         lOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005294; x=1780610094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4sBWMdT1v36UhZue+fcmldfG4lEYl0qYcSf1IPTfs8=;
        b=AVDFQHIgzsArTSje5H1PEw8vf07lIugNDQQGujHjpqLlw/04y3sGsAkBoiVaMAgoKV
         eYlg2ItKW7IyNHxLcPk+FMZkE2Ki3UZIbrMNSQWIAwFaQyTNmLtcqlVombbC+PVlhwKb
         jSk/qixA8vh094TA8u7t59jZUxoIV6UF7lxMDnPhYGu/UOcE/2sRrE30hj232LziIQ2H
         l1nYvecBIXYKoRluZbdkcsIfAMJa5TUB04gdPKZEcZn+0k3ksRcZ2aGte1kMf4qt/m8U
         gw2xg6PxElPAmOwg555/NjJ/fO808TT6EMgJCH0PoW5tY3n2Cyti4GW6v3xaaxbVn+Vu
         Cmnw==
X-Gm-Message-State: AOJu0Yz77e2apT5sxlKZpDtp5CnpgsPejQQpo+kxHP4TYNGvlweUVgY+
	rFhZt21viHxsW/AA3QK/ZVOBJTotYEmrjOOhIqyRzNkUGeFDqdkzrDItqrNlx7gaHRTGNg==
X-Gm-Gg: Acq92OEregv5I0a5jTg41wRJvKyevWkWZRSJZ1k/m2rYEQmMWPXRiTNAU06MfH0/jf/
	Y43ZLNMA/2ofS+MqljrAiwGDx3C/Lsx+d00dwRs+39BTLdiwdexf5j/DM4haH/PAzgUfVfpkO7g
	h3fNAhAkmtRm2CD5l1bwYBEGeKGgbe1rX+BuxnkxI4iZ+7iUOXwOLPo0ZEnIu0VzI5NkB9WYZ3v
	rLen5SyrjgbgtK8Q67v7CYCsISajQon1vYSPne3dlMo+Edg5z7vmboNRyDgUgZOnsXnOFda9NS3
	12P14vOjk+oAyZTr4VsS54lpZxyYVqtv+bEkT4lAxI3GF46QlfkTobxVZ0N0hEI4fVE2HF6HjwM
	//UclkkKANLxMBoDdxtaYeCfUGlqAwhvC5ZsHr5gic8l8yPVrLreSQwv6HNXtS/UoHWMU7sVA84
	NkH2BSkswHMw0JW8XO1CxYb9Knn3Qc+AbhTlpeLYORDNmr
X-Received: by 2002:a05:600c:5298:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-4909c072254mr4532355e9.4.1780005293915;
        Thu, 28 May 2026 14:54:53 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:54:52 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Fri, 29 May 2026 00:52:57 +0300
Message-Id: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADm5GGoC/2WOwU7DMAyGX6XKmaDEadp6JyQkHoAr4pC4zhZtX
 SEp1WDquxMFJCZx/G1/n/+ryJwiZ7FrriLxGnOczyWYu0bQwZ33LONYsgAFnbJaya8LIJ2OErg
 dDbLRMJAo12+JQ7xU04t4fnoUrz/DxO8fxbr8brzLLGmeprjsGtJMHgwGZ1rbWUBnAKw1FgP1g
 ++QPY5D21fXIeZlTp+16aqr7F+pVUslWXtHIQTGrn/YTy6e7svD6ljhltN/HBQOMCgeySgV7C2
 3bds3GJAwoCcBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4498;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=oe7aOtu4GlLFmto5XpUmD1HhhFhBv9aUVHHre0u6Tjs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmKI4w04x1nG6QRvCKQeuusOziQaGLWe8eMI
 weOw6zeptGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5ihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLSog//UDw5BlvHKGoLR5UJZwzXVjGX3lenNVg
 bvf45JWgt4lee+39Q4xuNjP7A95cZKR9LYsKq0tgmRTVu8SScOksETszX4q7LFl3c4F9BNiNq8R
 M+p6DkAnkgkcrwicS9EWzjhuUaqz1pwVNx5LNscKp6MWkEBMJ6agc00tUY+rktEGsX7+9rP5MeU
 79mnosxz+PktFmCdaOAwhRbtVLVCL6xn/ju/Xs5LD0oimYuJK7UUc0vrAZpOFWAYL296B3SYghB
 n1wOEXDIRxQzZXMXr08pkuDUvfb/f19+UnQfTgGNMUlPafddui6DCvm309OpIc3do2zdFllo+J1
 r97hrFBjpyI6ykP+KRIxhXcjwO7+VWGSHjSOpbRWE+0HCDKHe7Xv6aovNpVHmVKjUniDoSKTdv3
 DXibVh5Wrpf4qoUHTDbl+3kq8WKiUrBNtCSCBGYCML8Vi5ol/RZydDq5UV5JAi5IWpY5GLLW07h
 5iHltHQVLvm5Z8HFoJp2epsjoOiO7M057CdIf3mcKelF/J6/RrWiypKDGA2yHQeg/BqRzvigfv5
 ZyXCSefsv+pGyojFx3UlJ+6HJKch6lH3NvjJ08E/yHFzLYGfkHmL0s/H5XvrLinzAToMTFx8DmW
 1kIjeqpOIEY1bF+6WR78BagnZdcK5g62zBkScYP4wM08iCblc9fg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 3 of my zx297520v3 clock patch. The major change is 
that I have merged the top and matrix clocks into one device because 
the interface between them is unclear in the hardware.

There are still a few open questions though:

1) The clk-reset interaction: Both clocks and resets are in the same IO 
space, sometimes in the same registers. I see a number of clk drivers 
that register a reset control. I noticed Yu-Chun Lin's RTD1625 clock 
submission added an aux device and placed the reset code in 
drivers/reset instead. Is there a preference for either way or any 
guideline of which way to use in which circumstances?

2) Unused clocks: I looked at recently introduced clk drivers 
(mediatek,mt8196-clock.h, sun55i-a523-mcu-ccu.h) and they do add all a 
lot of clocks that do not have an active consumer - which in a way means 
unused ABI. Please let me know if you prefer to add clocks one by one as 
their consumers are added.

That said, there are a lot of clocks that I want to define for the sole 
purpose of shutting them off. The boot loader leaves pretty much every 
device enabled, including proprietary timers that I don't even plan to 
write a driver for. Registering their clocks in the kernel will allow 
the kernel to shut them off, so they aren't entirely unused.

3) I took some naming from the old zx2967 code. In particular, each 
device has two clocks: "WCLK" for the device operation and "PCLK" for 
register access. Are there more standard names for them? Likewise I took 
some device names from ZTE's downstream sources and I am open to better 
suggestions.

My impression so far is that "PCLK" is fairly common. There is no agreed 
name name prefix/suffix for the other clock. If anything, just nothing. 
(i.e. "UART0_PCLK" and "UART0"). On prefix vs suffix, (PCLK_UART0 vs 
UART0_PCLK) the existing drivers seem to be all over the place.

4) I took care to test unbinding and rebinding my clock driver to the 
hardware and also tested building it as a module - but in practise, the 
board will be pretty useless without the clock driver and I have to jump 
through some hoops to even test it. Should I even bother, or just set 
suppress_bind_attrs = true and make the config a boolean?

Wrt clock name strings vs struct clk / clk_hw pointers for parents: 
Using string names seems like the only viable choice in practise.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

---
Stefan Dösinger (5):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings.
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings.
      clk: zte: Introduce a driver for zx297520v3 top clocks and resets.
      clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.
      ARM: dts: zte: Declare a zx297520v3 clock device nodes

 .../bindings/clock/zte,zx297520v3-lspclk.yaml      |  119 +++
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |   95 ++
 MAINTAINERS                                        |    3 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   55 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   18 +
 drivers/clk/zte/Makefile                           |    5 +
 drivers/clk/zte/clk-zx297520v3.c                   | 1003 ++++++++++++++++++++
 drivers/clk/zte/pll.c                              |  450 +++++++++
 drivers/clk/zte/pll.h                              |   23 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  179 ++++
 12 files changed, 1944 insertions(+), 8 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

