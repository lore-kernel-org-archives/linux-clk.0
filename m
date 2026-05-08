Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5185C4A
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778208336; cv=none; b=q+mDVYdSuTGrmWuPy8atl7W7WHPgdXQKbXg7E8oUxN/FdPX/LE5cbkt8jzsH+KI+wHHFQrKgW6CZpn6BOzacUFxK2R/apLWMzsT2syyEAtSyM8dVBw84UnvMVf+ZLGlnzN+4wWmM++mCdwW6pfsqWsghEusECxyrE31IOXwTAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778208336; c=relaxed/simple;
	bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uqcw3k5SgTNH8do36O/a9PL+iqv8wGaKiGAmVF1Lcl9q+0/p000mldUCXiK85jaOhqEdqPhRLZ/z/VVovFgSyIayoNF+J3BXu+YcwbrG4Tzuxr8hks4FUWaJEth4HOPUeQN1GURwjirFLdcZXiEMoVUlDtu7SYI//QZIDtxoGUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODWmQijR; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODWmQijR"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69498319ee7so1571391eaf.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778208333; x=1778813133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=ODWmQijR/5g1OUlUvDpypgfpilBU8K602ai2NUyBrr9M/7scQhKmf615y/89uP6LZI
         KwqoY0I8Lxafcj8e/nkm+RgQAOEsZ39CG0rS51thfr0gU6w2fDjYJbqWQFgYZqprL1Aj
         JYSwzIdont/o9HPqVk49HyV+GKKO2s19Kts29KeTuWIobkNsTTFZ4pKA7n/AF11b4HmH
         X4ZX+IrFe5D1i8v09UAPhbV3uYwR9quHdjy3lcYTl9eW9tahlqRawaHOWR5f0kQ5WPTD
         p9mb+xO+5WnnBpxg3M2maFnTYjYu5b75oS+DI9gsVxkukHyPhhnjQ/6cP3MTxGQzbtmn
         JNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778208333; x=1778813133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=g9xwOkMuDSgJSyG6W3rriMgHjrfoaIuFdlzgDlQ9m73o6COqTAomUkj8w4mEhkqmsS
         VES+xiifbWhDKXrn2PHeCqeX3afnU4+fx14GssE5I8zvj4wZ0uz9IUfA1DSjfKc/4phw
         ijAHywJG5Uzsv0HSCD0/15bfGHAGRELNQbAKD2WfXNbheOG7JHSD+w/ZKLSxH7ppj7Kw
         ld+BjAJqU1nP5s5zwYx7QEQ0FMq27PCPU+5Fs2FkfNd2ercCpJFSmqlQIy2mLBtSMsC5
         GojWKS3tkJbMjrWDm7A+kbLdMVngcffY5VZx0C66xYSbRbgJJOYuuXcxyux902ZNCxsY
         zzCw==
X-Forwarded-Encrypted: i=1; AFNElJ9owlfxP8UYvQUJ5aeOKEsQjetFY7CKltK+QcnkXRoxBeRrA+PZHn+9lhQVND/xYUxzxJ+3KzaFIJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalXy2F703DVOXdzb4d1gjdwLmOL+/lTRgD6AIwXa3VbiUwncs
	uVaQWKJgaxR2TugLbLG8O5HMBCMYyNxBE8mJKHpwtpcswxumGkNoX3mf
X-Gm-Gg: AeBDiet9WHbkMooElLCIi/S5u85PnYQKLAQ0sMqqWwq78Acf85hormKsGbjzJG3boSA
	HhDUXLqRgBBk4EJKNdDPohwKudHJYRaMtn2DXma24+Meq+JRKXZJVBeYx9mVn0fFabutzBzmdX8
	8wpeVK9RTEpgEQDldLVMRUjzR+DmOQEZWEk6yeKvgk754gaCck5DmVeApIr6YXSaVjU1RDT+ie6
	HXiD1GScHnnLAH3WDEClXpXkejiQBaXszePvO02Krwazq//jeTc7i0pPDtoLXM4lqcrvG92pCVp
	Dxb47avj7SvD+uWB1I49iyHKeNF4yLSdUh7rhqpdTzG3+pNe01SiR4hVzHnjZPt8BdL58B22PuV
	vZDon9dunPdFULHnsXq7PrQWrnVwwJzSf0rugvb0Ax978O7Uh0w1/g4KQEWLnS75gVtU+6zkJo2
	Aa7lbUj7WRQmcfqPSqY+R2r3aVmeknhOyL67tTWkS/FJh4E+PxJzIoozgEdzBLnLzd5nUDXmUC5
	MEEswZ834IvrDVGn3GNNIu3gvkMNO0+ISk/NQLE0Cel8gU5
