Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010A230270;
	Fri, 19 Dec 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133183; cv=pass; b=iDZ4bdQlddHGuQe63iza7F3/GhDIZl4A+UmBjoQf3G90xnikpFuJ88Axezb90nd7ty0KegXHCFJIhf2Ohnc20DaGWmB1AX781ExKtSK6pL7uEWGry8UzF5u4fIjrgpsAFDjKZyWohGZNOpNzlZngNO3zR5AMk9Kvwy/Ew3ywVm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133183; c=relaxed/simple;
	bh=Elt1/GiM/P0wr/SJI4JI/GxpLyBhoK4QryBrbUI31Ng=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gU/kczRh8lWexcIesVTuJlVAxgN4Cufo3OhuByytdKkl+nbZu/eHoA/1u+PgR5ifWYqiT5WmAaDTQDPvi/tOkHRdsEX3jerdG8JJpqxdg/QvHpboBXxb8ZHJfGEQh6a2Cmtm7Ox/flJ/FBGOmXehhY10DVPUslvIjTkVZVuFdwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ebTc6WOg; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ebTc6WOg"
ARC-Seal: i=1; a=rsa-sha256; t=1766133150; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mO3BsCtyHVBRwY0bLlTdjrDimIvWWXM50aUIsz5/QFfeYR0S5kj7KkZu9JThgegwbJNygsyX7MCN1Vv/V0Dnyf9bZ+h0/mHQVTygLzSzG4oe4BE6agn4Q0ZXgWMLFSeRuYuswP9blScoaX5hUdnTtW+M+toawMAs2TGlsFShnco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766133150; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qD8jT2s+CQPUn8ahKa2Vl1fnycgNsJt25eb304sEF90=; 
	b=MuTetyo/VX0yQ9sSHArt/8K88nHgXZLZxt0fxeyQOYW8FzRy3TC7dbLjlG/jjbIy8nauo/f1MrFkzlFY80DvR8Q9hEQuTwYN1Z9LNLQlbLx/Cv5AkLzB4BIQpLgdqvIyDC8WlfL/9LsOhL/EnzQfhaYS5WKu+hTzHhsg7AMesfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766133150;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=qD8jT2s+CQPUn8ahKa2Vl1fnycgNsJt25eb304sEF90=;
	b=ebTc6WOgLBeiZrhOn/NeZPSoafkCMInRijQ5XavpzJ7B+7Nvzy/36tNv1sBP/Sz6
	S8/oCxFNa4mMAVCAWoET7ewzsxNhbjJhYD3aMBboBu0l0Qytz1HPbf8FOOhBkSHJOTQ
	XeOMXbp0CJnvYSHylJNw7+Diq28o+UrwtVxES920=
Received: by mx.zohomail.com with SMTPS id 1766133148865100.9592386002613;
	Fri, 19 Dec 2025 00:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 16:32:18 +0800
Message-Id: <DF21Y2Y8FHSY.148HX8VXOFBHV@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Brian Masney" <bmasney@redhat.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
 <aUSQLB1fmYgQe_Fg@redhat.com>
In-Reply-To: <aUSQLB1fmYgQe_Fg@redhat.com>
X-ZohoMailClient: External

Hi Brian,
Thanks for your review.

On Fri Dec 19, 2025 at 7:37 AM CST, Brian Masney wrote:
> Hi Junhui,
>
> On Tue, Dec 16, 2025 at 11:39:43AM +0800, Junhui Liu wrote:
>> +static long cru_div_gate_round_rate(struct clk_hw *hw, unsigned long ra=
te,
>> +				    unsigned long *prate)
>> +{
>> +	struct clk_divider *divider =3D to_clk_divider(hw);
>> +
>> +	return divider_round_rate(hw, rate, prate, divider->table,
>> +				  divider->width, divider->flags);
>> +}
>
> The round_rate clk op is deprecated and I'm really close to being able
> to remove this from the clk core. Please only use determine_rate()
> below.

Thanks! I will remove the round_rate() implementation and use
determine_rate() only.

>
>> +static int cru_div_gate_determine_rate(struct clk_hw *hw,
>> +				       struct clk_rate_request *req)
>> +{
>> +	struct cru_div_gate *div_gate =3D hw_to_cru_div_gate(hw);
>> +	struct clk_divider *divider =3D &div_gate->divider;
>> +	unsigned long maxdiv, mindiv;
>> +	int div =3D 0;
>> +
>> +	maxdiv =3D clk_div_mask(divider->width) + 1;
>> +	mindiv =3D div_gate->min + 1;
>> +
>> +	div =3D DIV_ROUND_UP_ULL(req->best_parent_rate, req->rate);
>> +	div =3D div > maxdiv ? maxdiv : div;
>> +	div =3D div < mindiv ? mindiv : div;
>> +
>> +	req->rate =3D DIV_ROUND_UP_ULL(req->best_parent_rate, div);
>> +
>> +	return 0;
>> +}
>
> [snip]
>
>> +const struct clk_ops dr1_cru_div_gate_ops =3D {
>> +	.enable =3D cru_div_gate_enable,
>> +	.disable =3D cru_div_gate_disable,
>> +	.is_enabled =3D cru_div_gate_is_enabled,
>> +	.recalc_rate =3D cru_div_gate_recalc_rate,
>> +	.round_rate =3D cru_div_gate_round_rate,
>> +	.determine_rate =3D cru_div_gate_determine_rate,
>
> When round_rate() and determine_rate() are both defined in the provider,
> only the determine_rate() will be used. Just drop your round_rate()
> implementation.

You're right, it's redundant here. I'll remove it in the next version.

>
> I didn't look into anything else on this patch. This showed up on my
> search for new implementations.
>
> Brian

--=20
Best regards,
Junhui Liu

