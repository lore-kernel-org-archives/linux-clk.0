Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0B2F3620
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555626; cv=none; b=KADE/aR+vWp/AP4q64ctU8c9KZzmetiDDq3x0g6xirD0kdqG8ogWhVmEnDMiCOrvhWEMKtiIsBpuznopM+mS9wr5pjHTetFzMWoKKJubQcrA2OJ6ZIXux5wLO35n1kK80nTbIHM/eYh4qRG+osSrAT/S9N/ehXL8f/iYCqNdrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555626; c=relaxed/simple;
	bh=qJgf1RF5GwyM1t3Atw/Q+kAszB7c4DDzNJhbDeMNAts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuNV+Oyd0fuf+b6/yV6GvC4m1ALl2RyrziFaMt4WvflYLL6pHqi9kvyBz84qllH4GvzViWStVFodjEX/XSQztfFIP/rdqvpUnDPhcp8iwQFPeLhn5I/oi5HQqTyVIB+oYBovl05Cm5IT3sTVZzm2/JfA0ZnbaSgc3+1kWXZ+sDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfgFCklq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfgFCklq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so9916017a12.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555623; x=1752160423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=mfgFCklqtoxCLPZy3t+4gjqsCrB5P567O9yGv2ICMwYWYF9p6akr2ozIQo9ulLf4tO
         0PoL5YPOBvnRopNc286PS8bk/YmoBUOcxnbNraLGwo1JAdRZDUXSI5xySfRNPrkwBxBd
         rAYoBG9IxVGiTLwP47thngj005FHJJmrWr3XQi5EnUgPSx64I//tDiSHwqhFceig2neX
         vidUlXD9pV0cQ8Fyu/q6EvRw7p99gis1jmxGWvF2MrUMIZ/Mw1rNSWeK7p2I9HTd5d0I
         pwOGrKytSCpojm6KyL8hDW0Sn3bXjYCePzrzkTq/CXBEkE8SxrXk9DpcrmqfFfM/MFU1
         vF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555623; x=1752160423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=a2x7EqAVt2pxp08j4qwtGQiEslEp3+9mrA0u8fNomdwTdcV0LtCIepBFbPB1aYVr0w
         fOMGfQZm9I076N8/dhNCXNX8DrF6wegvzA5kTSQfNzoIXkRHHNzIV4LuzWJTCwa3Gp2c
         NjoOtUHfl1isfNncG3vFGooLt2iYtKoIai2R4BBGtHkuegpiNpwiFqF8kyB4tH+CIzoV
         iGjtC2E2nU5INW7d3w1jvfFqHPpBa9Ayk5gjZa6mVN/N0lTRyGN4hQOwF9xVD7N2uieh
         HHBlZEp8tYAO/LSRzBXzk2BgHfcpUJIEUCHsVvR34dlAcHuWMzfyP8NQvnd17281lk3n
         Edfw==
X-Forwarded-Encrypted: i=1; AJvYcCU56bVwMdcEoxagIwrLGdnew9tmv1MER19aBgExcL2+7hAkLyH3Wp/kqB2P39fYztePf4L3bCbWT/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNo6Z8euHLl3a8iH3w6GKcM6toSr5CuZEwSMiHskyELOKDoqV
	pDSG9tAsclUuBHwQ6tg1k0C4LfKPSwhIC2PwUKmpw0UtLK20iunT+xpNZ4s1ZEhfbS8=
X-Gm-Gg: ASbGncva0VfwgMCSQ+kAeM7qdvgleroil4QUYrnAX5BfWyKiBXwU8HMy/yJMixi/qPO
	zRWcp9Vb9E6sU8tRMth9GY1dVkjhDetIXz0NFKvuK0qXzfoNDpNW3zGoVYaUs2RDUSI1gn2ixmn
	nQZo+bKzp6R0bnRrmlJbwR+9XBGebUK3Lfm03iOVzWS1TZ9GXau0T3Sm0OOASRJyxeQbyTZhUI7
	7PA1+S9mSsdQIg7mMYy8NoxuNvkW6ml96hbkO7yhbVMMWObFHW+zzVI93+XwESywdRK+w1arXj7
	VJVSNknVW0eYPqq9VLBCtREXHl5ldl+EFLpbS5d36+xVXrScx6gSF6qR9nefIHtVydqJfQ==
X-Google-Smtp-Source: AGHT+IHLbeEWvDtZyLpkZYq9v/9MjHWg44ua068Wk7HOmNac3d6CS9uj1wvGNiv38jkJSQ0CP6C9+w==
X-Received: by 2002:a05:6402:22ca:b0:60c:39e4:93e6 with SMTP id 4fb4d7f45d1cf-60e52d1939cmr4886568a12.24.1751555623170;
        Thu, 03 Jul 2025 08:13:43 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1845sm10903471a12.23.2025.07.03.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:13:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Message-ID: <aGaeJIjFMLcV8ly1@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>

On 25-07-03 11:40:20, Peng Fan wrote:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
> 
> Add clock index for the two CSRs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-display-csr
>            - nxp,imx95-hsio-blk-ctl
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */

/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
