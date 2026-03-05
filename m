Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853D372B28
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701032; cv=none; b=hXhbLxTKTHbf5WoapTeCIwHrLrL4ngnOeF+qtNXvPSnakzY6Oe+yZ0+8/EIZvCsDUXMbA4zNyinWm+qwScpnfGNDXoj+xHjqA7keeXFLIpv39PjCCOIyKiSWONEPPokJ2HpMidt+eDF6XDBvsQFL2JrEp1150QdwoKU2nduluL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701032; c=relaxed/simple;
	bh=IhuoGE8oRqe1Ym/GsN164uTGYIIELvzj/f6GldWcJdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=slcO+g6vexyBVYq+IgSzQad63rNuyd9u8JdKqxPzCBiKesgvTUoMjhJRlImh75b7EYkdf0qwX9aiCrqlWL/RkRfoLKfuQujiUE7Hka5wWScgnzgGm/T7Pp5I/Rl/qAPLM2d8SsvyxxYSPoF1Ny51XYcLeX4FN/i6SvpHS4OVbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZvN0Twss; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZvN0Twss"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483abed83b6so65221635e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 00:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701028; x=1773305828; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=ZvN0Twssfi3ZjkzPInduLpGLbE5kc2hxqZf7F3+qWPGAyWfKpqAe/1iJvtES1qJ6Xz
         fjCYa/s/GVJgZxqGBr6wXlv9rxOkH7GU+il1bjzluZMTciQ/bSl6NntoD1tzOeJ7I4Fb
         fBwiYS3E8onwBWzz+16yDwcN37t8PuPwx778OuHpY39/eFahU6tywIhAlPv222N+AUX0
         dGHUz3OARjQMHNAk1qrx+Z/tTLbwpJH8Zu99DO7E66+AFRNPVz4FnjXVj05w/f5zBkKO
         amklZsxK8iRP6l9i6Mwls9AmURL2TNjMa8HFWkOsSFbwY0uEyTYwlYNlMVas/urHxUCW
         8WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701028; x=1773305828;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ocIav81eGlA8J7gguvP8abYVPg8GbAkn/vs4f2boCyo=;
        b=DUdFruUXMJaphsGfYfcMM48TAqYPNnN1/0KOzVtirkLKPU282jH1nN3w6lMjN6AO4V
         eG7C7epsmyPH8EGiPfWdeUqKTe8Lue/Jv4jn6G+wPTV+EePk1uh03GNVHUUp8DMJvtQ9
         1ocrpVYI7cZiUhYwCqkwks6TC4S3qOEX9mROlk8NL1lQ0TmLKac8PpeAPVCAd55U8Wfa
         Gk5zpoOAprOzYOwoefoeHYJCAKr4lxZgdlBYPXvpuViNP9eD2zzQeDZr9LP3+/ASpfgl
         DBhgfW5xjFx7NidnvvlhjIUxjDIXYu8ORzyhi7lpl+dcc0QU5AsuVkUVMr/E8xSp/kYK
         +OLw==
X-Forwarded-Encrypted: i=1; AJvYcCW+eCbvVomjJwkzGaTFesd/7xf0cPUZ2fbUGObxEj9TzpgXTMBWr7tAHFpk+RpCraTNibkpSmU/x/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnBhoUOYOYPkZ/W4kZEGE9st6I4cqN9wOst0HQ1bE6DTZ60I7
	u2UZ24xGt22gUvM2quhUl8PAN8joTwd4KDls6/l8ed7KWdmDY4h+DvuR8RHGyaa1JJY=
X-Gm-Gg: ATEYQzydq08+hk+2hcnZogANLsTBV+byU7IkumD+vx39jhC+AsKfr0KIq9x9j9TEV4o
	jMl2TzHwnyHTBbEQ6FPyUIXmz0lCUWsyL+XGTzEakmh4dNcsXyThcw+Qs2WV9mFFpUQsUVxnUP6
	h8+sU7rTzbRnQJMQsUYamrvgxZbQ/Gi3mhEffzI6wihY/IR077UyaaGfERHOo0ntWmrCX1d5p8M
	bW80fPDRm+imXRs6Q+wUMerF6z56IHjv4hUh2dHPyoNXGEoekRnbBexuLk5FDwfpELH6Vs9bbXq
	rZDVKQJoy8nGzMXrUgKKj2EcW7Rx0ROFXwtTLhyQM6V7k88GRQJC3zAgKhMWVu203gZDP2lKjtI
	XFIHgrp4Uogyt5LXfpYIZodjZ9AqU696I/4l6sXujxIQAoFsJxpV2xstibtCEOdDVkjoRz2NkOL
	O4KO/d8KwINdJs+FCP/0HP
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48519874e2amr76440305e9.20.1772701028139;
        Thu, 05 Mar 2026 00:57:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439b485a0b6sm32442608f8f.39.2026.03.05.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:57:07 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
In-Reply-To: <20260305074328.639993-2-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:25 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-2-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 09:57:06 +0100
Message-ID: <1ja4wmbqn1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> Fix a typo for T7 gp1 pll.

Patch title is too vague

Credit is due to Ronald for finding and reporting the issue initially.
This can be viewed as a clean of his original patch so the change should
have his Signed-off-by IMO.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..b488d92b7984 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -72,7 +72,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll
>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll

-- 
Jerome
