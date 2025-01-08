Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD31202F96;
	Wed,  8 Jan 2025 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736366663; cv=none; b=QninVBDEalQIy6uf+lezybBb60siKAzK4BkQLlU1Fs2TIWbSZOpe1yFXBKmcmPjwCWu/ZJh7wim1IAHF+/DcLQ7cscpTSL7SJy0Mb0FTNpZm8ogwz4rig3ILogDhUGkMIvpTpW1eXv7BxYjKwKvB6g0PL251tMa+fOOF5tdQffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736366663; c=relaxed/simple;
	bh=5TlP8hwegLbGDPYIjSjuygwuoJnKOwSEQHzeioJCfP8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LV2PPR4JrqaDzh9oYCJVfHvL2OeVJOJXIwjsMvMGtZvLsTOJC92EWXvHtzjpql5OZ01fDUbjN3tv1MDohOUdUsuu6dkafRtdKIuaM7gpt8Adz2q+JdvGP4wZni+yWGGgOGbBtr75aGq0hei2y8FR8eJVlhNilLBWrqlDZ8hb6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXeoBHHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXeoBHHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0178EC4CEF2;
	Wed,  8 Jan 2025 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736366663;
	bh=5TlP8hwegLbGDPYIjSjuygwuoJnKOwSEQHzeioJCfP8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sXeoBHHCfpOidbCX+MqGgYyy0VSMlOReuzt2HdXkUj6PO3gxkhHltscEFE+xgtv0e
	 GNaJp3DXqocqM7zSx5lHrG0TF8+8VvnNtf7fxzwsC0F6wkoxCECOYlgu6807Y2pI7B
	 m+heI4YuiUkpIjdGvMd36wFn3UTsoRow6e/qg11bqmtbOH4cpOZucLncDq6V2q/FnT
	 V1h5n8XPjHry2+oR/Q8OqTxScndnjriAJNpuIJU+vTdYa7DrDSv2oRZ9SeZ6AdoF2a
	 yySx296llYP5MTe7snvEntJyEq6a2TsUEjDS64xi+H4RJ8+1mNo6ZU3/IM9RfrcvYu
	 LghwzeOeNXhIw==
Message-ID: <fc8150ac954220cbbb25d018765c17f3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250108122431.3063396-1-abel.vesa@linaro.org>
References: <20250108122431.3063396-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette <mturquette@baylibre.com>
Date: Wed, 08 Jan 2025 12:04:20 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Abel Vesa (2025-01-08 04:24:31)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.14
>=20
> for you to fetch changes up to 48806be086360846bb308c5ee21fcab8405a3da7:
>=20
>   clk: imx: Apply some clks only for i.MX93 (2024-12-26 16:46:03 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
