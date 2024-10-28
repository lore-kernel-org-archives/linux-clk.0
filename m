Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9A1885B8
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 23:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730159254; cv=none; b=tvcY8NakDlAYWMF2wzKyTsN2W4fCTQv00CGMlSge0Q95qSNCMmgJXw8WvOG2yXWT5q8G1nA3pbX3x6jE4MQKwAn2soByqqhwc8Gxbb/+AjLqBklhsm+2uTwNoBy96I1TJo0m+m8wCAmeEPxEzgiMBFr4zR/buBWQc/QKRSFD8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730159254; c=relaxed/simple;
	bh=0OVvmmzo8isp8gGYrRSQzcabdfiJ2FUcOWWtwOqO8Ao=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=h1/App5reVgJ+Q05g2a9Jlp7dxYWa6MFfZrOJOngAevUYdj6OGNF350rdTOP1ewSV2AilGt9YAQprpYsdfZOnLrdpGt4XfHiP3gNdm8odg7gCxUzB/fLz7NVDGkkHmH8MlDrwJGD4QPoMolxMegwWiPOBgL0Sz1ZxTTOBwTn9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCyDpdDN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCyDpdDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEB5C4CEC3;
	Mon, 28 Oct 2024 23:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730159254;
	bh=0OVvmmzo8isp8gGYrRSQzcabdfiJ2FUcOWWtwOqO8Ao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nCyDpdDNqH96s7mVutBWlFC+69mzbfzMVA5RjDJ37TOkORj9cOlKSFDtmlCot3Plp
	 SAx9adhQkgNUg2XGTg+FTaOku+QugoH34HW11oFgmKMVyZ14GemuQ+XkbYE3A8WRV+
	 tQ+xn3noNbTHLfuJa/+CqLTFGQRENdybg7yEm+3TCD1U3A8/G4ktFUXeFjQ8SaFLsn
	 iM8GLyBSfSAV/mcGPnDNw8p1fcqB7IB7QDaWyuwt172EJJWBTzmvlbQPsJY0VinlGC
	 xFuwXE14mEGWFmQoqkQ/VReTtq3xQcQuvU6tL0mrZ92hapaRD+K3a+2aplqb5KFa3s
	 QWwaMfqiireIQ==
Message-ID: <c78678240e4cffb02ab039e9351c54af.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023145146.13130-1-zichenxie0106@gmail.com>
References: <20241023145146.13130-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH v3] clk: sophgo: avoid integer overflow in sg2042_pll_recalc_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, zzjas98@gmail.com, chenyuan0y@gmail.com, Zichen Xie <zichenxie0106@gmail.com>
To: Gax-c <zichenxie0106@gmail.com>, dan.carpenter@linaro.org, inochiama@outlook.com, mturquette@baylibre.com, nathan@kernel.org, unicorn_wang@outlook.com
Date: Mon, 28 Oct 2024 16:47:32 -0700
User-Agent: alot/0.10

Quoting Gax-c (2024-10-23 07:51:47)
> From: Zichen Xie <zichenxie0106@gmail.com>
>=20
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
>=20
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---

Applied to clk-next
