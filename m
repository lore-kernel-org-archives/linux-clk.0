Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA047CC80
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080439; cv=none; b=r/vERWoNxOA1LfYPF9+Yf2oL5oui9oMFkUbgjhkyK0nsE5dQjYRzUVvClFBKWG56l51VR9fB672osXtAh7exoaukQkBMIil+CUEz85qHhlvqgXuO2gqfYuRVboRJHpLn/DPo5M6wMF33j4yE8gjVnulmbOmIXHPnRG0tEgXc7fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080439; c=relaxed/simple;
	bh=Oo4i4j0mTt7dtOMl1Y8KVKIr7pZfRNebOGCP7BQL4P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jgMpBZCf/u1evuA2BGsa1zVB1/K+f9LRp3aYEWFbwWBgZyy3zLdYbjzgKXwgQ1vij7gkmrQqRMnzcaSNkCKS9tcUMssSTDixZsVCnxRUPRne0zMyhVktXVh2pLUTQ2aAs9RgtzpSn24yEixAH3pJTyqr2suygrKb99fr8kFE90c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIUtfowo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIUtfowo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44b052142e1so2847753f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778080436; x=1778685236; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=vIUtfowoWmKBAWDDOHM0mBaF5KndlEk6uNkx4WWXVRjiQQtcpEgW/7HlkMX74odaUB
         FuamaI4iXoEHnGU3WBl12iR7Tz7eIEdSy7pvUxh9LRL6JJNETI+DL5of41U1jhgptcwT
         SOZNo8Z5FRk4vn9WtDpuclhsgGR7EGx3Q3V57H6IiVx1SgFLKtoeLXAZ9wt5cMIbQzgn
         FsmOD/RhTSeeF67d1NeSsE8501v29GaRz12Tj9U06ewWOqmImuGtROJctMlIFtuADlmq
         ZQwJJLmRcP5DLaFelf3qQeiVS1gl2mREZnm5wsXLmRNovXGKPS2fjjW38XvMAy05PURu
         vz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080436; x=1778685236;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=ajmHcWHSDLTM5LKcfYUWt1PFtH3EJsmDR5GbUUB0hKHV6SVJGtZbLt2UXNP33JKTWH
         PkfYSbpchp9ngHq1RLOrnYDWNgJkhrbq1gWVofL6DPUFiSfcr6gMNUz/gFZUFRELoZXJ
         bHX6NN5apco7k0wPtDgTMT5wU4YBNaXd8hEUcHjjmq/Ks5Fh4MVhHyu+u97cijAglYhy
         /4lVwIajj5wwq7kmmmOzyETPZS9Xjz+07uv5yMUEfA3Tt3RkAwtyRxSb05Pc6ANRAMKb
         HBo9FsCRRIXvmLUYjesL3XSjX4x5QSb0UHfYYku9zeyyi0q4xazlm6IAk6vh0DrMJ9NV
         m9xQ==
X-Forwarded-Encrypted: i=1; AFNElJ9r9DOOl8lDGlyiWPwuLhA1p2SEpiUybxT43vdP4eQn3ioLzQLv2WMsxkL8zcg1TS4BVZAYJGM9BuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHht8bwf4SkGV7Ohvpo0JzUc0sPoe761jbYyJt2sjAzpehJwR0
	M2BOneyHC8habf3M/I1JN+sjsmDaLvKWMkX9KfMr1pJPvcpCJmN6c0cTxQKvOEuolRw=
X-Gm-Gg: AeBDiesr9SI4mciumWLoFyAEw5XlqKg27UmRNmaIKJoSalquRl+6otlYEfxjtffenKc
	v9db95vqlvjL5XweU35dsqLbtD+pY24kBE5EQVpeAyauwNjEd6VWJzoefyqbxLj8SLRDnie/VAV
	jwU6b7yDz+zXPuB0cjUudNldugPtUH9JxtYh/uf5WXwmaTtoKuxgfwf+7IjSaHKYKFuywxRKFtj
	/d37ZZt6zCvTyC1X7AbXq5dp6bVZgLJ0lhu4ItcjIToAJxSLJwBkT2KXaot/68NfL9AsjyFP//o
	FEOPjEtNE59iYUogWb2gZ/XnagHpgrEK07ozIfjupLpcNR+FTcdqxytOT31Xvt8280qdAi+NHgz
	TavYSQdXAz88tXbkwAcb0LlS9IZttuJvdyC5yUzT9TroA8OT+lJfSAr0g9jKyMdggQHasTyVXvc
	X7qHaxg51SpN+6TXXfwe+DongPafkIVCzMUdn48YRj9GPynWY7Sp5B8zuJYKuzR/efvPETeC2Tk
	SQuqUObDYrs0ELwNB4lg/bon5L1TPeJyR2XVoI=
X-Received: by 2002:a05:6000:288b:b0:451:26e1:3cd1 with SMTP id ffacd0b85a97d-4515d5c56bfmr6478647f8f.35.1778080435844;
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:da69:ce01:65af:7871])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e174sm13297431f8f.1.2026.05.06.08.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 16:13:54 +0100
Message-Id: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>

On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++=
++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung=
/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs			:=3D exynos-acpm.o
>  acpm-protocol-objs			+=3D exynos-acpm-pmic.o
>  acpm-protocol-objs			+=3D exynos-acpm-dvfs.o
> +acpm-protocol-objs			+=3D exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+=3D acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmwar=
e/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c

[..]

> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +	/*
> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +	 * capabilities. Treat zero and all positive values as success.

ACPM_TMU_INIT returns capabilities inside designated error field?
What about other messages/commands? They just return error code there?

> +	 */
> +	if (fw_err >=3D 0)
> +		return 0;
> +
> +	if (fw_err =3D=3D -1)
> +		return -EACCES;
> +
> +	return -EIO;
> +}

Could we map these return values with better granularity instead of
returning -EIO for everything else that is not minus one?

Is this error code convertation applies only to TMU protocol?

[...]

Best regards,
Alexey
