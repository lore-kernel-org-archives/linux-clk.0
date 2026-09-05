Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614E1F63D9;
	Sat,  5 Sep 2026 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626936; cv=none; b=Z5JkrnUqg20oMJGjwfITxO6sV1WTgM4/HS9ESfLwEpdCgsT41md+Z7JGYAtjRA2Zqw4ayNrKpeMNMqA2tZd27hTLSADm1pimSbs0BBJB6J/hh505WR/V78GAGg7tld2Z5UOEy+UHMsw9/njak195Fmwi/Wa68QWjhmKEMmDMFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626936; c=relaxed/simple;
	bh=7zE4DLk+owEJCvsL7gJJRrEj5LNInTPF/kxV5jFwUuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6mibfMuQavUyf+eiqYJ29Nlh4xFc+nxi5hKGEJMMpcs65ucP7e9nvbV4yBZG4JHn8tx2jZ4FIwnKq1AVurAhqJcFgi1CvCFyqIiid/3cnADajh8+I1/ZpNzJbxrqp/R58dvQ3I8Er7ss65+LoJS/8MSR0NftR+/EA7coG4o/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFqVxMyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFqVxMyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BEF1F00A3A;
	Sat,  5 Sep 2026 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788626934;
	bh=O7IuTC+pRWMMIEwCHz18OFRXiFgpidnQyUKUZOMTCWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFqVxMyG4httbfeKeVRMfhzUuuBkORYG2TP4lQObvcq6ASoy3tYEH55e+8ase1vsV
	 JrAMlzSJBtnglcn/fqB0DBIq5U4Dnt74RnZR3exg/WJdVuPEA1FKwpJqKNaI7N+iTn
	 zmJXBmdma/us6ZFeF8J0AqTe3AJB5hFpGx83tT8dlxzn41fUP/cZrJ1sNjb3DawRi6
	 woNhHDHuS0jy2Ku+DCfZ8mCxvgPIK8T46gSr4nGIlh2ZIuPSbPR7NEVeLJOa2+6LJf
	 47a4ylq7yXvlax4PXu2iY5ePL11pgzMo4o2QugE3W/uIfjeUHgyJLpuBJpCQPSmG50
	 ARM1mGUYOlHqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] clk: sunxi-ng: a733: Add bus clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260905-a733-clk-v3-5-50f238f39c78@pigmoral.tech>
References: <20260905-a733-clk-v3-0-50f238f39c78@pigmoral.tech>
 <20260905-a733-clk-v3-5-50f238f39c78@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 16:48:53 +0000
Message-Id: <20260905164854.57BEF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Zero-width P-divider in mbus_clk triggers GENMASK underflow, wipin=
g the entire clock register on rate changes.
- [High] MBUS clock rate changes will not take effect because ccu_mp_set_ra=
te() ignores CCU_FEATURE_UPDATE_BIT.
--

commit b18b5b20ec18f362fb14429382135c39ebff8a35
Author: Junhui Liu <junhui.liu@pigmoral.tech>

    clk: sunxi-ng: a733: Add bus clocks support
   =20
    Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
    APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
    functional modules. An additional trace clock is also added as it falls
    within the register address range of the bus clocks, even though it is
    not strictly a bus clock.
   =20
    The MBUS clock is marked as critical to ensure the memory bus remains
    operational at all times. And the hardware requires an update bit
    (bit 27) to be set so that the configuration takes effect and the
    updated parameters can be correctly read back for the MBUS clock.

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/=
ccu-sun60i-a733.c
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_paren=
ts, 0x588,
> +					    0, 5,	/* M */
> +					    0, 0,	/* no P */
> +					    24, 3,	/* mux */
> +					    BIT(31),	/* gate */
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);

[Severity: High]
Does a zero-width P-divider here inadvertently wipe the register during
rate changes?

Looking at ccu_mp_set_rate(), it evaluates the mask using GENMASK based
on the width and shift:

reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);

With width 0 and shift 0, this yields GENMASK(-1, 0). On 64-bit
architectures like ARM64, the internal shift by BITS_PER_LONG is
modulo-truncated to 0, resulting in ~0UL. Applying ~GENMASK (which is 0)
then zeroes out the entire register. This would clear the critical enable
gate (BIT(31)) and mux settings.

[Severity: High]
Does ccu_mp_set_rate() actually support the update bit feature?

The commit message notes that the hardware requires bit 27 to be set
for the MBUS clock configuration to take effect. However, mbus_clk is
declared using a ccu_mp type macro.

Looking at ccu_mp_set_rate(), it doesn't appear to check for or apply
CCU_FEATURE_UPDATE_BIT like the div and mux callbacks do. Because the MP
framework ignores this flag, could this result in rate changes silently
being ignored by the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-a733-clk-v=
3-0-50f238f39c78@pigmoral.tech?part=3D5
