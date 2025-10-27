Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508B241663
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761608685; cv=none; b=NpSzql9Xs+JvRzUFt3Wv0eN+OMS/mjVMQzZaDEdiEXH+ZbQspDsJSgPWN3OcF/27RGojMjo0iM1BL9dOSgUDuTa1CueexbDCtxWijI/00Imn4+t7CQ+GFbRF4mcXf1h61/FHN/csWvYXx//VhwItAwQRHdhwI/T8XufzBe8wHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761608685; c=relaxed/simple;
	bh=BlWj15QBl01of3ufm2JQSZ9vg4uimS02NUlo/sgAPYU=;
	h=MIME-Version:Content-Type:Date:Message-ID:From:To:CC:Subject:
	 References:In-Reply-To; b=PwCB2wsNw2FkNqhnksqPSQr01qDzPMCULjZVghiHyULgdD036OrWtiDJm8MAblnQnJfaRQuoPFuaHHx2MpCMvhG0nap1drUC7Ikpsm1Q6mkJTNycNxHGhQMoAEK51N4ZXqWlF9GM35djyyZ3UezIxsL685v5FPIkdkU1BKCsTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=V9/yOA+Q; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V9/yOA+Q"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RNicd72526697;
	Mon, 27 Oct 2025 18:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761608678;
	bh=BlWj15QBl01of3ufm2JQSZ9vg4uimS02NUlo/sgAPYU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=V9/yOA+QGKiGyWQBq0w+9/1Pt/Xqbh9Rm8zSx5TmbTqJLi8YhrOwVxPPPcmfd07Sy
	 XXC33ibQbU8xShO4kPvvu27fFoF/hU2MWxp5SBd9hLXbycYdrUe4gH7DoEjFmm+E+P
	 1+4vm/UEqaING8tEHrtwqEk/uGbXK6TXnqaeUC/k=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RNicSD1716722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 18:44:38 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 18:44:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 18:44:37 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RNibXW1443126;
	Mon, 27 Oct 2025 18:44:37 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Oct 2025 18:44:37 -0500
Message-ID: <DDTI5QH69F47.392V8CW35LY60@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Maxime Ripard <mripard@kernel.org>, Randolph Sapp <rs@ti.com>
CC: <afd@ti.com>, Michael Walle <mwalle@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com> <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
 <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
 <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>
 <3hqmv26wfxruow6aojtvthgxcxten2potzezbodkevugwrifjv@ppkxevw3awf7>
In-Reply-To: <3hqmv26wfxruow6aojtvthgxcxten2potzezbodkevugwrifjv@ppkxevw3awf7>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Fri Oct 24, 2025 at 6:23 AM CDT, Maxime Ripard wrote:
> On Thu, Oct 23, 2025 at 05:55:45PM -0500, Randolph Sapp wrote:
>> On Thu Oct 23, 2025 at 3:36 AM CDT, Maxime Ripard wrote:
>> > On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
>> >> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
>> >> > Hi,
>> >> >
>> >> >>> Am I correct in my assumption about running clk_get_rate on unpre=
pared clocks
>> >> >>> though? (That it shouldn't be allowed or, if it is, that the resu=
lt shouldn't be
>> >> >>> cached.)
>> >> >>>
>> >> >> Any follow up to this Michael? I wanted to be sure this was someth=
ing the
>> >> >> subsystem should allow before I look into further workarounds.
>> >> >
>> >> > I don't know. I'm not that familar with the ccs. My first reaction
>> >> > was that it's asymmetrical that a .set is allowed (and works for
>> >> > tisci) and that .get is not allowed. That way you can't read the
>> >> > hardware clock (or think of a fixed clock, where you want to get th=
e
>> >> > frequency) before enabling it. I could imagine some devices which
>> >> > needs to be configured first, before you might turn the clock on.
>> >> >
>> >> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
>> >> > which clearly states that it's only valid if the clock is on.
>> >> >
>> >> > -michael
>> >>=20
>> >> Yeah, I still don't like the way we handle clock in firmware but I've=
 already
>> >> been shut down on that front.
>> >>=20
>> >> Regardless, there are quite a few drivers right now that use clk_get_=
rate prior
>> >> to preparing the clock. If the kdoc reports clk_get_rate is only vali=
d if the
>> >> clock is enabled, should we report a proper warning when this occurs?
>> >
>> > It's more complicated than that.
>> >
>> > The clock API documentation mentions that, and the CCF is one
>> > implementation of that API. It's now the dominant implementation, but
>> > the CCF itself never mentioned or required it.
>> >
>> > And thus drivers started to rely on the CCF behaviour.
>> >
>> > Plus, leaving the documentation part aside, being able to call
>> > clk_get_rate when the clock is disabled has value.
>> >
>> > How can you setup a clock before enabling it to avoid any frequency
>> > change while the device operates otherwise?
>>=20
>> Why would enabling a clock change it's rate unless the current rate wasn=
't
>> actually valid?
>
> That's not what I said, and it's also not something that enable is
> allowed to do anyway.
>
> Consider this: the clock feeding a hardware component is out of its
> operating range. You enable it. The device gets stuck. How do you
> recover from that?
>
>> I can only see a change explicitly occurring if the clock parent has
>> decided that the associated rate was not acceptable.
>>=20
>> If some device always resets the rate when enabled, isn't that already
>> problematic?
>
> Resets the rate to what?

Doesn't matter. The initial comment was about the rate changing when the cl=
ock
was enabled. I said reset here because any change on power on would assume =
some
default state it was returning to.

>> > Or how do you make sure the clock is in its operating range and thus t=
he
>> > device *can* operate?
>>=20
>> Well, if enabling a clock doesn't change it's rate there's nothing stopp=
ing
>> people from enabling the clock prior to getting the rate.
>
> The first thing clk_set_rate is doing is a clk_get_rate. If you want to
> actually enforce a rule that hasn't been applied for 15y, go ahead, but
> that means also mandating that you can only make clk_set_rate calls once
> the clock has been enabled.

The clk_set_rate only runs clk_get_rate to see if any change needs to occur=
. If
the clock isn't enabled then this is likely part of startup or resume. The
likelihood of needing to change the rate in this scenario would be high any=
way.

>> > There's a reason people have started using it. And it might be
>> > abstracted away by the firmware in some cases, but not all platforms u=
se
>> > a firmware, so you can't rely on that either.
>>
>> Thanks for taking the time to talk with me about this. I assume there is=
 some
>> specific thing that violates my understanding of how this should work, b=
ut I
>> feel like things are too loosely defined as is.
>
> I mean, I kind of agree, but also, the clock framework is newer and has
> been more liberal than the clock API. And the clock framework is by far
> the dominant implementation now, so I'm not sure what the big deal is.
>
> Maxime

There's no big deal, I was curious if there was a consensus around clock
initialization that could push this fix in a different direction.

Considering there doesn't seem to be any consensus I'm fine with moving for=
ward
with the initial cached rate workaround. I just need to rework it a bit to =
cover
the initial corner case outlined.

- Randolph
