Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332D17A2F0
	for <linux-clk@vger.kernel.org>; Sat,  7 Feb 2026 04:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770437906; cv=pass; b=ird8wGtJUSfBSKHFJVnFV9EhiZqJM5tQ9afktgYl2odnWeBdw0CHtQYhCfs3lJ+cLYahFgYRDdwPqrm8sraL3P8x7B11kquOhBYo+dnBgsc03SRMkFQQ3x5OUuPpeDZZ/1EDbnzhdAEQA3Gpfc/OjNeSFoVHmFU/NgqjR1RFyUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770437906; c=relaxed/simple;
	bh=GcNkLdBEoNs7zFjUQ4qrr/4WL1EwZYCheAdBqD+kcWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R97xy35h6Ular3WvkVDUGsZmJjBvMBdc9BDURs5B8jufXYDBIlicWqNWf/SeYYzCEQMm/zcIxz3QQxnCN+k09Hdh0o0Tz8vqCmwcJZPwjTxraybxV3enIJOSulngkeoH3NLbrTEMBLwt1Mkhro8adnZbcIokFp580c+E2m22IBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=IL/R8+0e; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="IL/R8+0e"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7950881727cso20487287b3.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 20:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770437904; cv=none;
        d=google.com; s=arc-20240605;
        b=P/bIXJ7Ndp3LpXd9XBatw/myohQ7QFebl5PbbywInJGOINUW27opbhSD3WjfLeJcnM
         ZrgtrEqv9ExJGtK1g/7/lr4kF2KjFvkR0R8bNCMhK0aBg7scmm1p7Rhc/FAvoWK+XXD2
         BYk7cPjmKD+3OdQh9EEjrrBtmAaQmw3s93t/0nm0s295uOxVyijsWQduZNxfxfehG21N
         am24oxBZrYSgaC7yEShxG6IBJ4D1lUFGBPhEJJESFq3nGmMwbSXQv8RNBDsWmDHF6na5
         rI6rA1vtUE4gPtO05rfmKyVtsXiALSnnYXWxE8zltUZ0M/Kpb6A/zhw4LiFrL4NAPCis
         3ZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        fh=lx2Q160GWjJ1or0usH47VOBSOThYh+W4cygJSceNVNw=;
        b=T5ofIybheU0LeQDvQBZTVySwqNXo6jwFoN9DsGBbalP/4xV2dNfBN80g+WzPkNvhyd
         0AxI0NWlmLzIPJ0FBwT/XP0EICv8sF/RJZePLWEV6x7f7OlAnKUtjeFbI14EJz/WJjoR
         22NN9+gZ7emwzRPBIh1ZCteJi5gHsphQxLbl78BPr6EzXIzC3/AZHPF8hynP8vzP/snA
         6P6kBkMM4IlCm4TKEcH9iujF0nBUqSBSL1THVQppfVi86HZSsjOg7JgZ7fo9ghhwQJpk
         Wdh8nC18qhShcyA4h35OMhqMfiycfX23UA5q7SgdBZwiiwyE0bMbr8twS7VhlBlm6whD
         Lveg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770437904; x=1771042704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        b=IL/R8+0eFTSOXeNgsBnBXCopMbSPpo1b4wYfwRDW5x0kd/75WngBJ3YeoF/NUvUeZ/
         1nsgdF22w4CCeChyNQJUrjaYUXnK08winZn6RMLHdB4SpZutdsmaPJI2WSsBukM8prMk
         5P3BCQkIDjvPEfzqd8MC20dPB2pfIZtjOXjs2Ttbv/ZWBD13ll4Ho4whlQ0rLldv8HDa
         n7GbrL6QpCTGHaVyiQbOlzYr+g/MTtdkc/88nup46kWR/148mquiYasBA10ah4T8CdDw
         qlSeF2444U7tJmJpdQiYKlW8AtqNxevJDypHn6rnn+D76jRJmKyu1P5wzEhFkD7WbRfJ
         NvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770437904; x=1771042704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        b=sdih32UJfpsRQwwujZAr/KXT1aiTEmYANEe4uy3WFKZFTSc/8MAbDM3P53I2HLunJD
         gdUkZIMEozhEM/ZNNyrsi7IzKcAHlbO7ca0vRX50lHGWtAUN3Oz2CJjQfFOeyR0KsB+y
         zhMP8Hg+XrFcADosPlVxZxu2UfmgCq2uB2pOelwQbMYDhV3pk5vX8u4GPBNB6pP866Yy
         1kMP8VCrY0F7vTgmQM9GIcfGnYA4U4Fut/GmEclGaKcfH2CGXWG+NY9ge8PydO9oy5JQ
         HNjvWqQhVcqeCPk1f7Pw9VfWaYIHviLmjTZQBG9dpafhpIisPwDZ6LoJ2dKrvdhMgsJH
         Kjfw==