X-Received: by 2002:a05:6820:190a:b0:696:1a98:bd5 with SMTP id 006d021491bc7-699ab62e838mr2720265eaf.19.1778208332600;
        Thu, 07 May 2026 19:45:32 -0700 (PDT)
Received: from nukework.gtech (c-98-34-199-138.hsd1.tx.comcast.net. [98.34.199.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c767d0sm349447eaf.5.2026.05.07.19.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:45:31 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Thu, 07 May 2026 21:45:29 -0500
Message-ID: <6525179.vuYhMxLoTh@nukework.gtech>
In-Reply-To: <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <27098742.6Emhk5qWAg@nukework.gtech>
 <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, April 24, 2026 7:17:05=E2=80=AFAM Central Daylight Time Konrad D=
ybcio=20
wrote:
> On 1/15/26 6:27 AM, Alex G. wrote:
> > On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
> >> On 1/14/26 4:54 AM, Alex G. wrote:
> >>> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >>>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_w=
css
> >>>>> driver. This firmware is usually used to run ath11k firmware and
> >>>>> enable
> >>>>> wifi with chips such as QCN5024.
> >>>>>=20
> >>>>> When submitting v1, I learned that the firmware can also be loaded =
by
> >>>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>>>> makes sense to have the option of a native init sequence, as not all
> >>>>> devices come with the latest TZ firmware.
> >>>>>=20
> >>>>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>>>> right thing (TM), but I am not fully convinced
> >>>>=20
> >>>> Why else do you think it's there in the firmware? :(
> >>>=20
> >>> A more relevant question is, why do some contributors sincerely belie=
ve
> >>> that the TZ initialization of Q6 firmware is not a good idea for their
> >>> use case?
> >>>=20
> >>> To answer your question, I think the TZ initialization is an
> >>> afterthought
> >>> of the SoC design. I think it was only after ther the design stage th=
at
> >>> it was brought up that a remoteproc on AHB has out-of-band access to
> >>> system memory, which poses security concerns to some customers. I thi=
nk
> >>> authentication was implemented in TZ to address that. I also think th=
at
> >>> in order to prevent clock glitching from bypassing such verification,
> >>> they had to move the initialization sequence in TZ as well.
> >>=20
> >> I wouldn't exactly call it an afterthought.. Image authentication (as =
in,
> >> verifying the signature of the ELF) has always been part of TZ, because
> >> doing so in a user-modifiable context would be absolutely nonsensical
> >>=20
> >> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
> >> has been there for a really long time too (at least since the 2012 SoCs
> >> like MSM8974) and I would guesstimate it's been there for a reason - n=
ot
> >> all clocks can or should be accessible from the OS (from a SW standpoi=
nt
> >> it would be convenient to have a separate SECURE_CC block where all the
> >> clocks we shouldn't care about are moved, but the HW design makes more
> >> sense as-is, for the most part), plus there is additional access contr=
ol
> >> hardware on the platform that must be configured from a secure context
> >> (by design) which I assume could be part of this sequence, based on
> >> the specifics of a given SoC
> >=20
> > What was the original use case for the Q6 remoteproc? I see today's use
> > case is as a conduit for ath11k firmware to control PCIe devices. Was
> > that always the case? I imagine a more modern design would treat the
> > remoteproc as untrusted by putting it under a bridge or IOMMU with more
> > strict memory access control, so that firmware couldn't access OS memor=
y.
>=20
> There is an SMMU on this SoC.
>=20
> I don't know the original backstory, but if anything, the through-Q6
> approach is probably *more* secure, since there's additional access
> control hardware inbetween

My question is what to do with this series? I think I present a valid appro=
ach=20
which has its use cases, irrespective of which approach is better for a giv=
en=20
use case.

Alex

> Konrad




