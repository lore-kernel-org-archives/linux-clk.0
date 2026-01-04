Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32656207A32;
	Sun,  4 Jan 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767517936; cv=pass; b=VFvZs+2tOlUnSPDv2Z45oeO+OTuQsmmduPwdZw1dgv1R/+yWYEvTag17b+qfx6LqkmGsFsLjHCOgIR21o3KKTk2GqhZLfxz4DBwkfyB7TQeNs+T5e9Js1lVGpec3fkAc8AoUlKOUkxGZjmC4fhfEIQ1ESmesJda/n8p9P9/hU6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767517936; c=relaxed/simple;
	bh=sh7H2vgM6G1QrWWIEKBdA+eLsPCBz2nELZw9EHcufXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=s33WSvnkJd/u/MbJngoU2dip4QSgJs+uXfbkSZ0ali6WktisuQffvZkS11wYoS4CH1jbQVTi6GYx28DVCRV0FE2faE8VYaF5Foi6bQc/a5USIbDNrCt7VPoCQ1DLOUDhSEIw6kFSJzhGguBRHTPaVRpsHFsYm8uL7Nt+xZH8bAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=m6Jy/Y7V; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="m6Jy/Y7V"
ARC-Seal: i=1; a=rsa-sha256; t=1767517889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KsrWPos6ny4u9+U5SqBfYsen6Vw6r1JjFnk/oEA3GtIfIQ6EL/2v8a8rQJa+jmcWwKks0uCB8BTOCVuw965VrAlYftU2+uIEcG//aAZz2jvw/vc9YOzZ9G8zUrKuJ2dghierrpqyO9HfX1q517FBefLMilBmEM6UwVg6FqOY/jo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767517889; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L05UvUaL84OUDJeTop5CqpzB9OlZRXWekgv+Sku6Q4k=; 
	b=QcjO4VttNLb19KI2tbkCYeoLnzJLiFgf8/r+WHeKyidcOGOuJ9YMpDq14C/izBz6ZKg4Ikz/pQZ87D+ZIIAwbkAd8uTaW4TXG2PEaAxZqxIfsyHyhy1Qq8q3BfwatV+kD0DRcMpe2yfn1t0CTLyFFjY+OxcZzWedaUGKb85iajY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767517889;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=L05UvUaL84OUDJeTop5CqpzB9OlZRXWekgv+Sku6Q4k=;
	b=m6Jy/Y7VzUBo5saIRAcl52rOCEeZIi0Teta+PF8qWS8gf0YSjykYzC0qJgJc4DI2
	D8a+3o4BW5OeLI5ZjwjurMSxXGrk6wcM/JrZ5QFVWFv2wevxepcYrkgDAqDOVhtr4Ae
	RsINBggvd8FNiUgDQPbRyccx7+m6f9ZHLTFERVrg=
Received: by mx.zohomail.com with SMTPS id 1767517885291893.0220610416135;
	Sun, 4 Jan 2026 01:11:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 17:11:09 +0800
Message-Id: <DFFOSJU7PN4A.KER1R2GT8EYZ@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/6] clk: correct clk_div_mask() return value for
 width == 32
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "David Laight" <david.laight.linux@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
 <20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
 <20251231105651.430f75f8@pumpkin>
In-Reply-To: <20251231105651.430f75f8@pumpkin>
X-ZohoMailClient: External

Hi David,

On Wed Dec 31, 2025 at 6:56 PM CST, David Laight wrote:
> On Wed, 31 Dec 2025 14:40:05 +0800
> Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
>> The macro clk_div_mask() currently wraps to zero when width is 32 due to
>> 1 << 32 being undefined behavior. This leads to incorrect mask generatio=
n
>> and prevents correct retrieval of register field values for 32-bit-wide
>> dividers.
>>=20
>> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may r=
ely
>> on a 32-bit val entry in their div_table to match a div, so providing a
>> full 32-bit mask is necessary.
>>=20
>> Fix this by casting 1 to long, ensuring proper behavior for valid widths=
 up
>> to 32.
>>=20
>> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  include/linux/clk-provider.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index 630705a47129..a651ccaf1b44 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -720,7 +720,7 @@ struct clk_divider {
>>  	spinlock_t	*lock;
>>  };
>> =20
>> -#define clk_div_mask(width)	((1 << (width)) - 1)
>> +#define clk_div_mask(width)	((1L << (width)) - 1)
>
> That makes no difference on 32bit architectures.

You're right. Thanks for pointing it out.

> I also suspect you need to ensure the value is 'unsigned int'.
> If you can guarantee that width isn't zero (probably true), then:
> #define clk_div_mask(width) ((2u << (width) - 1) - 1)
> should have the desired value for widths 1..32.
> It probably adds an extra instruction.
> (OTOH so does passing width as 'u8'.)
>

Thanks for your suggestion. After further consideration, I prefer using
the standard GENMASK macro instead:

#define clk_div_mask(width) GENMASK((width) - 1, 0)

Using a unified kernel macro is better for maintenance and it also
benefits from the compile time checks in GENMASK for constant inputs.
This approach also supports a width range of 1..32, and even up to 64 on
64-bit architectures.

--=20
Best regards,
Junhui Liu

