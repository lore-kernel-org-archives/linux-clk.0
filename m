Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD4366561;
	Thu, 23 Apr 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776959533; cv=none; b=RK66Un6Dw9J7a2MahaKuyJxchFpIOGJsaHpYh5u3tT8XgmZj8YJ/k6hkSA06suWTQsppzEKsXB8CvffXm0BoY3/DBY64zpt121rtqFhXlhAfmzQ+3FeMXuf04bNdsPNW+zSgCm7GfL9pnQmw2nLEn63Tn9mlEkWdK1JVfwAJOL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776959533; c=relaxed/simple;
	bh=nbIC7OtgfY565xf3RSYO88GoJUbI204rE1bt9wishCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGQzw6PuKFIN9cUMqnPY2iKHky4fePStkePbjNyoF/0lUxfoK5m08zRvlI6SMBCTg7pxHsDkrxiuezSK1pcHj/ZSHiE5lomnCwRU7eVFyYhim5k2LQA3x3/1vm4G7g/T7JTrnlvKsawyHrgO47cHbaxcRrnu0MbqUO4KLH15pqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MQdTx4a1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MQdTx4a1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00DC74E42AD1;
	Thu, 23 Apr 2026 15:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8CBE600DD;
	Thu, 23 Apr 2026 15:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DD9F10720579;
	Thu, 23 Apr 2026 17:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776959522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nbIC7OtgfY565xf3RSYO88GoJUbI204rE1bt9wishCo=;
	b=MQdTx4a1JQCBHZR9LSRv2S79DyJQG+J6wKo22OQCkTvP+DLXey7PrxdH89BgdN0y3ADFpZ
	gz4ms0zomvNgYyX5GOZAx0bUlljV3bsOvk7XosCWRPVEhOpoDJNhGWQuSDduF3FmJgsiI2
	nxeFkdjsaEYuo35BL6bslTM5tZZlIZE/lqvac2FphnQc8ox/m9gciAqAkJqfixC3ouRU+V
	A/5fP7qoe/Bsf4BmjxEYLMl+5lYDDOa+oeZ7o3/sLoSpqWwNxaxIFHGXHXpbDLOhPFDUvs
	r1yY0sIMXIjAT/Wumef1D7FHAQWUuVpuENnMy8rlMynyCdslC4lSaMOaa6K1yw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
 dongxuyang@eswincomputing.com, bmasney@redhat.com,
 dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Date: Thu, 23 Apr 2026 17:51:58 +0200
Message-ID: <HbNhp5--QBi-9nHQ7E_UnA@bootlin.com>
In-Reply-To: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
References:
 <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 23 April 2026 at 11:11:14 CEST, dongxuyang@eswincomputing.com =
wrote:
> rom: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
>=20
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



