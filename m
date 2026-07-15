Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDC23507C
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084520; cv=pass; b=FRS+9CB8pxSGfGGsHYUE/oRwZqcwR2nQw12qQzBplHdaSdUaVU+khds+P8qOdp5ci7RvljCSY9uInAEuJrN411ja9jF8wcUX4IDrt7SQY6t802c5W9qi4ZUaSG6qf+q93Z21tSF8AP2qKKGEWl9It7ttFVoBOvoLgOrqoKAt0zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084520; c=relaxed/simple;
	bh=gztsi8R3KcnU2Y68ziTBqFgTiO1IhBQcSODvmhfJT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQONx5ndJuVFwmSNCxwCMSMKqQuz/TILKXt3gz94JMBDKmD7XQL+Kak1uFVYYQrDxNWbVLida0dGUGTDIqebrKPyqoHVXZHseN82GkU39u0y6qsJFuQiEkFWaFBf3VZt1ZlV5bsLz+S2BtHTiuoTR083RTJRDtIt1iIekZNEqhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioVAyP0F; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioVAyP0F"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39ca300db70so29642391fa.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 20:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084517; cv=none;
        d=google.com; s=arc-20260327;
        b=X4EUpIBkoEuLJemVGoGUJ+DfDSe8W9RDylekkf+6WM7dGjiku05AI3f4mzCIsZESiZ
         POZa833zjmBNRY7pNzas6V6ukhWVedJmCskgzayYa2nhbrsriWrZvZbc7NXsG3G2IBdk
         xES0x2vqTzQCxJtBrQoBrQkuQRgeyS1tPo0+2hWBMmk2krL2VjdCk2re7wDVQ2Dpxrso
         1d+lMVVFPt6uUPXzHlUgnRIiCCoV/CDGiaaSbWiRGD2Sxk5LR5NwKnF7hXNv9s5FCE2j
         awwg5Gw/tAfpB6qCBL9SvP7o2qNNjlVJGN+NlACIByYeP/aSnkGcBD4z5qcuVrrGc+/e
         Ydzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        fh=7yFXiuMShxlkGvCa9J8mMcIMrlri9CVg/qxyaM4LnBw=;
        b=s21PbbuYc97StpLSvWba0KZJjqmoN1lTRmKcRnxiARUCgSWGtkyMPDIJcoH/pQxFlC
         Kj3kWSLmo44/+kVqfupK2ZnfzK9dMkCUThznOeGgJgx3J+dmGkSd9DgXcha1/Tu3z4zt
         4uHgY6pi8X954y2Ks3RJfoWaTquOUbkzd91uq26z3PowO+lt0L8rbeafxvxbeyW57Sr2
         Nm8BvSL6D/gSFwk117QM47UQORKUr7pEHG4tCuCwq00ublhBMCk74MefmYydecD+kS0M
         N2pB8SZOc2b5CEM7WtHT1+Vc2VcUqDC6AB925A/O0YCa1mUIOJpsT6FrYkVLGXmTgfqB
         CeTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784084517; x=1784689317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=ioVAyP0F9MUNE71P5kQ8il5qAayvaiadBfcgm5D1LMivu98tZwvhUTJpBSNn2hd1U7
         ChYfEZ5anj5XmVOqvVXjLNwmpSwX6I25ImvSxCvwhda7InJ0+owWsPvijsVHdZAJy1WX
         p/fYf2JRc80o8Ofcgf7IFUsAwSIU/auT8ASPZyEBLhOkRA3FJBUiRKDvWE8tL+Jfah9v
         /Qmtz9UHdKzRgCu5PUOy8vJK4SYMXOduihfY6QslzqG6MaGWbogUnhf1uLTg0oxf7pKi
         3PzhC1rqNJ4UVlWkkybyWLO64LjPL33M/QaI5mf9xuH++b4/Ba1ZfTQQh3AeRHzQubSR
         9DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084517; x=1784689317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=lsYqlNlkjuTW6CVfMbjrhIjpnAPEWW5BJOOO0sl72D91kqxJptBeiTlvvcPnnFqeGR
         NWwDyDKrk8fXoCIay13IgaAMETCYBeUd6LC3z7xO62f+NniqbwYNT3u6ax5OkvJD7c1r
         YfRGygXSCS+AxiJPJSi6lungfkcflRJD9ICQ2wcAiTGKCUgDFZtd/9HvxVwPObC2LeNs
         EA9l/7yTguDZ/uMb8fxs1F6RU1e3wPWAyCejG8yz3rctnykEA2uxg1ZYrpYeAd9VKzdg
         PXFhPH9aXUoMjjoAeMYmdB3zRIeaUNrZhXM5YZ5hHy9Pn0K1oZBlPNfSir/Le0Xr8AKr
         hXjA==
