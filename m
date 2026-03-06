Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586336E49D
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772794335; cv=none; b=DS/ah12ohMHFZ34pMx+5zHO1rJbG5D6pLFJp76BBB8vrdrtno0GiRwuFoSzz3Ipqp1X/0+VLsdde+llVnSjQzSl+FY9jq1xXpMWAoziDt4KzBwRbB8sUhQYXa81bvRZp9WjGiMBi5QwqoSwiVCRE9qg82RumOQarBKzz4bXnZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772794335; c=relaxed/simple;
	bh=z87XzOv4holHp8moQ6B2iNBKmHotGCtKyqh2FtPJgBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLfHH5+WWcvh+p3Vus37qJQF63Xe8zfxRtZxITIol0ILAILwFG2lyeIdOGq6eXj5obZpiUhEsHidxfnFBHrjX3T0VCgBymUyfXjcW1AiYC7cb2Sad0kSTcbJaP8k05Skcc7Yrr4vg2v9Nq000N2hCRyedLpYar0CDOcIv7yPZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kiW8/+LU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kiW8/+LU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=z87XzOv4holHp8moQ6B2iNBKmHotGCtKyqh2FtPJgBU=; b=kiW8/+LUHH2XugnqErUsbIIF0o
	A2dFUWHizPpuMlDsRXzQS8ZeMPyP6YCM+piQ872Jrm6T9ujfs5Il7t83KefVt3kkbR4glqedAtDGU
	023Dl7TL1UE5wEuFl4O8H1kmpaUpOT27fwOpQ78quObcDFljYiE7uwufBE3qnG1aGLclXeifqDTHe
	TW8V8gz+g9JYJ54HPOHgyP6QeUbjeHto4rS5MhPNzosWfLc1VBuYwQFLiJX2HTZcCN7aID/9qTFi+
	ByJtJe33wE+Y56Qxdva9+Oni6nvmHlXSZNQE5IwkDalIj39w1wE96eOlXt54SgFp0p6okNAcFGde0
	aZQMrQVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PCIe pipe clock gates
Date: Fri, 06 Mar 2026 11:52:06 +0100
Message-ID: <3742329.R56niFO833@phil>
In-Reply-To: <1772698011-145625-1-git-send-email-shawn.lin@rock-chips.com>
References: <1772698011-145625-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Shawn,

Am Donnerstag, 5. M=C3=A4rz 2026, 09:06:51 Mitteleurop=C3=A4ische Normalzei=
t schrieb Shawn Lin:
> The PCIe pipe clocks are currently left as orphan clocks and remain
> enabled indefinitely, which is suboptimal. Add the missing clock gates
> so the PCIe driver can explicitly manage them when not in use.
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> Hi Heiko,
>=20
> This patch should be considered only after David's patch[1] is merged,
> otherwise it breaks PCIe on RK3566/RK3568 due to clk_disable_unused().

This would also break compatiblity with old devicetrees.

The devicetree used by the kernel can also be embedded for example
in an already installed u-boot and handed to the kernel from there.
You cannot expect board devicetrees and the kernel image to be updated
in lockstep.

We also sort of guarantee this backwards compatiblity - old DTB with
newer kernel.

The solution is to add a CLK_IGNORE_UNUSED flag (but not CLK_IS_CRITICAL)
to the newly added gate.

This lets the clock stay and keeps the original behavious on old DTBs,
but also allows the PCIe driver in newer kernels to turn off the clock
if it wants to.

Thanks
Heiko



