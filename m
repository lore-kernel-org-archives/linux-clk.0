Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F263F2798E5
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 23:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881508; cv=none; b=DQvQZMQv7ko82q6BT75sfKlYKDFSaFgWmYT/1wxkqGLJyc8eTzwLgtzJArSb3T2CkYTD7+ezYOqcA6qAX9WwuxFMRM5nZVq/kiU1zJLNkvrkjffUmbzhABhFBtPB5omFd4G7Z9d+VTvYkm3hIHktgyweyDmysSSnpUz7xa7hpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881508; c=relaxed/simple;
	bh=M0bXAxUVajGUdbwCo52C81i/ru3MEd9U+J9iHxF4EIA=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 References:In-Reply-To; b=N7w4irr2/jrsEP1x9CiEAjnIjqCmlViAIsY4K82zAfwCcJ94LrSENhIxnI7ZLQ6m7O9iGRSU6TMLDcqi598jOzeMJmxA4lT9d7cUfTlV9h65WAPyJZdU0Wl7fi894uksrNWH8G+RErVLC8SHU3CVLbNGDUW3pVbOwpMOqphsaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cqyg9jB4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cqyg9jB4"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597NwEQv3925036;
	Tue, 7 Oct 2025 18:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759881494;
	bh=urU6PQHdQqsMtPa1c24jHJ6XH4WzEMGYSPWPHyUzoLA=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=cqyg9jB4NavaZmogqDvl+zUI1OiXi24drjkj39POkRwgwVWTLci8+XFtOd1VQ+5sL
	 B2ktongdfYiIid5TZ9COdDshgW9uh+J/TiTlc92hs6aTiZ7Wejv0gO+khSIVQ/z9TH
	 qsx8nEH8ToRfylskoiYZnWMP75o4izflV97cM9Bs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597NwE4U1045284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 7 Oct 2025 18:58:14 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 18:58:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 18:58:14 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597NwD0V1901943;
	Tue, 7 Oct 2025 18:58:14 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 7 Oct 2025 18:58:13 -0500
Message-ID: <DDCHX9627F8N.KWJDFIS4TO5O@ti.com>
CC: <linux-clk@vger.kernel.org>, <mwalle@kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
In-Reply-To: <20251003222917.706646-2-rs@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Fri Oct 3, 2025 at 5:29 PM CDT, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Recalculate the clock rate for unprepared clocks. This cached value can
> vary depending on the clocking architecture. On platforms with clocks
> that have shared management it's possible that:
>
>  - Previously disabled clocks have been enabled by other entities
>  - Rates calculated during clock tree initialization could have changed
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> I'm hoping this will start a bit of a discussion. I'm still curious why p=
eople
> would want to read the rate of an unprepared clock, but there were so man=
y
> logged operations on my test platforms that I assumed it must have some p=
urpose.
>
> Either way, I don't believe cached values should ever be trusted in this
> scenario.

Ignoring the typo in the subject (s/disabled/unprepared/), was there any
feedback regarding this patch?

>  drivers/clk/clk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..9c8b9036b6f6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1971,8 +1971,16 @@ static void __clk_recalc_rates(struct clk_core *co=
re, bool update_req,
> =20
>  static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
>  {
> -	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
> -		__clk_recalc_rates(core, false, 0);
> +	if (core) {
> +		bool prepared =3D clk_core_is_prepared(core);
> +
> +		if (core->flags & CLK_GET_RATE_NOCACHE || !prepared) {
> +			if (!prepared)
> +				pr_debug("%s: rate requested for unprepared clock %s\n",
> +					 __func__, core->name);
> +			__clk_recalc_rates(core, false, 0);
> +		}
> +	}
> =20
>  	return clk_core_get_rate_nolock(core);
>  }

