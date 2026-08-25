Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDE3CF02D;
	Tue, 25 Aug 2026 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693359; cv=none; b=ltIiRh1e3lvY3LaeC6+imH60pSdTu/Fpu3Mk9dJsiNOpGw+vyQuHsGkdgd6eUq/FGZWvj/05pwK/0dFqo6BWTsrHJSmj+X2mCKO6cbht3w6laUYwvgDv7+YlyFrM5fxbGRGuaME6Ai+ogip3YTf1gcSMgnO3AvnoJYPzCNjkELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693359; c=relaxed/simple;
	bh=2iozFZtdIl/TKicvL7HVAobgaKbBMDb8eRHLkQ4R22E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S8rCSFqjftfZCiPWrIf5GytxdRz+lb06xIPBsbKDPIwdkfHCA5aQzehK0/lHZE+BIzkMeRRivsAzQvbxGzAEOdUTrQm08fWq2hHzC4han//4FeYq/az16V9xV9NwtdyOXKFBWJ9VvSockV0GEbe/tO8vZ/ULOdxWChaeO8jtc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUTtHF40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUTtHF40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CB91F000E9;
	Tue, 25 Aug 2026 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693358;
	bh=2iozFZtdIl/TKicvL7HVAobgaKbBMDb8eRHLkQ4R22E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gUTtHF40akrSsShv09VA/vHpcn7FArzOO5JeCSryFHocSQt8eGMWwYkNGnl3O+omr
	 Pi38QX9thGw+8yMWgi9/i0xJEcL9pJ6icG1E3jJCVzktmDYbwkoNyfebXSuPmXXJm8
	 yOu/9QL+ecXk4oS5NkvVLRFDFUiqd2PB60DbdAEmlQ9/J9MzIgqOqTfE4h2n90+TqL
	 Q5Of2u8DGD68veZX5BOSNpl0wn4+s/0wtiuQWbT46HcTtbyavkC838GHw29wBd6D0o
	 vPFK14LAS3NZdW4sKVq47323RDlF9ay8ueIU+EXOWCbavUnjyzzqODWZ9yAHwXssy7
	 CsWHEmf77OPxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, olteanv@gmail.com, linux-phy@lists.infradead.org, lee@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260826-zx29clk-v11-2-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-2-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:29:17 +0000
Message-Id: <20260825212917.A3CB91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> I don't know much about the hwlocks yet other than that they exist, so
> there is no header yet adding meaning to their indices. Presumably that
> meaning doesn't exist in hardware and is de facto defined by ZTE's
> firmware blobs running on the rprocs.
>=20
> The zte-zx297520v3-crm driver will instantiate separate MFD children for
> clocks and resets, which are handled by separate clock and reset
> drivers.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D2

