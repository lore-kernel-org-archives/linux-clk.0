Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5940B0E0;
	Fri, 14 Aug 2026 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693552; cv=none; b=NJd6he5+juQKrD8akqcQhenKGLneafDrPSGKfccMcf3afsxiI0eFaiXhmThnCkieBMJ8TVvQhyfBrlEdt9a8x/ZbxASc4nAXTqxaBKUGlBzG1mdqtSo400femplSHEfhQMYFgf2ean2bpwcFCXOvlQVbWoTeKU2/GRuk6RTdjbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693552; c=relaxed/simple;
	bh=zC8zAQmFDXA2BWTc6CRzKYDm2uQZN/gjXRd9JU9qf6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wxp0H4s472c8jcly/xnZOvtEos0QkXr4spGffMePNJRV1Q8HWh0iW7QZzp9i/vi8UtzhOwv7ZkZEmDu3mD+xYP8TqOWRuj5gE9Q9QRYs6k+ZQh36seXFQp1LSYBloD9sn4f8BsQpETZe163W31D3n+znjSIgKax8JlKR+zpygqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN01w1qR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN01w1qR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E331F000E9;
	Fri, 14 Aug 2026 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693543;
	bh=qOiYoaEMY1014L/UI5crxmTDZI3eAFaQCLq9OR9Aeq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YN01w1qR9GPlslPktfF2Xo3eigMfyMQOyOScmDxIRQoYBNXUgkM8SY4ne4DrNXuUh
	 EzKY+8lf0Rjzb8K6z5Ihw+q9lYHYOgFEVlCDSDtHEJkxtZwgPU+VV6zsuNdgWYWH+S
	 2RoUYij+ookLqWSdf9ceRPhdfvPhMs/ZsSYRY/Qf4nyZJbgUYq57y3YCGqXREQ2pPD
	 atsDuPjTgrzPWZFmXBV4KDHxNErO+biVPzFDpJCm6zkt56OMqF8oVMwaEcdy+Kbt76
	 ni85/yqvHc2vCaxfZLyE6KwEsxf261c/Bfvv4jGJwnlssVsaLXnAFcuxUVQ/ZfOVVU
	 /itdOOs6p07Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:45:39 +0000
Message-Id: <20260814074543.49E331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe deferral or driver unbind/rebind permanently corrupts RPMh c=
lock resource addresses and structures.
--

--- Patch [5]: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno R=
PMh clocks ---
commit df2fc48ff54a98574c796889b9e6406c597cd39e
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks

This commit adds the RPMh clock description for the Qualcomm Kuno SoC. It
provides the RPMh-managed clocks to consumers via the qcom,kuno-rpmh-clk
compatible.

> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 6367b2a5a4e08..d8c3a6b12d4a4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c

[ ... ]

> @@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali=
 =3D {
>  	.num_clks =3D ARRAY_SIZE(kaanapali_rpmh_clocks),
>  };
> =20
> +static struct clk_hw *kuno_rpmh_clocks[] =3D {
> +	[RPMH_CXO_CLK]		=3D &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	=3D &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_RF_CLK1]		=3D &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	=3D &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_QPIC_CLK]		=3D &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		=3D &clk_rpmh_ipa.hw,
> +};

[Severity: High]
This is a pre-existing issue, but does adding this new static array expose
the Kuno SoC to a permanent corruption bug during probe deferral?

In clk_rpmh_probe(), if a resource is missing, the driver modifies the
global static SoC clock array permanently:

drivers/clk/qcom/clk-rpmh.c:clk_rpmh_probe() {
    ...
    if (!has_state) {
        hw_clks[i] =3D NULL;
        continue;
    }
    ...
}

Because kuno_rpmh_clocks[] is a globally shared static array, wouldn't a
probe deferral or an unbind/rebind cycle permanently drop missing resources
from all future probe attempts?

Additionally, clk_rpmh_probe() mutates the global static clock structures
themselves:

drivers/clk/qcom/clk-rpmh.c:clk_rpmh_probe() {
    ...
    rpmh_clk->res_addr +=3D res_addr;
    ...
}

If devm_clk_hw_register() returns -EPROBE_DEFER after this addition,
would the next probe attempt add the base address again, resulting in an
accumulated incorrect offset and potentially causing out-of-bounds RPMh
transactions?

> +
> +static const struct clk_rpmh_desc clk_rpmh_kuno =3D {
> +	.clks =3D kuno_rpmh_clocks,
> +	.num_clks =3D ARRAY_SIZE(kuno_rpmh_clocks),
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-kuno-soc-s=
upport-v2-0-3079794f0f73@oss.qualcomm.com?part=3D5
