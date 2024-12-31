Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48113291E;
	Tue, 31 Dec 2024 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605348; cv=none; b=dpM9iVh//gp1MIPSlB9K6XhxXQJsQoWCN4wUjRfg/0MmQltM0JeXlYe14HAcFsZD7MMqdSmZ3KM0a8bW2vH2mLES9ayen87rQDcvejNu3ib74yT4X0m34DdDFHNJPcRt8mY9H2kJN09VOt3Fow0ra4FESOAYGyd+xwctgWUCeqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605348; c=relaxed/simple;
	bh=EAQNHH/6r9U3uJVYIBbTF70SQX0U3RKDpaltiKDSXLs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=r33NmUTo4mO+8dnzxSPm5mbIPvPMGF2LMAE6nK7QGc0jtnx4OsHazVRlccEVPwBuER3conj7HRYkf2YdsmQr3okGuKjwPXVZ0MYxtccP86xIeYA4XAbtQGjGiG+9wcxc45Qs0XGCwGB318YDEvRKLUNnza5cU7tY9sENCuiB5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0z+/oGL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0z+/oGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CC7C4CED0;
	Tue, 31 Dec 2024 00:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605347;
	bh=EAQNHH/6r9U3uJVYIBbTF70SQX0U3RKDpaltiKDSXLs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s0z+/oGLrxRQV1Lbs5E2lP0zN3PnLPfA1RJsYuEXpUk/irHqwoUgQs4U3I6OeGTNt
	 IKcxEBZPeC8vAqWXN6SQqmy+owQt7+O7ttLfh8p0N8DLdgLPJlZvSZelOWf6jDCe4O
	 9OKXZXvu2Os0XLDofWL/9Is2W/eC/0GN67MpDLXRZcqs8Loxy0Qk2+YTEr4KiSxW4Y
	 2TbBZpItYFiwvL2rJ0KvifZY05DwY2sklZzfaqcgfevKf1G1D7kksYEgC62Hx/zjUK
	 Zy25n1t+xsfqQKiOOyL0lxox1KU+JL9oq1JWC+TSPqCq8avQpNDcht7gv5dk+VBQt9
	 5DRHNpCvIfuLA==
Message-ID: <6fcf5358bbace7400d35d3fac06254e6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-3-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-3-rohit.visavalia@amd.com>
Subject: Re: [PATCH 2/3] clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:35:45 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Rohit Visavalia (2024-12-26 04:20:22)
> CCF will try to adjust parent clock to set desire clock frequency of
> child clock. So if pll_ref is not a fixed-clock then while setting rate
> of enc/dec clocks pll_ref may get change, which may make VCU malfunction.
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index f294a2398cb4..c3a4df7e325a 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -550,7 +550,7 @@ static int xvcu_register_clock_provider(struct xvcu_d=
evice *xvcu)
>                 return PTR_ERR(hw);
>         xvcu->pll_post =3D hw;
> =20
> -       parent_data[0].fw_name =3D "pll_ref";
> +       parent_data[0].fw_name =3D "dummy_name";

"dummy_name" isn't part of the binding. It sounds like you want to not
set CLK_SET_RATE_PARENT flag sometimes?

>         parent_data[1].hw =3D xvcu->pll_post;
> =20
>         hws[CLK_XVCU_ENC_CORE] =3D
