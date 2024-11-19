Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1D1CC156
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023968; cv=none; b=U6GiHVfAbWdSlIyQkJvN3/dSWZvkHQRMNWYMdVCcXNDsWbLwgFROVH9UO1hf5d5v26sb44A2Q1/SV0XbwvmhoiftNEsRPja2TzubREwJnzH0fqcWmquRRyIr0PJ6ayWk92gyagLpBo4RDhEI2PEDMMMbdMgQV0WAjuASruhvYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023968; c=relaxed/simple;
	bh=ZCTkqrkfjT0tCxtMd7n0BWeKeUKQr3zuUDfYHPwEMFM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jrMmEtC+tI0Pih8mK70V5iL3LvAQcCH1d0fg9RcmByxqmRh2A4482xi8rIwpuJsGPsG3/HXtDqGS0zFo8D7/5QlE4UPRW83Qz4PTZrS0ZqiXvAwmR61ZLZvGWHVAIXBRmdSwpq28dHJlvUgNzreYgl37qXI8qhOUaEoBN01BdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=mvPt7nOJ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="mvPt7nOJ"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1732023962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TgHwPslSk2PRB/eadtEYqufFZbDdiWqg5iGoDx9N5MM=;
	b=mvPt7nOJuK3tOZcE4Bh2ETmJE+u3r9PIbXv2ZOOtdFtnCHgF1fXJGMedBs/rdegph8oNS7
	qajfOuU28XVbYTVDoR3zvtqvORg+vLN/A7k3IJdo60Uapz5BM3aFwP1eM0byxfsr7hMw+I
	LkrB9h+q14nLcv7qsdMCWadW5YOpqLe8T27HMggN5+Nrh4HaUMDL8YP5ju/RXDtBLHD/gx
	ZqDSBBovznuJWLtwi/A0egtShz4lTdIXGgIqrmH/ycppiOtecpsuqy+IVB56vpFUPRXyZX
	+KpzxQE45YzQKj4KNgB9A8e2muSN02xkN2griSTwhvYy23k/3G2wEZn6TrnXLw==
Content-Type: multipart/signed;
 boundary=79d65ceca52770ce73e14ecdf58ae1ec71b511c9b7ca1d91c45705b1ce2e;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 19 Nov 2024 14:45:53 +0100
Message-Id: <D5Q78ZOX5SE0.2SCB8FEGY7EFA@cknow.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <detlev.casanova@collabora.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/5] clk: rockchip: rk3576: define clk_otp_phy_g
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>, <srinivas.kandagatla@linaro.org>
References: <20241119132916.1057797-1-heiko@sntech.de>
 <20241119132916.1057797-2-heiko@sntech.de>
In-Reply-To: <20241119132916.1057797-2-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT

--79d65ceca52770ce73e14ecdf58ae1ec71b511c9b7ca1d91c45705b1ce2e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 19, 2024 at 2:29 PM CET, Heiko Stuebner wrote:
> The phy clock of the OTP block is also present, but was not defined
> so far. Though its clk-id already existed, so just define its location.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/rockchip/clk-rk3576.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk=
-rk3576.c
> index 595e010341f7..029939a98416 100644
> --- a/drivers/clk/rockchip/clk-rk3576.c
> +++ b/drivers/clk/rockchip/clk-rk3576.c
> @@ -541,6 +541,8 @@ static struct rockchip_clk_branch rk3576_clk_branches=
[] __initdata =3D {
>  			RK3576_CLKGATE_CON(5), 14, GFLAGS),
>  	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
>  			RK3576_CLKGATE_CON(5), 15, GFLAGS),
> +	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
> +			RK3588_CLKGATE_CON(6), 0, GFLAGS),

RK3588?=20

Cheers,
  Diederik

>  	COMPOSITE(CLK_MIPI_CAMERAOUT_M0, "clk_mipi_cameraout_m0", mux_24m_spll_=
gpll_cpll_p, 0,
>  			RK3576_CLKSEL_CON(38), 8, 2, MFLAGS, 0, 8, DFLAGS,
>  			RK3576_CLKGATE_CON(6), 3, GFLAGS),


--79d65ceca52770ce73e14ecdf58ae1ec71b511c9b7ca1d91c45705b1ce2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZzyWlAAKCRDXblvOeH7b
bgO3AQCaEVGABu4FsN0146ULiB2lKOrKXkI8R3DKOrAFLEGfMwD/TJpSfxGr5g9P
Ytl5DRMSV+Y12kJDJHBNFt8sVM5NpAo=
=Z0zZ
-----END PGP SIGNATURE-----

--79d65ceca52770ce73e14ecdf58ae1ec71b511c9b7ca1d91c45705b1ce2e--
