Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77214B8284;
	Fri, 25 Sep 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348119; cv=none; b=JODVEwlp8+2qvcxA5b215Y2x3IRhF7qHfzEdlq8g6WhKt15z812tcxSvjsEx2aGc1bpLy3FxsJZrDUvVIKiJJE0GuLnspsE7fM5+AhhDYYPU86TPTkE0j4uQ3UBcTC8IvKfVoupVRxyd9+M+WaSdd4N5+1JJcQ1l3eE9uvCs09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348119; c=relaxed/simple;
	bh=opYKHEotMRYFAlD4+KcOmyrLCKHFKVp0R5gI4jsOH6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DRk/qclIXGXB1bTk1YsWfGaZssdltB/vxjvtQDofJOGCIPv2dBmgOxMBiqwbOhzjAI3TBa8W5oX4fMdvicmkKE27miACCPHVQwHE60lGC/aqHoIPZP/0xk8v5H8OtL/JBPWlVY+9/prIk68S6qaBD/Y/F3FDUakgEivDkO5AcuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaPykenQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaPykenQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EAF1F000FF;
	Fri, 25 Sep 2026 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348110;
	bh=DGtCVwBHH9uGVSpKpNVSFCLtyHt/if/SX8EZqpJgR4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eaPykenQV13zboL/8Dz1aUz5TWQN1E6BXmjrHlAQp93iWH+7KD9XhSmzicHqmAJpB
	 UEVeNzYAdTlDiMIsAcUqs2pSTeuRkEfXxNBGwNXNwh/G85zJsGC60tryPTYbh7TTJl
	 od0xjdvaYi7IJWdwayl/ybGqFrq98O+kfp/DdA1OT0kC63lZeythuWpDhyu5dJRfz7
	 FpauC3bUyiO2djghzbi3b3AmNvB18UrGcjDjmsC6zFBO3Ju/rOikdXm78+EqSO1FQ3
	 PcHyB/7HQVg8GNmdekqw/fQJciVPRZp8E4qVNTXgH2ZW3OkgbUMDKNRI3PyuZMepjF
	 4e8a36PwR3cMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v3-3-ffbae7e020a8@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v3-3-ffbae7e020a8@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 14:55:10 +0000
Message-Id: <20260925145510.94EAF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: nuvoton: ma35d1: missing MA35D1_CLK_COUNT increment causes la=
tent OOB array write
--

commit fa4195c8a4eac6a0140746768ad2e5ab623b88e4
Author: Miquel Raynal <miquel.raynal@bootlin.com>

dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks

This commit adds PCLK3_DIV4096 and PCLK4_DIV4096 to the dt-bindings header
to describe the clock tree for WDT and WWDT muxes.

> diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-=
bindings/clock/nuvoton,ma35d1-clk.h
> index 2d6a44a7e55c4..764d837d6162a 100644
> --- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> +++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> @@ -248,5 +248,7 @@
>  #define ADC_GATE	233
>  #define EADC_DIV	234
>  #define EADC_GATE	235
> +#define PCLK3_DIV4096	236
> +#define PCLK4_DIV4096	237

[Severity: High]
Does this introduction of clock IDs 236 and 237 require a corresponding
update to MA35D1_CLK_COUNT in the clock driver?

In drivers/clk/nuvoton/clk-ma35d1.c, MA35D1_CLK_COUNT is currently hardcoded
to 236:

drivers/clk/nuvoton/clk-ma35d1.c:
#define MA35D1_CLK_COUNT        236

The driver's ma35d1_clocks_probe() function uses this count to allocate the
hardware clock pointer array:

drivers/clk/nuvoton/clk-ma35d1.c:ma35d1_clocks_probe()
    ma35d1_hw_data =3D devm_kzalloc(dev,
                                  struct_size(ma35d1_hw_data, hws, MA35D1_C=
LK_COUNT),
                                  GFP_KERNEL);

If subsequent patches instantiate these new fixed factor clocks and write to
hws[PCLK3_DIV4096] or hws[PCLK4_DIV4096], it appears it will write out of
bounds into adjacent heap memory because the array only holds 236 elements
(indices 0 to 235).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-perso-ma35=
d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com?part=3D3
