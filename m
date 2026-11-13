Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574856;
	b=OioFjGopo09RaijgbGinADQ65A0/iK9o9x9a82+qQ13qdpiJreS+FkLmoCxXjERPxHOM
	 mVQYrR1p7yyYKVH12fsIFTZqh2wEoYJhzxb4D+gX1cD4gg+csTSWeBCVr0c1jUraPRzf2
	 FAxG7qiaBeWZxfdjupxd0ER1F+vGo7mpKe79yEFjxMHcip7pblks386LrdTA/X95M+TdR
	 VAXb0zkl5v227iseGcj1hg3QKSSOJIRS7XXi+9waPOr2uM9fcnO8OOXOPUykq0dlhcEKm
	 +brGB6dw7iPxwfiQLR4wwgBy+2DEk0oKIrgHuFlBOwItf7xNnvKB1O9KLQxMvaYG8vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
	b=qUGNigW9jVua2m9GRKnjBjfBRnUp/NiY62s6NV9H/XN5GIgiuWBeKiETWAzOFfVPj5Rw
	 gK0S5Yh9jjDQ0RJRUJKHxESg1xoircDAnFMAvYnZaBNq/L/jQ3VG08/L/gNkEwW0T9uOQ
	 rMexBwGvBFOQYsrdBfLN51TM6vcIhkefSi+856DjWewQrHbhG+b5gEgjQPfQLiL0HHOCw
	 f2l6nbj7WQI1p9TA160yD+nIycvextyYK30Xee0ajmZP1RTqdGPeEGpaFb8lvFtpPOOAC
	 zKeF+yUvqGvzUwmr+9i4xdsWccCe14gnq8rABymaQ8O0eX90Daoxrx3w+k8C/TwheEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62FF606A334
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62FF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1848603a12.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574854; cv=none;
        d=google.com; s=arc-20260327;
        b=DLRfCL9MKgtbhwrzaVs8Eyyi6X5I5smJK/Zit6UZnsLgqO68sSrsrmae+Gu0/0j8JP
         WcYZOW2A6NrgdOJzijeFQkW5Vi6b+S9HceJnpv3HUDPs20CZljlGrcaLWPqJ+y/asx5f
         sbC7tz19xWud5ad12vaZ0STwXMIQlWNKaLPP543dHwtea4VzHeRn5fdLpgB97Gxw3AKm
         3Cajh72yyCkgbnSSP+C1fSRMw91tKw8EFZzl/Vha/qEiNQCeLG8RubZBbHx5LqMoMLE1
         ccW12d0HgHKgMyyNKidsOUAWsLmi5v35VqQ/I2fyw1kJcKJa9b+iIi41qGod46ss5ol/
         gf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        fh=TwHh9Pco/Qef0b9KwrGd/CmkDT5UazFjnOGkh5jcuMU=;
        b=FZ7TvYumAsryKYlv2jWqCaB2tZfWYrDCmf40DNs5rLrwPyBbdJUsab0ea+OFs1+pLr
         QpDYu3aoTpDxa6WTdFabhHIzOpwblHcb77CCuA8go9TmGbhp1HVTsxSmYVIf8zdsTxEP
         XbFa4+O+YG2WKgXsklM63vyMkE8t90ir+Mg0U91NYMaH/3UrXWlX3rsKH25wCLjAqQa6
         wRpPQLw6yh1zSSaPcfeY/3VqdCqSm9S+R8nj8FPQE8R3DGGKbvzcTtP8c5fG+Nw0uMO/
         zPUs4rZ/X+r1jMSmyvCrqpDd/bmx/nQP5upaQT8FfluPxu7PdGohKkcVIO9yQnKPPTjw
         Ryqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574854; x=1795179654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=jnm00dpexQcSPfGZxQphnKBSd17bh5Upe1ySHaJZjd3SRylcfmGBl4dkJu33zlmYFS
         IK8hqMGUDl1UCPZ8ZrJ7+cPX+7adIw6uvi7+1wSF1E4uPoOASKQqKtMVltRdHOGxuoLJ
         HJBALf2AkIm/5Oc/99i93CWinzFErZvMrVFB0BPMBtf/hNO6A+9FDjSO6bCdzdapFF/1
         NbOfWZ0Vyez1mjQJ1sEMXA3/cp4OI8aKne4ycJkA00biNQ8w1FHmhwmQ6FK4ZHWkNKPh
         k1yv9/YvgPomizwtcLEFLtNVP650OM0e1LeUivUAFjAeZyDo+gcaD4K6as03xcz+n65y
         Yedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574854; x=1795179654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=Et0r0SHkEnZ6ZVkOWbSgpqc8NDtCt26cob9H2T1Twj/nza7W1Aa/EnANgYw2Pq+Cjo
         pmIFiX661u4rrEsFXzu3smgmg/+/UrwRpw/4YdBEs5zwnzgqFgw5Fnpfx/SHD0zikwRy
         H+bDynfQr8jXJYBErSBPk2jMI5pGyBPban7T8XollhwHmmRbhbqgoVo01mPc/M89l54X
         w+M8VP8uc2LbeMNA1OkILR1nNQCtNyFSpj3+WtDTyGk2Bk56AMa6ZK90F14/kxbj3YYX
         Ges5IGjcpgCZy1W3q8S6WQzYBu7LxKQRa4HUnjtTZIgUZvUuEolVfvR2X36ZLqx6CsJB
         Naug==
