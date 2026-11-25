Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629935;
	b=GBm6vxPUY11nTL6v2BqguilJ5KdYt6JolNI7A15d1CfO7qgnlr/kDydFZiOEJWuWLeTT
	 xHLKOGdwAhX5b7Oq9ONoK+r6wiSLFcLjlAkLUQG0pCFl8NF47RsXU0ibxqgekAGAfW0/e
	 vFuLrRC63hZ2u1H6sovEoyf7nGcCA0KEsP/do2xB+zWBngdRaDpodBrAE+SkbGanmt8sa
	 J6fdPPxxJ0D/4+mHaNVkDi6H/To1qlKZSO6QPtThWIL0Vk1EbgJ9/BmqLeobEpijtqQhy
	 Czf91pV2A3VizzbOWWHXyXX5mLOp2q/iZczHjqugJ8/gKEfclgpGo4f9E3CRqHB91VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629935;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=gjJnzkcMPhEPJ5/q666Im5Q4FNxL6hZMRuK1yLefp/I=;
	b=yYc0qiEE3HDE6wGn0LP68OFtpwMitgvUURcFUg26/DBxyvq5o8ZxoI4VGAn58k+NhUU6
	 1lDC+mP8lr0ufynJDCDpdjLFKOAMCTd3HpxJnUzH4F2h0zwctU1kTDHCyGWaC+ZSSGM0f
	 DCMKA5ns3MSeskDweyE759thPDqRnqOSDlQrAIATr8N3iJRvUOSfoAKWeDLJl4UOtufqd
	 kzk0YQX5j1QELKkz2/47rl+NsTInVSt1t177e4BJUTEISOsd53X8OcF85z3zI//0Vrwcl
	 sNAqeil+QAgX+qarwTC7jTR8JL91DKEtltXStYP9fs0w4VtBj9x9Vujy67UC1ni/ScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNm17mS0;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80030606A692;
	Wed, 25 Nov 2026 18:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80030606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNm17mS0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E3004E4177F;
	Wed, 25 Nov 2026 18:05:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8C0460480;
	Wed, 25 Nov 2026 18:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3289711E6B08C;
	Wed, 25 Nov 2026 19:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gjJnzkcMPhEPJ5/q666Im5Q4FNxL6hZMRuK1yLefp/I=;
	b=lNm17mS0qvqEwvboUKPMid9SQ8CpkX8eQqI7GQDWRSmDkLE8f7U+brK688OGcnnK5igGZT
	2SbRz9c9mGnneagQcttxjU0NPGFtpfTBPT2BKMOHp8W9OluUMBoO95tN6xC27vlrPbx+zK
	J+kqtI/88n2fZMufcyEpxxAeV1J9dqjL7x6WYsepiaSbVpymESWecm4JRQuTBHXzOB450o
	OCDucrEeNc029XSVPqHLoYmuGNPCJl/fpqfKLZC+knKhugpO3UKANhiOJtg4Ho3x+JlLfx
	HzZ7WRBYaMoMnrmiA1aVQi2lkQl2tsG+Mv9KrdnBhBq8MeM4SZnKslVRrr1GNQ==
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
Subject: Re: [PATCH v13 5/5] arm64: dts: imx943-evk: Add display support
 using IT6263
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-5-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-5-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990453.846133.15615766820554855508.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:40 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
> i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
> the default configuration for the EVK, add support for it here.

Acked-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

