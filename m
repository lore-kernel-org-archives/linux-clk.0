Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465D12C55E
	for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708963946; cv=none; b=d1wlf5U99MVy/j4NLbVEglwBXCKrBFVc/hbWT+6CiwUNGyskpY+lUAU5kK8krURbX/LfH522VhZttZubRG46TKT9zRvEDd14OUCtIl98GPkoq0fURHE6cbxLI75nshEAUNCQ5xTi0u7t7OEZ8dnUAdsFBikoBiM1caJ8uJHpmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708963946; c=relaxed/simple;
	bh=a6f7tH+OqrI8hsygIm05fQcRkKGxUj/pum2GnIuoRvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJE5E3JqYFSL1G+A+U/YWcN8X7hzEN8f1OHPhNznBkq6RAzoyjxVsP2ne81Z1TGDkJBJzY4frIRHO9o3z7vlrHwnHJo8beWIOlVa7c2fP3WOIhsDm3RuIbO5D+1Ju04dtSEaIKVhgW+a5wi8cwfDQwgjiP33gRTtJ1Y8Esz7l/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoRS2yBQ; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoRS2yBQ"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a04fb5e689so1665979eaf.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 08:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708963942; x=1709568742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5sH6z9nrzqVNTL38OQhoDAwWJzK93pXYFPgmQuEUCcY=;
        b=BoRS2yBQ1FIjCzXe3Am2ozDjd3R7N9NAiJC1hWk9JYXOnorAh5dgaVcrrCuX3qzaAb
         bmOWwsK+A4uJnnUfIEoe4BYki7CgvY/ejWPgaB7Dw02NDMsmqwRenfzVpUmm/H/EpDW/
         I/PjgplIDH5Ld/WFgRp/hihvBa3mwqwiS6Iyizq1zvc40oE/ir1RsVddHzl1cQFMmXDE
         WOA1XJqA+nMW8KNueKX64MqlWrHnP4kl2Z/aHcRIVOau4X7G4RbMAqjdDlHLH6lsPK2+
         XqMRfNbdIDn0WS5LBRF/wndbTKXPEA6gl1UaIbQw1XRHQ8tZh8rgTkweQ8qKV6cpzPhA
         +0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708963942; x=1709568742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sH6z9nrzqVNTL38OQhoDAwWJzK93pXYFPgmQuEUCcY=;
        b=HyH01C8yt0JkKCp3QAyPJ+6Ea9H01lxBiIvdr02ojnU0RkOmtH0fncqjruMhqbh+Nj
         zUdfMz2kIG6VybYNaLh3ZxtuCmGorsBaE36oxBbbDDiN7vo4E9b5GOteKWVugaVAGNSB
         DpA3TA2M1a8STx5mY68h+GVaYteVNBXVUIsoqe+dd9YLCJQllvEF6GIrFxj22VoSStve
         Ph6IzUVnUboMdyugY3IP4M37AOhCgaxFHQQ/2HfhDylbO0db6ojPQbTw1J3Y4xVI6uP/
         kfQcgzJdVRTlynlBEYeTjvDI//PS0gkH7p5K0Bh62lWONlp0UomSDICDBc9YSFHUlcxA
         AhWA==
X-Forwarded-Encrypted: i=1; AJvYcCU8FfvOBAsa42XJ8Sfm/WcZtdse/A6rLtx5vyQH0l22gyubcjXNVcXhRyaYmkEpz08vCjv9Cfj+7acSsaxTGcCjWBQWj3/BQLSE
X-Gm-Message-State: AOJu0YwOQs87o44k7GzUj/LkQUjndIETQi6Ut3bQ6BZ1Kr7ENWzmsVkq
	Mz4eSDQuwBh9ekmGKeGKVoxOhu66zooFuSCxTijE9RBr7U3SvOFpSceULPOv6o8=
X-Google-Smtp-Source: AGHT+IFjUb+c/fFWRXoZFCN25O2SmDpaUNvFqFasQHJGd7CEyCqvLCJr1Pd5sypoEjZ6QljgaKYLNw==
X-Received: by 2002:a05:6358:6f0c:b0:17b:b532:80be with SMTP id r12-20020a0563586f0c00b0017bb53280bemr1375921rwn.25.1708963942241;
        Mon, 26 Feb 2024 08:12:22 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:360c:e16d:91ef:5fec])
        by smtp.gmail.com with ESMTPSA id d18-20020a63d652000000b005cfbdf71baasm3591736pgj.47.2024.02.26.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 08:12:21 -0800 (PST)
Date: Mon, 26 Feb 2024 09:12:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: remoteproc: ti,davinci: remove unstable
 remark
Message-ID: <Zdy4YwD9LNmq7hth@p14s>
References: <20240224091236.10146-1-krzysztof.kozlowski@linaro.org>
 <20240224091236.10146-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224091236.10146-3-krzysztof.kozlowski@linaro.org>

On Sat, Feb 24, 2024 at 10:12:36AM +0100, Krzysztof Kozlowski wrote:
> TI Davinci remoteproc bindings were marked as work-in-progress /
> unstable in 2017 in commit ae67b8007816 ("dt-bindings: remoteproc: Add
> bindings for Davinci DSP processors"). Almost seven years is enough, so
> drop the "unstable" remark and expect usual ABI rules.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/ti,davinci-rproc.txt        | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
> index 25f8658e216f..48a49c516b62 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
> @@ -1,9 +1,6 @@
>  TI Davinci DSP devices
>  =======================
>  
> -Binding status: Unstable - Subject to changes for DT representation of clocks
> -			   and resets
> -

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  The TI Davinci family of SoCs usually contains a TI DSP Core sub-system that
>  is used to offload some of the processor-intensive tasks or algorithms, for
>  achieving various system level goals.
> -- 
> 2.34.1
> 
