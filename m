Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3C2874FE
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757332; cv=none; b=YmBH+qSKR6xAAQ+rcQT7eW1vwplE15eTMplVB55TgAI11LYtW8dbHO/wfzIIKWNVx1FVIAlusU8GP888Z9NULHi6mtlq6f/E9/HLf7kysx9Le6QdloBFs9EFP8686E7YWpwBsRWqPcNogazF5ZwACHvqOEFQreJ+aQhY0Q/tSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757332; c=relaxed/simple;
	bh=U/5ladtYidflML6s4OrAqI221yvscW24HxOAkdlAfmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9Ty7t19X6TIvGNlMzLhBiPMo1L8t+hqD+zP9qSino2NOaM9j9iDp9P8XGYSJW0S2Kx/6BypWWib8uEXE4pivCeqbx2f4dgBFq5uzjxRtp5RVh2N0dMFdnro8PhNizjT9RrsDTTrjaMOdN8RQhJ+2SLQUtFg9oLpCplFkNV/2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFl0SMfM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOzOJyte; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFl0SMfM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOzOJyte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763757329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
	b=bFl0SMfMqFaDVAJOo+qgBhFzN2Ajh8tvvvi5c00jfGojmAgd5GEJeBN5uxhlH+MxpXYID+
	mYjQAzq9/zdMwj9t8FWitt5D6/EmDXgr4g+/A82bSggeuTHps8NvYxXwxlRHD4xQElv/jK
	yy2kVjcFzUTepCplOOY+nE4xqbWnBXE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-JsAaarjcOUG-mAxOo_H2IA-1; Fri, 21 Nov 2025 15:35:25 -0500
X-MC-Unique: JsAaarjcOUG-mAxOo_H2IA-1
X-Mimecast-MFC-AGG-ID: JsAaarjcOUG-mAxOo_H2IA_1763757322
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b73586b1195so35973566b.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763757322; x=1764362122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
        b=fOzOJyteUpKDylMeSh1AEAZs7z/yGpuM2+qFEEytL5Qes1PZPMEeJcEw3eyK3ZccVo
         5+VWQrSHRnGm7BjIgw4zf/AUd0iRwFZaadCzbljpoCPAe6GbjMTRH6pLHxGmD8LAJgM6
         bqpmzpftYHHN+AYV10/mbQVEJD1SgSGfgNPsR/TZqtp7NLyWOd2D4ogk9W3ndEdSoEAP
         6vwrjpJEuYcXtg7RElTWw9wje1xBxDd8pEcQa7kkM+ZldYa5+yuG/2ioEjEszezA8LhW
         5yuPsiaRKc/pAfVR0DkNCwu266j55/es5CwksGfDMnzmUx/OCRQnVcVFVTKMkNKVS9UD
         Ux2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757322; x=1764362122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
        b=e+Vymq047pYIOjXo/FIKSMU9tjSXgcj6AGQSDHWzg2GYrnnqHAdVdj9r0ylM+EPHn2
         Dx4R5I4s7mmS2ot5xNdlgzhgWa0DUw8Q4vgW4sy7ZnflaROvjNdgECft7JtT7D3t/m7X
         o+yqiJ9X2f26iNvY+gB1fHk59LSgG/Oij5CW6uv+MrQNijmO2+IxEr2C5fNQtkgWcbPr
         7JLwSvxEwLxrWWihjD0D85a5FtUI2DQ/VWBVWtKF6e23nrj+S/pjtCHiwmETfmZ3auCv
         NJDu/1/YAxHCDwARSOOr4OyTUJx7AN3wLPYP2LdBZrLovN6hHkxaqjR3UHWWKM5rGJBW
         lk9g==
X-Forwarded-Encrypted: i=1; AJvYcCXcggCo3f//EG47xGZAvVrc3/g4/psj2uY/5x4TiDV3mE5j6o1qsrbj8WyqBXyTb50Lcun2JOMkJg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHExNXoLVy5PWkjX5JpOrC+FrcdduBEqaFRu9mTKUoVF0LIWW
	+AS7XZeuhG8+v62yTzxVOauzkJwau0QzFtgIoee6i9sYjSkbo3tX42e7cIA5gjfEVWYmGs9IIev
	BcqyT/bHyhhTFxew7DieOtAzTWUwyS3NhNEcrfuTvF/loVx89uguiadlF6sXKWxr+0tDUm0BEaO
	61ykvuo94Tyesp9WyNcHFMBaYEp1IENTJcnZj7
X-Gm-Gg: ASbGncs87dq+BFYAKA/NWW6V7JShBM8LE12mHCFtdfNk75snyjXRIY0hGgmJ+KUAT2w
	Vxl6clJPpzP3TGNVqL3X82T+qHjgGrjrROf2aSlLT5MFOQG9eR2n6zejsMFHRuzY8huuepeM4CC
	fd/3/sxGm1GVJiZ2QBAZ67LWUjuipd3WqXeobOKBQPqaOtxClMRNPiDoyecy/8K9hgkQ==
X-Received: by 2002:a17:907:a0d:b0:b70:be0b:6ba8 with SMTP id a640c23a62f3a-b76719d9598mr357318666b.61.1763757322500;
        Fri, 21 Nov 2025 12:35:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5MoiqHr6rhZgG9KdrrZBJ768U2Y/5SFSstIe4omCdXUnoddVoCfAm4oVtNeszH2S4MZnX+cBp5U4IMWzXLVE=
X-Received: by 2002:a17:907:a0d:b0:b70:be0b:6ba8 with SMTP id
 a640c23a62f3a-b76719d9598mr357316566b.61.1763757322113; Fri, 21 Nov 2025
 12:35:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick> <aNVPqHldkVzbyvix@redhat.com>
 <20250930-brawny-pastel-wildcat-4ba8d8@houat> <aRfH35-jhM-qOrbb@redhat.com> <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
In-Reply-To: <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 21 Nov 2025 15:35:10 -0500
X-Gm-Features: AWmQ_blS5eHoTaB7NGOUKTkyFQvIfdmnCSJ2VTwhtLeyExoNDVIvf6A57OZSbO8
Message-ID: <CABx5tq+iOpwLDy0VaQt4k9mLyAb8SF3WGHPFh+rwvT9=J4ZnKg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 11:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> > I'm giving a talk at Linux Plumbers in Tokyo next month:
> >
> >     Fixing Clock Tree Propagation in the Common Clk Framework
> >     https://lpc.events/event/19/contributions/2152/
> >
> > Stephen will be there as well, and hopefully we can reach consensus
> > about an acceptable approach to fix this.
>
> Yeah, discussing it at plumbers would probably be a good idea, and maybe
> try to record / transcribe the meeting so we can have the minutes too
> somewhere?

The talk will be recorded, plus I'm sure there will be discussion
after my talk. I'll post a summary to this thread with the next steps
after Plumbers.

Brian

