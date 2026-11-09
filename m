Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184948;
	b=CsoeGJC9s7DX9j4+6VkvZfJA2vzxP1L9kW3MkOssLXiFCdNrPKuCnJghTY96QOaJOkVl
	 lcJ6bertvFRGXmTDquUTKnBsa7z+N2Jf7D6Z/DtYXr01SQIGSkRJCYkhvoRL9ok0hnqh6
	 wntRugV3IIQdKGxG8sVFaY8EQYuLwgiqmMVQgoM5wy/EsqiSW/xb9g9gvjampNwn7tT5V
	 gJwXG3KTXYw8DdHhYI4dth4pTS1CJYw7zad7pqslrTmWxUQmnGRiJPB5sV7uSbLz1ZFC5
	 QR0B6j2EsSy3B940g3dRmg1/odMwzafeXIU3CFY2i5SWcoPKYqRq7IDxh3R5PYkQATw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184948;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2RVXShmKXKXTfRwY/qtjvI+5QvmgEuma1AdOdj2ZXWg=;
	b=E/n9WKpOO0S4e28rET7cM+P786oq0t/x6lqQLEwzzp2eE7iz/CPrgaqDqmEC+L3YNJB0
	 dwsw974xEH8RrzP08vivd2fN41TBFzyQsNoPesbCNxGHqulf8ze7/57mRZS2LRyQSK2F+
	 9outqBhMGkZMSKpoer0uDNFmRHIcWLyS2jrHGIR8WXgiS+EFD34XKjRXSpfhBwOtZz+7r
	 5NTdW80FdF+2aUxG7rxsvOXIC2OMLR/a+Z5K8HFcKZj+jzQLEdCttQjUNKmN9envY+2Ph
	 qxU2xT5lHywS5pvAHH4EWidhnfJoozBX9ymf32BxTmnZa0bA/DdyKSi/qORAJobx6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TatmlMyc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8D606A31C;
	Mon,  9 Nov 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TatmlMyc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E22F1F0089F;
	Mon,  9 Nov 2026 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184947;
	bh=2RVXShmKXKXTfRwY/qtjvI+5QvmgEuma1AdOdj2ZXWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TatmlMycOJmSg3wl++Ss5hrxJ7AjoWILC9aO7RZIa6DrFgiCRnVs3/clUifrUxJfN
	 iOSnUhRrH1t+xVeGCpm2P4h1nNfTWXDCRfwnJ8kaWWPKPs/AKD+EyxFPjp8fWFHETE
	 E88v+ba0ltdDFnF7KDSHcmNmBlrsGMKdF5nJ2/+kXIgVLUk8mYbyb841YZH3QQ7W1a
	 ZflTgfKJY6CAD5S8TE/gQj4z8R+LtUc2JByN0+SKzN2AWSPadYnnB/lVSYAN5lQGyS
	 61KsKbzQptp2Gu/NJ4Rko9jBtsxGgLLdx+Jq0umjIZlunZ3brDfhqZE3K/1PpOOHLK
	 FpIsWmXS53sCw==
Message-ID: <sashiko-outbox-204243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-halliday-clk-v1-4-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-4-20c3ba8be0bd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:42:26 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: qcom: qcom_cc_clk_hw_get() returns -EINVAL for protected
  clk_ref
--

commit fa96d79cffd1dd43d975e203514d31dbe847897b
Author: Stanislav Aleksandrov <lightofmysoul@gmail.com>

clk: qcom: common: Register clk_ref clocks from qcom_cc_desc

This commit adds support for registering clk_ref clocks from a
qcom_cc_desc descriptor alongside standard regmap clocks in
qcom_cc_really_probe().

> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 08fd62ac780d3..c767fa3d02079 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
[ ... ]
> @@ -247,6 +250,9 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_ph=
andle_args *clkspec,
>  	struct qcom_cc *cc =3D data;
>  	unsigned int idx =3D clkspec->args[0];
> =20
> +	if (idx < cc->num_clk_refs && cc->clk_refs[idx])
> +		return &cc->clk_refs[idx]->hw;
> +
>  	if (idx >=3D cc->num_rclks) {
>  		pr_err("%s: invalid index %u\n", __func__, idx);
>  		return ERR_PTR(-EINVAL);

[Severity: Medium]
Does qcom_cc_clk_hw_get() return ERR_PTR(-EINVAL) instead of NULL for a
protected clk_ref when idx >=3D cc->num_rclks?

qcom_cc_register_clk_refs() skips entries listed in protected-clocks,
leaving cc->clk_refs[idx] NULL so consumers receive a no-op NULL clock.
However, when cc->num_clk_refs > cc->num_rclks and a protected clk_ref
has idx >=3D cc->num_rclks, lookup falls through to the idx >=3D cc->num_rc=
lks
check, logs an invalid index error, and fails the consumer's clk_get()
with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-c=
lk-v1-0-20c3ba8be0bd@gmail.com?part=3D4
