Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C701388873;
	Wed, 23 Sep 2026 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189122; cv=none; b=ASW+KBebv6brJb/xLsiB9YIxLG/7U/o8xI7u4fPxpOeLOqdaKXNhODd2KXPp+F8L7WhAFcTNumKKWTJWa0BO50657jSVxyYQcgVXxkhv+rQyeyd082WJ+t5Y4k4HugDUNiFFW2ojVR/R2PAd3WPVoDDlNKGofd6TKktPCnp0uoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189122; c=relaxed/simple;
	bh=69tRG4YoSxnx9N15HM6AoLF7SBuNfpJOuBExHSEESeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gn7cdySdshjE0CPrvbaQClVZclQUT/L7qaZQL/YIFQ8o3PwKeNv/Fm0tgdxph50rcK9f053UnjeBBcRBv2GME58z8P1OF2gHn6FZzPbWppnib58Pk4qFTJleixDKl2Y38/DtJfY6w6pqppThfv5yHNaZyEbMA1icFok8vWqIJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuYHBOyO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuYHBOyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32131F000FF;
	Wed, 23 Sep 2026 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189109;
	bh=69tRG4YoSxnx9N15HM6AoLF7SBuNfpJOuBExHSEESeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CuYHBOyOMPeeVSwbCXOaP/3Jzwbsl1YDvjenYlmqnMMoeiBZWjBlSj+rDZEQnj5WB
	 JkyIJZhpJtsh0alaM0P8+ZbJA5RjopKXzVFL7xUr7eLwQQR/WUh/6v7eA226puJW2S
	 Fzbu4CvAMcFwxcigCy4wc6/5cWvqY/8mRI5s5mKIxxqE2TTPaq48hkQACG40o0+MnT
	 QRHKKl7a6KH5pRSJw7JnwFT8/8cj6CIMX8qXr3bWkp/cb+RhhBv2af72Fn5XlSZLw8
	 mxznU2++002tLlkr2Z9ZftKZUM/mmYkqO2ZVr611d8eaNRMwe6Ocn+m88DYAINkWLT
	 8FcKodXeBvcJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, lee@kernel.org, vkoul@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260923-zx29clk-v12-11-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-11-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:45:08 +0000
Message-Id: <20260923184508.E32131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D11

