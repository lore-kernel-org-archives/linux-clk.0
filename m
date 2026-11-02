Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625671;
	b=ZhRPunZyu44nUMcAB/MlZV6aatj5LS6jg3M0mp5KQWNvWP3kDjwc1jUbI2byFnkP48AX
	 GaAurMnzkB3Ap24dJMit1YZqsStTD25f3+G5zniwZVaCGrWrdLFNlgSiO9hf9sVpwm5Jh
	 dTnLp7QMqLw4XE8PdaHmzl3hBCUnMGvXP9fl95BLn9pwetlwb28qA3G4e40dMejRNgyUa
	 lJeRmvl4f1VSR0CxcNZCwtcek/kgGT2vd5RqZpxxtRZp/SoCPg31cd9PiSiSKY9AshlRE
	 t1cobEoHsAlTC9Kk9XG45TxW65uydXGguPekD21/WfzaEDm+J1tt3pPGqNR+fQ806mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yBNKQ6zWjtR64RQZ+Ex2Yv8w9cs8OFNZEHPb0SbROj4=;
	b=AYJ4ecHHnAUw0XTS5HS1wWpB1cMRYqfI9AOgzdFOYcX8VrQ8wS3TWpnjS9MsgqCSp2EK
	 QuxI3zpIAmLXysWq+ILy3i7Nmznuj9kDmpSlxEYZX7jODTj4CCS7+RqN9wyLOeTHg8gIm
	 ywDRWvAr60wzRxTKicriVrKVRDg56lyqQYVqJmoUs6BvmVydxKiQrle+zWOUiAVRH41wC
	 k930tekBxj5SoqO1MtpMN81Z5oceVJzrCAWtXy46V3BYwiD8wt1uEM2COEDrMkcVvBBdZ
	 pT+bT9cCl0RLLTJtrOEF1uKCv309FhcBUsV5JCBmJjWxFS5TAQTij1WzSIS0jXo8tSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XnbcgSOr;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C20606A329
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 13:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C20606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XnbcgSOr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1640282f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625669; x=1794230469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBNKQ6zWjtR64RQZ+Ex2Yv8w9cs8OFNZEHPb0SbROj4=;
        b=XnbcgSOrdb8bGCdSCamMDcguZxzc06vIkj5O+OJeGdHd7rDPcfJ5J2RTe0qk69oOow
         U5FSU25nUe5defx44vHZ3vejWc+2fKSSKk9BxW450mSEqY6wLd0Vj5WyIEgdYXSt04Oe
         FKkZs3n6wrafvB8yE7YBw9RRoxvGfY4aiFkGfJJFYSbcIDMsB5t6+6/CBBzqsn2Qofet
         2P+y8xg9P/oMipnWIuq0ExZkb0fbPeYSa7I2hB1wyyCtPNO6wMKJsbPSGQdRxwu63Iwv
         0HIDW2Lf2OykaH3XNy4M78MXadU31gjlp6jga1E0KsheW0TBMy2L6uDSolcf6yKvTszv
         HS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625669; x=1794230469;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBNKQ6zWjtR64RQZ+Ex2Yv8w9cs8OFNZEHPb0SbROj4=;
        b=imalnLmhgApjD/A+mMlbB2GsG0fY8825JPhWI1pNlFdmh5ZhKAYsDjmWQFIcPUqYd8
         P1UkyufeMkZGl2DYUh4N7hSKOeIksheJ7rbPCa2kleo1K9mkRU1FscW6qYkIKzw2v7yy
         N6wLkSTFtBcwd5AwAWOGD7/5nz2qiUacYUgMxCtyWwDxFOc2evEso427nMKKAAaWxvtu
         BGsgMa+qlgbgQOh0IVRRQzEMGlfvk05PaGu20Bj4WnDsEqHfvWGIk8Ay4tsBSIT75ilj
         BlIjrJ+hx4x9OlB7bXyBVYiTPohTaQzlxjMOm2i3IxW59vQ4QJKZcFZU+/+RjEo9trAN
         u+5A==
