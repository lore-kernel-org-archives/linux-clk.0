Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092BA46983C;
	Fri, 14 Aug 2026 12:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712365; cv=none; b=a7Dxd1EkLqrgw0Aye2aYsT2eVr6PNm5vVUdJkdZVHQJ0HcPMyT1AGsEF5n9y7yIKxKG2D4vrf7cYS8y8ZUc5PTyUNxbdVxE2yVTCNrpPJBzFUMCzE4ruZUoeFWrSnXQkxxFB8fJrh9MzM7a7oSYYRLdwV7Cl4WEwEpmmjAHF/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712365; c=relaxed/simple;
	bh=nw9KJB2mYQAX/+pMzKQjmQO5z4pdgl3Giv+mqO3B6IQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=goiOCNsOfn9zvyuLOzTxnOVp9BpH3VOkVnFaOeu5Iih7XHEvPzk/lPnsPpWCESX8whjbJKn4Hc6g1bmc8yuUIAb2xrGYxi7AOc4NFVXH9GcTQsS+5KddZ65vknJx8lEYaSgi680Ua26y2ztq+xXxke274xZtKRgGhtPoI86FS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpmqAJvr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpmqAJvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8AE1F000E9;
	Fri, 14 Aug 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786712363;
	bh=uXoIwtcljLqXIJs8AgeEkxzkI+FeK7XuzznqVLLAKa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FpmqAJvrFmGF7xen0F6OcYImc7bfg3Bi6lOV5CITjSihbYCAWL8oeb04m2WGi1W3H
	 aBWNh4tAxVOeg/u8ZbLiJFxPwNiFC1aFw6eNTolCV7ZIVX7pXVKcH8U6NlJeiFEcLt
	 7c8oCWZrwoMB28MPrTRFc1gfmw81cBK3Kqyb1KDHvhsqaTBHvN4gp2AIw5eHVsPayH
	 ertBaSVSfBnSxcMTYRki04KxnjpqPVtnC7gZ06jU1LsJ3VZ4FIDB1gaThScTPagbpA
	 WCEs2pCiXzFeAN9k09Lndw1inHBLVn0zGpjLoFP8JGLvv6gKbhacL4LspEmJWgdHXj
	 9Po/aOXp5YEPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 12:59:22 +0000
Message-Id: <20260814125923.5C8AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack variable used in clock calculations if regmap_=
read() fails.
- [High] Divide-by-zero kernel panic in divider_ro_determine_rate() exposed=
 by CLK_DIVIDER_ONE_BASED.
--

--- Patch [3]: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support CLK_=
DIVIDER_* flags ---
commit dbde27a9bd18456c99d0f970183ac77f2661a8eb
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags

Add a flags field to struct clk_regmap_div and OR it into the flag
passed to divider determine/recalc rate functions. This allows qcom
drivers to opt into behavior variants such as CLK_DIVIDER_ONE_BASED.

> diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk=
-regmap-divider.c
> index 672e82caf2050..6e12aebf14b6a 100644
> --- a/drivers/clk/qcom/clk-regmap-divider.c
> +++ b/drivers/clk/qcom/clk-regmap-divider.c
> @@ -27,7 +27,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
>  	val &=3D BIT(divider->width) - 1;

[Severity: High]
This is a pre-existing issue, but does this code need to check the return
value of regmap_read() that populates 'val' right before this line?

If regmap_read() fails (for example, due to a bus error or the power domain
being off), 'val' remains uninitialized on the stack.

Will proceeding to shift and mask this uninitialized stack memory lead to
unpredictable clock frequencies being passed to the core framework?

> =20
>  	return divider_ro_determine_rate(hw, req, NULL, divider->width,
> -					 CLK_DIVIDER_ROUND_CLOSEST, val);
> +					 CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
> +					 val);

[Severity: High]
This isn't a bug introduced by this patch, but could this addition of
divider->flags trigger a divide-by-zero panic in the core clock framework?

If a QCOM driver opts into CLK_DIVIDER_ONE_BASED, and the hardware register
reads 0 (or is uninitialized due to a regmap_read failure), _get_div() will
return 0.

Unlike divider_recalc_rate() which checks for a zero divisor,
divider_ro_determine_rate() in drivers/clk/clk-divider.c lacks this check:

drivers/clk/clk-divider.c:divider_ro_determine_rate() {
    ...
    div =3D _get_div(table, val, flags, width);
    ...
    req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
    return 0;
}

Will passing CLK_DIVIDER_ONE_BASED through divider->flags cause a
divide-by-zero exception here when div is 0?

>  }

[ ... ]

> @@ -65,7 +68,8 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
>  	div &=3D BIT(divider->width) - 1;

[Severity: High]
This is also a pre-existing issue, but similar to div_ro_determine_rate(),
does the return value of regmap_read() need to be checked here before
manipulating 'div'?

If regmap_read() returns an error code, 'div' will contain uninitialized
stack data which is then used in hardware clock frequency calculations.

> =20
>  	return divider_recalc_rate(hw, parent_rate, div, NULL,
> -				   CLK_DIVIDER_ROUND_CLOSEST, divider->width);
> +				   CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
> +				   divider->width);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-qcom_ipq52=
10_cmnpll-v3-0-21c3db378611@oss.qualcomm.com?part=3D3
