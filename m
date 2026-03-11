Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6A32D0E3
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241621; cv=none; b=NLcNkPWy7oruUzHjXfihAm+pOPq0zjtLkfleUDvanYKd/N2otw26ki5OYfkn12iyy9CTxLkHGpPhJn6JrCg7EdR5j5rhoFMcRG8MpPOsxtMWAW319FsUizTPaNuls9ohPIv32lrTRMxL9mr4EQQqWQAdDttELf15Rema7oGFiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241621; c=relaxed/simple;
	bh=IdxTmoN8eV9XdykyGPCgHBaOAlPELS+eBRDUCEUQl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+LBJ1iKS/HOltsxnQT0iEUjKrarJgUNpK1Xgh1CmQHszRevHFtR7yDoEQknAb+WXK1i33I7zy5ddc0YtWNDxYtY/GAbTlzURWl5iYBsk7bVJwAFG8GiE5/Ncp8kn+874gYDWBtF56eiDHd6TDwJdyPlDXAhWvlW1DFee9Yw0/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L8jzkFdr; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L8jzkFdr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dknpLbwPC6M9r55ZzYVfKb09gY6bN4LTaa3m33L/TiY=; b=L8jzkFdrQk/c7X8SpYZS95Pc42
	xgsy/wKAVxGuLTLf8VwXoKSfRnjFcQ3NuB2svPosKPdvwrXMjVhkBembMnx3oMP6OdjZmCK163EKd
	2JmUjqlvYKXw3JAIOM5yOfAsM/3EYzf5rifM6Ss7M7fcYHY6pextIR264ATw9VhMZ/gTJG1BCXeGz
	3XwDpYGprzsgTIF4Wa2mXi3qG3H4eNwOds23xzVP7Y0wYubRQGRw7BRUcXGEJXbxDXyezeWmCA6jl
	pdrKpRMYh5qjd+oOZI6ezD5KuRoIiB9Qcs+xYTzo9LT0yu+2YKe5rHavDpQaw0taTF6iqlky0ALv8
	0A0cHf/A==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KkM-0000PO-1D;
	Wed, 11 Mar 2026 15:41:14 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KkL-0002q6-2d;
	Wed, 11 Mar 2026 15:41:13 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH 6/6] arm64: dts: imx93-tqma9131-mba91xxca: Add LVDS display
 overlay
Date: Wed, 11 Mar 2026 15:41:12 +0100
Message-ID: <4338185.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311143217.1700704-8-alexander.stein@ew.tq-group.com>
References:
 <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-8-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

Am Mittwoch, 11. M=E4rz 2026, 15:32:10 CET schrieb Alexander Stein:
> This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
> on MBa91xxCA.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Please disregard this patch. I accidentally sent this obsolete one, which h=
as
a typo in the subject.

Thanks and best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 64fe9487b1003..60aafadce0725 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,7 +418,9 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx91-11x11-frdm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca.dtb
> =20
> +imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs :=3D imx91-tqma9131-mba91=
xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
>  imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs :=3D imx91-tqma9131-mba91x=
xca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
> =20
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb.dtb
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


