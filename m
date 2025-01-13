Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C322A4F1;
	Mon, 13 Jan 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771404; cv=none; b=JC6mXRp+Sc5FPBWAnK8/BiIktRmJdd9jSPPUKs50sSgjm15kuVV59KRkOLkcTTh0iKprRIqhRpuyi1OWd0pJK+DmZfm07rUfNmJXenw+fekVSeyLek9f20Q8MMRnI95cmGizLgVVkgfx6EwgCLQK+yVIPzRkcUJPF8A8+FIxDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771404; c=relaxed/simple;
	bh=srKllMZW3R4jNVS3ob0zQq2Achx8hw3VrNniXfosw5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itS4e+lQWkNJhc/kT89jfhkIzNMxpWV1M3lavFRtVmN1xyFk654K+atEUErzvc9FQuwyTjlWzWCSNx6hTM7a8iO5Yl6PlB7BtaSNcqAtfAE3YKQIJBgYvk9Z0pR2AmJvDK/OHx5nREczchP1q0I/FWINOP3yD2wEqBE1tVLVF8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBm8wfQx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBm8wfQx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21619108a6bso70276525ad.3;
        Mon, 13 Jan 2025 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771402; x=1737376202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ro6/P7rgBdJH4WO28Cu0rkO/sr8eLGSRRDbWEerqoQ=;
        b=dBm8wfQxlIIyRWHzrlOtoB2v01FhztEoq/R1bs+Hf+zs8Cv+0jIhYrmNGC0g/YgyGr
         XckpNycfULTbufd5rKbxGQNp1AjNv7F6E9/4pXfzVLMPKKtsfvzQiE+VogB9oBEXQR8D
         6b3WVzfhycAJLNSe7xxjVp596bFeGT0AL1vgnnBAyCDczr2Pn12xkScfgSMa5foSLjb2
         gfovX1EMDdtDqh/JfLvImb9h/kl+7gGbHvTVuscTU3KoJZ1nARkt92tquW+BMdctgt1O
         jB9fxPTnLr8Ib8xZh3KD6XT3Q6D9/NaimtV735DrvRqm23WL5gFCaL0PQ3YkD5yTAXrH
         p+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771402; x=1737376202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ro6/P7rgBdJH4WO28Cu0rkO/sr8eLGSRRDbWEerqoQ=;
        b=ef9tvnctCvCMs2g1xI/TP7K9G+b0/FGCu3VxaoCqBzOF6XoL4mqhUIe+E+XnqH4xNT
         pmQCKaIhDMoNe4bpsPppdnwWfDfigrbim2GhQNCejt1ID8kNdPxDrXLnlNqYZEjyib5H
         pPnrdJAW5G2FsgoLsPdtyigt1YhpSqs2+9EFromYwyfHEBEtdAbiqQpIWzqIIS+h3DQV
         25cwhOaJucqao+Rf5e94lusUi8GlV9bjqFj5cm0XbJltXaqs48Zu8GuWrZMQQS6IpjLt
         EXFKIIgcy2lvEGfjfClzauGxYFG4vebWKUOOyyzythaLXBPyIXCuFvygDD+50zieA9Lg
         pqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgcsXoogesSLZbfpyRIQODDhyaa2wT6kYL8f4VyBjfHHNj/UjKAGo4iw5U8eFjA1tbn9vPAl4N/suY1EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLYtmbNq638j2bv/CfjrprCIYoXINVtPHbddF8oY+igx9j3Rk
	tD0DKvJgrjoYSUTqhNAGi6U7f81TwiYgz0sWCn7US/vLpuV+PgVDlAnhkdNx69Yz5I3ITZxUb8j
	+Nw09007ccCdPioff6oTwPaOcW4Sbz3SC
X-Gm-Gg: ASbGncteosYCWQb9ZfJ9/rqqEmJz4g5/6LckLAa5JiXn/ha0yQTwzvE32tiKJK3k5Ia
	j7rCHZ0U5/6Xr80bUQb8m/6TeQVwsEz5NC3rD
X-Google-Smtp-Source: AGHT+IFT573twRyKBUV5gbeW4QMKK9QyVoTrXDY7oEtS6Jy/EB3zG2UEszDBphnwXgd7qwsoKNIRDBbC41qKILCy2Ho=
X-Received: by 2002:a17:902:e886:b0:212:68e2:6c81 with SMTP id
 d9443c01a7336-21a83f62612mr353655205ad.24.1736771401865; Mon, 13 Jan 2025
 04:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org> <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org>
In-Reply-To: <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 13 Jan 2025 13:29:50 +0100
X-Gm-Features: AbW1kvbW9Sh6k8N4m_cBg5TS1QcbvimnSphpqlbdgpS1VsE18i7COJGdEk0ffpo
Message-ID: <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 1:17=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/01/2025 12:32, Sergio Paracuellos wrote:
> > Hi Krzysztof,
> >
> > On Mon, Jan 13, 2025 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 13/01/2025 09:28, Sergio Paracuellos wrote:
> >>> Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT5=
350,
> >>> MT-7620 and MT-76X8 Ralink SoCs.
> >>>
> >>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>
> >> 1. Please use get_maintainers.
> >
> > I did but from my tree which is tag: v6.12.5, linux-stable/linux-6.12.y=
. Sorry.
>
> That's separate problem, but not one I was thinking about. Even on 6.12
> stable you would get dt list, which is missing here.
>
> This means no testing, although does not matter here, and it does not
> appear in Patchwork which means does not reach us, except my filter for
> nagging.

True. You are right. I forgot to add the device tree list to the cc
for this patch. Sorry.

>
> >
> >> 2. What is the point of this? We do not add constants when there are n=
o
> >> users. Commit msg explains here nothing.
> >
> > All of the old ralink SoCs' dts files which are in the tree are not
> > properly updated. I expect to have them updated somewhere in time
> > merging real base stuff from openwrt dts [0] files. Not having this
> > header with definitions makes very hard to update dts and then
> > checking the driver code becomes a need to see the indexes for the
> > clocks to properly setup a consumer node. Because of this, this file
> > is added here.
>
> Still there is no point without the users. I do not see any reason why
> this cannot be combined with fixing driver to use the header. Not
> combining is an indication this is not a binding in the first place.

Driver uses a bunch of arrays for the clocks (base, fixed, factor and
peripheral) and they are registered consecutively in order just using
the ARRAY_SIZE macro for any of them. Thus, the direct application of
these definitions would be for dts consumer nodes, not the driver
itself.

>
> In any case there should be explanation in commit msg about such choice.

Sure, will do.

>
> >
> >>
> >>> ---
> >>>  include/dt-bindings/clock/mtmips-clk.h | 130 +++++++++++++++++++++++=
++
> >>
> >> Filename matching compatible.
> >
> > There are multiple compatibles regarding this, since the driver covers
>
> Driver almost does not matter.
>
> > a lot of SoCs. So I preferred to put them all in a single header file.
> > See [1]. Should I add a different file for any single compatible
> > instead?
>
> Well, are all in the same bindings file? If so, can stay but then:
> filename matching binding, because binding has proper naming scheme.

I see. Yes, they are in
Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml

So I will rename this new header file to 'mediatek,mtmips-sysc.h' then.

>
> Best regards,
> Krzysztof

Thanks a lot!

Best regards,
    Sergio Paracuellos
