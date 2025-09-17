Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BC96ADD
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095564; cv=none; b=HS78owIyCsJm5y01RptR8jRALjJ9Fnea88Q4t1Bu1VEeIfpWcs5gg5EpUamoME1k4z+iMZ6Jwd6pLoliQAqvOV/dKwsUA+hE+sZnCSExL0jXX2FpYvt81d0s3LwFwkdWnTMSbzBl9Ky4nIUT9jasSO81BRl8pWtoXHk0YwqLGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095564; c=relaxed/simple;
	bh=sq+35NiLodqZTUndAQ068vCXGUmPl5MRsZErPDPB4PE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwoFw1aUcBdH/sGn0+YyjGqS//1Gu/di4a7kdEnF54MPSkUIynQIjHXRpj/Q2jxot8CQyll5Iwhu6HCRmjS363Tq55OOtQWUT6/JaS69hd6fLHQul2Kq7hgrxvDCB8Q4lpefTVoEBwE2Vp5yvCzgDVt2vCAyViH7uyhBc6phOIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R2Krbm7U; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R2Krbm7U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 940BD1A0E4E;
	Wed, 17 Sep 2025 07:52:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6444A6063E;
	Wed, 17 Sep 2025 07:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1A45102F1727;
	Wed, 17 Sep 2025 09:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758095558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ap2y+Npu+kLF/Mrdl1WuStE4nxuZYwysNcBQ5q95FJY=;
	b=R2Krbm7U0/4oorf1biGdW5mKYpGEbYe/25FeznSsZ6Z94DSXAspeBLOFJcukQhLo1NvmUp
	r6kWnLlT1sUnJtIJdL/Y/fxK65YtCCvOGuZyeVfCHHIGMvm/jhOhQ/34nGsmDTv2HCKom7
	PE1qLong5NeYcuvJus3EG7/+aHMPfUI3Id5qcZhAUISqLqFRf/+d1LLBRMfQhwpaSNN+00
	HwMjTZQsYg8iMZnb1n56GBggyn4KnkDnGo+ABUnkMIxr9Sc/qZoduseJpIaAAu2AEMl6jT
	XwsWypEI5qzBUzmTKEc0qkEDzWVEbC5RJGKWl4PI3Gci+tVxPjh9lBY5D1RZ1w==
Date: Wed, 17 Sep 2025 09:52:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Jonas =?UTF-8?B?U2Nod8O2YmVs?=
 <jonasschwoebel@yahoo.de>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 13/23] staging: media: tegra-video: csi: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <20250917095215.12c6a7cd@booty>
In-Reply-To: <20250906135345.241229-14-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
	<20250906135345.241229-14-clamor95@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On Sat,  6 Sep 2025 16:53:34 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
> proper place.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