X-Forwarded-Encrypted: i=1; AKwUvBxSutBdLHaJ5AydGeRRbFM5iFrTsKg/7vcD3E7kK8gdRfMGx7FYVW8uTcewe8MQIwEtyyouyNy6u0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ze/BTZIPQ5Z8cJgnZDIuQG1/zjC/oMyYb0w1zZH+3c0pCwLeH
	4vrXUzudsrCrCKoQM0zJn+0nq5s0EnN8bae/x4kmDFzOi8md+arV23oNypqYTCh22Ic=
X-Gm-Gg: AYBFou2SK88kmhcda5Ooe2QXHi6AIckFQNwEVVLwdLXRV5hycPOZSy4aKAZ2LeLYc1O
	WyB62tPBgLtTShW7MK8CiVMmNM6qJtT+3nJmamWIIvKJ6RhNZ/tT0/Lmjbu16VADVNJQonO8e2t
	+qEAbTwVTsHlL04D/ODDLVVFpacfRo3mTeHgDibN2Iq+XRg0ASV0nbSYKO0yKPsBeG6Q++UJfm0
	nzTz926X0Uh5ikot3WIwvMQ+tszUMv9VXq0E+MgsS9DeDwzoqeLDdE02jwLkDRumQt3ZVvdsq+p
	DD7VtFtf1XpKGLx66/mjjEpOKITriJMcwBMunuc5socAbx64lwVlDxcDtA7v5NxeC4yhO563C+B
	VpaYOawt68t0mcq1pzFenqBHF1jB7cUVPWXJyhcRe017o8c3xtzMkjf9kRAU4ZtTwq2es3eZMvX
	oAJINddFoEvzoMUnq8GomZoAx9rXDBI0y9bFcmlJNyfTViO8W+LOFLObcWLCVtxZQ/15mrjFyGx
	NzwDQV7psGbK/z/aHYl5EMO2BoF3U3fP0OANHsLEADsfZlF/d8VwvMvzRYS9kCJwRAEdYlyA//4
	3d0XywetznYB2Q4bbh7FAky2FOX3eROdYVKcpDLFPcoDCxxNzt5CGS95W3gosq86YYv/X0rdiz5
	d8omC6fOV1X70yv0KDETM6qShulU=
X-Received: by 2002:a5d:5e81:0:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-48e64cccf13mr32855668f8f.22.1793625668325;
        Mon, 02 Nov 2026 05:21:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm22312319f8f.7.2026.11.02.05.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:07 -0800 (PST)
