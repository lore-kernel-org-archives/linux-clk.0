Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE83914E1
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010654; cv=none; b=cH7ybb8fh+B/+98196zXDo4cYu7By9BlSizSPBk77D1KBmct/Bmeviq4nsMP3i08xW0dOFCNWT+SxcoWZBSu7wtvUCJy/V8Yo13oHELZFJ9nefVv5p2nWrvpEDb8K/SAaF70uIsDtT2xPdTTpYkfuTpEhfyw85rniRct6JIHJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010654; c=relaxed/simple;
	bh=vDfkLDJaOeZizfvAQxeCbGfASUqiL1kp5bzBm13U9kg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J3pvAN372PLe9ngjjvEdag5jmF6q7f2pAYy5/QcGtpBOWkoavGcxdwe086Yi6yiNZmcxxOu5D9iyUgn1L8te/+5OgRUxw8k1KumHrVVDr9MFgSAnIencwRS6yjmwsRALL4EgbPAAeEEQbvzKkOsq+aihMOoowGikR4iJIVazmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TII0fZFd; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TII0fZFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789010624;
	bh=JkKpYWlGjsNb0KvXkISJQTVrsGZtNUVjybFylagCGLU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TII0fZFdbPQkK8V2wIA41tVL0g/OX66wqizAt6iP5si7K2e+z5MWcNDaj8XYN2hcw
	 TkOlKA/K+rRHcdHFHH4ABeKOFVEIR7dpL0/1RdkskOOn+3wA0y9YawEKgYwNctSSdJ
	 Ps2FqhV2ra3XXXmJE7tX87ssnRH0t/7naiI0T7yM=
