Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50197184
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175109; cv=none; b=JAEGFfPhcQmIPGccfrsMuvpcoK448OHmMDetQ6bgw9Q3jqaAmzUPmE5ZY2JrV4IKD0OQgSpkC/CJjy7QF3LJUMPzoGiYocxDmiPbNC2JktttUZVx1N1CYxX498wXu0XKMB/F2N/wE4Llt1+fZDJE8t8sFOLEhixWONheLk468r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175109; c=relaxed/simple;
	bh=Ydx/E21M5FNxeVqvnTAFoACwszEuoh1Ekj1kWMCRAH4=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 References:In-Reply-To; b=UjYxnmJu4KJVrOMRRp9TFgigQMcS4789yO5zWTrx6rHJIRSjD2CET/7+4vsafe/hNqKZZG09i2Vw3sRGFn3FzCEEC2ZmfkEk5pzEC3sz7PSviC6/KZmGWUZUSEO2Fh8RI7e/boGLR/VoClrhHX7yolVwZlXuHgUe1mhrrqww7O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hNo8u6J2; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hNo8u6J2"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MNIM5I1517125;
	Wed, 22 Oct 2025 18:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761175102;
	bh=Ydx/E21M5FNxeVqvnTAFoACwszEuoh1Ekj1kWMCRAH4=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=hNo8u6J29dgP7c/GLYYWimGWCMfRxwpw4asgtilfQ+UcJhVZXdLS4IoACF9PAKDSP
	 +etabPiXUNnBXCFPAXgIvCV0F3TVTU4dQZASbJQftqD9bSR/OKkWlnE68EldDIRRh7
	 prp2UaXhSnLAWp8DvcXtrsqfAcr/mFHckNRxGeTw=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MNIM2M1949800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 18:18:22 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 18:18:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 18:18:22 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MNIMgc1951145;
	Wed, 22 Oct 2025 18:18:22 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Oct 2025 18:18:22 -0500
Message-ID: <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
CC: <linux-clk@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
From: Randolph Sapp <rs@ti.com>
To: Michael Walle <mwalle@kernel.org>, Randolph Sapp <rs@ti.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com> <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
In-Reply-To: <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
> Hi,
>
>>> Am I correct in my assumption about running clk_get_rate on unprepared =
clocks
>>> though? (That it shouldn't be allowed or, if it is, that the result sho=
uldn't be
>>> cached.)
>>>
>> Any follow up to this Michael? I wanted to be sure this was something th=
e
>> subsystem should allow before I look into further workarounds.
>
> I don't know. I'm not that familar with the ccs. My first reaction
> was that it's asymmetrical that a .set is allowed (and works for
> tisci) and that .get is not allowed. That way you can't read the
> hardware clock (or think of a fixed clock, where you want to get the
> frequency) before enabling it. I could imagine some devices which
> needs to be configured first, before you might turn the clock on.
>
> OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
> which clearly states that it's only valid if the clock is on.
>
> -michael

Yeah, I still don't like the way we handle clock in firmware but I've alrea=
dy
been shut down on that front.

Regardless, there are quite a few drivers right now that use clk_get_rate p=
rior
to preparing the clock. If the kdoc reports clk_get_rate is only valid if t=
he
clock is enabled, should we report a proper warning when this occurs?

- Randolph
