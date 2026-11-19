Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077150;
	b=dOTHoTZByezV8XJGViYoI34NBaO49zjHbVY2Fo6FKcyHPBLFfOjM4tQ+7giFr/F4X1wO
	 k+A0MjBAnqa0Ppr43IXrxK40+zSGnUrTRLExUud33nOYqvBhz3ntxzq2lN0ROCRyXylZp
	 KHwFiwSwaMoAiJFx/ww3lNlBDsl17f2opQ5biMdoNJ1PIeUwc+3UJ3ihs0Gpivapeti3b
	 JNxec9oTA0HRH7Bhupdpisk/9LOxlJ92fURbJZ8Tj7JK7tYnV2m1UKq0RfH3p0Uy/2C8G
	 ocApr6LYd5P35npD4l14nCK3aBgKARTRdnNPb4wRd+kFdTD6+sMsWDaaR1Ks/qbdd3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077150;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=4/BP9wjChv9IKNUE3F8KB6d3fj+WdhdLPbwpzVhGfVgPzblI8vucWTLckjXjnZWthXqq
	 wbEYpKeLBSnBGEgGJ/7Jeo8QHFt24p98w0M7nXiDXnfg42gyyoZtbhpE1K0JMUGSv7g7Q
	 f7zJe8XeYGSO/epccFbz5Ht8LMJN9PHv9NNHIrUqdEuJazXGXoYw7sO6r3H3BwjGC9qfG
	 i3lDnTJEOit4N5z4H70bTWAAxejvBgbnreb8O9l7inzb7I6d5Nd6bnfnaj6vpe+cSjQSd
	 mOWtQAEYn8EfYx5eiYR565eSXlJipKMnMInSyStR+C8jUhE810pXfD9k0Ufypfbmrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C4606A324
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1C4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J65EdjmP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A8CFC4CBEF;
	Thu, 19 Nov 2026 08:32:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC49C60237;
	Thu, 19 Nov 2026 08:32:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD7F11BC31D3;
	Thu, 19 Nov 2026 09:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d+pbzDtS/JQiA7b4wrmuxjkA2iPIz7YvM7ymaKga0rs=;
	b=J65EdjmPAxHMYXVljGZhHi9UwDX8egcSnd8PSZFe9AhLAwFS3tqyv9DBuO5bhFFxpMJp66
	oopgmeIVRLQW3xYvB1CCVUqdbZkcjJuIdrKbSXyoDC9SO7LezCP6JNI0Cv3AQn/zqHrLWp
	2tP/nMASKt4MayFXPa8xTaI8naoQzTDfsNHgB4L6MSwcTXBXy6LFRdTlKI9d3BLbK6CdML
	9MiKssAk9n1AnS3bTMcPpD67AoixRvHFjticPSCwyGaQQRsfxaf7f97V1T+gRL94x5gcRs
	g/lMUbG99dFuADw9mxJxAs37zWUyTX2yV9lufMvIgPKYNEQ6TJwTLgFGLFWJww==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 2/5] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
References: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
 <20261118-dcif-upstreaming-v12-2-29b35e27a1cc@oss.nxp.com>
Date: Thu, 19 Nov 2026 09:32:16 +0100
Message-Id: <179507713631.198693.2786295335112670846.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Co-developed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Looks good, but there are some issues reported by sashiko. Can you either
fix them or explain why the code is OK?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

