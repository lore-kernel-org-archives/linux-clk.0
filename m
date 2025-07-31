Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC259A921;
	Thu, 31 Jul 2025 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753980354; cv=none; b=FE9KmKIVOaboKHOkJZgiM8pAAT7UWHdC5YJPkIgBg/+HKe7hFrQcxAQ+BwbgSfBZXSkhkZ3d22IW93keH80QDt/3NWvwkriI9hfl4gyZuMNT6K+H4V9zVx/dWd0QVOitTmvbXqh6V1Fu8bfmpGJxPmpV/yLUtvV+GWOUXfPUa6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753980354; c=relaxed/simple;
	bh=SJczIBKf58p8fWy5tLAGEcT+vxfqpb7u7WWqnALnrQY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bxn71xH/1PcxnrjP9UKVHHA1ZmnHqy97OD31gEp+iiy3LDlV1NnBDaGVc8PVMJQJhJ76jD0xd8u2AvQ63sCoYIay4FCio85dNhLT+w8goBOdX8mreSl1s+NcYeEOjbcl2uZRuFYvPoO2y/WRJ+7iPTJz2GxKPNIlYHgldNiKL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9d95se9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9d95se9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D19CC4CEEF;
	Thu, 31 Jul 2025 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753980354;
	bh=SJczIBKf58p8fWy5tLAGEcT+vxfqpb7u7WWqnALnrQY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U9d95se9SF+ha5QrduNx9gwIaunq5uNtt4gDNt7KWM3VS2GHtyg4h7MukrWxwdEB5
	 Jac7JgEAyaUTvGJ+P6R3XTe6cbwVKWDEu/vMMnbjnATBUNM9l5JqtCEmgzZTTaGTnp
	 NrgBvGnh4rdMKMm6NDkzDfU0DW2GE1wId92D4+sr0UFPC/S63d7jqk90bBi1DQ5aDn
	 pmXoPh491Zo5Db75xkaIbl9wDglpBj9J2G/CBy/pfV9vNhkeheAKv5yaXrFYTss6Ii
	 zGKPwx4NXk/bS8nUR2Zlu9jGHMzVSPx12NjLHHF+bVXbbn1lqNG/oSkO8t3hz39QFy
	 e51ldbbXcShww==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-add_fault_tolerance_to_of_clk_hw_onecell_get-v1-1-886214fab4a7@amlogic.com>
References: <20250731-add_fault_tolerance_to_of_clk_hw_onecell_get-v1-1-886214fab4a7@amlogic.com>
Subject: Re: [PATCH] clk: Add fault tolerance to of_clk_hw_onecell_get()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>, Michael Turquette <mturquette@baylibre.com>, chuan.liu@amlogic.com
Date: Thu, 31 Jul 2025 09:45:53 -0700
Message-ID: <175398035351.3513.14541914855277799230@lazor>
User-Agent: alot/0.11

Quoting Chuan Liu via B4 Relay (2025-07-31 05:39:58)
> From: Chuan Liu <chuan.liu@amlogic.com>
>=20
> In specific cases, even a clk_provider managing only a single clock may
> reference of_clk_hw_onecell_get() to access its member clocks, as seen
> in implementations like clk-scmi.
>=20
> For a clk_provider with only one clock, when calling
> of_parse_phandle_with_args(), the phandle_args->args[] members are not
> assigned. In this case, the reference to phandle_args->args[0] in
> of_clk_hw_onecell_get() becomes invalid. If phandle_args->args[0]
> initially contains a non-zero value, this will trigger an error.
>=20
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Error conditions observed:
>=20
> scmi_clk: protocol@14 {
>         reg =3D <0x14>;
>         #clock-cells =3D <0>;
> };
>=20
> phandle1: clock-controller@1 {
>         #clock-cells =3D <1>;
> }
>=20
> clock-consumer@2 {
>         assigned-clocks =3D <&phandle1 1>,
>                           <&scmi_clk>;
>         assigned-clock-rates =3D <xxx>,
>                                <xxx>;
> }
>=20
> Under these conditions, executing of_clk_set_defaults() triggers the
> error: 'of_clk_hw_onecell_get: invalid index 1'.

Please write a KUnit test.
