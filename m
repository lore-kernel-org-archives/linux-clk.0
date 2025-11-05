Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B15311942
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762348618; cv=none; b=gW19p5QUoE44Je9QPDHK+oNX+el495XUW4jyxV79ztdZtqicGKBwwa79+ON0tS2BCKeRUyhbaFwdxHjkUc1C9Jn7bEyVCu+KkEGbyuoOBO0tMOCnI1E97hJR7QcVnvC7Pqxcw91zn1KOlVEZcwUukF8nOQaStlC8mzX8acq7jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762348618; c=relaxed/simple;
	bh=fUTwJNDHUgzPs1TItc0+dwsS8UK7KycrT4JxNbiktpg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=W4AoFsRwpADSXTtwlrmvTQT80/gL6N/z0HX+3tdX9DOafPg+Gvs1QiqJDcBXXhqgq5y08VeD6rQoT4ISWhmHQvTiABoybW0qpv4IOpLcwsOUKZMxnkrnmrMlDomfjrn3f8B7QHCdwfc6qUYe1Pkx8uTNzpZEnhMhvc/cQMVo+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=nuFi3+XJ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="nuFi3+XJ"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762348604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06qBPm1fhFSKR8WuXfgSJkBHchOvYaGI3r+Tq1ruRHM=;
	b=nuFi3+XJIUC4IMIZbpTNvnro4Irl5tYMnQEv6fg/Kkvl/IljVEvTDKotl6REwLqxDISxs1
	jThgRGnSFy2QBbD3kavo6bUiH81wPE88IxmoVUcgZFaqwcJLuolnq0lVd9iUCAbB9WtBZJ
	DXX7B1rwDawDtBkYA6jbdjAFiuSeJaLipBy5O2IdmxEimmOSL2m/teOlY/62usQ0UKCA72
	YkJeImAlO5eo6SX7oI+p+l20fKbwhNW8ixTRCMvu3x/THQH8TppAJ4pAC9gO8W/4fDyLSb
	ORun7XhsHZ7QsaF72kfVFoe81YBN2F09k+BeOKzG5qgJotzcvXV4PRBCVeQZOQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 14:16:42 +0100
Message-Id: <DE0SFV203UMS.1ZV2JE6QEPN29@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michael.riesch@collabora.com>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: use SCMI clock id for cpu
 clock on rk356x
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251103234926.416137-1-heiko@sntech.de>
 <20251103234926.416137-3-heiko@sntech.de>
In-Reply-To: <20251103234926.416137-3-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT

Hi Heiko,

On Tue Nov 4, 2025 at 12:49 AM CET, Heiko Stuebner wrote:
> Instead of hard-coding 0, use the more descriptive ID from the binding
> to reference the SCMI clock for the cpu on rk356x.

Any particular reason you only did it for the cpu, but not the gpu?

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a3361527d4fe..d0c76401b45e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -53,7 +53,7 @@ cpu0: cpu@0 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a55";
>  			reg =3D <0x0 0x0>;
> -			clocks =3D <&scmi_clk 0>;
> +			clocks =3D <&scmi_clk SCMI_CLK_CPU>;

Regardless of the above comment, feel free to add

Reviewed-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

>  			#cooling-cells =3D <2>;
>  			enable-method =3D "psci";
>  			i-cache-size =3D <0x8000>;

