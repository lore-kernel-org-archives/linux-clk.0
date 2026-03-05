Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F23264EC
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701418; cv=none; b=jvk1gqh/r9rh1av7JG2TXVQsuZw3oaXquS3LHgtYvxju7/WxaF8Uev5yTKupu0Hx7iGixxScJzF++Lv88bczUvVR9c7ZlNd87zdc5Jo9OXNrfyrixOePdWHOkGjhCionRih1aC7LYkJI26ZFSho07m0MkktGUvMKFrEmMQlquLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701418; c=relaxed/simple;
	bh=kxnI1kq3blq/G6aSx3FDq3CCB9uCXKLhW/uT2AuKJOA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gqzto7p2YP3zRBSb7fpTiuBQagF/Xq7HvYwFPTtVJktNQZaTCjpgkyBy2rVZaQpYXE7CUEtUN2ljnTnFQqNRDlexnBoF2bs2e0Yn8nIKDmtYbs1ZYn2Z1n+f+iIMIUETgxn3dBAflKhh0IxQVaeESr4p+RswflApU99Jl8h4j1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3UhppmL1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3UhppmL1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so3717036f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701415; x=1773306215; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=3UhppmL1ubtCdtjhllLgzD5hrVfzI2bvNG7OP6VbqCcyQOzOzZLZEOVOl6oDDnNCnW
         cOUgZyfp4vzXkrdPXgnXvlnoxyiDo4oINv9KG5Cc5CNepWf4B1SIs9O6rgC0VC5HVyUr
         0kwgSI/aGFmJ0tcpXxKAMAlrjRNA//plBNi+c/HlfS1E/Eo1nx0jHqpaMBL2DfG1Tog/
         Uy6f7dj2v3chQ0MegY5Sp94hdyWoAKJ8HR5h5wEmhavkKn5TX5bTV0c5yvrsrh45Lbvb
         EPOZU0JxGIvCuNJ7YKSMGhuEzpBZlEiQ8caA7jdVDVWdoA/GouPBxdJqW/TIVOLXAeo5
         mYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701415; x=1773306215;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=uZNGDu+VhCH/eEbmG8FmURUZd80g4xKHM05VX/rdE+C22R/HPnxkBIEpoE69jGeH69
         k1orHpcj5qlNi8gD9vfQfqxj4+20Q8+ElDtUzq228H/4rqf72UWG2erAHkITWN2U9idV
         fGrngby7hXu13AYj3+YCWfXAJ0j+yVEEUs2aNIEZkBdjVE1Ge/vhF+eJla1sw9p1yInc
         8NWdPm3aKNyo+EG5b3org6rhGxQ9rzmz2YwGadS13vTKAYpcRXSH176mSk/8ee8Bi3CL
         K/3jsCNhD9235wxtXxvlHm8GQXL5tf36LVJUaH+7ocSeFAN6YVj7f0UH0yNi3TrCnT47
         f4+w==
X-Forwarded-Encrypted: i=1; AJvYcCX3d7NLrNVoagUVkTZmdFgEG4DIUzwzYkHNDeaRlNOrIw7xQuVVGjK4qOVMoXiirWsyEaYozQaJVeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/5cw93ADVdpm1czyM5+ylllsTAIxWl2PDa6EN1wFmDC9hDnN
	AZVbBGf40ra+QbJEAXxQahqqH9U6ij5ntoWvRal+Q/1bC7LbG/mptU3n0arIJfRL8jU=
X-Gm-Gg: ATEYQzw1YhvtZEXutWi8uASG3mGsILuZrh0VE2aHL5tcuHFYR2sFM3BlaJKhdLuL48O
	BDkoj+2qBtNLuTAtLCXTxoACel7iBEXbUsTa4sGv3WhPDH2RUbcTyNVzlEoQKKPh17Egn6i+/u7
	4J36TohiVAcFeikvlCW2f3wZIv9PLvaIiMmV0PGJ95Ke/8nl4GF7CzCI9o0y6s27cRc1pLN0xTa
	qKEbFt/4xv4emGeqKr9S5Qy5/SWl4iMDd6CuNIdLht8viPsebLzXgkQ3rittNPykQMIc14QEBgp
	aCAuDr1D19Z7TaFZfZ14CiNMy2i35hsVlCtOt6KtIDA76zLYXa5OCUE6kmFbr1BS10Bt/3HyfSE
	VVsvmQzcgKhPbyiCGcHCeEsNnwecovv5Cm3+9BnbMoLuoey8pBowf3FLxtKw543FAqyxx/8jC6N
	+TEzXXMDsh+uiCOa2X0cos
X-Received: by 2002:a05:600c:1f85:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4851989f765mr93346545e9.31.1772701415004;
        Thu, 05 Mar 2026 01:03:35 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4851fad2812sm41178955e9.1.2026.03.05.01.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:03:34 -0800 (PST)
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
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:26 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-3-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 10:03:32 +0100
Message-ID: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.

... but this changes the index of the clocks after this mpll3, and those
index are supposed to be stable if I'm not mistaken.

It is indeed more convenient to have the optional clocks at the end
as it avoids writing multiple <0> in DT when we do not have them.

At the very least, your commit description should say that this change
will not break any existing DT because these bindings are not used yet.

I leave it to the DT folks to say if the change is OK in such case.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> index 55bb73707d58..27cc1f331587 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - description: input oscillator
>        - description: input sys clk
> @@ -40,12 +40,13 @@ properties:
>        - description: input gp1 pll
>        - description: input mpll1
>        - description: input mpll2
> +      - description: input mpll3
>        - description: external input rmii oscillator (optional)
>        - description: input video pll0 (optional)
>        - description: external pad input for rtc (optional)
>  
>    clock-names:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - const: xtal
>        - const: sys
> @@ -61,6 +62,7 @@ properties:
>        - const: gp1
>        - const: mpll1
>        - const: mpll2
> +      - const: mpll3
>        - const: ext_rmii
>        - const: vid_pll0
>        - const: ext_rtc
> @@ -98,6 +100,7 @@ examples:
>                       <&gp1 1>,
>                       <&mpll 4>,
>                       <&mpll 6>;
> +                     <&mpll 8>;
>              clock-names = "xtal",
>                            "sys",
>                            "fix",
> @@ -112,5 +115,6 @@ examples:
>                            "gp1",
>                            "mpll1",
>                            "mpll2";
> +                          "mpll3";
>          };
>      };

-- 
Jerome
