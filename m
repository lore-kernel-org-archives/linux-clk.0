Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82503C73D9
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078714; cv=pass; b=CFXycETKVyhiEVFtBMJgu2LNsMmU+dGT3NEYZCLsZEaiFw+ovAomsWCXs8a7SIU9OSysS7xecsOcJ2Hca9QD9myMoxhbVH2cwjf5gv1AYRurlAY7HcpyUlUThqlKvP7QvkWxaWrBvIGSzSSJbSoaaH5QT2hyajxk2M5klENuQUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078714; c=relaxed/simple;
	bh=vdhbHRkc4p5LGfMXcZZqf1fXPNueKd8i4kcDxqQnCpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGn0L5xjIJLBkROpXY33hNTzNN2zuE2vKh55826qeWQyAhqbUXEc18XlOMhasSOOg7AMbkbq7G8gFDd0qWO5g3UsmWLS30mWw16P1yS8L1/Oq8z7UU5bhYlUPPDZnpuTKkhPLhw6QHBne1ZmIxoFK7DH3mVaMqordAFZo9aJ5Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FirXTSmq; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FirXTSmq"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso935743e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 21:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786078704; cv=none;
        d=google.com; s=arc-20260327;
        b=jXYxLwRs9YVg5M4xR2LNAg6tPYByyEBaibYU2nqGi2Lhyie1EOS+Mn3/7gBNKHID/0
         Ev5Xn4ivieeSEQyZ5Eq1yLXXap3eTnurbsnWPnL+307GDBslRqksS2yYArn4oZBU4fsy
         77D7KZAxKJbM4hploOYqy1//uXcnfpqSEN3xyo9dgTpu8FbheqXsqBG/ROtVBKwsKTWi
         hUFLf+qtGt7UfYofSziY3dHNByADzoYfM+gnRLc4joqJna9VJyAmmIzWkvoSiZ9OXAhk
         XIWp/S8Lhe2Nu17BZeXG8wF7Phv/Aj1AJeiATxseXH3MJNi+q+gedxaIrk4/Rxh6uu/G
         tSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GyoCsD/0rmHS7KcEa/0ZI40shOpSzJyo3J3k5RnZ7co=;
        fh=ct++2mHUqKfuYBZp/40x5KmtXhSvRTLzIHTHmMDq47w=;
        b=e1rZPXN5Wd18VLV7YLa9EEFfg1pa3o94LER99J+CzD23woGDDIwN4WBk+dZpGisr+g
         Afo0yMvO1xrhj/x3rlek+lzwRDV6BOfm20koHf5SBmbnbVwnsP8iVq8Xyk5mSRVv1gQc
         Lb/XFRzXRGCJ6emGvsbD7xri87vLBXXt+KbAQeJST0y+wuVqAdr+5NEI7rnDcM6s61i0
         I6Qe6QRig6arYP54EzwImS8/gfS2JAF8cWkzuf1WSOoQfKn2WBRBJ48KqGOWZHs3mdJl
         kvWjTrGZsxicBTXaHxKrKi52TuSkPtj2FuAxmKvD2dHqHHgOatbjUAIgivrZ5PBjUzhb
         yE5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786078704; x=1786683504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GyoCsD/0rmHS7KcEa/0ZI40shOpSzJyo3J3k5RnZ7co=;
        b=FirXTSmqeFCJPxwCwADzrbpDr4if7NQaFNr6Fi2WyoZPyArGg0f6PXtNtaI/PLG0sK
         qqmYDapQJlAJns/itzg8GSIe78FP61Ak6p7LdPYk5wh13jjAf1SBAEk3U4+xEbx7sBXI
         EtuTF2Ja95JqC8RiyrW/SzSumoBOYtptnnWkZYX5M6+W4i69Aj72G4MZD5tCF2wq57KL
         +ejJfgvkLYxGbefBRR7ReZbuvkNJkkWt2i0tTa1UaKG6s7VPQj1sHkCP2Obt9S2Swux9
         tFmr519hxGnPCrzTDTx0ssZ6bU0aOi0kcUgp132+ZJGIytwxhS0S/8ud3KZ9ImRmCBgc
         N0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078704; x=1786683504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyoCsD/0rmHS7KcEa/0ZI40shOpSzJyo3J3k5RnZ7co=;
        b=fuCKAY/rdvjYnFWtf2WvVV7SFn/WovMscoW/pp87un22ESFc4u4VWykzPZH3S7Cfym
         41T+m/LDZfc9sTe7NsIRQzs9kIgLtBcOED8j4RXVNN1vVvx7Q757Ox+auXV1vSt4Lfq/
         OrfC1lK2FzwIBiAebPfBiGSLenM5e+7P0WsUPppJH6uPYBRyaoX/k3lm5S0s9mpWAoX2
         sOG+by8fmN2tLN8261c51Rdy7xQIxO9e7EVVVqlLDh4aR8Q1fNHnmSNBredkabnrQrx6
         oct57pcetm8LY5L+r5gG6x40GT93Efl+92bScLUEmDr5sEKh86m2vPFhAPGnFXvFLM26
         EcPw==
