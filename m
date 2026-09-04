Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FD3E63A3;
	Fri,  4 Sep 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539324; cv=none; b=GRsjrxbf9d4eiQHG5aArszc5vIIUNW8ZlqtgrZp62k4F3UzV/EqRhYpw4DAeWb/LwtXBoOuP3cMzwJRwLSc0304kPdcnsqDmA31SnhqEiHDwA2HFDpDkE7YDTEwjzi9PrlJNl+yQWugF1Jx3yXJN1wefNIdOpm95PXmhI8IdsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539324; c=relaxed/simple;
	bh=bnHmm8/g8qQyusWdPF+vMOpmdS5Y7dzmJpwE4+xZ0Y4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2KBEnMPesPy7L7/6GHn5cc1uWxUgUwRWq2OdNr653+0uaU3CbbpYv8iEnflXieXTe0IYEGeCiKhEWKYCCtCOqlZ+icnyV8Cb1bG4QRYnDjUZ5E4OwgwhIsTlNfOUUOz2Sp1dPOQrWogcqE5wYTr3S2IAL22r6GM56JrsTfr4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enL5Kgv5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enL5Kgv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772761F00A3D;
	Fri,  4 Sep 2026 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788539322;
	bh=XcBcw0aJKgYgIKS3L7Fa4TsjOnl/vy1qRLF0Di3wBE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enL5Kgv5P+E5iPYAeBua6+1NZKo8PIS5gLPr92tcKeVcwoGEuYQXtcvva50tj3ijV
	 qTcWQ1M+f0zRI7UZIsf7ppv5YFcS3ees2SUDyqnWcEvVDi8M6haGa7Mh87FSpA+z+A
	 qG4P0TVcy+3+wPM7CJT8gnxaQOAFFhUkhKXFAfMQOC4hp4r3uMNa0hxy40aVXQycRC
	 IaFDxE7/OBong+MLyvbHNCcOxRuFEquSbJYPI+u7Bk7bU7maWGcc/C3K/Hmvo6ALdx
	 BzpZ4xZ3yaGRvvP8iTOZXoStCcH1cDlPPezwT2Mxi9Ut6CnvJYFE9wIxHsBi6MiF4K
	 uggmEcCffiNfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 26/27] clk: mediatek: Add MT8189 scp clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-26-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-26-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:28:42 +0000
Message-Id: <20260904162842.772761F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect register offsets defined in `scp_cg_regs` for SCP SPI cl=
ocks break clock operations and status reporting.
--

commit 761866944873dbacd9da82a6105c5dd33a62520c
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

    clk: mediatek: Add MT8189 scp clock support
   =20
    Add support for the MT8189 scp clock controller,
    which provides clock gate control for System Control Processor.

> diff --git a/drivers/clk/mediatek/clk-mt8189-scp.c b/drivers/clk/mediatek=
/clk-mt8189-scp.c
> new file mode 100644
> index 0000000000000..75f087d819c08
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-scp.c
> @@ -0,0 +1,76 @@
[ ... ]
> +static const struct mtk_gate_regs scp_cg_regs =3D {
> +	.set_ofs =3D 0x4,
> +	.clr_ofs =3D 0x8,
> +	.sta_ofs =3D 0x4,
> +};
> +
> +#define GATE_SCP(_id, _name, _parent, _shift)		\
> +	GATE_MTK(_id, _name, _parent, &scp_cg_regs, _shift, &mtk_clk_gate_ops_s=
etclr_inv)
> +
> +static const struct mtk_gate scp_clks[] =3D {
> +	GATE_SCP(CLK_SCP_SET_SPI0, "scp_set_spi0", "clk26m", 0),
> +	GATE_SCP(CLK_SCP_SET_SPI1, "scp_set_spi1", "clk26m", 1),
> +};

[Severity: High]
Does the scp_cg_regs struct assign the correct register offsets for the SCP
SPI clocks?

It appears that sta_ofs is set identically to set_ofs at 0x4, which is
typically a write-only W1S register in MediaTek SET/CLR clock gates. If the
status offset points to a write-only register, will the common clock
framework read invalid data when checking the status of scp_set_spi0 and
scp_set_spi1 during late init?

This could break state tracking, preventing clk_disable_unused() from
correctly powering off these clocks.

Additionally, the set_ofs and clr_ofs are defined as 0x4 and 0x8 here, but
are inverted compared to scp_iic_cg_regs below.

> +static const struct mtk_gate_regs scp_iic_cg_regs =3D {
> +	.set_ofs =3D 0x8,
> +	.clr_ofs =3D 0x4,
> +	.sta_ofs =3D 0x0,
> +};
> +
> +#define GATE_SCP_IIC(_id, _name, _parent, _shift)	\
> +	GATE_MTK(_id, _name, _parent, &scp_iic_cg_regs, _shift, &mtk_clk_gate_o=
ps_setclr_inv)

[Severity: High]
Since GATE_SCP and GATE_SCP_IIC both use mtk_clk_gate_ops_setclr_inv,
doesn't this mean that enabling an SPI clock writes to 0x4, while enabling
an IIC clock writes to 0x8?

Could this swap in offsets cause the SPI clocks to remain disabled when
requested by consumer drivers, breaking clock operations deterministically
when clk_prepare_enable() or clk_disable_unprepare() are called on
scp_set_spi0 or scp_set_spi1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D26
