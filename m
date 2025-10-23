Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA01D6194
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202598; cv=none; b=dMX6l8C3uIArViS8X24SSuJhUPdtEGo5axs9VaovY/c4A4gUiSl0i88pzTeUqNgVKkEQclwAWXe11LhV8EjqrqMSd/01m+ydwJtIMUbwXKGDVnHSbrGFzX+cxvg02/SEmXDEeGXHh4PR/46eZq/KbbnWV1IrBXw/S78Wdy6DBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202598; c=relaxed/simple;
	bh=OjQdk0BZdnyHlEpPWBMKC7iucCp4Zd2OGCyrXtd6FSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IThmVByyudZHCRY9DUDJU6LmDO8xGYh094FzDIdMEfqrU3pVshdDIwyu/qJkubuYNItaZ4W303g3tWbIf/pO4BptFbEkQiBnSqlvWb+VZqXeNoTaOuDSNIoS8eAqEjIg1F4kr6kq+27DEydjlWHOj2KMFfgRV3Zw7Yylj9MB9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lycZeao9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lycZeao9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so3120935e9.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761202595; x=1761807395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=lycZeao9B1bsp0FXzKmSTLA98BVRs9Jq5UdLb1Mfozz5B8w244BuA1NxxThuAGBBdR
         OtGpcEbPL3XQuzRZd/0sakwtQJeyNoZqPh4k4XndjKDivJS39DklABYBaHWa6rS/SZLT
         ZAaeyP/D8vBeUuvUh5AEGXRX1CqgezWH+t8BjOsKF4Vc8tvejHmnifKnEiY/saaN7j38
         OIzUDnW0lvvkFayHer2stqr6HFm35ooIm5kcmp2xsOdlxTOtOymAEXjLoP2Q+zkkPBeH
         p9xRu3Y+9eUfLUvl6FozFrhyj9bs2Kr6Wd2nK6eFOH8gzGSvVaebCQKNPVEhEGsFAJYk
         Uvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202595; x=1761807395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=ukAObLO+YoIiQZoUQP2iVjWTqHrVLqDqdfb+4ojLu7yI0ymimxfEeTBBK6ctfUIb8n
         cRxOwGt1R8VqGpi6rNr5oCXbuv41GS2RVWhZakfEd37iMw3tue0hai+GIW4uerX3a+Sk
         qSyUJ+EpVnvB7SpvdxmRbc6F/7nB/k4L2zewY5a3RgQI6FFYbEySjVKnM/u2O3/3gh1i
         HJGBAYuxeBOCQzXSFV97Tw0aUAsgEwXtKMPeG2BGam9EoJg8AyVZjRNFXgiM+oL7haxw
         8Aie7uk8f6lE0cRLDt694LgRMVgXAvXAxtfEmZ7bab4HMti+pFaSQjqlvcQZJkrTGnyf
         GanA==
X-Forwarded-Encrypted: i=1; AJvYcCVP0XLuWgqAj6BGUBSmSn0ro4WecFL/2m2oGia0emOvPxM5F0QPMPZzOOmZ31vZrwIPhHhahU08CDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3l+UuOz/t+vLxKXBDtMh6NkJJRalKA7DJ2BMeIxvJCiGljxzy
	Zh7YiQGsUgqPvRThiHSON7zz3jXnwAB3HCBvMC2PVSyH0w35aJlSces7qm+uDeVxNtw=
X-Gm-Gg: ASbGncupBQiKmyq5cAD6oWKV0CiSUA/qmDgYdO9HJo0pEJzZKYYudmLf9bOjy83Tl6M
	3Qccyxcn0Xk4bi7J8dWsFwXSiFEYOOW3VwXznWRfNTyDY81PV2c40mnYyWwUybfJbLfAyXeYWU6
	ov4WpZKqhbeXpEgqkqIRyWSzNtat0Y7GxAS3p4xR0JR9PpWNIcayvXxS+KhrJfuG/UwBL+/lCUF
	A2EA++W1WVC+LOSzsnbW7ScPjmDG6wSNsStWYFu9LsPmsPghA58crC5Npz95vQj916T6IysAtmx
	cmrRnFL0dN007j6MgKPZeqIWF2C1iViZ2Gx0Qc5CpWpg2Zu7ygL7xie/Vi20UPg116Nofo59RqW
	JhgtZG3tt1Ro5yCpIsMjq1Nb0H6VrwXkeJaln0nCMgV1dSUFlr4+YlwMEMtpA3F17wYqTja2YOM
	8Q0F+PIUU=
X-Google-Smtp-Source: AGHT+IGpQD/mtL5CvJA6o/mUd4UXTKshusdC3K11xj2LRMgyz3ANFxCnibnxcRJODpBqSTGDyYLPBA==
X-Received: by 2002:a05:600c:1493:b0:471:1c48:7c5a with SMTP id 5b1f17b1804b1-4711c487d74mr115681885e9.9.1761202594902;
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ac30b4sm52576665e9.2.2025.10.22.23.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:56:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8mp-audiomix: Use the auxiliary device
 creation helper
Message-ID: <4skca2rmh7pfasmptplp24uucst264idevjbjhid4uj3fbxelg@ap2mzqkmbqtl>
References: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>

On 25-10-23 09:49:32, Peng Fan wrote:
> Use the auxiliary device creation helper to remove some boilerplate code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With Frank's suggestion in place, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
