Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7AA44AB80;
	Tue, 18 Aug 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049317; cv=none; b=hVpbPyfS1RTGMXcgx9jziY49KQq4NRgj5wS3f5RiPcAzFIn4WFDZUjKcF9SBISZHy35EjIfHPj/mpgAmQo2EHSjwWW05zmNSISleJkW07j6L6LDpRQevCtGO8LWtx/CajCAbFq+B0Z6W1kpp3J0IJa7leKILNP3w45GpEBQdl6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049317; c=relaxed/simple;
	bh=MIASSTkA70ZHW8I6wen7XhjmbLDmA5ubM+T80MlNnJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qqtAw4GoJ0ykgWkNW2vT49dIKZ0tJ33Q2QbEJxp/nqk8HgvZtnPgJzsGjQG3oA8Mb17BGufxOtKBM7Lfl8Jref4kNeRwjTACYhA9XzsJqUBk8CHTPaliGSKe9d7GUPG4CdQwfkTKa1Pjf0TagTMP8FSPfo/Y0THzyNSCJV/Fnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G27fLp3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G27fLp3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA6B1F000E9;
	Tue, 18 Aug 2026 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049316;
	bh=MIASSTkA70ZHW8I6wen7XhjmbLDmA5ubM+T80MlNnJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G27fLp3UY9rqD9xlsKmIR3wj70plRBuJKQ2B3NPTIJ2Ya7XAynF9dfgPtAZBBPmE6
	 XAGGGV4xvD9AzXImlR3A/u9libjhjZin03lGKgkIyIFPl56rty9ylX08MWpde38Xbt
	 VSH1hAeky8LpZVnJemeSwCyCt0MNqF5GyumiexCHY+9ZvmDU8WJa4IokmD4LDO3ndo
	 9+ntZ+QURCTK40bxGm7mwRMaFAtlUF+4LVv9G2eB6+FAPzE7qQo0CasAY5V9Sso+cT
	 pTwgU2dcifh+VcmuqsjMr05ZKI82z0xbmw65teXFK10wxpSNeTQK5fmPVMdZh000sR
	 sa7E/aaKAdjsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] dt-bindings: arm: add Ambarella CV75 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-1-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-1-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:35:15 +0000
Message-Id: <20260818103515.CEA6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Add the Ambarella vendor prefix and CV75 EVK board compatible for the
> initial SoC bring-up.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D1

