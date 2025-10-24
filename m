Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06212F9DA5
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292584; cv=none; b=MNKHkwqlDOIQMcVAGKTDRyyrRS/iS3oGGL9Ao4lh+AfKfEcRJ2EbJ6INFQUML5zRw9raEdpgeyKXCscxcWL4rLc2uTBMzCSYkYEiq70ryr0i/FGYlqUIhsnPmQw1r2KId2HnMYPZsm9VMHf6sFdYbb4FD9tD80fIftSa+0KmFe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292584; c=relaxed/simple;
	bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwO27n5ZyxEji8ugZUy2t8CcIcSexEN52SPne8Z4mNGP14PKuvjauXrCfT87wQidZX26fNpglGwAb8dHdLqQT/IHcwEkUkoghopJOpjeJStvkN1JAHdM/MWB81h4NghXdpo46cqQ8UNJ6u57n3Vq9BltNV88UZYOuzsRFPDnAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v3iF3RAP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v3iF3RAP"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592fb5d644bso744471e87.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761292579; x=1761897379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=v3iF3RAPDCb1elFqO0VtoWQu+fW6ymU7UCcKEvvmYKNYTD2ooJnLd6jMbuJoUoN+Dn
         48jC0TXcnzK7hHI8l7XLLufqE40irxcJ4vQUvDf4zdOy47noMAAYnUg6+rKFE7kuW8KB
         USll7/Aewk1bIvHRDatF6iZ+ivUhLjYhiJEJEaA/t1MN12k63JvJ8Z2BqetAPfCPpfzc
         bXyJLqDmaG/v2uSkzQNDFkhtLwjQdE/QsFWa4lokn+PvuaNQ6Zeenb8G29xaiiFXP0S7
         FDqWxQyTvlalR9tZ8BC9oRxHctw1PO5qfa50RYj0lq81NdRESC/gWmdIjcg72jvCS2fV
         wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292579; x=1761897379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=pllYdTZcrn2kyT5F2B+IkWlEQh/RugBo2qLTOmVUnjCC2LbjzKSvA8d+ZdubnZ8h10
         Z14hTaIxwmcU1tmPLqmuR0AU8oBvTYbwIjGoI9jDEJqKsHlbCa/PUeHodxeWMU6tfaqO
         Ie60/YbmgTvN8fyMIU0esxpV4zscz0rP0BzD572eINmDt2rJC+iMuJYy8MUy2xIR4xj6
         p7g1VzAzAqwRsJSPMz4fc00fhIbjaS3FSw26ClwKESymvOhM6GsYuphjK/oSMvI5qcjo
         I7oMaEeJ0YUO2aVlVurYMYV8ApaWXigLw437bS4Q9yMLWJ6FwMu2C29KpKkZh5Qs6wOk
         gppA==
X-Forwarded-Encrypted: i=1; AJvYcCUXmrTqyPt4a+OI7deL51yshhjgCPW4FCWsd/pa5lEf4VoN9OBV/p4+73PTGXJtQUfGsBSs6jKfFJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FifgHhhaHUCtcq1F7/mtVelxA9xmacFXcn9xO6FY3BdO1QQl
	0zXXtKw+KQqGil3gE825qFBiCrgqJCESWovM3iTsSNiUqUHxsUWbKOFGmjL8tFu/SSIPA+rlCuy
	w8Gkw4Z8plVWcGUaFWdyS0nWP/+i6l4+UgZq2vkdoxA==
X-Gm-Gg: ASbGncunOoBl4Fhd3etCo2n6FheZKhaodRqUz6K/rhVkmBEGKOEIAdlQ1j3WP4wUAFD
	tzjx2QpHYx+EAodKM8OOKs26Afy+RK8mxrMQZXxZfNo2oRi0HENL+nu1lNbR4kVw6VVja+BRjyP
	r8DU568REVjB/VzdW+HyeiutJMlXfWuNC7E9pvI40E+8lobkQSsga8I1LxKKKbcSXAgWXfOZF4s
	1vhFS3nW2mTBg3WzJNoDndfbeg+gSavK6jAa3BeDWq+DICSXOlnfGyYs6q4nUl6eJsheehIj2Pa
	XYYnpUY4mSGkJO8=
X-Google-Smtp-Source: AGHT+IHSnXZ/gyOux7cXwXN4jLtleYFyXBIE1/V6t/jovl+yJ4b+HMb04wimJ5i7xVzENgmv7b2GUJ2i/5ONH7mEpKM=
X-Received: by 2002:a05:6512:130c:b0:586:83e2:2295 with SMTP id
 2adb3069b0e04-591d85525f5mr9376212e87.45.1761292578695; Fri, 24 Oct 2025
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023143957.2899600-1-robh@kernel.org>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:56:07 +0200
X-Gm-Features: AS18NWBwXS6t25LKJEi_UKqvj6YhljrcGI4AFOhItyKPndeRwhvu3EmnTJe9vDc
Message-ID: <CAMRc=MdE=1cPDPQwPQA6mdBkbXF2pG=oQ_oR_YuasGzaPDsKtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 4:40=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
