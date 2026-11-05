Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910768;
	b=f1iX7rc/ZAOFv44qqqFpqjCuaEfc3nikF+QQq//mQ3MKnXyD9RSjEJmh55waqVAFZbxQ
	 c1aPbqfMN3KyLowR6p6Y/U3UnRx+KLZ6xVTWmIPPXSCKtQnsBhIVJshSDmHJXiCOsXHF/
	 0vStjL606G4uHYBdOJxmvMpqzM3fXek6wWTSrOnnnRgYDaH1f3sAf0n2QlIXTk+flY4bq
	 FcQES300hzvBshqprHEhVIIQiJbk4DHVBXk59ablvibkZ06CEPE/EF3bTf1C+L1PcgWh0
	 9a8XXb3DcnQv6KC1mInPN0zxP7ksh2VRjo8VuZZy747BMzfJNk2ytV8aYyzFuWdQreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
	b=nJsKaVzfwEL83Ix8ldiRl4Tx4fPc9COQshA8CO8NMOb/yOGEomAGQ7cioI66OeAoep5m
	 3PqttlXDrYiWlwjlDpeNyVE4oP0KGbof6hsU8zR/XZANzobuFIufeBSDMknfPh9C4KvxH
	 9dYE5kaS0IyobXy2tA0Gegjj5SR3JUkLe7qWbSvsut3KuCY/W4263EnFqh/59vNo1cb2R
	 NwYGfIM3wMHe5jpQymm1mf1UiRK3OQSXzeZdYOQ4n+hSdpTmQUWi+HlAmtFJNw66jB08A
	 in8xoAoPfVmmy65xuCk3BmRBspt6cHG99XfFnq21xsJ9r3Q2FvscZGf2QWoaTIW+hfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21796606A332
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 20:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21796606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f6295304dso245819eec.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 12:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910767; x=1794515567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=CbfReCaR2ox7msv4AJ+5IvKVxHvt7xkkGjz4AN3ksoA/F/C0jG0H8EY77tTpQ0g5CZ
         tUE2XHB0GSv1rHmE9fquea9vp6kx1iDMVBOEr5k5o4NOzNGI7kj+Au5QoHHcKDrSV17V
         U2HSz7rLAVl8PIhE+24Cf/bot01Ab0ciACiavrXgbWgNPXISvJauopLPbrNSgPUZYz3d
         MdaJJyhlYWGIiEAWLw+gQC3UvQr30N+DNF/SElDvrKxjcMGLYee98mgO7QgIwvY+rlFm
         T1TEt2W46CA0+ERiKrv74KKG/EH9hNyXnrh6kE9iZ9GGX9nfFndMWzX8wEQC8ylDgiFf
         diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910767; x=1794515567;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=gQBjFb+jqYSc5DkP6Ar3eBljCGGMoyxx+dtMVhVQEpeuRQ/5FRJ5Oeh6SyU4nLarmN
         X2Tf2go4fFRpru+tA0vkmkeLCnjTTvJNTpCvEgtFHFI4HAugEf68X2uAS6KR/n1dSOxP
         tNtw4Km1esLAJ/IPnqhs+P4G9Co+koXlOCyn80Y7EOaeowCWOvz7YKcX8AcySdCm3o0n
         jZZopSbfpKenXlIt5kBUTwr+1hmh5Y2F2wvc8iY2esh1KEsOhaNWDQsdrlytOfI13rco
         CCfP48uNqFcx5JzI9954A8rZCj6vmF9y5tfblh9zch0ymXkhdfUtghYfjMdf79Mu7cEi
         LxYA==
X-Forwarded-Encrypted: i=1; AKwUvBxPvdptfe4g3nSVGP8klNbWn2n4qZkzhGu1Y0En51IPmUA56hBuLYe5gI4Dd2uF52ygz9yNY+TGz98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XH4dtl9W0ZhX6l3WXEsmBGN59GS8pGL7LJyS9I15/B/rdOqyu
	lIr9KxVVhHOwU/szkvHCa8XHk7MB4RP+kQbuw3zZbBXtY3ds43ZeBSK0
X-Gm-Gg: AYBFou1GBgsEdLjeQB9lSPLh/n5B2h0buzc4UZZoMPcHKmGzSIPd9Vv2ttcOo4ipDpR
	TdGX8p7fcFf2vAU1G6ShFDsKYWXe6BkHyVA8qbxF+OesFkY/ceL1hozjA1HFRfj5mz2lCjVfnrW
	c2FpFemwGaqhEBVxBXiPzjiVApl6Oxak1mkdJ5HebVuJA7iYCY04Eym0OVXvZNZtD/dbSgv8wlw
	BydkFdu9kGQSppY+s/sNPG+hc2CA+G70h0MJNzbXyFthMtJxnSAKLpxKjqSZ9bk3eqibWC68Gvm
	Ysg6S4EZ6B+FeTAEzlzu1d1DvWYSSoQTRvXclmmBRkv464wKla9NyNmRrXdWmlai456FcFmQtja
	fw1htzxym9d8izBVYv2RP91GytUHC93a9NyVuNRFueyLOMXPz3+0d9KTcLCMKjSVpKJBS6eQoYn
	t3dCy0BLq0Jg1xUpM/KLXf4dR0oRc8QeB7MdtxzH17rdbrZdVsZx0EN6eCl1YIt4vAd5NjeJzM+
	K0UBqWK50UPEWJGj7ppkY4/lr/1iSaNEqyzVuYPDqRcQu/p2fiK85DPI0CYNRhiMmAO/kImNBwU
	Nt4TEz+/
X-Received: by 2002:a05:7301:4145:b0:36e:20ee:b297 with SMTP id 5a478bee46e88-36f752549f1mr304325eec.6.1793910767172;
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu,  5 Nov 2026 12:32:39 -0800
Message-ID: <20261105203243.2292647-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add JZ4780 SMP support to the generic platform
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/Makefile            |   1 +
 arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
 arch/mips/generic/ingenic-smp.h       |  20 +++
 arch/mips/generic/init.c              |   4 +
 arch/mips/ingenic/Kconfig             |   6 +
 arch/mips/kernel/idle.c               |  25 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 10 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/generic/ingenic-smp-entry.S
 create mode 100644 arch/mips/generic/ingenic-smp.c
 create mode 100644 arch/mips/generic/ingenic-smp.h

-- 
2.53.0

