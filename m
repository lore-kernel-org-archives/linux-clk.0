Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000819;
	b=NISeHSh9PjuxE4dZxwDAdBA4Y1ByCytBCOaqua1ugWtInwpGOQglFvvPNf/ULgkE00TP
	 m/YB2pbIpV+vZPAB+V75KvphkK4aEZ/vBglqyQylpR1hkZOmlvskSlkCYCvfoeZw0wc8O
	 +jHRLZilAJWJLy9rLQCo4lVWpZfU7IAado/8Dyf5TChL3vindnEuglLdzRzGJghRVEWtI
	 lzuP9sCZNZNzOazMLx9JY16x/lOHfLNTwWuXhCQa3vkvVkIXoRWm8rmBV4hvxDZC6hctx
	 yA4/u1ppTxaGQIRiiAznRMVrFtUZh5u7rdJrTIbBHW4RSbNVB3c8oLmmF6Ney2jMKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
	b=hWXuYXNdrPQa0Mnm4AGC/6zSPOjgQVtOUqeEv7g5RoCsduVlhnahaNl9SP5FD8B2AFca
	 uM9bsDLHaV1ZwiLdPWiFFKRQQDcCvKnwMRYSnxIkPw/8OGEdP69cciGfHYAiUTDhy+EoP
	 hoN47HltNfrE71XJLj9bJYlnycqkio1cp9DFLtr3T1p5KtgAq0U8nQrRxfPW3UVW4d3+h
	 7WQbplkqYp68oyKWcf8wbUuWFuzMDWXLK2xm47B93yTD5gSR8bvn8n/XORESLHoneT5os
	 P8MZg0b2bu5pg3aeI27175XV6pAn89odZi+C2t7eAS09VPWFCHeupFUAUijfn/J35mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D232606A31F
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D232606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so2051141f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000818; x=1793605618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=oVCZUiyXw1lfiBhfxo41FJlK1qi2BtYosNra8np9mSh/DJ68mSBGzyPJWYmA4KBAH6
         vU4gQh3R5fMOth/IlDfH/frNDmT+mv0GDkd1K7glrfnahzC1aV+6oBsPSP+alGm4Q139
         9qFU+55MFyqIzRPJ8KSKohV0T6zJkzeEn+cho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000818; x=1793605618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=R6vdRD1KfEjHcDXo+26yo+Bl2QxIlGFGtYmqnEQvab2jcvG+TJpo+snfj2Ne0rJFD2
         cbiQiGIrmWjo6Ey/oTU1a2EcjcRtdzo/arlKVRE9C0ksLc2lFRGxrpjQKk0Rtf7j+cDS
         OqKc7PewTRkvkEFyUBB2S8/NgzSV5QlNfh0UqOJRt6ZL4dHndcmnGdDbZIK9p/pj7T1L
         OGgOibRXmCGPddKFJsuGaEbJlV37/4LouA4wEHTBVfbz1W/Hfy9B3p1bwgWKf8kDaoAj
         IUmc4N1LVQher02jD0s5LkapCzFLBQT4qSQ6P4mWfYExluprLv3udGiOyCPxCjwFtUcb
         /ZJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc3Pu8CSQULDnPsxuUAXauEx+/P1UpTECE6beiPppszI5D5CuNTTNhE559qE/d67QyBFieQ39xeug=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoQ3u6FgwtY58vZEhEULrwHVHY0OP5UnVC8pmRwne0zf0HL5BR
	aop2YmaxuGD92TFfd7nuN69GLtNTZIEMGfQciW/w0DVn0paOa/PbgnpVD9fCWS1OPezn3tIvjUs
	/8QLB
X-Gm-Gg: AYBFou23GzrvVpDqNfR2w4z++NRS3SNWOXlOzRYUPE2UtRu6HalJX9rkvDx1l8DEuOJ
	Pdb1ExHE2H0VYoWMfYBBcuehF68RCzVdldc+Y4WgQubvUbNRltmrghB5ZhmRb6dHs/yEsO2dzB3
	vuh4fY9Ivjv6x65/farETH5j/9iy9ceWwXOhYNkGmfNORtX5TYTQ45D2xqX7BMVMHdP+A5U+cdk
	Rm7wWohIciBxdbzovhTsA0mVwak4Os8XxkyXRj88US+PNoFHLCPvlwlUrj6jK7HCm3A6rJlNr0i
	s4DrICpR2KZ/M2UPc+ecuCdjqN6JrakaANHcJ5perH3IJzViGLdo4u91brpGCzJTUmbbPr+BQ6H
	lSb9J2Jv8zOxO6FOMAWH8Zl5Dd/4p4LHWtkDv6GRH8P+RmVbxJNhsFYDuaewTK0vgatwqvrnLb5
	6iAgahFAyXbSQFHgWtJxXFhBV4m4mT2nKHND63rbIq3LF1WtYz2j07sey1W/4Yd85I9PPEG9hhk
	z0Cscwb1+tNTmWMHESVOf5TuIeMrb14YoYihJQTXWESM9U+5Y6XsSPyPDcUHOAOWNwxSEdgnE1u
	iM+czqN+mkbLWAYniYSrLXLSIMHJR+XaNGBahO2JloMVQWgp70ouTgVUwZlmeb9BWC0PdLSdJUX
	4Ee0rLIN6o/h4MzOjd3J9uSlsc4iXNAu5OfbiXzOMpnLenTn2rRNH
X-Received: by 2002:a05:6000:2003:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48e3eb73c36mr12890000f8f.13.1793000817894;
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Mon, 26 Oct 2026 08:46:26 +0100
Message-ID: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and drops
the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters. The
dpll_disp_ck SSC registers are programmed with the same values as with
the vendor specific properties.

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 95 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 91 insertions(+), 29 deletions(-)

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

