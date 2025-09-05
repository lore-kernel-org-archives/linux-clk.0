Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD52FD7DE
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059453; cv=none; b=eoeeXhI1iZE95p484IXMA2RUSBCfh3Y4dJqlajPHeUwer7QWdOxX4WElIcvQReITR8uj7/l8MgL1AwCiYDYNW+pH8t2/3xBpP0LS7ljaULtL37F9D9YFrcSzUw48OyBqg7TpkEMRKK3gUnCwkzXuRNll8G2RqRsoW76ANxWSpj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059453; c=relaxed/simple;
	bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npTJng+uMB0TlBr69f2mR5NWWExlM9xuNOXGng86rFu/9LPNh3r7yj30tmfxtmL88ZD+juSv/GB4/EG/E8NhL/D074vUdtkIedujGvbwT0TfGHgrxppyPs3i0ZSOl8rZhn2084Sh3GtKejcpuNPvT+vZDrZzF2XQfBHX6pnORfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bGzL0syZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bGzL0syZ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336bbcebca9so14384141fa.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Sep 2025 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059449; x=1757664249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=bGzL0syZP9Tuw2/0AtF/bmdxZuSWwd+gXiqLXNd/9xOGMYNV9rMpUzhjtCVFNo2ZY3
         l78vFVU1pG0AWRrg7iWPp+lGTzRO+dzfsweZ5ZBqPaCH8FYiXGO26yAh+lzo2QBqvwa0
         ykCa59A+0TRJc6P+jYJO2uEWqA4ApH+alnp2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059449; x=1757664249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=GlOTFqymeZRoDvdr9oRhNGR/SglTKgrGO310PZylPq1HbmKzCUP/woJmLQAMNqfKF+
         4NRxb19GJRyGLZ0kRODGS+uDYhEhPB4vH3MN6sa+Ri6+ZzW6Ot3g6wO13nm6U0JTEqeG
         cHJFCwxFCUSt/ebN4QrQpXBOQqToLkODwKf9KVFzAdO/OFcOJjT55qW7Do91HlswQHjB
         +Hg1dTX1+IIGiolbx4+EdzLx/f9YXHidhc7DdsF+CWyyV/mG7MS/P+PudhTu8vz0iNYG
         QGpOtjovhLELq/giJEuXq8qIP69E6Z34lqouAPG0ouqULmJB72p+YoodkPmSO9vm61hn
         ZW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOZVjjI/O2qbC8kRBP4jBzqFZFVrIrKeChHYHRFmwjEWQUACBr8Lg0qZL9Z+7lQqRJiNMMo8cbInU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFd6B7NqUTZe5CeOGrZ+6XY8IKorBm2PW190KCahyUWRyljTvo
	j8qekkEsdiKNW/PyAZZMV43clwp+O8EHk+bh1u8PJp8oHqjoGsAI5UcuBQtJm0NzZjpaGZ7X7hF
	V7bLwHaILySU3ekDibxhaKxicfLquAkyeWhH8FKqo
X-Gm-Gg: ASbGnctKbSUU0BdV9PpcLmoRjN16Yr5SnU6RRHmkr8i5tsdSgp7kwNXfeLu052jZ50j
	kgvHpBuE6kW3GjrcmtzY6bNQXis64046ZzSjWyC+tb+dpibQaDq1rj96WDr8/08m2GQ5unpmV2k
	B5FJmyn63u/fm67WYNFBliqPOOsixLUEsIGrQQ4oM9pbxJAN7TcH0YF8G8vfuZwnSQ7Z2c8Ntku
	fVv68JrvVTMs56z0Rs8yZZQnV3VYrF3kYuUjg==
X-Google-Smtp-Source: AGHT+IHT043Y/TruREpGKZ+/QRl4lPJ5bvgN3xV40J/rToLhwUaxJ8c7vgtH50x+X4YlPrhw0jN/shKQPrGCvcazPsI=
X-Received: by 2002:a05:651c:1a0c:b0:339:1b58:b199 with SMTP id
 38308e7fff4ca-3391b58bbc2mr3260661fa.36.1757059449029; Fri, 05 Sep 2025
 01:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-23-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-23-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:03:58 +0800
X-Gm-Features: Ac12FXzqjLPg1snoakkIHpjZL3gjVDvpLkfu1BDJJWXmMZBGn3rIna_U1tSPpG8
Message-ID: <CAGXv+5GreKJSz76EiHYzX-ByfyxuYNYB6OyBJk9ZhsKCapPjRA@mail.gmail.com>
Subject: Re: [PATCH v5 22/27] clk: mediatek: Add MT8196 disp1 clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 disp1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp1 clock driver via
> platform_device_register_data().
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val
