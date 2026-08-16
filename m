Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549F347500;
	Sun, 16 Aug 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786869552; cv=none; b=TogPEAAgzxCeSwX0NIE4kFbE8i+ugVXRM0EBIKANO0qbTAdeu0IVpczMxf4FSlCniLB1m0d7RJLGjPkTgIKJHZ0GOQmuDtpGbkbBH1LPDlfB6fl03fYfsYi19IpHQpA7nCBSXb3zhc/1tik2B57Wll4JVeN2GsfzuoHgqU50+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786869552; c=relaxed/simple;
	bh=7R7M9Bu8uw3DjIy2ExBf+YEfW8MIdENsJHAp3xnhS5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=SOU3mLDJn/z8GiXWGuYAVu0Gyyiy2AUP+R1yAG0dKPtSBbadhy2f6HFvGHGjh+DxwgQbCKyQ1zEY9M158Y+NjRDerBy1WhAN5+rvJsBkluvjIDBGYBwpgevfLYp+6cJHmb9tZA3wXG8DbDc6iY7jVlZ4VCjS8k02EnJ6EEDq+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fPCMwKiK; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fPCMwKiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786869530; x=1787474330; i=markus.elfring@web.de;
	bh=CSxWnjJeD7xgwO0DoVg8lbYPCAPnmNjZUeHb9bz0tOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fPCMwKiKE8d1zwmm81WvHHf0J4gOemVAbVj43nLy7WCRQAIUaOjACUyIzWR1zsge
	 TTIXHqQTQKjexb2w7S/xRfZmsj8eJ8ynaYaCByFedfP1/OB2YhA4DNvI45FKImBgM
	 7VPSkjplpdv5X841X9zEBkPx0mZAV1F93SyWvwvITB6nszyObeyPb89flHzPz1OsZ
	 kHVdJgSs2YP0TTfjDPgZ48dfgyKZpFPljXnAYCKgwpzc8P1+hDQanrKfLFVxHdxKc
	 tlaMPzUG2GxYfhqoDozBVIBdh94IUp51m9hp1dfXIUUZoPyrZl895YG156k6Ecu2f
	 AGBlt+5oOM/cSH4LXQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwNW-1wO6aC2bzy-00kJVA; Sun, 16
 Aug 2026 10:38:50 +0200
Message-ID: <d46f9eef-e77d-45ca-90e2-5f9f903e92d5@web.de>
Date: Sun, 16 Aug 2026 10:38:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [v3] coccinelle: Detect clk_register() anti-pattern
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 Guru Das Srinagesh <linux@gurudas.dev>
References: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev>
 <bbc7fb40-7650-c81-6e19-f7baba188e86@inria.fr>
 <188bba40-bee-fb85-93c-fb59487dc861@inria.fr>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Stephen Boyd <sboyd@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <188bba40-bee-fb85-93c-fb59487dc861@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2UCWm3LGznDjMfCfHxZJhwl9v3hdcEypOW3wEJKPkx0L+IRNOei
 S6wMhttW8AmFsLG41RKeHfWxHfhYBPRe6r73N/VnOucKPJlugguhXKMA7nEHZIYEqnjMI+G
 /F07VgoOn3FUCkb1lQLoJWShON8OMw8a0Gi8nvePxiXg6D8i++zdtheTZneRW/hq1yNoHcC
 3ONjzkDPUChPj6LaK5PcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dNeNtItJppY=;AyTLGf7fHvDvMzXNrGkm6cF6R/T
 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

=E2=80=A6
>> another issue is that in one case, removing the error message leaves:
>>
>> ret =3D PTR_ERR(inno->phyclk);
>> return ret;
>>
>> This could be cleaned up to just return PTR_ERR(inno->phyclk)
> Note that there are lots of occurrences of
>=20
> ret =3D e;
> return ret;
>=20
> for some expression ret and e, and 99.99% of them are fine as is.  But i=
n
> this specific case of error handling code, perhaps it is not useful to
> introduce more of them.

Will such a development concern trigger further collateral evolution
for desirable source code transformation approaches?

Regards,
Markus
