Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4229D28A
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724550; cv=none; b=ti5cj1XmJmkUGyu6FqmglIToum4j0coOlCuLr3A2eBzm9+rTdeSRfeq/pq2NAbSUaEwEmnfNNKtb4itm6etdbeUWCtVvowo8GkemByoYyA13ObJUEH5EwC3QGxASNbVBLnGBU5qFX863/LnITQbPc9SSnCqFzU15E1mKwjcRpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724550; c=relaxed/simple;
	bh=3xhvugvsa0BVa7WbVlzEOoeAX0LIGDzZ79w5LrCkti4=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 References:In-Reply-To; b=KsXNezYxtAcTaYpc99UnHewjay1fA0N9ccGmr/vZ6JXvq8ADvkiiCCayjEhvqbUQL7qNHoK8ZpdkKlRGq2NQs/pfopz4VPqMxWvYtCw7wWWtDOkN1Oy7S49jIiDkClmwrNz4G+Onv6i3EM7qvpHHlueRpsa11cOjZqoFvzYsQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U2b/gZU3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U2b/gZU3"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HI93NU333853;
	Fri, 17 Oct 2025 13:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760724543;
	bh=8kw0t+z8Lp98I4w/VXtqkBTHrMAYJt4T67K3mrmPlnE=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=U2b/gZU3gSlVqvzi006JH531J9Qj7BE2z/1H97TnPHWzG6g0drjX9n7ZjQAfw/lUn
	 HE41R8TydLv5qBMc0C3u9VqJ4c9/TeCrNSdho2VFICR1K0U/m3T9XvgSCRfNGTQep1
	 H3e6wYZVVK4MeMf1uc5mFHXOyWKDyCy+jgoeKjhg=
Received: from DFLE209.ent.ti.com (dfle209.ent.ti.com [10.64.6.67])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HI938k2585147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 13:09:03 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 13:09:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 13:09:02 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HI92JV1707645;
	Fri, 17 Oct 2025 13:09:02 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Oct 2025 13:09:02 -0500
Message-ID: <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
CC: <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
From: Randolph Sapp <rs@ti.com>
To: Michael Walle <mwalle@kernel.org>, <rs@ti.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
In-Reply-To: <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu Oct 16, 2025 at 6:23 AM CDT, Michael Walle wrote:
> Hi,
>
> On Sat Oct 4, 2025 at 12:29 AM CEST, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Recalculate the clock rate for unprepared clocks. This cached value can
>> vary depending on the clocking architecture. On platforms with clocks
>> that have shared management it's possible that:
>>
>>  - Previously disabled clocks have been enabled by other entities
>>  - Rates calculated during clock tree initialization could have changed
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>
>> I'm hoping this will start a bit of a discussion. I'm still curious why =
people
>> would want to read the rate of an unprepared clock, but there were so ma=
ny
>> logged operations on my test platforms that I assumed it must have some =
purpose.
>
>> Either way, I don't believe cached values should ever be trusted in this
>> scenario.
>>
>>  drivers/clk/clk.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 85d2f2481acf..9c8b9036b6f6 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1971,8 +1971,16 @@ static void __clk_recalc_rates(struct clk_core *c=
ore, bool update_req,
>> =20
>>  static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
>>  {
>> -	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
>> -		__clk_recalc_rates(core, false, 0);
>> +	if (core) {
>> +		bool prepared =3D clk_core_is_prepared(core);
>> +
>> +		if (core->flags & CLK_GET_RATE_NOCACHE || !prepared) {
>> +			if (!prepared)
>> +				pr_debug("%s: rate requested for unprepared clock %s\n",
>> +					 __func__, core->name);
>> +			__clk_recalc_rates(core, false, 0);
>> +		}
>> +	}
>
> I'm not sure this patch is correct. In case the clock is not
> prepared, the rate is still cached in __clk_recalc_rates(). Thus,
> I'd expect the following sequence to return a wrong rate:
>
>   # assuming clock is unprepared and will return 0
>   clk_get_rate()       // this will fetch the (wrong) rate and cache it
>   clk_prepare_enable()
>   clk_get_rate()       // this will then return the cached rate
>
> Or do I miss something here?
>
> -michael

Ah, that's a really good point. I guess since my test is only looking at
instances where people are doing a clk_get_rate (occurring outside of drive=
r),
clk_prepare_enable, and clk_set_rate it works right now. Need to adjust tha=
t.

Am I correct in my assumption about running clk_get_rate on unprepared cloc=
ks
though? (That it shouldn't be allowed or, if it is, that the result shouldn=
't be
cached.)

- Randolph

>> =20
>>  	return clk_core_get_rate_nolock(core);
>>  }

