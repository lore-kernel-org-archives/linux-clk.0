Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE5363094
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813788; cv=pass; b=q3AXWEhTDDfrYw9AR8rPwqAbU6S+BIKZ7mPSl2ZAUzHnDN52Ydsi8loC1P4Lvf0NZWXwUbz+HZlUICD85AjGue3WULmoOzbfNR7xT1RWTWUVdzDnrrhIHMQ4fteF1wJwkW2m/SKFcFkq0NRS2Mj42OSN+f8RcsMTaxPQNhT1PDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813788; c=relaxed/simple;
	bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2PP888PDZG8rSn/pS0FbtX7IMzC5STRsPVpe55eLhwfsS375CUGtqj4B+aqFM+d1wuQdjt0tTpzw0HP3ly+ewlOKIIbA6ERqmV1lWZb19xIbUt73/bTXJlxvKzA1eFd7S7awYXfolN5wGJU9GIiJuw4Mx2fexrDOi0/hhu9F3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQsamJ+H; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQsamJ+H"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a9296b3926so53252965ad.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 23:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773813787; cv=none;
        d=google.com; s=arc-20240605;
        b=Szm1RGc0SyIZY/LQmEnJB7hloPZm/9OymcRRP6SEmlrkwiuL5HekzT1EuIzIEpEmIF
         s+YakgusISf86B4WokLJq83fapK3FsY+6/xXoDUSEZ3LdAoF9t/waIcLVwNoiSlcIxCo
         faDynj9lv9Jo/QTsPLF4CjVbL9HRSpC8NTKk5UllKXioseAiYfgZACBcZL53ZYnsrIpp
         bgqZPBhRAP5mSIG1e20kQZ32iJwZ0JpcjByjUTidSe/8WQwAxGjTrRfosoiAzgkZ/b+x
         aecGIIxwt+eAzkgjZhRXignY2AhBhBGalVkm79TLiqbVgMiF9relIaslsC7ilYSnbtgE
         39bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        fh=49/JRxwEEXJTCNUfon344Rhf0FrlMKcnokdNUzsYLYI=;
        b=PUYl5bxlDvZM6chHW7YrlSw2zuPPZfdEsG3VdH4yIdn0s2DMfVASgr1F9H/BQcQWmX
         W0kzSoV7fkjg6p8wavgELzFR7Uc0WwBIhSTsRPdnZGxO5mXiC6HRWXOynZT00ycJVzTv
         GMAXRr8OMzRYaoKoHXkPzsmmt4qYXmbPuKV5/HDFuXnYJzThSGAlyO8liKmXmIWhPIXo
         w02nGnnwsQ/voBjhuwp+C/l4VgiBgclpmGUyLsIChlblgfMOxQKk1DVtbXDiFsv7xi9Q
         4S0xxrbp/XJtke7lN9onyx2ubgwa2DY7qOhiG6C8EIm3VFqIDqoMXEDXqDiCi7UZS2+G
         xaDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773813787; x=1774418587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        b=KQsamJ+H/sTVmjjdRXvL8mZT3rdm6q+jRwuS32LehAw88OxCqP+T7O0ijPRSVa0qT/
         P89HBihA+u1nbGKt7f+FvzEd74GCbwM9umJxHxFMYgpYhcmpNuT+ruYblm6MvVLJAWJj
         4EtD1NW5XZXJIQRz2lou1su1lW8hnkl+5+xWJOH+tdVU5l/RNoQqSqkO7fzvrKrzm0Mx
         e5R3juyPZpp8Lp7ge089OXXT1NaBLKXe89UVAbH6nuoE+QepwW4Bn2za4k8lMDacg5AS
         omXFrkPaKNOI804Mz5reDXYbkO4OYdiNAizpacdA4mdJo7HVMx6/IoY/rztnC/fQbQHd
         cWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773813787; x=1774418587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        b=CTVDReuxqMFTcUcHpjRa0mQ4J08b0xquNElWUqKZ1Kayx5pxD6TKnka5VHAICMSRXC
         4vezt6yV+IhuOM27vnKZvyPJiF/5gofT7rra08RvnVeX9rUl+aGVyAzlX2OD41wTAu0I
         HZrIqQ10BJ6SFZqI3uoMH5pFr2kJzFOWJS4tKFs3IK1/O9T+CRD7nW222pFOsBylOM9F
         i+ilfCM2Ed3Ipxgb4jB440/HslB+ryDVSqwg8pwKBNS4vT71nMB/ox0kdTtl5ffUlFiB
         nE5Ge7dZzfbi5lcT8kVPg40rwSeRrNB5VtPjy0RhsO/qNDCaM42/WhZWS0qPtxQ9cvcL
         eUvw==
