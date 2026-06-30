Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193E3368AA
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809641; cv=none; b=snFphgRXThvPl57fRRL+nxs0kPI0dtMB5L8thGvScTJKJef5q5CMEoZKlzrMrznNmrZRJlGw7gefLyodFLMLpo2YjdQriqKcz/ck3UibHOOnluWEEp346niUDR5yzHx22iJFMBtBfSqWExpf7WzSrKtMQjrumJGjPMNKfOSL/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809641; c=relaxed/simple;
	bh=jSqCbiw8rPhSQgPSsHd7R6eVF88l2Y8pZ2SQ4YaLbnM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qYjnCBtaRXJLyx/JCGwadOrPYm0DTWcO8viZDknXJV/uX9HFmz9e8Fi3gHGgPkX13usvBdGRXXZOyAEKKsDJJn//0DHQjimCv27rw5s9BO0fzKMoZB+8uR+BmFjhs37n7fzK9DiDZ89tJheVQfCwrfrZW/8nY2bqmoxZfUBWklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHvE+qhx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHvE+qhx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so3002185e9.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782809639; x=1783414439; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=cHvE+qhxJvEN7A3RmEoEz/b0SL/0uv6pB142b62xnXECyfIl4OHuJvwCfrMPEnPZhd
         LR8la3lIZEy7inW2OaOJlWhAPaV0/FAPitBHR0zuwzjlwIiVTKAYtJpXPLOFIo559Qh6
         9zS2MudCthN+4vb6F0wNwsZ0tBXjS7Jn0MRzaLnJ6+Lz2R5KStJQHNV11HAdOLmHoeJ9
         7KpCIfBQIV4vOmjVerXkn/G9OnxG10txMIa4SmpT3jk2jbGqVyO9j1Cz3BhKN5wXh2rq
         oo9Cm7j9EUcQeRFBLG+28u6/KdAV56Fh/wl3pneLc286AjaKmP0pK/OkRBhiZzk6gI6l
         50tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809639; x=1783414439;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=R12n4iLu2aLYIxRYqaU4S//Z7lYz9+/OyX50y9+3VoU2VtIOnYNLyPl2XltCXuTtZu
         at97nCrfgmUxnK37x7UjIkJCPCQ5x8JlDaImYIVy4c22rfvxav4x1b3Apj7UGdQGxutg
         exTjDF5dtshQbza/I3g9qeXcy6yiiMle7WzXCZAst03OXbQcVfb0kt0Asuwa7LW6evxc
         pDLb5dUl2gBs+1eLy4p16Lou8SB7OPMlAaRuF6fvM3UMc8B8xm91EMemuy973Dfm15Iu
         P/mFAIvfS+H1VvZWYjhHK4854/72w9Q69qHgAyN++aDCxRe6qNVKanGAsQ1FwEGZJzdR
         dCng==
X-Forwarded-Encrypted: i=1; AFNElJ9D+6eocuTrngmf+BPZtVWpFIPvejT77TQZ9RzAUzBqtfMaOKfx2eFjdNvhTUpE7xwTn1zDokADurs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXeZJtlJHqALrKYyeEGbVeKwBG0irbrNXIbETrGU748I62cIW1
	jUuKTLy6Qn0f4zrcGwjkd7ssdO0uB8quQe2i8ufl46D1MAjCHYeOwUWn
X-Gm-Gg: AfdE7cnKbk4kvnjiPZcjapLmv1z4HRH0i0T7isanRbGhCI77fX6gc4vlaQTL4dOYyk0
	J38u4U77MlDgSBGS3LvC1vP45V806qRkM89reTBF3J8tqQjLHXE4COGvUIfqdOFxRMM81RwXMZX
	7HATEHVz7UgD8o3eQH0Pxtu8kYmThB1WDIpOfpYgHiL0VIEO2/S0fOSYIDJQVbzUEf9icKfRdUo
	BJRRQ/l2h3Vw3jSdLdnvi9VSDq1470Cr5i4YWNUtqxIJuBXUHMhdOnuvXnekObGeQkbNzQ41N7T
	YrxUbng+Jy6dHJ3uer0ZHzu9jllqCN9xC+O1F7f6NWrwobfRnYU4AXh8dGX7SnOcbgaSkNr/Tz/
	hDqSQrEh3J2GSSYIRWYIUHRuwu84e0pWOMKxMhT7U+oZMoZZLjKHacZLVEA6Mp8b6M5JSkx+FQS
	PMqcEStf8S9WDv1qNaKXnlHDgdxh4r38s89UT5Rfl7pKqiS/CBDdN/
X-Received: by 2002:a05:600c:c11a:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493b82b0e50mr36934455e9.18.1782809638753;
        Tue, 30 Jun 2026 01:53:58 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bc7aca88sm46787785e9.0.2026.06.30.01.53.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:53:57 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
Date: Tue, 30 Jun 2026 11:53:41 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
 <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Philipp,

> Am 30.06.2026 um 11:27 schrieb Philipp Zabel <p.zabel@pengutronix.de>:
>=20
> I think the MFD driver is unnecessary overhead. Can't you just keep =
the
> reset controllers as auxdev and use of_platform_populate() to create
> devices for clock-controller child nodes such as syscon-reboot?

MFD for top and matrix was the suggestion of Conor:

=
https://lore.kernel.org/linux-arm-kernel/20260618-fantasy-estimate-6c52edb=
c6890@spud/

To quote:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

I can go either way. To me aux vs mfd seems like a distinction without a =
difference.


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpDhBUACgkQPRO8yFRP
GiLDTA//XuiFvq2hvcqMHFcgqCiOzfN6Ejynlaa1U0fpgCupiwkoTk7x7V2F9fNC
GDJKF2tdhcs7CpooAxYbSMwhLT4UlSuCWBz+Op6qj4ANOJi0L/kMelslIMoZG5qc
XgAKSrho7pZxbYl1BPd6iNZn7fU6ejh9B346spNmR6Kjk8o+7giGQS527j2Qlnfr
Lgk0fnGiCcg5uKdkynAcTArHAJN7Pt9TjBHQ3SxjC424lnbUqeAHZ3MVb+nMbM0L
vbSSXmozV0xj2RPFVor0EUYhXWT8jsF1t6TfZCycP/DWL4oVMa8nzBtYRM1E6D7M
Sz+Yc59noQ0NgNeCzoTDR7iBR/QkZdsq8WB6Q5cO8TMVcDxXUOTIU0cyVoFLimjG
y8cNXWjGqhYXYbAT/7W/Y/MlTT2Ss20ssTNTTP3WYoORsMjVrBUtAiyI7FXpaZIC
7u272rGUcIf/EyhIBuIOtukt1F+YwWytOoPqDXzfvUX3OyU/VdzlV63Ee30HlnOT
JNjndlqVVL4aX7BgJIBKkP4gEd815JCX6I44nlSbLWs9375U1uwYmkWgqhKFLx/S
gm0fMw/AxcXSP+XbtrCnbIMSeWSWtlW9y+itnxhISdD9rgx00WhjxnoX99ywfat9
ugTXugS0oIxmoGGxLvMBTUdKcXQjk0V/smaau8JmSbdZujZ0lr8=
=DWLi
-----END PGP SIGNATURE-----

--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27--
