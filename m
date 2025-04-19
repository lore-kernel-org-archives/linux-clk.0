Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4E156C62
	for <linux-clk@vger.kernel.org>; Sat, 19 Apr 2025 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745089802; cv=none; b=K1TSY7I9qdey7tPLrXmJt+uzK/XGbEYv4hgIN/7EOSbRIUlZ4KqrINGgLp8VQaQUGQBg8bbUwJbaqo4aB6r9NhSfCmtDfv+9GQ4MVPaEDpi7uZuxbonyPQ++Kh71ZsYQutwGB2jVcdQZ2dCyO7jt65x45u3gbOMC6CxK8uS6Q/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745089802; c=relaxed/simple;
	bh=CvUo7ZEVGQkRI/Tl+PNYklXAI1DxJ6GpVsoi7Pb4tIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOcLI0aao3fQbjWziYX6Yspi3aTWbRmlTxE2tEBQszoMYDDfZLToHMdg03bUxDNbPMsU4HNYbgjduUe9Gl5DA8g2r+eUu22OnrWqn6OBy/5LahjKbcB0hL+hAG7c6GtDl4wqIC2M8A41b/vXiNjMJd5T5B7gWVkC5EGzyMYEhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=bdbKUuBD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="bdbKUuBD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73712952e1cso2675477b3a.1
        for <linux-clk@vger.kernel.org>; Sat, 19 Apr 2025 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745089800; x=1745694600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
        b=bdbKUuBDsSWg/MznC+jTbYpxXmuy4oUSs4iSTrcbgRCG4NsinWYtNdCxr+ngxIhcdX
         bYJ8y+x29GSBmxwXKWKIXqQ9V3M9yADuXD1BtBwUv97zqPdkECZltu8j5yigl08iAulx
         e2FcnqL50TZlZKOzRGws5bU5+bCj0E4ICwm+LbbqqS/K86K4JqXAWMk9HGGfrillQVTd
         2iqxQUoeQTlUBUyPToNFBUwSqe/ELiYJjgbjw1yqTjGaJfSv+A+UjhhFqkOUwkyS8ByO
         GvBQL0uHfkiTiNwlT5a8HrAMbQCIQtbekxyRA7P698XNAvC5VEaCG2WStVKTDrcy0Psi
         9nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745089800; x=1745694600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
        b=Dnza00oK6x/gBSgBWreIWOlnMAj7kbo7ZRbNNg9LaFwOCGn1oIfAgOifEcUHceoLnI
         WGgp/LX59utCJf1aONF9VGxLbFngwM4cK1ycyDpI2zODGuz/XhDlmtnELxZYrzER9F33
         20ekqOnYe1X7iRhTntwj2Q1wo34L3HHvOklxxhO+Sn+vN3hfB+XhS/pcFSYCEOPGYLIM
         lGw4IQES37+V4U/lR/EOdqR+PuJV2TXqYgO3di61pQewSrwwSvpidw6iywzT5BZyuAaX
         1DTJ9XTFxkKebDVbLHU9DzJr6/rKy0RNf2vXT9oMYYcwnsjIxs7MUH5UuF6nUJ8hTdBF
         BBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFS71n88G5s5arkuFfmiNZhdt+T4MTvj3W93jrrGQv9vxFz9Hw/NlPsbcj6rgOw1XLz3hxCzr6SgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLE+jR8Dbe0lSahvzsEe/Fp4I6lkoGfWBlmjqCGDVee0nHpl9P
	dzXPQLQcAP/GuQjYsyjEInMF/uh18Ogihx6NMhOpPr1jwUtu0iUIiXN+TFv+NpI=
X-Gm-Gg: ASbGncvjOjIrjf8/ohZHKaQNiJ5oJhZLYRZdvGHwPG6lkQOXZsWHLq4jiepzwXyYH2p
	xt6k9sMENNNlCGYAcFswwe123RQ9KYXDaAdXgY92zUWTaMH++qexT0CfcvnXrT5Hvh+E5gpviXI
	9P1q/UkMHEWxUXSWziGZUL00NjJ09iBlo8VCu/9HdR74j0j8IvLArGR4f90hhb2GZ25khi/v85O
	Jv9B4eozQmdhRqRn9e/u+k7HoGRew1A0xEESb1hXMKaGRRKQvHrv0wGnxiGywRZf8wBt34S0BDU
	g9hJBmqxC8zTDDf6yZy+OQh8/6KfWnySTygF1f8DZzChwlk=
X-Google-Smtp-Source: AGHT+IEulD0uH2vbpuR4f4ZA7Mcq0ByRrFg1az3eKDUNZKezFcapWJg4o30Tvo+Xd7BMD278/s2TCg==
X-Received: by 2002:a05:6a00:9281:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73dc1442ee6mr9314401b3a.2.1745089799961;
        Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7easm3611489b3a.84.2025.04.19.12.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Date: Sat, 19 Apr 2025 12:09:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
Message-ID: <aAP1BW3RmMb/Irya@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-21-m.wilczynski@samsung.com>

On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> of the power-up sequence.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 474f31576a1b..6b34aab4b455 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>

Are you okay if I omit this hunk? My thead-dt-for-next branch is based
on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
window.

>  
>  / {
>  	compatible = "thead,th1520";
> @@ -497,6 +498,12 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		rst: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset";
> +			reg = <0xff 0xef528000 0x0 0x4f>;
> +			#reset-cells = <1>;
> +		};
> +
>  		clk_vo: clock-controller@ffef528050 {
>  			compatible = "thead,th1520-clk-vo";
>  			reg = <0xff 0xef528050 0x0 0xfb0>;
> -- 
> 2.34.1
> 

With the above caveat:

Reviewed-by: Drew Fustini <drew@pdp7.com>


-Drew