X-Forwarded-Encrypted: i=1; AHgh+RqfXnfGt1Uh1phOdKyW/0PP//wo4Qrl2z7zg4Y4Edomu+loDIGPC2JL+tjbzC4o6I2BP1pSOaMmgAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbGoJPlMje+lnLK25Knh7I+ba9Fuqu5wc628K2QmcEU/uDM7O
	cA8nPYXBe+L7bvI1nSvkxc68B+URm6XAbxLnmvVV/PrLSWqd25j+8CwDIErcMICrPFjLvRgW8F4
	L4m/zZhfFH/8ZuRsY7eN6IsVZdxiiDqc=
X-Gm-Gg: AfdE7cku9rUVJYUXkoWGQUKokqpuuGsu5y76BbxZlqilsfyWlw2gZhLlqDqqt9Uqgui
	YF8nHz3HCTtbcRitCQi/KY6R350NqJ1sBl4YsZqTAzve9JXYy0CXLYIJ0/mbkvttTAs7XuKdXLN
	4dN+H82WZc0agHGTHFatPyk1dWpPYNcsA6fAtB8hXXhTwWYpst/VZBFTePA56xQA5rjo6L3DoBM
	h4ecuEa+0ix/587TfG/kJveL+pxxXRqdpmVxmIj7tDGTZRF1+JuiMI2FN3i0PulZ+s0dMiEhzWe
	6iSUYMmpQWBZz7jQW1it5UYERj5x+LuzmKwpjDQy6sCCVoBOu5k2GA==
X-Received: by 2002:a2e:a902:0:b0:39c:9aa0:799f with SMTP id
 38308e7fff4ca-39db6d92796mr2546101fa.33.1784084516752; Tue, 14 Jul 2026
 20:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
 <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
In-Reply-To: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Tue, 14 Jul 2026 22:01:44 -0500
X-Gm-Features: AUfX_mzpMEopUQE7TosDVBxiXPh_gfwtw_3Imj28x21OlNZglehtbqTvg-XngPU
Message-ID: <CADi83T6uU+L5+SxnZsHN8ejUZ1JfQxv01q92wF_y6MbVsOu=wg@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gma=
il.com> wrote:
> >
> > Hi Rob
> >
> >
> > On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> >> >
> >> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> >> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_=
wcss
> >> > > driver. This firmware is usually used to run ath11k firmware and e=
nable
> >> > > wifi with chips such as QCN5024.
> >> > >
> >> > > When submitting v1, I learned that the firmware can also be loaded=
 by
> >> > > the trustzone firmware. Since TZ is not shipped with the kernel, i=
t
> >> > > makes sense to have the option of a native init sequence, as not a=
ll
> >> > > devices come with the latest TZ firmware.
> >> > >
> >> > > [...]
> >> >
> >> > Applied, thanks!
> >> >
> >> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struc=
t
> >> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> >> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT =
schema
> >> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> >> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
> >> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
> >>
> >> Why is a 6 month old patchset with reported errors being applied?
> >> Anyways, linux-next is now broken. Please fix.
> >
> >
> > I must have missed the error reports. Can you please point me in the ri=
ght direction? I'll get on this ASAP.
>
> "make dt_binding_check" on linux-next.

I see the issue:

      DTC [C] Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcs=
s-pil.example.dtb
    Lexical error:
Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.=
dts:49.28-51
Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
    ...

This is easily fixed by applying PATCH 3/9 of this series ("dt-bindings:
clock: gcc-ipq9574: add wcss remoteproc clocks") [1]. It defines the clocks
used in the yaml example, which resolves the issues. `make dt_binding_check=
`
is clean afterwards.

Would you like me to resubmit this patch for linux-next?

Alex

[1] lkml.org/lkml/2026/1/8/2278


> Rob
