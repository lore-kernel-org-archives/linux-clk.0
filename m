Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505156;
	b=TNoXt25bOpMAkOaYFF2zWRLgH4I3g6dcWluh439ZyxipY/C50UMqFJFC59svw4cc6v+s
	 p26+J7nrBNEEDSax+uIHJrWqpO8XedyXY9Zc3EuXeInw6TU+zJF5VpCY1aKld1ugsrHkx
	 uiQeNvnNkOWAVG1FpuuyBWrxJaRX/y/A5u26Hyhy+C/w9ImJxkbbIgYK/TSQ33ybyZupT
	 rtDChkF+21vUvv64/hGMiaFwYCUgJEqCJH7EUjT6ecFeBDwREuVPOfF6pU1kq70YpVykU
	 2rzjCNw9ihdG/sZzmpjAkVnLDEvZrE3Yrv0VvbApD7rC0b39/us9GK0M7UzUlIxE6bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=rpjlQZMNdbdSf6T1XIM98azVI2gPgzqRqo39bRX6+j4=;
	b=dJs2Y+6hQo3SytuupykvAco+QvxCrAsvhavYF08rV5IocVn3Xf15mQKgUAsaRZdVF8nB
	 U1QuKFAOb8PEgT8I0JNSOrxxsIAS2m5UOdiZnIuMJXhB3rhu1z8Um4zSC6a2r9ixJDAH+
	 Py/Jg0YL3/Zy3+6RQu8AVBZGN4Kxc+g0ziUKU/BvZnzNxEveG3bXKB8S0Siwn8Ic1BT1P
	 VorA4yVTWy0S6KIqDYf9hTZ4iOXRr/YszwO+8wvcrrBHfZktWQyzhdXqe/vfYcAS/LLJ0
	 t/mxHxs+V3wx56Y1mL18J0IkO4TnjaEBQgfxXFVVMdXkE4fMyhTxjo4o1bKArB5siRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="BB/Cgox/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C560A262E
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 14:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275C560A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BB/Cgox/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29868C63455;
	Tue, 20 Oct 2026 14:06:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83B3660393;
	Tue, 20 Oct 2026 14:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6A6210328934;
	Tue, 20 Oct 2026 16:05:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792505151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rpjlQZMNdbdSf6T1XIM98azVI2gPgzqRqo39bRX6+j4=;
	b=BB/Cgox/eirjT8+0vmw+jFEYhRemG8+xv5/pINyLVTJpXLFlO9eLOx6q9vwsaLgmKo0bxg
	Rg6nqyqcLFWYM7ecfE9SBAxAzUynfCcnd8b4k8ysxmxAlMp4vBdspyYIziaAYfh+XCdMbn
	IZdCrEFfdIV23FSUYgW4FdHNJic87B0j22lfztOUic3+dIGRCZdMP5zT/FEsZMuxSGFZgR
	N/zSMQGGCUgMX647AZqDwnou7rfO53AmhcNt0xJiq/8DKxkLUzkeryMhNzHZ6NdvF9aU0x
	UlxSLELQqcSca8VMF51emi9XZKunsPeR/gX1iSgei8WhBTKgNwqSm7tJwEPz5g==
Date: Tue, 20 Oct 2026 16:05:38 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li
 <Frank.li@oss.nxp.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonardo Costa <leonardo.costa@toradex.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke
 <ernest.vanhoecke@toradex.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] of: unittest: Test fw_devlink with GPIO nexus
 maps
Message-ID: <20261020160538.15ee07bc@bootlin.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-4-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
	<20261020-fw-devlink-nexus-ready-v3-4-fd6f1c17e16d@toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Ernest,

On Tue, 20 Oct 2026 15:00:15 +0200
Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Add OF unit tests that call the fw_devlink add_links operation for GPIOs
> routed through nexus maps. Verify that each mapped consumer has exactly
> one link to the final GPIO provider rather than to the nexus.
> 
> Also cover direct references and all GPIO property spellings recognized
> by fw_devlink, including the deprecated singular and unprefixed forms.
> 
> The gpio-map routes its entries to different providers so that selecting
> the wrong entry is caught as well.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> v3: Route gpio-map entries to two providers, use a middle entry (Herve)
> v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com
> ---
>  drivers/of/unittest-data/tests-phandle.dtsi | 39 +++++++++++++++
>  drivers/of/unittest.c                       | 75 +++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
