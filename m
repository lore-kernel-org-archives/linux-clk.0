Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D63A8BEC;
	Thu, 11 Apr 2024 03:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806586; cv=none; b=oLvE3WYhnT1gm6EQgGrxg7+RV4N9DEeKFoAL0MHBJdxgeaQTbvHk8V/trjT6v+4Qt0A7M+rSWEVAWFdVN8GJHUwwhMGXi/BZ5P1UMMQoN5BinWWn6SeEEdv+aglu5nDNuIT6xea6iwMMMVsItfL8MAV2YPYK4mwm7WWybL/JUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806586; c=relaxed/simple;
	bh=DabkDxBdM8RytLR9ORzLTQGfpOYEuPiwuMASCGTuNk8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LIycOB9QfYh3kVh1HaRROxI3rJQ0n+ZZo9RbtjjjbmDDqivxd/bDNe48RZKfhFdEISL/xmPVlxqrV6pLueeWmCCk6E20O/YhLx/wWeIP9QrCK5KoBlNTU9ruFsFJfv4VS7q7hmsy4byR11ToxiPDtHzp70doCogXTwvFaNInjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0s2dhA0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0s2dhA0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0A6C433C7;
	Thu, 11 Apr 2024 03:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712806585;
	bh=DabkDxBdM8RytLR9ORzLTQGfpOYEuPiwuMASCGTuNk8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y0s2dhA09UwgTyYhJfqlRqZji+Zh/91gdJITb36KboIJoAjK/2O5dBtFB3uCNQYBT
	 qSTPhQVvNDuHFq7AJnFDoSgrLj3Mp65PBEkj9EklK37Ip1aOTkYAjmTGgCBl8wJNLT
	 dV8ZwT3GgouFGXbKXOsBm+dS8nRUO/A5w2GF7RizZVIPREFlR+K9VTwA/aOn6sFvOz
	 /E97uOVxwm1kvMq52QSysVEFc8/11sPtJQqorUwpYDISVgeQfGyatw5w+XgD9F73IB
	 aTYMrSIz5DGVhmhLfca2kwCHBG2OLvqi4ZFHMDwQrkaYH9DBynxV+6jdh+eN5hhxOD
	 zdOPGIoXYAAbg==
Message-ID: <c2edfe004bf082b0d08073670a0a3e7b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <562a0da8d7874a02a324687c152c87a1549924bd.1712399981.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org> <562a0da8d7874a02a324687c152c87a1549924bd.1712399981.git.lorenzo@kernel.org>
Subject: Re: [PATCH v2 3/4] clk: en7523: Add en_clk_soc_data data structure
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 10 Apr 2024 20:36:23 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-04-06 03:43:43)
> Introduce en_clk_soc_data data structure in order to define multiple
> clk_ops for each supported SoC. This is a preliminary patch to
> introduce EN7581 clock support.
>=20
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
