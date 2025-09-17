Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAE223DE8;
	Wed, 17 Sep 2025 04:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758084115; cv=none; b=peclWSqJINElvHeFnePXDVgcN7f6Y7JXgOjlPLlUo9v2cQynszshXWqggDFD31ilkj/rTQRuHg7jol/3WM2TWidBVdAJX4wKYlHQVZsBXzltNIU417jIgTKXbHtY59mxpYu1Hvf4NdhBoBXwyTGAGAhKgeLOmAMCAfHZM5xnHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758084115; c=relaxed/simple;
	bh=bvYJdBIebWbbLky595Ju+Qy57cTKh3vRPO/Is9p/+As=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dNfH+kbwrx+3z3qlsrWuIhHF5ybKtE0y7bfQTwcY6Uljq5dcGKZVTJE2OFgC8ttsY/ME2pBeCEUtVhSZ50gz7pNi8C4ZBUYZc/RSsohaqQHyKbjX9O89nCQrAvY+Lp7MuLyypbT8lRHUHEUI4siCSresRamVt5G7D0n33BJrO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcFafbbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcFafbbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A74C4CEF5;
	Wed, 17 Sep 2025 04:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758084115;
	bh=bvYJdBIebWbbLky595Ju+Qy57cTKh3vRPO/Is9p/+As=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mcFafbbCaOwnq+FJ9nFCRZMI2CHdK6+1eVod2bk7RumbesBssXUt4WhxML8AfDckq
	 PXa5J/KG+mDC06mzNHF5xYnmWsTAnv53g8LFg49kU5QFrZ7xKTb9FVABfvmGGcCOzb
	 wgvTJf4yb7kKa+3hgH+paPCrxl6g2sPsvXAUqx3t/2ENk1CVRkgh7O6EXbX5Na60u/
	 gKRKs2t/XBgIeak1pZ2ZoBh2pGuyK8nqopKSO4WZmLPbBLt7KHO4GFR7jwIPhiPGJq
	 qJF3FSSD7jhreQQwp/8jLjDC598gSVLtUsq6h776OilHhMD8GSlHvLMyp3KO1V7a/J
	 OIj0MCoT1FwYQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250916074828.9677-1-abel.vesa@linaro.org>
References: <20250916074828.9677-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette <mturquette@baylibre.com>
Date: Tue, 16 Sep 2025 21:41:54 -0700
Message-ID: <175808411442.4354.16459182435931479904@lazor>
User-Agent: alot/0.11

Quoting Abel Vesa (2025-09-16 00:48:28)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.18
>=20
> for you to fetch changes up to 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857:
>=20
>   clk: imx95-blk-ctl: Save/restore registers when RPM routines are called=
 (2025-09-12 17:28:29 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
