Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D39E3B9927
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729455; cv=pass; b=Kg/Ytf7Czf+G5/q43MNXNwjzkIOy33paRZexcXksRZ8+0SXO9qcuEPe06p2hJWkjHYgesLLEQZrjiybvF8hiqzhB6YiIBkl6BqjPd/zxScspmtR4rLLLx9uCx1PhNoYArU9YmbA4LqVxEuMjSiLxUAhZeIv+Fe4BQuaa8wtGwFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729455; c=relaxed/simple;
	bh=FDg0Cl/yIbEJs1iZUcaKBc5BZgkQJeT1BjRjBz2+49s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDPO9tcy21F8SEuaoAlR7yzHxhMV7vFgty2KPseNnpDtxCZKGf4TjXyqdIIjAigtBEQDBDAhgOsYDLFNdwv8Nu+8U5DsAOqqFIjLhLdQMzT/510LmurSk5uaCjNHG2aAx7o8MiFMDIuhj0fpJpf6DzSMBVlRWBhS4ThXCZJm5O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNLt9r9x; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNLt9r9x"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6984111d35bso2551845a12.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729453; cv=none;
        d=google.com; s=arc-20260327;
        b=di0X28vrBivLRVCpECpgRenvCuIE3YEjsJdb1efNG3havNtuW9LYUYuTgKecGZwQmJ
         OAqLNJN9h3Eotv3QL5uV0f9bxlMAM643EXKCzyuL2DeWC7Ok68pAqrborb7qHs7ZBgxy
         XsYVEaaVgU6CzGhv5qr89jp/ldIQMmIU9SVV3v23jiL8DlA2hTj8uAWD9A7GMcSIK4HL
         Si5W3ZXgshNE0CynIul1hP+SKwp2ZgfoeiUsLs1UCE8SxIT6CEwQsU85a6U9/wAbRh7m
         x7fnGK4J/Xe8Eftv8Q8tMtuVH/vi+D3+1yV+nth6rLsM70CxfHihnUpjlyu9IP7vXuTk
         ceYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        fh=j0TU1PnGU8mILltOI+G246GHe9PojWkfs/s0vBRtC8I=;
        b=c1YWLq5TVdnRDO3lur0NydViIEoFiAZqW/6pvoAMo4D46vfXw6B4h+m8edn/mPNb48
         RRn7/WTu9yavImWqWiXvLcI1tvojyWU+UjjVhAH0DeTHwn4d02ANE1Vpd+EIYXaKRYQY
         N6zSJYizNBUIiXa1KKEwqh8CXlYLaJVJEH3qGAIZO5xmsCNQxh0kBaXuU0gksTeH00ix
         LAJCx52H5rv/k9KMRzxDBUlFVpclqYjgL1qRiJ7mZ22S0w0mAjOvnYjOr4dOTTr1jhU+
         k4kn1rf1Gmj68N9zMoDNWr16N6Hw5+K5PLkiBxt+RDiH/LjySb9+oORarw2OOj73Vt1t
         rgDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729453; x=1783334253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=yNLt9r9xtmlcY4hQOxUHk6RH3pxvfxn2ARq3N0PeKfYTGDUFyE8d3aLdwswytFWgGi
         4IxnsS6oh8tyJzF++FIwCHYYTeb3esPrdfYhuzq0WxfI5vxjk4qo9TA4yoxkBMWJ/vol
         UcwWSFQ5alScG44B0rHsJPpA19v9IMVF6xqIxDx1WsORJM21NU4WibuxemOnXFW8TxLs
         VYkNnnF+Jwm2NbG6em9jjmwhjhyngoTEXTWB99oTD/z6MW9Rni5ToGKxBKNNaI01wwk8
         pIXE0ZiSck51LUf4FPhkCsOKNK3trxngGlwd6MAkkwil7bys5yHRdH7MhFIIv8FnsyTg
         OZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729453; x=1783334253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=NPvESWMJH6eREiorsNyVvaktvGMLZEok5qTIMm5rZPt9DJ99uuRFcA2M9XIwEfe69B
         zS3oDVUw0aB+RqXYRiVcQSzazBxv67E6BirNK3A+exA/lCg4A0bSMJtNLQGhA4RuZ0BL
         Uy8Ep9d0uxhBzjwq9Bxyd5eATJs6wW2qiR2E2ZkHqy2oHvdyu+mLiuOLTC0gi2M+lVm0
         d7FrHQU0cqwQofTIIOXOV4lfsJZboQXWuhnmId8N5xAELm5CU7gfBajW/6cmWgac1giV
         rhRilHRpuVJHGzhSiz6mEJEkmHRuUEUW1usiLe03z+mTjj3G3b+k9VfvX6qoTHANkT+V
         gXdw==
X-Forwarded-Encrypted: i=1; AHgh+RoelwUmxQNvP6VnRrINjA5OZEamsdInIkH802u4NDTtcf045DprpscCDv/84Yh3NRn1or8dx1Vtopc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygMoI50q6ejIyTiHd25NBF7CBOVz8rKPKVaiMrtMNIpD9ikAx1
	jQEeN22vNau35aWWXB/RorkGyIUeAxt/4YLJT+YfpAQfRZtl7gb5NQMB3pWWT7/JYNvdF51S7bv
	7m561dIiHqimEMDZoVTrflaAshcW152qPA5fr1ZGcWA==
X-Gm-Gg: AfdE7ckXPKcJKdm1kea00UZodVSpd0wgFYET3BifDznMFtql/V5KysDrrfnDl2xcwp9
	3C3HhV531RLkl3xLwjr+gJpEgb7/xowi66XMHW9BetuXtaKw6/hh0SNZ152Rm90R2UmGG8Z5ANV
	7yo+p4JM/B+FEJwkAMWPbQ2n/5VWehjCht9coQyCF754eKrTfACcW4xOb+Z6xswBpMbtjIQ3CVn
	B9LcHopnOw9cof6Me6HVWAFu88ByZVADKOrylheBYoaUyVszKA5OYInlRyS8xeq47VDgvPtfhkI
	IoL4crrs+NO7b6p0e8TYYABjsI1neA==
X-Received: by 2002:a05:6402:430f:b0:698:3f58:9290 with SMTP id
 4fb4d7f45d1cf-6983f5898b7mr3425467a12.20.1782729452868; Mon, 29 Jun 2026
 03:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:37:21 +0100
X-Gm-Features: AVVi8Cd_KzL4j8x2t75zH4aE58eWi5dZrC_hXca-XTNOV6txB2qHwNYu_bbkjxY
Message-ID: <CADrjBPoa7pTyfANuWznzeoLm7oWdWGcJbGxW4hmuSWo-R30SJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
> index 47540307cb52..c06f591d9d90 100644
> --- a/include/dt-bindings/clock/samsung,exynos990.h
> +++ b/include/dt-bindings/clock/samsung,exynos990.h
> @@ -434,5 +434,6 @@
>  #define CLK_GOUT_PERIS_TMU_TOP_PCLK            17
>  #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK     18
>  #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK      19
> +#define CLK_GOUT_PERIS_TMU_SUB_PCLK            20
>
>  #endif
>
> --
> 2.54.0
>
