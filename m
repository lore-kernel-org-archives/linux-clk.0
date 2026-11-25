Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629923;
	b=rCH2JFw5jpRy5Hcu0NZXvPad53R9YM/AZCgkffnDEFd3xE8JrgWJspTV1Qe7FrUnlZQB
	 Xd7XhbRd2/42lxU1aQR1dkXhOubrSSdgFsUbGTeE5XjCppODyofdQnoZ3OI7LvSwe6if7
	 mvNjcHk2IhD/m3f9AESDYmfaBmnWNFYb8l+EDyTW/TU97SGtk/ZKUWUGuOY+0blFM4RG4
	 jgFWPODe6nJk5JUb7zwO6JZAe1rlYjus2W3+pR5KCt0JXwGmrDCwgUCKZ6pgXdTBj7JJ7
	 piYzkx/I7crU1eDRpnt/ps6gnbNls2fApTIuUyoAOGRzZkrnog2NUrwbLUzjV3JDXmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629923;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=sEL/pscean90U6hCcOojjCZHDF5WDZzJBu1CylwbSDrlj7nvu2YtqI+MFtVuj8GhW/Yb
	 8ObywP0IVBMn5B5HTh5qXk2sDwFxxvO2BtcYUA9gyOgI+bonuauHMiLPIKEo5e1Y8zaRj
	 I2yt1ypYG9qELjI46Uus4ub9z6mvZ3RkBg7n9pHHWDwoQcQ//TT+g+ObBcBxB6vCWvFOD
	 Gkv4XOf/uyfmeVHtD3uR2XQcimTmJiJ9OcfCTAk5Lv3BllGCpNjXnGZwwcjKTY9kk/48c
	 innLpWWPKJu4HlR4XJCFB7l1hi20mrXT5xlayDE4bRORUkfC7YrG/M4wRNsnK7jqwBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="mfUz/1l2";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76305606A321;
	Wed, 25 Nov 2026 18:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76305606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mfUz/1l2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2018D1A17E2;
	Wed, 25 Nov 2026 18:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3B3E60480;
	Wed, 25 Nov 2026 18:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 047B911E6B0E0;
	Wed, 25 Nov 2026 19:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=mfUz/1l2y9B5Q6PYTyl08Q0MPGeJPFMZpJfKF9f2H85BLYXnVbJYV0sNQ22zUAufCKepkb
	Io2t55gOPfDO9liSeZnvG1Zys75fC1wGTQP4yBD/ORz31SyTAedq/74Q/EhMxOEzdBmpGB
	U6Lk1CEjUx7XJxAc9NPu+MsghaHtJVDTaRnL63mHusx5uf6jnKvNpkrXIouXBa5xzPbrz7
	/dxrCjLyC4O5LF90xXlF7CquGb858SGCsEHjZ6Rp18lypoOzkZV2+mVVWqfrwYJ8FRZKbX
	DouSvjBzu3hp3KbICuKu7eJUO/IvZY+zqXc4eE+nL0NgzdPeGME/WefmWEkC8g==
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
Subject: Re: [PATCH v13 2/5] drm/imx: Add support for i.MX94 DCIF
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
In-Reply-To: <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990451.846133.506244474972901657.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:37 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
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
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