Message-ID: <21769646-2e3b-4c45-9798-ea6ad9f4ea0b@linaro.org>
Date: Mon, 2 Nov 2026 14:21:06 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/5] drm/panel: add Novatek NT36850 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-2-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261019-sdm845-hdk-v5-2-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 11:18, Dmitry Baryshkov wrote:
> Add support for the Truly WQHD dual-DSI command mode panel built around
> the Novatek NT36850, found on the display card for the Qualcomm SDM845
> and SM8150 HDK. The driver is based on panel-novatek-nt36523, the power
> and command sequences follow the vendor device tree.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  10 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-novatek-nt36850.c | 350 ++++++++++++++++++++++++++
>   3 files changed, 361 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 53a1fc2913fe..869a5501e709 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -723,6 +723,16 @@ config DRM_PANEL_NOVATEK_NT36672E
>   	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
>   	  RGB per pixel.
>   
> +config DRM_PANEL_NOVATEK_NT36850
> +	tristate "Novatek NT36850 panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Novatek NT36850 display controller, such as some
> +	  Truly panels used in Qualcomm development kits.
> +
>   config DRM_PANEL_NOVATEK_NT37700F
>   	tristate "Novatek NT37700F DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f2c9c80a218f..8dd8eb7080cb 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36532) += panel-novatek-nt36532.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36536) += panel-novatek-nt36536.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36850) += panel-novatek-nt36850.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36850.c b/drivers/gpu/drm/panel/panel-novatek-nt36850.c
> new file mode 100644
> index 000000000000..0d1eeba539db
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36850.c
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Novatek NT36850 DriverIC panels driver
> + *
> + * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct panel_info {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi[2];
> +	const struct panel_desc *desc;
> +	enum drm_panel_orientation orientation;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator *vddio;
> +	struct regulator *avdd;
> +	struct regulator *avee;
> +};
> +
> +struct panel_desc {
> +	unsigned int bpc;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +
> +	const struct drm_display_mode *mode;
> +	int (*init_sequence)(struct panel_info *pinfo);
> +
> +	bool is_dual_dsi;
> +};
> +
> +static inline struct panel_info *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct panel_info, panel);
> +}
> +
> +static int truly_wqhd_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
> +	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
> +
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
> +					  MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi, &dsi_ctx, dsi0, dsi1,
> +		      MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi, &dsi_ctx, dsi0, dsi1,
> +		      1000);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
> +					  MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +					  0xff);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
> +					  MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +					  0x2c);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
> +					  MIPI_DCS_WRITE_POWER_SAVE, 0x01);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1,
> +					  MIPI_DCS_EXIT_INVERT_MODE);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x10);
> +	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi, &dsi_ctx, dsi0, dsi1);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi, &dsi_ctx, dsi0, dsi1);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct drm_display_mode truly_wqhd_mode = {
> +	.clock = (720 + 120 + 20 + 140) * 2 * (2560 + 8 + 4 + 20) * 60 / 1000,
> +	.hdisplay = 720 * 2,
> +	.hsync_start = (720 + 120) * 2,
> +	.hsync_end = (720 + 120 + 20) * 2,
> +	.htotal = (720 + 120 + 20 + 140) * 2,
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 8,
> +	.vsync_end = 2560 + 8 + 4,
> +	.vtotal = 2560 + 8 + 4 + 20,
> +};
> +
> +static const struct panel_desc truly_wqhd_desc = {
> +	.mode = &truly_wqhd_mode,
> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.init_sequence = truly_wqhd_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +
> +static void nt36850_reset(struct panel_info *pinfo)
> +{
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	msleep(50);
> +}
> +
> +static int nt36850_prepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int ret;
> +
> +	ret = regulator_enable(pinfo->vddio);
> +	if (ret) {
> +		dev_err(panel->dev, "failed to enable vddio regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	ret = regulator_enable(pinfo->avdd);
> +	if (ret) {
> +		dev_err(panel->dev, "failed to enable avdd regulator: %d\n", ret);
> +		goto err_vddio;
> +	}
> +
> +	ret = regulator_enable(pinfo->avee);
> +	if (ret) {
> +		dev_err(panel->dev, "failed to enable avee regulator: %d\n", ret);
> +		goto err_avdd;
> +	}
> +
> +	msleep(20);
> +
> +	nt36850_reset(pinfo);
> +
> +	ret = pinfo->desc->init_sequence(pinfo);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
> +		goto err_avee;
> +	}
> +
> +	return 0;
> +
> +err_avee:
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	regulator_disable(pinfo->avee);
> +err_avdd:
> +	regulator_disable(pinfo->avdd);
> +err_vddio:
> +	regulator_disable(pinfo->vddio);
> +
> +	return ret;
> +}
> +
> +static int nt36850_num_dsi_hosts(struct panel_info *pinfo)
> +{
> +	return pinfo->desc->is_dual_dsi ? 2 : 1;
> +}
> +
> +static int nt36850_disable(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { };
> +	int i;
> +
> +	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++)
> +		pinfo->dsi[i]->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++) {
> +		dsi_ctx.dsi = pinfo->dsi[i];
> +
> +		mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	}
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++) {
> +		dsi_ctx.dsi = pinfo->dsi[i];
> +
> +		mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	}
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++)
> +		pinfo->dsi[i]->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt36850_unprepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	regulator_disable(pinfo->avee);
> +	regulator_disable(pinfo->avdd);
> +	regulator_disable(pinfo->vddio);
> +
> +	return 0;
> +}
> +
> +static int nt36850_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	connector->display_info.bpc = pinfo->desc->bpc;
> +
> +	return drm_connector_helper_get_modes_fixed(connector, pinfo->desc->mode);
> +}
> +
> +static enum drm_panel_orientation nt36850_get_orientation(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	return pinfo->orientation;
> +}
> +
> +static const struct drm_panel_funcs nt36850_panel_funcs = {
> +	.disable = nt36850_disable,
> +	.prepare = nt36850_prepare,
> +	.unprepare = nt36850_unprepare,
> +	.get_modes = nt36850_get_modes,
> +	.get_orientation = nt36850_get_orientation,
> +};
> +
> +static int nt36850_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct device_node *dsi1;
> +	struct mipi_dsi_host *dsi1_host;
> +	struct panel_info *pinfo;
> +	int i, ret;
> +
> +	pinfo = devm_drm_panel_alloc(dev, struct panel_info, panel,
> +				     &nt36850_panel_funcs,
> +				     DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(pinfo))
> +		return PTR_ERR(pinfo);
> +
> +	pinfo->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(pinfo->vddio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->vddio), "failed to get vddio regulator\n");
> +
> +	pinfo->avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(pinfo->avdd))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->avdd), "failed to get avdd regulator\n");
> +
> +	pinfo->avee = devm_regulator_get(dev, "avee");
> +	if (IS_ERR(pinfo->avee))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->avee), "failed to get avee regulator\n");
> +
> +	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pinfo->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
> +
> +	pinfo->desc = of_device_get_match_data(dev);
> +	if (!pinfo->desc)
> +		return -ENODEV;
> +
> +	/* If the panel is dual dsi, register DSI1 */
> +	if (pinfo->desc->is_dual_dsi) {
> +		struct mipi_dsi_device_info dsi_info = {
> +			.type = "dsi-secondary",
> +		};
> +
> +		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +		if (!dsi1) {
> +			dev_err(dev, "cannot get secondary DSI node.\n");
> +			return -ENODEV;
> +		}
> +
> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> +		of_node_put(dsi1);
> +		if (!dsi1_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
> +
> +		pinfo->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, &dsi_info);
> +		if (IS_ERR(pinfo->dsi[1])) {
> +			dev_err(dev, "cannot get secondary DSI device\n");
> +			return PTR_ERR(pinfo->dsi[1]);
> +		}
> +	}
> +
> +	pinfo->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, pinfo);
> +
> +	ret = drm_of_get_panel_orientation(dev->of_node, &pinfo->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
> +	pinfo->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&pinfo->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	ret = devm_drm_panel_add(&dsi->dev, &pinfo->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't add the panel\n");
> +
> +	for (i = 0; i < nt36850_num_dsi_hosts(pinfo); i++) {
> +		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
> +		pinfo->dsi[i]->format = pinfo->desc->format;
> +		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
> +
> +		ret = devm_mipi_dsi_attach(dev, pinfo->dsi[i]);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nt36850_of_match[] = {
> +	{
> +		.compatible = "truly,wqhd60-nt36850",
> +		.data = &truly_wqhd_desc,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, nt36850_of_match);
> +
> +static struct mipi_dsi_driver nt36850_driver = {
> +	.probe = nt36850_probe,
> +	.driver = {
> +		.name = "panel-novatek-nt36850",
> +		.of_match_table = nt36850_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(nt36850_driver);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("DRM driver for Novatek NT36850 based MIPI DSI panels");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
