Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55906439F87
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141794; cv=none; b=ed5JS/g4h/xujEaOiAxECHKJ+fx5Jvpryyv23J3n/A74lJWzG9zhlAsJrHMI8xSApUS0/d6istPvL3iycBGTBSH0pQO2ieo1lthOqwzVtOFNMm5owx0ACzAdE7+Mn7G8ucYC4cPqwK2dojqpbWO7eRaR+nZP5VzLieiVC0orZM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141794; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J68lSf5g69eJlgXN+zG2Gm88/rML6W9zzcrIiN65MwH10YGXrT6N4cqvVA4khRVZXw1dfYw7yDskHeqS/tL4ahi41gdU9fhxQhZGpgpSBi5ruGxcJ44NYm564jHPJFFYLMFsQ2yNtRdV9zUQ+DAOGypYwFvDC7+1C9BylAM/XGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxUBZbHV; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxUBZbHV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8adcso273101b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141790; x=1790746590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=hxUBZbHV6QCZXuCz2XUqH4RtTWSjfTtAuoAbuFYn36LKQ9UFFzkyYjzF681zZBcisc
         8gX0HdHSSHLXMLJWsgtY7NJN8Mh3EKqnpDidPuVjlB1MQQfIqsVIwhx4aN57mur4AG2C
         DLJnCIaN41i/bMg5PjAzqI5BQQu7GQp3OGkgLYkVTaiH1tGvvvFKuBgo8QRZfr0aBtpH
         Ff+a2hfus3Hb/uK/Bl+HCweZCBtrfxN3/DSHnWNc1UatibpDktP5PmqUCHXkPQSlA9NU
         G2PmBYaijuANITHl0C8Ihh0xfNXA+UExUFohEDPfEW13k9XpVleZQAEefxpKgSmAPg7+
         wxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141790; x=1790746590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=oY+OFdZ6pJBvpfYkKWvGJDxZGueTafUIpE0NCHuPSiq947UkjLZWiRrtWGQGPlbFFJ
         2kJjAyKF3H2VIxcV/tLjaHiZ0/rGPkTSD+01Mbgg/RmFo8SQ3sIEqNT91vI8YlWEJ/yp
         WhCws+o71GZuyUony+rMR01yi6gjGVDSbGchZR/30N0h0n0ZzCpIVjMQB9YoRBuSmBy4
         Wa3if/fw5s9a493DXMNz2sgGFEpYS1Vo/yG9usEf4Jqqgs7LycUOwuJe37obOQbTEMD5
         Gxq7sGXlVJOeMVI9T+efhdXyTM/5h1VVp0Hfw+QeD5Ba3nU0zbRa4Ia6Fq5nsG41ncsz
         KLAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwoFV3lpIsRqegV2QllpQyKMffuDGNg7ejrnTotzoybODpYbFIFgvakzG8zVwyd+eccKlEuciwrt8=@vger.kernel.org
X-Gm-Message-State: AFuF++lwMIeqoH3FeiK8wshf6HRsD3RkpmKU1znh8OtEqEAkEsi3B6N4
	VVaQKwafws7B/A1OwRpm16QGChpmHU73JjCkvMmv4l96dejCxIH1VzKS
X-Gm-Gg: AYBFou3kKCfoUXsUpgm83ElZrrkISBNYAnFdVynqFFaN7dtxh2ct207YPZ4023kvHXz
	y4thEQdfMhoxqQu/jGaxYOraDBi3P47HYGXRK8HlrWzb7x3TvoyCFKpwsE1GH2z8wUOo8gNfvmt
	baH7kPa+XgaeXKInNZJm7CoBlDr417OQag/GKSefZ+CnP7X3Pl08rQE9PVZnfOkm2Fx7i93AveS
	P0R6STRpcysD0+AqLFLy+X7/aP2ydKbq9M23SkrlteMl9+iKHlYjPrNdE9zkbswbXmsAnmTUFih
	qPlH7Y6rQm3Ecqi2SbmqBH912XQwN4bEgr2AibpmOkLtPryXHa1vX9uEvlEqWKADXAkyrzp8OBb
	iNJzE1w4izt0gSp2QT9ES3tIzkn6ALDx7c7YroWbenrBFIzZIqMGCEzfwxUiGPNmJSrGS3UOCIy
	/NlIlsNE7LDPy/xQlG0Z0gh/qbJw3N7GLerTkzivKAtPIiGjIoNHvZI4DNXbYZSE001aRWeg3H8
	IUOvY7Oh1/p1bc9eYjxSNtdC3zHfwrO6p5wfefMRvpBBIYLxt5dBTaO7XOVjSNfrPhyvDDUaRRt
	bDjKXwIogv4ojUUUj0w4wWdU7rLDfveHOCJp9rA5eF5PmyGCCozrN8t/C1uL9Ue3FqnEQly/Da3
	Rbhov3T3IeiV00Cl16p8h
X-Received: by 2002:a05:6808:1495:b0:4b9:e5fa:8a1d with SMTP id 5614622812f47-4d5ba092ea7mr1861997b6e.34.1790141789974;
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:18 -0600
Subject: [PATCH v10 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-5-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

