Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA0C2E0
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260152; cv=none; b=kgJdTx4S4gRdAEUr6CHFaWU8rp8uP6JzwrehLatGG5PkLcVbDn7lveGFLRONMzQGJ8goYOUOXR2vswcuiRdgD7aPKIrJMaz7k4O4uXs9znP3aWbZEex+hQIFjFn6uDiTYkmHcSbGo7mL65k/pqwaXPfIoOdi53uQxYflec6BKMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260152; c=relaxed/simple;
	bh=FWgteLVaOJh9yMG4FBSuSwMfiThZ5fB8d5Bgq6X+MWY=;
	h=MIME-Version:Content-Type:Date:Message-ID:From:To:CC:Subject:
	 References:In-Reply-To; b=uZFbTjD8z+e+ye5IhAnlk/A4F0OzctTDv1GO27O1kqBQXKKAVrbg0qFafDRz8O76MitmdhjhiWQeI89M9YgoF2o0GOTNjTTaBBs/+YAtF1YoqUcsxUtF8lgtzUrRv9YYkXmyz4+ehmphalKO8yb6GFciUlNZv4AF+qz1OF7oFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U/c2r7Zi; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U/c2r7Zi"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NMtkoO1781571;
	Thu, 23 Oct 2025 17:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761260146;
	bh=FWgteLVaOJh9yMG4FBSuSwMfiThZ5fB8d5Bgq6X+MWY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=U/c2r7ZiPCh/i2pCkKn3VeWRWgQhpibcc0Z/0xbtlscRGpzTsHEuIOl1DiyECINQY
	 zZrPTHc2Qh/OmmAW4m2u1ddsxsI1FxyhKKFd3zFqSV/YY8wqw1z6yWzMPyG3frnSxT
	 R1AIH8q3EjqEnkNVY/BG2DUjsI/V79AQdvwmSVZU=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NMtkgt3144227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 17:55:46 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 17:55:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 17:55:45 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NMtjve3592524;
	Thu, 23 Oct 2025 17:55:45 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Oct 2025 17:55:45 -0500
Message-ID: <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Maxime Ripard <mripard@kernel.org>, Randolph Sapp <rs@ti.com>,
        <afd@ti.com>
CC: Michael Walle <mwalle@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com> <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
 <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
In-Reply-To: <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu Oct 23, 2025 at 3:36 AM CDT, Maxime Ripard wrote:
> On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
>> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
>> > Hi,
>> >
>> >>> Am I correct in my assumption about running clk_get_rate on unprepar=
ed clocks
>> >>> though? (That it shouldn't be allowed or, if it is, that the result =
shouldn't be
>> >>> cached.)
>> >>>
>> >> Any follow up to this Michael? I wanted to be sure this was something=
 the
>> >> subsystem should allow before I look into further workarounds.
>> >
>> > I don't know. I'm not that familar with the ccs. My first reaction
>> > was that it's asymmetrical that a .set is allowed (and works for
>> > tisci) and that .get is not allowed. That way you can't read the
>> > hardware clock (or think of a fixed clock, where you want to get the
>> > frequency) before enabling it. I could imagine some devices which
>> > needs to be configured first, before you might turn the clock on.
>> >
>> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
>> > which clearly states that it's only valid if the clock is on.
>> >
>> > -michael
>>=20
>> Yeah, I still don't like the way we handle clock in firmware but I've al=
ready
>> been shut down on that front.
>>=20
>> Regardless, there are quite a few drivers right now that use clk_get_rat=
e prior
>> to preparing the clock. If the kdoc reports clk_get_rate is only valid i=
f the
>> clock is enabled, should we report a proper warning when this occurs?
>
> It's more complicated than that.
>
> The clock API documentation mentions that, and the CCF is one
> implementation of that API. It's now the dominant implementation, but
> the CCF itself never mentioned or required it.
>
> And thus drivers started to rely on the CCF behaviour.
>
> Plus, leaving the documentation part aside, being able to call
> clk_get_rate when the clock is disabled has value.
>
> How can you setup a clock before enabling it to avoid any frequency
> change while the device operates otherwise?

Why would enabling a clock change it's rate unless the current rate wasn't
actually valid? I can only see a change explicitly occurring if the clock p=
arent
has decided that the associated rate was not acceptable.

If some device always resets the rate when enabled, isn't that already
problematic?

> Or how do you make sure the clock is in its operating range and thus the
> device *can* operate?

Well, if enabling a clock doesn't change it's rate there's nothing stopping
people from enabling the clock prior to getting the rate.

> There's a reason people have started using it. And it might be
> abstracted away by the firmware in some cases, but not all platforms use
> a firmware, so you can't rely on that either.
>
> Maxime

Thanks for taking the time to talk with me about this. I assume there is so=
me
specific thing that violates my understanding of how this should work, but =
I
feel like things are too loosely defined as is.

- Randolph
