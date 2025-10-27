Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6F2EF660
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559229; cv=none; b=o8kBgs/CRv0bpXIELkqwH+RJaFNGRumHUWDkfeZLy5Oamaxf3Y58I0GIxNigEWdwsc55FJrkBLWK1hKupOSgVhI6020/HfOS+/Loh7GK+eM/mU7dGux4bRUJgVUC0TSBzsZIUzp/Ew+oGavmXGazPqy67WWU06fruxSK7TRjlI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559229; c=relaxed/simple;
	bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkiAeosRfm/RvOIQLZcnJ6dB9g/SlQM+wZyjd2STL0ZSPr8y4uyuQ/AayWo/7eA83N+svZlr2L7k4Y3ABYglnOKcKWRRUYUEiwXeO05uGAwHBtpiGJlks7aNPF9Vo9w47liJ6FFR9P2QzBhB1JAEUhIsNr8zKz8V87gRHbcCgas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqNkvpuJ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqNkvpuJ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce806af3eso4061703a12.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559227; x=1762164027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=BqNkvpuJxdLFFaYQmH6TFx2FCGfBO5dYTF27G1SnJK+kZOD3xPEY+kn1E9UrVkf25g
         zkawesYiDwVSXoFYjTeE77r/8zObUTIRlzXL7I7x3RpZAQmCJsGfvZHw5E0vXocKVcyx
         qa7vHdSpwKSv+QjfiXm/kKdWU7rLhXRza5V9xNeEBz0mNKF65ObfuLGrUHDL8ePslbzR
         Uk1eaVlqxFoH6Lq1DJVUd0EDiEk8KFT4xIPDOV1QpJI4Ol5kw3qZzxtuyTMD5NCWZ2aD
         M23eFzYXu92ymZdM4P86C8lXJt6ha8Un5PRq8uEbBwg7ShdTZ+5T6vwFaENWI1YBiMLm
         7Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559227; x=1762164027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=qK6Nax/CIugHLzXUFrZhgS0oaNLZ9lAFKPNprRRdZpyei4PErqWdXI8ZAWC25ji7hu
         aAngQx6A69TvDhS/Bg6KFbrJV5bgXVKR1MbfSrBDa9tuwtjJQBaUq/CQW5zH1km67UrI
         xEWfIdaxFwCIkhlqWyv5J0vo8QPeG6ugo8zZNb+bSjDZtBUgYKAg3n63l2yml02ds0/y
         uTiiJUpdyM6lLS6hcSmj95UImI++hWED0lr+eOVCxfNx+bNHOvzrtO3AZDqWki+GiAoU
         NfsFr3CS4okNMwYjTL4O0N3gHlwO0vZeS5ZjvFLM7yRAi+iAB1yYRUb6nfdkU7dzFluT
         tGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGmkqqcjk+vx64dwU29vvczyqsGV72P11YFv7hYJHEeTMubhb5GhMo9iT+1BROS/8wOY68lYIU9C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIgfyLM+xcJ4HKO9GyIzrXQLMclZeaYKeTuMXnHd6EEaL8IFjB
	srEqshBvuhsHrn/vDjKZWvN4b7MfnmPWEoM/mGYvhGgNKyuXiHK5D2uRzfliS3J9ZL/GZ83YZj4
	RdC1hUPsvtRR5BM3N3VvIyaIHZH62cIE=
X-Gm-Gg: ASbGnctQXLc7SC22bIZRJPMkTSueKhc4ImZbSRcHyTyxsHbPsWpzfDjOc1qWV2Q/uKV
	I5XHIxDbazIHGIpsHnpwL5DVwGil3KNCdiZVMgXbF+IGIm5KbAjIeFidvGIiIf3VxQB7fA0pp/W
	oqlawhKzxD2cQxlHb6Fzx6QolV9Tv6WIwEu6CviPtJV/q1nYq/lHY3OyHNmyBIxFQ2ey/zMsHEp
	1Un7kJKFCWbN3pgTCZ1rbC5pMdL/V46+R/a3Gg4vSSz2b2ry59JvIxJ6QEaNNXliwwdsbYn0W02
	CzkXaOJktr53VccPNZ/sdFdx+bm1MemRHQY=
X-Google-Smtp-Source: AGHT+IEVKeBh2X8nn5edN2JNYH0ip6RRsXlkactmrlxMJ24ltADBqpxEPIq5x0ftvH+xeOzwVb5LwOMRmctLYx+ASlY=
X-Received: by 2002:a17:903:18d:b0:269:b2ff:5c0e with SMTP id
 d9443c01a7336-2948ba5aac4mr144470455ad.46.1761559225678; Mon, 27 Oct 2025
 03:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-5-laurentiumihalcea111@gmail.com> <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:02:50 +0200
X-Gm-Features: AWmQ_bnztc34-LVMElYU3hA5bxPnJsvEFVV1IWI00q3s-IiPzNkbThRFF6roaYA
Message-ID: <CAEnQRZBFCi9GPaAw+NdKboADSpzPKGL-1B3WNh1M4Nuxd_9rqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 5:47=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:21AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > The macros defining the mask values for the EARC, EARC PHY resets,
> > and the DSP RUN_STALL signal can be dropped as they are not and will
> > not be used anywhere else except to set the value of the "mask" field
> > from "struct imx8mp_reset_map". In this particular case, based on the
> > name of the "mask" field, you can already deduce what these values are
> > for, which is why defining macros for them doesn't offer any new
> > information, nor does it help with the code readability.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
>
> Register define still prefer use macro.
>
> So far const string, hexvalue prefer use value if only use once.

This is simple enough that we can use the BIT() macro directly to express
the masks.

As you said you can use the const value (including BIT()) when the value is=
 used
only once as it is this case.

So I think this patch is fine:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