X-Forwarded-Encrypted: i=1; AHgh+RojIpbG4i4XTyQcNN8AbmDvs6VmRagkkXLjyMN8Fj7j0bx0cbbe7L8aP9FObknRKCHx5BQ8Zr/DvG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZurEJlHNnugakNHnkOukloo4ok7e3U5t9DGwUosVngCMVpgaT
	2HG4LRSh53H7OXPpRObvKQAPYq01Lw24rcO/cG4B7Zz+1qR77XxO7IroWXslKFx8Vm5ffv45CWP
	P8FOPJictxavRNAA0VggyDd5HTgw7LaL2uciRPyod9g==
X-Gm-Gg: AR+sD12ydKsc5Sxq+1R2NLDIUhwxEnpJJlpAxchDfyBmYOYdpPxUOj3Ny7v1UWTVNz/
	lLQZRR0TRH8wuiDe1RDz1OYpjARDQ9+eu+tMkdAk3nTwlvammxqdeCkp25xb0aCyFIGWCAI6YB2
	iPkrc3oj7GVh5/cShdi7goPISG/xH932Z1vl33s6WwfXQGKv3Dgm6gzY4WLsFrcudvkfCrF3wJ5
	cRV2BGgGtcvOLyAmzuruPQKFgp2Re1YrR5D+81If2bGbw+pQBgFnfwLbqRJV7sXHOsEDhgB1xZf
	40LLd1O/EcQRtnmNIjE32e5PYqOguqumFYoIDsHXcwHe
X-Received: by 2002:a05:6122:4886:b0:5a0:afff:78a6 with SMTP id
 71dfb90a1353d-5c3d928f28cmr2879891e0c.14.1786078703917; Thu, 06 Aug 2026
 21:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729121640.3864006-2-ukleinek@kernel.org> <CAEG3pNCwa8ZyQHuDLDiCWXDUrGcuLpT8n6O75yN8tLsgZ5x-Lw@mail.gmail.com>
 <anIL_FKn9O4evOlL@redhat.com>
In-Reply-To: <anIL_FKn9O4evOlL@redhat.com>
From: Michael Turquette <mturquette@baylibre.com>
Date: Thu, 6 Aug 2026 21:57:57 -0700
X-Gm-Features: AUfX_mzgLPEXYkiHvEPra3XaeDP0B2oNd5TWIzL7HUWjDzPBXzd8rtW6RJDClkE
Message-ID: <CAEG3pNBTOHz59qN08AKJ1p3yXtB3E=8veq1LN8nyQMx2iGKMHg@mail.gmail.com>
Subject: Re: [PATCH] Drop Michael Turquette's clk maintainer entry
To: Brian Masney <bmasney@redhat.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgQnJ1bmV0?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Aug 4, 2026 at 8:57=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> On Sun, Aug 02, 2026 at 06:34:06PM -0500, Michael Turquette wrote:
> > On Wed, Jul 29, 2026 at 7:16=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > >
> > > Mike wasn't publically active for the clk subsystem since years. Stop
> > > pretending that there is a maintainer team caring for clk.
> >
> > I was hoping to send this patch myself, and to recommend a couple of
> > folks for promotion to the clk subsystem. Alas, you beat me to the
> > first half of my plan.
> >
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> >
> > Acked-by: Michael Turquette <mturquette@baylibre.com>
>
> Thanks Mike for everything you have done over the years with linux-clk.
>
> I posted this patch to make me co-maintainer to help out Stephen:
>
> https://lore.kernel.org/linux-clk/20260804-clk-masney-maintainer-v1-1-de5=
93189a9a1@redhat.com/T/#u
>
> To help make this subsystem more sustainable from a maintenance
> standpoint, I propose:
>
> - To push more vendors to participate in meaningful reviews, and send in =
pulls.
>   A recent example of where I did that is with Mediatek:
>   https://lore.kernel.org/linux-clk/amuWdRD-TBQtFT_4@redhat.com/
>
> - Try to find more people to help with the subsystem as a whole so that
>   this all isn't on just one person.

I acked that patch. Per your second proposal I also suggest that
Jerome Brunet join you on the team. This is something that should have
happened forever ago and it's my fault it did not.

Best,
Mike


>
> Brian
>


--=20
Michael Turquette
CEO - Dallas, TX
http://baylibre.com/