X-Forwarded-Encrypted: i=1; AL+hErHH/v/CJyuqQfw7bfgiyE3WSMhWaWqdo06VmD89xSrB35MnGzyGsjtUXb8Ftq5laPiFncLA0e/XXRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6lnIpMjSTTAx8yWDFl5B0oJoGU1jlY/VNVQHHh+JIm3zvNiOF
	QPMIg+/9tSb6vKUqWgn06uIU63h2H3YHCnNwu1NVhxh4o0TCZa9/f7P056eL9SCUcdizZORHWJR
	gQvcJETHFPGk3X4v6npCn+fdulkhSpzcZuD2hOhmB7g==
X-Gm-Gg: AYBFou2n1HCAbIKZxy/yrLxKdA/sthBl/IrurE9GZcgDwW7TKHgaCqoK34fKJMAzak1
	CJjiydE4sLjGw2aNBWntD661JTUnOHbhWxa4IpFwh5qaUB66YWPfYAURwoUop9HlcuxtmvgFF7t
	GtVHGl9nl5oUf3JNL7TaKlTY3JywNoI2prMWs0t5oO7SiF6TxrPK+xUL4SUldz12n4llOY1puJX
	fepOBDpuXELc7yhLewZfv5LYtTFQql1I+qO7CikmgPzE3RnQzGBit8fd3/rDAfBO/zo7Eun5qAD
	SnxTdI/LiqOh5fen7AjRKNTfQyVJTaHaRUWvK/U9XcOIQv20xXeGwggcI38gqkoRYwTaI7cDWDN
	P3WPtOTQ9tjCrW/zDT6TwFyCdYeNoLRaXmthqqT8uwCc/U67IDxeesyUzKFb0qVsfAjqYwOqf4w
	/VkqIQtEpXG98K+Eg=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1756365a12.33.1794574853723; Fri, 13 Nov 2026
 05:00:53 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-13-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-13-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:00:42 +0000
X-Gm-Features: AclHuK-Gujxl0bdCqN1FIJbWWs5SjHt2ToZTIgj-Ln1Yz-sYA3apmJelY48JkxE
Message-ID: <CADrjBPoSV8uOqX2tkVyEdiZi7NEOJAb8JsxkvMqUn9+wF5Jc8w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris
 clock DT nodes
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
> Add required dt node for cmu_peris block. Also add sysreg_peris node.
> sysreg_peris contains DRCG SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 2e5dc79d66bc..b461de6a7548 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -146,6 +146,27 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               sysreg_peris: syscon@10020000 {
> +                       compatible = "samsung,exynos8855-peris-sysreg",
> +                                     "syscon";
> +                       reg = <0x10020000 0x10000>;
> +                       clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
> +               };
> +
> +               cmu_peris: clock-controller@10030000 {
> +                       compatible = "samsung,exynos8855-cmu-peris";
> +                       reg = <0x10030000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
> +                       clock-names = "oscclk",
> +                                     "gic",
> +                                     "bus";
> +                       samsung,sysreg = <&sysreg_peris>;
> +               };
> +
>                 gic: interrupt-controller@10200000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> --
> 2.34.1
>
