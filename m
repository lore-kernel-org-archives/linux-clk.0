Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67C3164D2
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762348170; cv=none; b=Ya0UigeFGWG7gSW3jWG6aD7kWiHbjCbfKRARu2gft8Mpv0+7JPVp+kC8TjJek0P7TwJnSVFGWR6zesKYHyon8qIDuaa79EErCJMez/DSggGZlC5+YW1sFMqQAlIDFzVp/1cHTsLLH1x2hFi9avQLwTRrmD5Kklgc3vr6y9PchWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762348170; c=relaxed/simple;
	bh=uguI1xGoSqMV/a92i80LW5vKXiSNa4y8fhfB+Wp0GW4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=RNgbw/hrvjO/Gdo/h01/OcWEoHyPFFTy/ty8W7NUE8XqmKoLfTKn5DuchWXsUh0H2Y1jvUqdLqP4q2NmLrjTetJzgoCUftT3F1TNQparqcLwFfdEvEE5nKdA2r+0h3f6lgw/kpjG1H3Dom9PEx3kjwLxJDt5gykPEWCBfLQXP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=MNTmIoYg; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="MNTmIoYg"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762348154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JviihLCt3v6d6CZovBHWlp8JXmmPFCMHNUL+edx3LHs=;
	b=MNTmIoYgYT8/lE217Au/8HIwzXrmYeDqSa3iJuB2cz2XV0ASGUqU4Jn+7U+k5/x8VuoUmh
	wQM4ZwYXWDcsU7vOdXVFhoiwmcJe7dDaRSDvVJVGfGz3wrclxU+mpJ5dFoCmivN9vdAS18
	sLVRoR2CRPiYUem7AmPTd7Whw6gsk+L6BDCkstcw4el/O7xgCyJ01yh2kvge79opSk7jAy
	OvgqFm3rNxMCWNc1v/M/5WWG/ItEEUahS0kpFDtVv8XJR7SdC5LjYLCGmfRgRPrUFeg2dG
	novMFhyOvhRD7jHLq93j6hNgrs0VqfXyipAM92miup/izAs0i8wqEVgnQ13kZw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 14:08:59 +0100
Message-Id: <DE0S9YBDI0NK.2892TZHYSQLFM@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michael.riesch@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: rk3568: Add SCMI clock ids
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-2-heiko@sntech.de>
In-Reply-To: <20251103234926.416137-2-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT

On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> The Trusted Firmware on RK3568 exposes 3 clocks via the SCMI clock
> interface. Add descriptive IDs for them.
>
> The clock ids are used in both the older vendor-binary TF-A, as well
> as the recently merged upstream SCMI clock implementation.
>
> Link: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3126=
5
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  include/dt-bindings/clock/rk3568-cru.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/dt-bindings/clock/rk3568-cru.h b/include/dt-bindings=
/clock/rk3568-cru.h
> index f01f0e9ce8f1..1e0aef8a645d 100644
> --- a/include/dt-bindings/clock/rk3568-cru.h
> +++ b/include/dt-bindings/clock/rk3568-cru.h
> @@ -483,6 +483,12 @@
> =20
>  #define PCLK_CORE_PVTM		450
> =20
> +/* scmi-clocks indices */
> +
> +#define SCMI_CLK_CPU		0
> +#define SCMI_CLK_GPU		1
> +#define SCMI_CLK_NPU		2
> +

This corresponds with the id's in ``clock_table`` in TF-A's
``plat/rockchip/rk3568/drivers/scmi/rk3568_clk.c`` file, so

Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>

>  /* pmu soft-reset indices */
>  /* pmucru_softrst_con0 */
>  #define SRST_P_PDPMU_NIU	0