X-QQ-mid: esmtpsz21t1789010622ta65d0c4a
X-QQ-Originating-IP: gN3PKgpqe5LUr3Xxvr5mtfTLUbno8h8E0IUkA9CNkHM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 11:23:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2512009657120881219
EX-QQ-RecipientCnt: 3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b27a31aff78db9385a11b35bd47a7dbc4cfa53b1ddfa541804de3f1bc0c9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 10 Sep 2026 11:23:38 +0800
Message-Id: <DLBBC49OENDA.3SP65LNWNEYJY@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/5] clk: spacemit: describe CPU clock dividers and
 shared PLL muxes
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com> <20260909-spacemit-pll-init-v1-3-b3065ad5a4ac@linux.spacemit.com> <20260909142152.612951F00A3D@smtp.kernel.org>
In-Reply-To: <20260909142152.612951F00A3D@smtp.kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NRN3UPsLzYKVc7sBO2hn1IIxHol3lanmW4AqEFZJ6tfPhEpLHS/biaMi
	VedkzLfFBGXcwDRCBaJSF9+tjBBs+PK4OG0LMY2QSH2uPMy1caKooh2d8WpE0sEm7Z3movL
	cgxs9FRKgG+XShCWxzZy5uQGBGrOebIMwyGMWRBioJ3WLKhnE2vDV/Z4rYlZOx4CejhAmrN
	oJz3q55Vd2Q6ZsqR+Dyx2hf4uYO51cmfL9Zb72n3N5pKs5A830quP2zYN4iiqMnzTm2N3IZ
	CF2Dhf4ryybljysh37Qw7eGzQidpWZLve7KHnApLVVIUmqkS3vkPdnjD0XZIvRrWKiO9NZ5
	329CQiWRmS9DvguEM+Hg9M9s36YMatbiopYE55qIDM12XKFRoC/8Jdyma5ajqxKviDPP15J
	NYv469l7OFzFmGaHdGDNsjBvlm25PA0MtKEUSK0+jIxX5XGu7jZHFBiTMlnoC8+pgcNo8Pc
	Iu4cVE99/F8WbvOyBqAT9PNGLkkKBMZd/MotVV1Y/Tuov9w9ibfzXG4bqqRV5WEWPSkIoKJ
	8g2g4CFRQC0jWbduSrTfEE0vDVfF7mAaa1uUvsibGmOCCaH2wPoAJ6JQNxa6+I0uS9nVZ54
	9uL2QuA4VkCd0POUor+UxMGaVulSAx+KMfk45Pw9M2FI+WxO3dz8WX/h2yuEEHBbIlF+d43
	zYAla0oabL8N/6Eij5ItI5J77lVTSetCuTTsPuFk5T+VXnCMSakY5y66oSKgMOvEK8j6CvD
	NLSfnNjkBGfo4LkdqLMJEPrhBjoAtQAUr52TvmWY/98Ayw09kUd+wnWDYJQPYUONY2Uh79a
	pxTAwRcm5HC2YecwmQUNPS5KGDEbmzNv6mCvutWqLCk6CPmoW7cOBLQ2ucwasJ0OBiz8435
	ygZIpzMi4b1MhkvukfTF3rE2DtLdcovyj03ZzOFlZkvhIrbk8rXov5EBhtYYIHwPOh1nE6q
	KKkCAKM08s1o5VfI8agB5MAteVAbSCMwd6CRXjmnenR8V61Hw+7UnCyO406BV+e6azJuHQA
	UZbqKSVgGSQTDgSdf99fneCSkENvnoxWJYdBRltju8BUGvZnaoqTWebiPTwaRhU86VKd9oV
	kxHk/U2cYvS
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--b27a31aff78db9385a11b35bd47a7dbc4cfa53b1ddfa541804de3f1bc0c9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 9, 2026 at 10:21 PM +08, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing `.set_rate_and_parent` implementation causes non-atomic =
updates of clock mux and divider, risking severe CPU over-clocking and cras=
hes during frequency scaling.
> --
>
> commit caf894b03e44c8fc393822573e3c7ad1a85fe9f1
> Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
> clk: spacemit: describe CPU clock dividers and shared PLL muxes
>
> This commit models the K1 and K3 CPU clock dividers and bypass conditions=
.
> It registers sharing muxes as internal clocks and excludes K3 selector 4
> from the modeled parents to match BSP policy.
>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1=
.c
>> index dee14d25f75d4..40cc96c4ee876 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -391,8 +391,8 @@ static const struct clk_parent_data cpu_c0_clk_paren=
ts[] =3D {
>>  	CCU_PARENT_HW(pll2_d3),
>>  	CCU_PARENT_HW(cpu_c0_hi_clk),
>>  };
>> -CCU_MUX_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_CLK_=
CTRL, BIT(12), 0, 3,
>> -		  CLK_IS_CRITICAL);
>> +CCU_MUX_DIV_FC_DEFINE(cpu_c0_core_clk, cpu_c0_clk_parents, APMU_CPU_C0_=
CLK_CTRL,
>> +		      3, 3, BIT(12), 0, 3, CLK_IS_CRITICAL);
>
> [Severity: High]
> Does introducing the divider model to K1's CPU clock here risk severe CPU
> over-clocking and crashes during frequency scaling?
>
> The operations struct spacemit_ccu_mux_div_ops in
> drivers/clk/spacemit/ccu_mix.c appears to lack .set_rate_and_parent,
> which is required by the Common Clock Framework (CCF) to atomically updat=
e
> both mux and divider.
>
> When cpufreq scales down frequency (e.g., from 614.4 MHz to 409.6 MHz), i=
t
> decreases the frequency before lowering the voltage. In K1,
> ccu_mix_calc_best_rate() iterates parents and stops at the first exact ma=
tch,
> for example index 1 (pll1_d3_819p2, 819.2 MHz) with div=3D2.
>
> Because spacemit_ccu_mux_div_ops lacks .set_rate_and_parent, CCF's
> clk_change_rate() executes updates sequentially, calling .set_parent
> before .set_rate. .set_parent changes the hardware mux to 819.2 MHz
> while the divider remains at its previous value (div=3D1). The CPU tempor=
arily
> runs at 819.2 MHz at a voltage only sufficient for 614.4 MHz, causing an
> immediate undervoltage crash.
>
> Could spacemit_ccu_mux_div_ops be updated to include a
> .set_rate_and_parent implementation to ensure the mux and divider are
> updated atomically?

The intermediate 819.2 MHz state is possible with this callback ordering.
I will add .set_rate_and_parent() in the next revision to update the mux
and divider fields together, followed by a single FC handshake.


--=20
Troy Mitchell


--b27a31aff78db9385a11b35bd47a7dbc4cfa53b1ddfa541804de3f1bc0c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqIiug0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv3UoBAM401bqRuFybbAA5KpnB4a0eoo5hZiw9zvRB1E72
WCa4AQCmBwqd9lcdFScEl6IRweN4365vrpk3b6wd72XhYcoGCA==
=Vh8m
-----END PGP SIGNATURE-----

--b27a31aff78db9385a11b35bd47a7dbc4cfa53b1ddfa541804de3f1bc0c9--
