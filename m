Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353566;
	b=WRRz9LE3oMzznctxhV/yNbR7g+3RXMOd4Jw+oLXiqllMBhipNH+fyGGPgKF++UlcF2y+
	 A6lpFg+krOR7TDRrkvlpdqMaeZedyi/YkDLiDHoJwSZQHbjapRWH+ZL3oXNdeXhWdQ+J8
	 ULx/f6kebKR77BPpYdqOqi/5jfKhE5t8I9Q6M8teT+2HJOaGQxA/v0tair2TDvlHUbiJ5
	 aoDWlxLEyes9HNStMdvRa0CiMFg2T5d2ezcRKvLzr4ytdHWxGY4UVD1mTf4kYDdhEBDyb
	 RmmGpuYx0bbJ5jdIUkooaQITeLnw+yYstOLVmpBYqEs9L4YyfUFyl7HmWY0AOf3DH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353566;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IWQC60ayXmUSstofGwQlMawv9SEc1M09tNmoor7OPsY=;
	b=CG4hFdU8l9OQ4A5397fGhAkGikJF/ucJE2J+Hmm4VNi7svW57MRWPMaGqc6jwKKDOQx0
	 K9Syo+K+nTfnPHuU/i97gQZOu9+2t5fzDPJm9M3rjQSf62j38xkWUlvhheZnhSVPMJz1G
	 BJoAYd2B9EDsE3hDF5OQjafVv5dv6erkzCUR/+Kb3SV954Iuc5KRNfV+n3p/GU9sm8mEu
	 RDNvg6HVDkdxHIwEfcvytBVZk2npGo84hPVMbGtKuTvOw6HiXhIFMnQ/UFurtjNxdf31+
	 XtqoEtv9HM+5Qquccfepw83ujwBZtun12lbhGtJM0gcUWAMg1tEc+DvSmc4BcAxBLxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVOOD4Ez;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5A606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVOOD4Ez
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D9B1F000D0;
	Sun, 22 Nov 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353565;
	bh=IWQC60ayXmUSstofGwQlMawv9SEc1M09tNmoor7OPsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PVOOD4EzZVYE6MZQYVBN/O1XO3vyobBkQ8tTmlHkJgDih5/PTb+VdO3jOB1CZOTDL
	 grbo4RPB33Y4xPE0RxvrxJwirrBeyKAkhbDjsif3KJz9lzJhPXjzYAAHn601JCfreB
	 rAfYfiH/ETaPVAjEYAIyLCmL2G3E6qlnecL7liuLJlZQ6HMAut2XnKNteea15m6gNg
	 146tT4rnOf9iDbvMNYzlV7cp1jrEtkIr2Lt+3g+DoZuNCPwoo9yD+5Pj6cXStzZu51
	 OWzZFqkLPYhWBTz8Rxpcpm6q5m0h6m8ziW98fxsFgE1aQTWUDrkgyrjUSZ5GS2Vdgx
	 tkFSMNE380AzQ==
Message-ID: <sashiko-outbox-227958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Consistently handle MSM8996 and SAR2130P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261122-qcom-kconfig-unify-v1-4-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
 <20261122-qcom-kconfig-unify-v1-4-6abaa7faf1c9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 13:19:24 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] clk: qcom: unmet QCOM_KRYO_L2_ACCESSORS dependency and !ARM64
  build failure
- [Medium] clk: qcom: unmet SAR_GCC_2130P dependency from
  SAR_GPUCC_2130P on 32-bit ARM
--

commit f5d53fc7ff487e3f47959841dfdfdc27b70db0e5
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

clk: qcom: Consistently handle MSM8996 and SAR2130P

This commit removes the ARM64 dependency from QCOM_CLK_APCC_MSM8996 and
restricts SAR_GCC_2130P to ARM64 || COMPILE_TEST.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index f127a3bf911a6..fc77d2aae3437 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -441,8 +441,7 @@ config QCOM_CLK_APCC_MSM8996
>  	tristate "MSM8996 CPU Clock Controller"
>  	select QCOM_KRYO_L2_ACCESSORS
>  	select INTERCONNECT_CLK if INTERCONNECT
> -	depends on ARM64
> -	default ARCH_QCOM
> +	default ARCH_QCOM if ARM64
>  	help
>  	  Support for the CPU clock controller on msm8996 devices.
>  	  Say Y if you want to support CPU clock scaling using CPUfreq

[Severity: High]
Can QCOM_CLK_APCC_MSM8996 be enabled when ARM64 is disabled?

QCOM_CLK_APCC_MSM8996 selects QCOM_KRYO_L2_ACCESSORS, which depends on
ARM64 in drivers/soc/qcom/Kconfig.  Enabling QCOM_CLK_APCC_MSM8996 on
32-bit ARM or non-ARM64 COMPILE_TEST builds triggers an unmet direct
dependency warning and fails to compile because
drivers/soc/qcom/kryo-l2-accessors.c uses the arm64-only asm/sysreg.h
header and AArch64 system register macros, and
drivers/clk/qcom/clk-cpu-8996.c calls read_cpuid_mpidr().

> @@ -1166,6 +1165,7 @@ config SA_GPUCC_8775P
> =20
>  config SAR_GCC_2130P
>  	tristate "SAR2130P Global Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
>  	depends on COMMON_CLK_QCOM
>  	default ARCH_QCOM

[Severity: Medium]
Should SAR_GPUCC_2130P also depend on ARM64 || COMPILE_TEST?

drivers/clk/qcom/Kconfig:
config SAR_GPUCC_2130P
	tristate "SAR2130P Graphics clock controller"
	select QCOM_GDSC
	select SAR_GCC_2130P
	default m if ARCH_QCOM

On 32-bit ARM builds with ARCH_QCOM=3Dy and COMPILE_TEST=3Dn,
SAR_GPUCC_2130P defaults to m and selects SAR_GCC_2130P, causing an
unmet direct dependency warning for SAR_GCC_2130P.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-qcom-kconf=
ig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com?part=3D4
