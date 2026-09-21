Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C642CB08;
	Mon, 21 Sep 2026 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023313; cv=none; b=b99yybZDk3QNJ0d9fxKjYVRqVUvx5tQWU0m/269UnLFhjmogD2q4HTkPztDIaYAi2sF6m1J3xnItvt+KPaW4AkKAWAReVeox6yBQLWAX7+o8ykWbJuGjk7CzclvlOEDcNkwHYmTjF4FJ3GI+D/KmkrdJLfGgDgycrN2htA5Uh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023313; c=relaxed/simple;
	bh=H0PiM6jVLH1IEJPtzoz8BW5/20099viV2vGfGAgeRjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iFbKPXJkgSsxYEh5GBHW3oyxQ/GJIuNr9hTR0n3W47WcnXppAfC+gabn6sEEg6PCkLm3HX00Ra3UqvWZcGpqPwdm1SMbIZJ+qZcKCeCehLPvKW+HdM8tvaZyPmRnjJpC2jyV/Xfu0iprgh0Ba7ORD8n7rftUsdMAdnNMQPKBgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLeU38Kn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLeU38Kn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8A51F000FF;
	Mon, 21 Sep 2026 20:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023312;
	bh=exFEWHyGZXfBJxzEIKXZH2KjDMcCy2h2+BuM4gRvU8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLeU38Knxvb37Kox0PfcNNGes32srMji4mDV797mMWVoGKPaUXGAD0qdzC+HR3H/n
	 LndvUwg1x2ll8hOLcwf/CxMOLVu1dQKsbYJXsjFxLcmP30n9rESpOUnG9tckeff/jh
	 ABglASbpxw6Gp1pKKZJnBkgBa8LxffHd5LJggbwEw/DWqyfDHKQ5EpDASB1xLAkQQs
	 wHx7GXED0g7Vj4XhqdxsD6EcczAQJoORye+MXsv/0H8tN4CsVAvFThZBEDFIPg7P/H
	 3vUYOzjK4H2i3/ko+eze33jRtQLDYhPr1DYXGDJvz/jwLhIZYd7QWnHaCpri4tJDuX
	 cfiDL0G28llxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: devfreq: event: rockchip,dfi: add
 clocks to rk3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-2-43ff34ac8599@collabora.com>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-2-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 20:41:50 +0000
Message-Id: <20260921204151.DE8A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing clock constraints for rk3568-dfi
- [Medium] dt-bindings: variant conditionals fail to restrict clock-names e=
xact strings
--

commit 88c291fbc8ab68b7cfb2fa8d4a230dd27bd0f853
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588

This commit updates the Rockchip DFI binding to add clock definitions for
the rk3588 SoC. It modifies the global clock limits and introduces
conditional blocks to handle the differences between rk3399 and rk3588.

> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi=
.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 50d3fabe958d5..3450e28b40208 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -17,11 +17,18 @@ properties:
>        - rockchip,rk3588-dfi
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> =20
>    clock-names:
> +    minItems: 1
>      items:
> -      - const: pclk_ddr_mon
> +      - enum:
> +          - pclk_ddr_mon
> +          - pclk_ddr_mon_ch0
> +      - const: pclk_ddr_mon_ch1
> +      - const: pclk_ddr_mon_ch2
> +      - const: pclk_ddr_mon_ch3

[ ... ]

> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - rockchip,rk3399-dfi
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-dfi

[Severity: Medium]
Will this omission cause schema validation to be incomplete for rk3568-dfi?

The global clocks constraint was relaxed to maxItems: 4 to support rk3588,
but rk3568-dfi is omitted from these conditional blocks. Doesn't this mean
device trees for rk3568-dfi specifying up to 4 clocks will inadvertently pa=
ss
dtbs_check validation instead of being restricted to the historic maxItems:=
 1
limit?

> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names

[Severity: Medium]
Does this setup allow incorrectly named clocks to pass validation for speci=
fic
variants?

Since the global clock-names definition uses an enum for the first item,
and this conditional block only restricts maxItems: 1, a device tree using
clock-names =3D "pclk_ddr_mon_ch0" will erroneously pass validation for
rk3399-dfi. The same applies for rk3588-dfi passing with "pclk_ddr_mon".

Should the variant-specific conditional blocks override the items array
to enforce the correct fixed string (const) for that specific variant?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-rockchip-d=
fi-cleanup-v2-0-43ff34ac8599@collabora.com?part=3D2