X-Forwarded-Encrypted: i=1; AJvYcCX0UBEppm+SaZUkV7mSCDAknrK4ZzP5eWIdJrPJdUdqJ0qy6zIuIBI289DC6nkJjWpirc5Ufu4HbUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR5OjYMfTKj8bm8VDpf/WmU39ge1DC1vwTWK1CUtEM1aATpdl4
	mGHXbu4PggyE36TqlxRouc1fGeRoqtaJX1i3fL4qa0tHjeUW8xFhaiKkboB5gVq+hB0QgY6s/3k
	CeZ+VQdF5fyoPrcB/px8YlfIebnQSrfA=
X-Gm-Gg: ATEYQzyexzh9FOQ7l3fL4207CcoHZJOvZ4u145zXtF6kL8LN9KITcl/JsZn/jsYnK/t
	WR9dEG5VFVPBe9KC/LAA+0uA4ORpR5gG5EVHuzTHDZY+ou4iInPYqgdvxClZ+/oP+jhyRTqYjP+
	1W4H46P2Q7xJGTIcCYUW95p6sudoI41+LzsKY+RGIqz3hWpBQM3KVWHrvAfn1mdhrkZ3VGFyYH0
	+mAx9dd2JV4LVuc3OXV2NViBxl7gQTqkbVBrGabQ7zvwhQz06n5K+jlT18xLEmfIoHORZeGiUwa
	85cBdN9MF2n5SrtkJFSqaaKgGHR1fO1Aca5Thw==
X-Received: by 2002:a17:903:4b43:b0:2b0:6d2d:f1d7 with SMTP id
 d9443c01a7336-2b06e42bcb5mr23101165ad.48.1773813786487; Tue, 17 Mar 2026
 23:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
 <20260311043831.2576-1-phucduc.bui@gmail.com> <TY6PR01MB17377BF5B5B59022FB39AEA12FF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB17377BF5B5B59022FB39AEA12FF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 18 Mar 2026 13:02:55 +0700
X-Gm-Features: AaiRm50Lyrt6jaVx-jDOI8ZexNpt-ne3CL_yu9V8PgLR4hVEocE_OODjZBPtK7w
Message-ID: <CAABR9nHZsnsEVcsb08YLaZKL_ofBkKhqGyLSdH65Vh-2we8O2g@mail.gmail.com>
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

> Thanks for pointing it out. As per Biju's comment, there is a missing
> -hog at the end of node name. Thus, if we keep the schema-friendly node
> name 'pcie-clkreq-n-hog', then 'line-name =3D "pcie_clkreq_n";' can still
> be useful.

Thanks for the clarification, that makes sense.

Regarding the line-name property, I'd like to see what the maintainers thin=
k
about this direction. I also noticed that the usage of line-name across exi=
sting
Renesas DTS files are somewhat inconsistent. If the maintainer approves you=
r
suggested approach, I will follow it and include the line-name in my next p=
atch.

By the way, are you the author of the renowned books such as "Linux Device
Driver Development" and "Mastering Linux Device Driver Development"?

Best Regards,
Phuc

On Wed, Mar 18, 2026 at 6:31=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Phuc,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: phucduc.bui@gmail.com <phucduc.bui@gmail.com>
> > Sent: Wednesday, March 11, 2026 5:39 AM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> >
> > [You don't often get email from phucduc.bui@gmail.com. Learn why this i=
s
> > important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > I noticed that for gpio-hog nodes, the kernel already uses the node nam=
e
> > as the default label in /sys/kernel/debug/gpio if line-name is missing.
> > Since the node name here is already pcie-clkreq-n, the line-name proper=
ty
> > seems redundant. Should we remove it to keep the DTS more concise?
> >
>
> Thanks for pointing it out. As per Biju's comment, there is a missing
> -hog at the end of node name. Thus, if we keep the schema-friendly node
> name 'pcie-clkreq-n-hog', then 'line-name =3D "pcie_clkreq_n";' can still
> be useful.
>
> Regards,
> John
>
>
> > Best regards,
> > Phuc
