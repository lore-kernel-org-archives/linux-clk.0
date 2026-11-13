Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574888;
	b=E/ZbpLuHMJrOMUH5b4V2mKNHBUwxAcZeXgxTTuOwctWFZKfx6dImxPibC62U7tAqEBm0
	 kW+wNbjV3Zyc3V25fUsChzPVSGaOANU/BnwSnOwxzebGbgVNk1wIe/d63NvO9COyHVjXW
	 K4taSiFPnMo3pRA4trhKLHsgHTPN0EkhxHnEc0xMI7ECOdul9bLJi0FpLZpbweYEAIDR8
	 Jf2puW8UTa6SixeGRoiQvT+EAs17ZfeDcozXiVP8Iyp59eoQD5SeIGl0aU2FHkFdmCKAU
	 JaC26zVvJVdJj1BEk7lkvNJ8Tl5pdAUBYnmCNQ94h8oG7YJLAn2/0WYMoifJT6vyfwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
	b=i75feFCInnHm8+1IFPeT2GKEAkYLxZB4oB/GNWVUSoDCymFV92ImR+H1XONm1AlAVQ45
	 9AvNBVowQyiTV4ZnFE4CiUhqXDN1UFkBo5KVlP2Qf4cQA44Q5G3fz+aIoSjZKZyNrbw9v
	 2GAc2zqvS/0g+bkVIDejbOUPLOylIzmjkYZ324IWe3yjQrOEkbHUtUD4EzFNBACsYzeK8
	 wEMrsjLOmUxfQAxYS9rI8T9jFtU3VHILqucxl7ucXqJHkY2AFd2HuEmfA7pyRcnBkQq3c
	 P0mHlr4mSaApFexQdIy/tc6Je3mx+lBy0onJj9YhxPKDnQybMyPv+lc4l/7Z3T0CBZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nnTVdz2h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0B606A337
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C0B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nnTVdz2h
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1914488a12.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 05:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574886; cv=none;
        d=google.com; s=arc-20260327;
        b=JQWjYdy9EcWdo7EEpR4QsRUmF3CXbG9unoJpJPr5LTRbdqmnH/ivzvILVqEZjVxOHR
         U9SjF3hZVd2vSnwNIY7ixCT/o4saoXf4/Rm864TBF4vV89zMRscESh9kZzqsY01q/5dD
         +XciDxQStY+FgcvJ+egm3sEjrsqX7yvnnLrTnXfyszkFH5ZN2qtusuSVhEzhkprJwOQe
         SRSzW908+Mpom6EEr9eWq8Q3GjjWgKaxEayUjbqwMcQj602OtmCSUyZodL5DQQIuwsOI
         bwAhIDIvwQhweXwVkU8PdZtDAml+AS8rvevRfscP9Tkwu6rdkk4LPQWaamGt1vcpX+9J
         A9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        fh=ogOYaLAb5kh6cT/Trc30Bq1YTLRXe9B6Ze9856mz7rk=;
        b=cQnkN9pRBVrf/K6BVOZIdZsuquOaPbUHFR/zkh8TX6T/777TyvLzONRmXAwASivBuC
         CObGmlih0IdlEz0WgF0+uqZKdOPebqUvwUqhrksEd9tPooxIQCBwISJ2CPsHFaYtJXP6
         sIuVZ/BXV/WzpfpOc71RWj5bvUaFkr/Vh0QVLWjE0PJpgAaTh2Pq94KZbZeWXTQC6zqd
         1YAMKDYDHBcsDRGO762YZPzAdd4OyWw0aYzKGqiH7kHLyyf1eCs1EYeh2UOPO35uM3Tx
         hOcH6qw57B/q8Y2owhmtnfz9UstKvMIGSCLsJsgwfZiW+Hem3YHlrB+AYwUa9m62W6J1
         w0rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574886; x=1795179686; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=nnTVdz2hYXjLv8CZGg80c7sQRinQG91iQTBVm+IbawZjNNVF1TexNdD5dgtjfpuY1B
         2gZVzrsPBWjtuXVZVHFej2U6RlybPF3iMeX992fMFsq3OfQj8YLYXxSin3iox89TgsQs
         iJxDO/jgdGN3w1HKjcuYpw3Pyzy1fpY+Khm6lOh5uVpJx+hG7cHgMxUT6JmyjwgiSN9j
         KCBGHkFo4wt2Agmq9WQ3E/iz9I1HC6pyj5kLPUYQuEwFELjHUI9MCt4d8qVosdkq/C47
         jRkDU86/iVndnQOWWjcjvDvhYxxuSG6dSDhtKRASS0nwS/adP6bX2IGVaLI52bCddBp6
         Ae7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574886; x=1795179686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=C1NMxrEt0LTUm426Z5qcby9H7SLCh+3K8+EqhWuR4FdnYthIasupYwEjQPN1ndri+r
         UEIMW+TfOF5p18oLNUsGBnhhfZTqDOWo/GfKdjjj5bcpyKFb9TnWoOrx+DHr5+++mBPM
         kMqwiokfRzVJGHd5ZCUMY0mYyvirU8WsfxwVHtFtPxIGgy92ktdrNzCcNnWZCZLH0+eE
         DMjSF7H8CGMCszZx0y5mjCly4Ctp2F4olzDdGeb0PqWgTRh6trMepc1TtX+1Aq6zi0Ee
         CJPFYEKBirtR95fiiUU3aq6tn5avu31jvRZWuXEwPsueubTtNh3eS5o6xhe9crNUvtSO
         sbGg==
