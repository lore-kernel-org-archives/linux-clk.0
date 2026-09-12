Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A341A795
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219448; cv=none; b=N44jbpOo7i0fg3cDAMQPJ8acPYbxJ+CACbbLkWN3XEqJlzAGOrebuPeGfpJflspytm8n2gZcloROdCWrphadZDOlCvmy8boN+lu3GnqnK0p/5Y0zRBceJisiT903m9j7J+kuWJW6rnNWoEsExuwqx6O2mxnrQWPjV63HsezXnx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219448; c=relaxed/simple;
	bh=JTyASCAu517YlvfZY5ZI/dqkLMEghCTv2qlMzVaCWvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n80XTxOjE9Wu1f5FZDTM3AVbvpNOF5yzN8u4bUj96xylYIIlBeFSflQrXEcw2QgZdErW5kSl/ee4cLIagwGEmwE/cW0j/4TwSZ+S/ZSwVezT3oiWwnUMyTWdXA5t7s6UjeXGKGRa9D91z9JqQ/yMJ7nPA+QM2iudEI7slSJ+y7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOODqbxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOODqbxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91AF1F000FF;
	Sat, 12 Sep 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789219447;
	bh=qYYqvT08RDsYBYYpyByeW0ZxRH62HSfMH/Zx4W4XIFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOODqbxKg/MAEJWQTY2AixMnokLd++2KNlw4sngAz/+fyfag36AQY5tog5xAOubOR
	 qepAxRdKvMpr8V3uwrf+7xF1IKwIE7mNlzSkfI5aDoajdxbYlH6/mnivnHAarFs0Dt
	 8R7Pq+KL6ze7UZITVaRGqoeYL5JyUlpmU+s6pvvYFXP1earUTFmtqsf5HXVrlB4pZY
	 LNOvmjsGJb5xUaS6dzVJxk0/IRa/rmAFc348xDKNFsHwXGy077wyCxJLUTv8gYAF5d
	 vRuGD4iSILpmcQ5b/+FQBhcyQUvwDJySNs0dHkC2LSaV0yRVyaRm5+WBJa3tc8HjZF
	 Q13l6A5HcUuYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clk: qcom: ipq-cmn-pll: Assign .num before accessing
 .hws
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aamir Ahmed" <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <AS8P251MB000187BDFAD98A21F4C356E9C8BD2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB000187BDFAD98A21F4C356E9C8BD2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 13:24:06 +0000
Message-Id: <20260912132406.C91AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Wrong teardown order due to mixed devm and manual cleanup crea=
tes a use-after-free race condition.
--

commit 30f995bdacca1d3339ef8960a158a04565cea6d6
Author: Aamir Ahmed <elb12345@hotmail.co.uk>
clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws

hw_data->hws[] is annotated with __counted_by(num), so hw_data->num
must hold the element count before the array is accessed. This commit
moves the assignment to right after the allocation to avoid out-of-bounds
accesses during registration and cleanup.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index dafe8c1738df8..a9abad9ff4e57 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
[ ... ]
> @@ -406,7 +408,6 @@ static int ipq_cmn_pll_register_clks(struct platform_=
device *pdev)
>  	 * is configured to 12 GHZ by DT property assigned-clock-rates-u64.
>  	 */
>  	hw_data->hws[CMN_PLL_CLK] =3D cmn_pll_hw;
> -	hw_data->num =3D num_clks + 1;
> =20
>  	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data=
);

[Severity: Critical]
This is a pre-existing issue, but does mixing devm and manual cleanup here
create a use-after-free race condition during unbind?

In ipq_cmn_pll_clk_remove(), the driver manually unregisters the child
clocks:

static void ipq_cmn_pll_clk_remove(struct platform_device *pdev)
{
	...
	for (i =3D 0; i < hw_data->num; i++) {
		if (i !=3D CMN_PLL_CLK)
			clk_hw_unregister(hw_data->hws[i]);
	}
}

This manual unregistration frees the underlying clk_core structures before
the devres cleanup phase begins. Because the OF clock provider was register=
ed
using devm_of_clk_add_hw_provider() in ipq_cmn_pll_register_clks(), it
remains active until after remove() returns.

If a consumer requests a clock via clk_get() during this race window, the
active provider's of_clk_hw_onecell_get() will return a clk_hw containing a
dangling pointer to the freed clk_core, leading to a use-after-free when
the clock framework accesses it.

>  	if (ret)
>  		goto unregister_fixed_clk;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/AS8P251MB000187BDFA=
D98A21F4C356E9C8BD2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM?part=3D1
