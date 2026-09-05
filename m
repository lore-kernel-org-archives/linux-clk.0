Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9F2C0F8C
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641867; cv=none; b=KucNAqdW6SYTNzU0n2Z/nqhMCZ9dfth12vTHtV12XrJBF/tg3YF2jdfjOD46TbjXXZAEpEQIl3G1M51lNeBQ/etRiwp3xpYNw/TRokM/0lg3+Fugvmo+Autx2k2R+guNNnmuac9u9A/8cUqWGhT8cuXLOqjwugely5B3rQUh0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641867; c=relaxed/simple;
	bh=3RgoKg1FPMnX4HgIoEE6tdnxv9MZBAaoCGxYNnDcq6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RUEp46s7sCPRMpe3hlHurCJULoPLchef9WztvCByTErEf0BGVjQbGy1Rw+ObDDzoqdwcI265FOTV+BaANZSzuxmhXESkMWiPP9KpRZXfh7ubDfauqDywXGc6j/hSzF40nHaqoESVUuoYysCIhUTV95NzLTFjJym97ccCxGxKJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoDG5LM2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoDG5LM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1971F00A3A;
	Sat,  5 Sep 2026 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788641866;
	bh=IW/8XfLIU2Z4NNq11zWPfDVPufJqfsa8uPkxukNhnfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoDG5LM2AcIyPGs4QZnmpr2yoIezJmUv5DWcjltokx3viWrx7F4JCRlb+Cu+3Coys
	 RWoBA5iAfYO2sMrB63JQgBmOeWc60S5tRvJf6WFF/QeS+eJcvL/rroLfASgswscgIz
	 h8Iyle2+7Mp44VPB/9xoVbKm2AGFIzhEVkUBo/M1uizUP0/9P52KBHOIZZvPYQI/eO
	 KipqP8xPeQX+EZJ89G9XE7JeLup1dfKxqxwNq5flLlBjr6Fewr2uKb/IqPeeBXmZ/9
	 7bZB69XsCpdjuzw1OQ/oTN6Z8MhWEUIFIgxc4RXKaZRcgJW+EchEXNhbYd5GnoZpVO
	 RiJm/I4CR8wiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: Assign .num before accessing
 .hws
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aamir Ahmed" <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 20:57:45 +0000
Message-Id: <20260905205746.3F1971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver unconditionally triggers a kernel panic or memory corru=
ption by mutating a read-only string literal (.rodata).
- [High] Clock initialization applies uninitialized stack garbage as config=
uration flags.
- [Medium] The parent clock reference is permanently leaked upon every iter=
ation.
--

commit b7cdd9438cc10aafbe039089be5e257e331a9472
Author: Aamir Ahmed <elb12345@hotmail.co.uk>

clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws

This commit initializes the num member of struct clk_hw_onecell_data before
the first array access to the hws member. This fixes an out-of-bounds warni=
ng
triggered by the bounds sanitizer when accessing the array elements.

> diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-cl=
k.c
> index 1e44ace7d9519..ed3ca59e0ee97 100644
> --- a/drivers/clk/mvebu/ap-cpu-clk.c
> +++ b/drivers/clk/mvebu/ap-cpu-clk.c
> @@ -284,6 +284,8 @@ static int ap_cpu_clock_probe(struct platform_device =
*pdev)
>  	if (!ap_cpu_data)
>  		return -ENOMEM;
> =20
> +	ap_cpu_data->num =3D nclusters;
> +
>  	for_each_of_cpu_node(dn) {
>  		char *clk_name =3D "cpu-cluster-0";
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but can this unconditionally trigger a kernel
panic or memory corruption?

By declaring clk_name as a pointer to a string literal in read-only memory
(.rodata), the driver attempts an illegal write operation when it executes:

ap_cpu_clock_probe() {
    ...
    clk_name[12] +=3D cluster_index;
    ...
}

Could this memory protection fault be prevented by declaring clk_name as a
character array instead of a pointer?

>  		struct clk_init_data init;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but does this allocation apply uninitialized
stack garbage as configuration flags?

When struct clk_init_data init is allocated on the stack without being
zero-initialized, the clock framework might read uninitialized stack
memory and apply arbitrary flags (like CLK_IGNORE_UNUSED or
CLK_IS_CRITICAL) when passed to devm_clk_hw_register().

Could init be zero-initialized to avoid misinterpreting uninitialized field=
s?

[Severity: Medium]
This is a pre-existing issue, but is the parent clock reference permanently
leaked upon every iteration?

When retrieving the parent clock, of_clk_get() acquires a reference:

ap_cpu_clock_probe() {
    ...
    parent =3D of_clk_get(np, cluster_index);
    if (IS_ERR(parent)) {
        dev_err(dev, "Could not get the clock parent\n");
        of_node_put(dn);
        return -EINVAL;
    }
    parent_name =3D  __clk_get_name(parent);
    ...
}

Is it necessary to call clk_put() on the parent clock before the loop
advances or the function returns, to prevent consuming memory and elevating
the clock's reference count permanently?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/AS8P251MB000199E5C8=
6A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM?part=3D1
