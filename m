Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585040;
	b=hY8MFlanCvkhWzJi050+iZKavTVrvHgQthA17KuPuxJqdg4BXl0F/OvIKCAIwC6tVUGv
	 QcjsI5hzJWHfiiU3UrLtZWMnyJFBR/uNu7PhgG+HEBRkFAZAR7feltw8DxFWz3rGZwxnJ
	 s2MSldOPK7eiFFRzDk36y4PrwFbUTDA3yl8uEqK0tRS1E9WufBAIFoBQFW0s+XL0jf2le
	 sAfIpXY3KJokhlXBcv8HMKm6VAN49diQFsD67fErxSc4q4GzKGvKsCv1Jp5cEjjZSkitj
	 h3h++SEX441osTMRLBpcb0GjFnl5N4ViO5Foz/CqvJ8YTkrlczpFo+0PsLB4wUO+k4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
	b=hLX64gQpFzVtS+LzAhu1RbZKr0S9kOz1Jpibgo2sGwgbRpaczte3vnBINKyC2XITUB7t
	 Z3TpF86GcY/ALUG6G2pmy6oR+jjXNFuT8VRopU7oX85+m/Q66VweXCIGudrneP5z1U6MM
	 OjzUzdKXWzVpVnhxmUI2UrXV1VGwjJfb342Ym7TGEL5aTo7+E5yJFmll2ipsEfSxNSLjU
	 Xg7UlSMhnhMMWAdlVOaQTnl9g7OlW8B54vaMxCBy8pG5RuGV2N69XbkwN2AQNu/WTfX4U
	 qbXebJ0lF5ko4GObLR7966GRU6Dwl/cmhw3Yx2slqlAZWRzavVf4NIxuJVaC9AfSDkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210CC606A332
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210CC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsG3too2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19993855e9.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585038; x=1795189838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=rsG3too2KgoFZzoonq5v4A4bv6Mik5fbIf8ZGGba2IIuVzhugyGmL+2fCvOWYzuFXQ
         M8f6za2K65AQLfYlduTWD7GzpH549e1AlH+wKoNL5R3C2OrH86ldby5aa0766Rqvk77K
         8rRmXkWDlmcjAGonf0q0hS59yV0uppOtXtJAteYAm13HmuagwsilNVwU4tsYOfHi9oNF
         3a3JiWx/WxrdbDfSFKi3SMXk+AYHGm1AmFTDCd8hOb+LBsFrfNvtmkT5Wz7+3mkos1lw
         HqF3NDBa62+Z5HbdE5GqxY4cfna+hlCuapFxq2yM+sqhzFq0F7tkjxp8eVxoic2O2sLu
         407Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585038; x=1795189838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=DQkugDm54yHIte1pnZiG1KbBNBSMUn2ccCcamisnlsF6Bxial/G2+ZAhCvExOk/Nq+
         Hfc5MHeUfl0KaHgMDq4mexiE2y3sbI7eSwDIXghHIoDpErpQZJcYAgiJfYBY1TUD4sbf
         iqUm25XM30rgaTL7x+xnH0YqhXsJ9lm/JpXqnyfAfquPte7D3pvEAnGGYN5qbSozb3f1
         CTRW1LPzW4EH9e+pCiz6GQeBHHdLiCGjEcW65ZOPKHI+qrk13Ytk/X51zVMuHjGgrogm
         csPGWqqVCE1etB+7VExFnOOUmikyqesild8rr2/UV2nbPJlQkqpGLoXIjCNqy27Psuwt
         E6YA==
X-Forwarded-Encrypted: i=1; AL+hErHcyAoOZCkyp3VF6YaWEdjDxhLpixI1dQGwYJ4eRr60E6UOxaisLswHAt/wrLmNrlBcRcAL/liaYbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VqhiTwyqX08oZotMEh/wumMDwoAWz78eBKMz22pB/K8qNVx2M
	FNOGjzbGrl9Otq85QugDvyq1CwPOX2XuusOQ319dsxpkyLerXG4O8swR
X-Gm-Gg: AYBFou2RNu2oNBXCoUP+xfiHBAD2D9WPJ12Je0CIL/QtBzW8RRphm8Gys0vY6PW/Mi6
	KLKXMurj9jJcs5PQ0LMgxndUYOhiio/szq3b1EWJPVp3yaU8HNg6Kz7x51lplTXtBFEx51lqtJI
	NKFEiqGbNXxTSc3rM2PMt9CMbV3f8xbskWAK6W0g5hxVNNUQJn7GyvrO234BQgwllLViVC80f7J
	LoKA+/QxjczsU8cZGS4FTysC15Jmmpb6VeF1cMdGaA6AP60WV0gLLH/iDri2l1pd9nk1I7AC/1e
	NgrWd67E1SPYvWkRmTAjXiKB7qX7jt2WLgWrDDzEii1k5Y3QvNCKM5e7AJmoOhRWs2r8kzQCYtd
	QxedQefGhCo6fHelgAVm6Gekrb6tTQF8lxwxGZ2hgHFdUTp93lc8FKLpWnunRTu87rbjsy3TM7o
	pXbhg3f4p3S1q4zVjWMWZS/DwTECGRvWC8RpjRNICTeP/A7CEhxIamXV5sRWzMCu0mMTYawV8vw
	5pDHK1vrqXwDRT9i72rS5JRBCu/UJnpz7kbVahlNUeHUYs+/ztNB8boMUKX6dL7wpw/v1dbVuxk
	naJGj23YbTJKq/MPBtZkSvRmbc5cgufbw3j9ucD5SbHUIhucP7v/skyF/+ebO3Y=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr65527035e9.22.1794585038370;
        Fri, 13 Nov 2026 07:50:38 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:36 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/2] clk: sunxi-ng: add the Allwinner B288 CCU
Date: Fri, 13 Nov 2026 15:49:58 +0000
Message-ID: <20261113155000.84703-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This adds its CCU.

These are the CCU patches of the B288 series v4, sent on their own so
they don't wait for the pin controller. The rest of the series follows
later.

The B288 is closest to the A64: most of its PLLs are bit-identical. The
clock descriptions come from Allwinner's BSP, cross-checked against
ccu-sun50i-a64.c. Tested on a PocketBook Verse (PB629).

Changes since v4:
- rename some clocks and resets to the names the other sunxi-ng
  bindings use
- build the module as sun8i-b288-ccu, like the other CCUs
- add the CPU PLL and mux notifiers

Pablo Mazzini (2):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 775 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 +
 7 files changed, 920 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