X-Forwarded-Encrypted: i=1; AJvYcCXs+7yn0+HF6nu9hYAX1tUpd5x3dSG7VFE5wKspLUw798fOz1dXofdyOCwEaRARCZrUWDqCAEW5Sxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJqMsIrMmM/vs6jm0tOxhPIMhlVSqzU2OBxlIu8N8BlcW/5qjY
	7rEGUCLo2mGF6umsAOix29vACJCFT6jk8QE6zd0TNCPxODOO3gSv0msPIh18g7c5aTQLpvwlLnL
	9pI9PaIrIcHz3NNbW7jSFQhok/tAUr0X2gNwRa0tlbQ==
X-Gm-Gg: AZuq6aImhc+dz9XqRGEc7GiXy0QREWQoTYiPaSEPmLeDmwZ8ue3O04/Z1rttXIoB4Rx
	liVnbi+g9iL9PXZ6j/OdkjROXkeOlNzUhc4ggsyp+p1aoXQ7xVAxh+7hfIH7hpghql4G9F9sqxf
	fSoAvXEaN5rAfidgiFFDoiL3Nk8qbgJg7Y1ErxKHlqjeZ1IzDglzrBdvt6bQjOuZ36cmtyUdypy
	boK39Z9a8NAqYckOww5/D4tLfqXXkRtdrkmfR/6dfYnYZP7chzyTGbWw6EfFgDSdfUVMgi5cOSx
	oGx4eGwjrm5skYGQdMrs7cXZ6j2p9T2dTbePi9cfoWr7DkUl3Vl4RNg96JiH
X-Received: by 2002:a05:690c:61c2:b0:793:c9d4:3c8c with SMTP id
 00721157ae682-7952a92b6b7mr103670897b3.0.1770437904547; Fri, 06 Feb 2026
 20:18:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll> <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
In-Reply-To: <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 6 Feb 2026 22:18:13 -0600
X-Gm-Features: AZwV_QiHNac6LgRRtfDmS7__jtmHqoGGjoj97IGh3VIDiCdpb8PGDE9Igjmveao
Message-ID: <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 12:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 15:31, Anirudh Srinivasan wrote:
> >>> +examples:
> >>> +  - |
> >>> +    clock-controller@a8000000 {
> >>> +      compatible =3D "tenstorrent,atlantis-prcm-rcpu";
> >>> +      reg =3D <0xa8000000 0x10000>;
> >>> +      clocks =3D <&osc_24m>;
> >>> +      #clock-cells =3D <1>;
> >>> +      #reset-cells =3D <1>;
> >>> +    };
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index dc731d37c8fe..0fc7bc6d0458 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -22534,8 +22534,10 @@ M:   Joel Stanley <jms@oss.tenstorrent.com>
> >>>  L:   linux-riscv@lists.infradead.org
> >>>  S:   Maintained
> >>>  T:   git https://github.com/tenstorrent/linux.git
> >>> +F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-pr=
cm.yaml
> >>>  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> >>>  F:   arch/riscv/boot/dts/tenstorrent/
> >>> +F:   include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> >>>
> >>>  RISC-V THEAD SoC SUPPORT
> >>>  M:   Drew Fustini <fustini@kernel.org>
> >>> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/=
include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> >>> new file mode 100644
> >>> index 000000000000..3820781127c3
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> >>
> >> Still wrong name... Look at your compatible.
> >>
> >> Please read writing bindings doc in DT dir.
> >
> > We will have multiple compatibles in the future (I dropped these in
>
> Maybe you will, maybe not. But you do not have now.

Let me add them now.

>
> > this version and I have mentioned this in the changelog in the cover
> > letter) named "tenstorrent,atlantis-prcm-xyz". The bindings document
>
> Where did you mention it? I went TWICE through it.

Conor and I were discussing these in a previous series and were
referring to them as rcpu prcm and !rcpu prcms. I use these terms to
refer to it in "Changes in v4".

>
> > suggests picking a more generic name in this case, so isn't
> > "tenstorrent,atlantis-prcm" okay for that?
>
> No, because I don't want to keep guessing this. The docs clearly ask you
> to post complete bindings, which now became less-complete, but fine.
> Then the next rule asks you to use compatible as filename. You cannot
> keep skipping the rules.

I will add all the compatibles back, so there will be 4 of them named
"tenstorrent,atlantis-prcm-xyz". In that case is it appropriate for
the filename to be "tenstorrent,atlantis-prcm.yaml"?

>
> Best regards,
> Krzysztof
