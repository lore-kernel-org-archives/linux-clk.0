Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED10346A15
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438401; cv=none; b=HyGjLAX5OlYxEc5FUmrPhm7aIt1o/9xTR7jHcSp1/+Cxpd/hJNyH+suB8c9TUDISWQ9Buaf3CYmB65gH+xpRjMW6CCzu0oDrzJ3rYqNMx1aDwgN5M/4+5gaezpPV3S4POob8Ir3d3ndis6yk8AfDMkldw6B5B9RPD9gFn2ohvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438401; c=relaxed/simple;
	bh=zDjBvHqPxX/UNO4JPLX6sFcO2RcmeEiXEdVvkfXFKEk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FYrbkre3XTj1GS0cPXQS/9ubEoHOksUzGj4McLUdDw6aa0IVF1an2VNoKzX96NStTlKDcKUu3C7AW8/MSo+UnX8e9CwodrU9IEBP27fcuMdgPdjx+gMxm8ZnHD5EazPfntxVwTPzssSt0m4qciQATKyPc5/DEcKHZ37QuotwMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sYMocTki; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sYMocTki"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so1126155e9.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771438398; x=1772043198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIekHAkyURnbY7ZGcdPvi5VEj7cPbPYtWFDuUCFEzTw=;
        b=sYMocTkiR7XecJWB9AoMW1aW0GXtNmuDYv6MXsVVHGJU2ulnPtueEYUoBxD92JAvto
         SZCO04eYTqDry4gKSAZy2uvXnmfIQyTNf9gOpESE27gqKtzQSRBZLZUVtSJ6s1DlYZ4m
         PNMD4hviMvQaN/Xx7tAzfCrPbRtE542aF605ISjd1MURe6PAk5FscAH1Bha3clMf5951
         Jv3tL23ML/fxJWI9yeiqtXo/KeFZITQCoeumCJPbOeISl0OmervVQGwL+/ZlI5x8jqMA
         2Mtwx++PztFjUB/o90nG3wA4G6b8SXOpdtkx3ucJiljfFOHqMa9mOhuJnM/+MCr6N5YB
         07PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438398; x=1772043198;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIekHAkyURnbY7ZGcdPvi5VEj7cPbPYtWFDuUCFEzTw=;
        b=YPcWw7HQXlP70rwsQwzTXLhkIicNPrfX4vdfMcbjUhEn0P0uLXZb7ecSsjnlYEZJ8Y
         nUFcLDgWfMHEVCkCSGa27Dewv0mO2FQgLnF2tvFMVoF/wdDkuvIpORhfof3pgXi1Y5iA
         s9O6lJrsEjcHTajpmZsR/gFdRzSnkkcEXHi/+voGICh1Jt53bEvul/2SDLBtVqHIjLya
         f4UBUBoEsWpn2wrtGBkw5bcuC0M6yo5bjYtiQAD9fU5m7QCvE2YjTNv0x/TL8YIjNCZH
         wywdmwTYiggWCuUXTRNe/s3tX7ge/BMTaJbQTYyAlRIasa0oQjZBDArAMpOxhimNodsj
         BF7w==
X-Forwarded-Encrypted: i=1; AJvYcCVcKEUoTbBAB2BLkXlvpW5FiMWUX1PIOLqx37ZtIqXeM15etFK8UGq7jeHMVv7ojLnePsoQC8XfX3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmxg62tHGwXLXzTwuzzYmx5uNjtP8gm4Bt5ggCsxrlKQItpvk
	4tBiK7jQ4I3IUjKACXjSHNOs03AlJ3W+KrlvmyT6xwXC1H33ivws95UHjQGV8ogv7lk=
X-Gm-Gg: AZuq6aJYpf3yBpNxzRfixAIeu4SxYUNt6DpbeWVrO2+Y54pSnMUZRM8trvPRw95LGPs
	lazSFB7psIuKf/EaMEa7H2wLqyza5qaSfMbg9iu6WGTEwi+iXux62I97twOtosmcbvdAgVmrKkS
	DtbieZJRoDg9i68NY+ciIjXjK14oHej4jgoH1vf6rXwXNqbsG8u82lVn2zYHNrfAJkyeijGGQXk
	aCPhdl7a+fDgVWmD3D2IxgpCSaVDsZjH1tL6J32I08Jy+irMVP9QVbJtiyTtUwnrafG1ADuDa4B
	NCxoUDJUacNCxwE44gjmWDzS/91UhC5BVyPEzX69pEdmxqE0LxaYnEACpsKP+K+VUD2JPI7o2Pf
	TwNUrhX6bhyelMaj5NZ9TWsnM9JONAhQtPG0BgfgHvKToHaiylM/6Ce849uezLUqDMgHzy1l/Iw
	9O0O+vzXEvOaU4jGrISxu0kg==
X-Received: by 2002:a05:600c:6215:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-48398ae8e6cmr48823635e9.27.1771438397601;
        Wed, 18 Feb 2026 10:13:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4837b68e5adsm416187875e9.9.2026.02.18.10.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:13:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <20260218105709.36253-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:57:07 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105709.36253-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:13:15 +0100
Message-ID: <1jpl616htw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 18 f=C3=A9vr. 2026 at 11:57, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add PLL for the clock controller of the Amlogic T7 SoC family.

Assuming the 3 first patch are actually needed (I don't think they are)
I think patch 2 and 3 should be squashed together

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.=
yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..6a1598e6c359 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -23,6 +23,7 @@ properties:
>        - amlogic,t7-mpll
>        - amlogic,t7-hdmi-pll
>        - amlogic,t7-mclk-pll
> +      - amlogic,t7-fpll
>=20=20
>    reg:
>      maxItems: 1
> @@ -42,6 +43,7 @@ properties:
>        - const: in0
>        - const: in1
>        - const: in2
> +      - const: xtal

Fishy. Maybe it will get more clear with a more detailed commit description

>      minItems: 1
>=20=20
>  required:
> @@ -72,11 +74,12 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll

Indeed that's not good ! but you need specific patch for this, and Fixes
tag. You can send this separately.

>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll
>                - amlogic,t7-hdmi-pll
> +              - amlogic,t7-fpll
>=20=20
>      then:
>        properties:

--=20
Jerome