X-Forwarded-Encrypted: i=1; AL+hErER1PnXPrxHjbaDnu3c5dEHhg920q5nisDgovOmAKaUXK0X4OsoYZ/xuAjT17basgszOfYn7CmH4VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9rNs4SzK9qWHhEetumIo8uGdhplG0POGcoAVz7z9vVqZ7XK/E
	cOlMUxj2zeUjK0VB/EpssaAiR558yuo4Z1hArlj1kGO1VKz2XrcvSztq5Gv6GwjfaVPkn7Owk4S
	alTkkfuflz9/fB5/XHWRVVTiWDAUB2u9xjDjkWTd+wQ==
X-Gm-Gg: AYBFou0LNrufKa/5U+zr0j7fhznHusIa7wOoakLMM6Ei76+iFx8kNGMjrWNdq18BeMe
	q5or1rpugzwgvEewkbGbtsj4mRu62sv32E9ENWUtln86NtRY37eF+WQG9cty9kvo17ErGXJh3ya
	jLp8/rRyyaHKCJ0uDDs2idCQOpNcVHWynq80HKaR9iui9AAus+HhYaX7IVYPfJFkDQiRoIoQZWl
	yZT8nLKGjTow0Tcr5z92idY2iMh0x5iFWbiVZoqlmi0xrj281FdFchGf9FyQfRBG1H0sbcJOlf5
	5kPoPmlXecyruEcCK3NxMQfH8KDc+8KM89F4Vl+nnDEch0/FuIBcIjkrjnenfEiwRUg1UKXQtJG
	GJu/JtJDdvuEEsusdxX8cbO5zqS82L1kRz7bMv5W9D0Ek/MBYNNI+RVyM/6ODR3D5/2APlw==
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b7c0d144a7mr2186142a12.43.1794574880970; Fri, 13 Nov 2026
 05:01:20 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-14-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-14-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:09 +0000
X-Gm-Features: AclHuK-DofCQ80IZzIK-whDWDx-7N4O3mu6ydJD4FcVZrdGUzptZd5Yy1pZ4bbc
Message-ID: <CADrjBPqormg=jcKYZh5q61MiwZaRB-ZqtV+R2CFNP7o6Jd-SKQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_hsi block, while at it add
> sysreg_hsi node which contians bits for DRCG and MEMCLK
> which are used by clock driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index b461de6a7548..3dd7a4c4c609 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>                         interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_hsi: clock-controller@17000000 {
> +                       compatible = "samsung,exynos8855-cmu-hsi";
> +                       reg = <0x17000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "ufs_embd";
> +                       samsung,sysreg = <&sysreg_hsi>;
> +               };
> +
> +               sysreg_hsi: syscon@17020000 {
> +                       compatible = "samsung,exynos8855-hsi-sysreg",
> +                                     "syscon";
> +                       reg = <0x17020000 0x10000>;
> +                       clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
> +               };
> +
>                 pinctrl_hsi_ufs: pinctrl@17040000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x17040000 0x1000>;
> --
> 2.34.1
>
