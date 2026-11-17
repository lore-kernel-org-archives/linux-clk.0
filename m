Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949262;
	b=uhbc3qGo8EaKF8vTyt5HZ2xTNj7eGUTBt0pZk0WMbld5KfJCvs216lXzEuZLlP5zh3bk
	 ISQSaHSfiAG/t2b/C6Oc3Lvbok6cS6E9a6XdSQWzaTbrpEAKn090fuOXeF8au6Y1ojYN6
	 cePOmeODywuWg5kxh+GbL1LqCTuyDTLA6MwQidWPP5T+s5lujulNN7a7EVXEX99V1kfzj
	 m24A4BrNaCi6BD0FbqVClA6A17UZ+iNUod3r001Gu6Q82MAcfMOCz8IOaq+fOr587S3v7
	 ns9ZpB4nylVRlGS1nxWmN6Ip/vxdiGOiB34TlPYn3Emtvw/FTjPGIVJvZmzn7VrbbDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949262;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4G4OsBpiP4ESq1H97D1AsDisbDduik4VQ3HIzmTyFjc=;
	b=a3GZHMXGIN/EPt6ovvWuOwhp2s+Rh3Wv/5wniNgaXUuFLh9WWAZ/w6MBUTunvr+4F9p0
	 nHlLYnR7HJoprynaYeD+n1fUw7fz77YqHkmUkpyca7g4x6Ywo/H+HSL9Rm3eGjgpIxdaK
	 UCnQjD+v39RmDjeXGdDV3vQWA1Kp4nVfURHg1s9W8b1ks5I1jYCiDgYr5XmsJHzcUy6Dh
	 JVde4L+Jh7kSR5L7PLUbkN0dG2TJM8BfrEyG2BvatM6Uf5/THVauEClGmjqhomHuLarZL
	 mqcXDStFwzPxZ9n6zsvLtNeSl4X6sXccjkI1QqMM639bjLGjK5K8ZXVIxPuKChzO0Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=L1hcJN3x;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22147606A88A;
	Tue, 17 Nov 2026 21:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22147606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=L1hcJN3x
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A77C220D4EBD;
	Tue, 17 Nov 2026 22:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 8684D20D4D62;
	Tue, 17 Nov 2026 22:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 8684D20D4D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949260;
	bh=4G4OsBpiP4ESq1H97D1AsDisbDduik4VQ3HIzmTyFjc=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=L1hcJN3xIte0izs4ee+2ObDPkGJIxTFTV1AMtVdEOqHoc3XmPfGcRA6z05YXVjEpi
	 eTBvRjVOWM2AVvt829Z1G7Q8NlDzDRQx+Igd7/h9DsGOwdkUCnKDe17t0b299qvS5C
	 6CApAEDNhkpvedT3VhIXvhV7WCkrPBMjQipsyqA3VO4R09vC51moPajad5kRToScY/
	 YTv9lEkMtLLFQMDNkhjjnfXIRuMAd+5wFKekdwrXJ0+ww7ZhurrOW17lZppAPh96a8
	 mW3M++c63XLWloL90qGL5m2l8QXQ2aYIrj3uhX3lwdjxizkLVGuVpfuuVz71Iyyt0W
	 92QSz5LRaIX3w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id bGhBTA95vChK; Tue, 17 Nov 2026 22:01:00 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3FE5020D4EBD;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 6/6] riscv: defconfig: Enable PWM fan support
Date: Tue, 17 Nov 2026 21:59:51 +0100
Message-ID: <20261117205951.140146-7-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
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
Content-Transfer-Encoding: quoted-printable

Build pwm-fan as a module, used by the Banana Pi BPI-F3 fan.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5..d244e806f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -178,6 +178,7 @@ CONFIG_GPIO_SPACEMIT_K1=3Dy
 CONFIG_GPIO_PCA953X=3Dm
 CONFIG_GPIO_PCA953X_IRQ=3Dy
 CONFIG_POWER_RESET_GPIO_RESTART=3Dy
+CONFIG_SENSORS_PWM_FAN=3Dm
 CONFIG_SENSORS_SFCTEMP=3Dm
 CONFIG_CPU_THERMAL=3Dy
 CONFIG_DEVFREQ_THERMAL=3Dy
--=20
2.47.3

