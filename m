Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA173BF660;
	Sun, 27 Sep 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542446; cv=none; b=daicecJHFmFvpeN1Ul3uMMCbRubW9bLs0Hzq/x42Cbi6cejgLch7j/VjK6WeIYWBWZl9Uuh3C3/SJTc9CzfYIU0LFNGyASUroOug6uVFeN3FbF/S99C7DAfxxguumIwo7mj9W/EpM088HGHO4EHLaTZdbYcUnvr63vN3b/R1p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542446; c=relaxed/simple;
	bh=MJ0UPL2cAeDVvEB22aEInX0vQVCBJDel13GRgMQz/dY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HXUozUCD6wLa8//8SI9e3PTvueEIUtaii3tyYDeVfATUb1hEhd8tVy1e+kBugkfHGef34r6xFFGrkRLcdHU74CCSw4NnFaOOc2BsmzpyxWGmp6PTknB6NlP5V0VAEZrMBn2JgAwy+IIMlDBKhMdFlJgKx1Gztm39fSbf7GcpYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqHTx+Bc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqHTx+Bc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481791F000FF;
	Sun, 27 Sep 2026 20:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542444;
	bh=MJ0UPL2cAeDVvEB22aEInX0vQVCBJDel13GRgMQz/dY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqHTx+Bcb0MuHGr5lgB29gqz0Mh1Eu942Oc0v99UJnUmBmFGqre0NHQpO/EpDx1C5
	 7RZytSNLPktLyaO/almh8mxI7u2xqeBQQ/QQ0KzdXLhH+0XNj5hV4HRAErozaVJclk
	 WwJqS/0GUA10TfBYLqYSnwYfp8dxdtacfgZJ5BQBzBDx8MXxMiwcPGMpeArn5SG0Jm
	 uoWG6WDk9eDW4gCDf/5nQFJgiIAyK3iMyD5hkShwNAAbA69g21QsPEfbcxRKWeDflv
	 GVBdjK++ECVI205ng+XqDvQaXhB9JhlODsqiVSdczItyl17uxF8+8AsY0YJLfBkGhP
	 p8cauD3zPa69w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 02/13] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260927205055.185366-1-stefandoesinger@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927205055.185366-1-stefandoesinger@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:54:03 +0000
Message-Id: <20260927205404.481791F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D2

