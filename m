Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817761DF724
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955969; cv=none; b=tjxB5FxUAims9AqfTE2r7WPDgJBtTiC93Fy/5ss7VKGLmj8CEYr4EL16obI3996zydNNOIKxBdlJRy7MMqZlFH5tob+wh3hup1GoXm0YsVH5HkxDmxIIPwXm4V4HAJOSg42AyjHQYsE7ePbt2efy3AP3VjeOSKRNvpp9Y7uoVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955969; c=relaxed/simple;
	bh=Ll4Hm33BOP6BRDteNaeEkalteukRrEcf/dQJ2Kgc9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwZOsVt2z8X0GrTD3rKEvcNis6BX+qs/Iho1xP1QEGOMQxTD7eNOFG9+VroFqRmqst1nSvkqQxmLf4FCOcAuGGbwyTVuZVMmirytAfU4cuBjow4CIKD5e1Xorgqp4pM4In8f6s1DDNParhIw5Q5XiVHIl19WBRU8ZWcjIZ5h9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Or4nQuM7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Or4nQuM7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461f2ca386so2888281e87.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955964; x=1740560764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=Or4nQuM7nTSyBqwDP5wJ/fwD8lL2sW7zUCjTGIDt5vK5uZQXQAsTbeDKtNdtRRIu3M
         cGu5aeWkF4o/oouZ7hZHhBgpVdIkp7bhZC2HHJDNlybdeFhGVtZWfjhcKpvoM1JuMtVL
         V3aaqxI0TGOZl8C5hPFh/PwbLTJNpgfmQY/hKHQknZIXREBN5Dpu1P72SoR5zj2Lf3tt
         KMPTdpWaYhYiROMN3CREXh/jpTthjnAnDxBS8rAFwUjA5NS9d9W2+KMLKG8EEGi4CYfn
         IYK7uFcZZaLr2uTNRyFx79y4VCPTsRSYu+pqk+8F07R/mLroAxNCLySC5x10SH7Edm23
         GqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955964; x=1740560764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=L1dFS1PlaxfuhpaeG2HdkBOBKjXvb6RKC90q4gy1D6ObqUmpxq5OnTrPgk9Qy15wZq
         XcDbKaz/KgLFRLfCsIAVIuoU8ix3yBMorvNT+elMP5T+Mk8RREOrxBJZHXkd01nrnPvP
         AJNhxqQwCWYL9plcdSN/WrVhUIP/bDrZLLIzXojkwG301GZRqD+LlBw/3+fmE9mVkM45
         aCTsizeTgWs6vbmjZwRTJFDB3Ya9kBS45moulE0lxLfxo//ncLwnrTv0ciNsjKTT1Y/w
         zm2cmxLCmOslixRU5IZJkAtxzPQRT24kmkBT07AkGqLucsPiPWzdzwRduM/jm1BO1rwF
         x60Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoYDl/9Cep/5cbIM1TZkMyLD0U5ncwwurh7PAqv8sfHehWQRwUhrqGb52lnzV+U6jxr8siFrpo8Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwokUGcy6izKy+0BoxNyFZQPpcLs5SZcg5YjmgnjYnfz5uqg7Ua
	KaWoRjr4ZYQvvrGgQNAruxlci8xhTFFyy6ZCnSEfA82AmSRJrQkboRCpnDsKUXM=
X-Gm-Gg: ASbGnctttR1sJ9R3ZVbF7P/kqS7KB82nboWHLd4XX1fUqFkycK+VDmE+EgcdMDJshIa
	3yWYw4YDU8tkLnozAr3onZ+5+K0/r5UPkHpQ7arXraPF+90VhG9O8Sl76ew8UiaCiOpjJD5iBI4
	PpXHmXzi8RQVQh9tRpSSGkGKMRkErEnAUGqIK7Q17K9CY38oGhDW2ztpc/DmFxlhRw8OBtebmiK
	BZ3K9vJaIpryZ1uLRCMyMcpRO7rKamaEWLh1gBHWKzsBpU74rb/YWs1Db/xRPrlxxx+MGNInLQN
	wKYHYNnpzUyEhr/B/F3iqlaznZujHgJwe2/45a+1jCN3TvY9BO1zmaDx44DRUL/WgyfK/ng=
X-Google-Smtp-Source: AGHT+IHm7rrZGF7gWE8rLuZPX4nvDlV3DcFc5Uk1QwC4R6ncjGo7U2SoOER3uymDvhu6BZaa/4okgQ==
X-Received: by 2002:a05:6512:3a94:b0:545:10bc:20ca with SMTP id 2adb3069b0e04-5452fe583c4mr6368433e87.24.1739955964491;
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm1454714e87.36.2025.02.19.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Date: Wed, 19 Feb 2025 11:06:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>

On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h |  17 +++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>  }
>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>  
> +static void auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev);
> +}
> +
> +/**
> + * auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Helper to create an auxiliary bus device.
> + * The device created matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> +						 const char *modname,
> +						 const char *devname,
> +						 void *platform_data,
> +						 int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> +	if (!auxdev)
> +		return NULL;
> +
> +	auxdev->id = id;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.platform_data = platform_data;
> +	auxdev->dev.release = auxiliary_device_release;
> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret) {
> +		kfree(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, modname);
> +	if (ret) {

This loses possible error return values from __auxiliary_device_add().
I'd suggest to return ERR_PTR(ret) here and in the
auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
failure.

> +		/*
> +		 * It may look odd but auxdev should not be freed here.
> +		 * auxiliary_device_uninit() calls device_put() which call
> +		 * the device release function, freeing auxdev.
> +		 */
> +		auxiliary_device_uninit(auxdev);
> +		return NULL;
> +	}
> +
> +	return auxdev;
> +}
> +EXPORT_SYMBOL_GPL(auxiliary_device_create);
> +

-- 
With best wishes
Dmitry
