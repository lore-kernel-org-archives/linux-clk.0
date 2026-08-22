Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710183C81A9
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407004; cv=pass; b=gjdNWUvlnvFk8+cMENVlF142Lrj2NUOE/FXd2+OSNLToesDjReV2jQ7mu8Gva9uHCH0UtetFjOCVc/AI8VpY2Qh3tpllu8NerNye/Hz2bT5fNNCYmlt4iSo34jhjt+XWS3hkzDoVzMfYGvjjXAEkZCUBdYT+6jjNjjo7YbfHho4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407004; c=relaxed/simple;
	bh=LW/8llNNM8/lpri29fLU+15TtvguEYyj6F7r2cvmV5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzr4f7+stIt0QU+tsEI8Hn9a9YCXZtlD1BB0AZxe2uZepMmm5sTNpZ4mm5njpkId5htaNs9s5ZTiCjRwWZ9tHUzsauOoHzes5vWqiEA+V6jVS+1Z5quNKET5P8rFP77/OuiYjqOIUm+pz7lE0/hNl+N2NsbLiwbbPvJmnRU++wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8eiVGNG; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8eiVGNG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so3356907a12.3
        for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 06:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407001; cv=none;
        d=google.com; s=arc-20260327;
        b=XtB4i2nojrrAaTcpUgR7txlKmFF8L2dvNlcbpnxgTVdfck+j46gdwhddenkAIeHp1e
         ZveSiUnsLBWfjD8NJmvtDsXidyDo6Egpc7vK7ogZ/iV+pziLuC7gXpl/Aw1kKXSp2cQR
         GFGE+uhfo6XPZi1+saq5OneitkIfMZiwytJbARppSTDLM1w7xGKVweAMzoJ4WOUuWwQx
         ctNB1Tm5iMoe+dh3RHHoWgRuQNVbirzp1oDeWCV9Wc+RypjOCi1scJ3fy22CvxDI387q
         C0ISPp9tFKLtDQXQ7xwHswk/E+Nbun91soote2jXie2BqqSXM+bGgRcsp8WWQooUtwXJ
         o7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        fh=ZdWGLRHh4XeD0UCI/EdZkL2cRSBlo9mt9BYbENeMO/o=;
        b=RkY9ExVDTLLe5VHus6BlY2YEVGfv3vp2rDyc2I6A5tS79xvxKDvfUb5xGg9l9AQ024
         UEerBAtivEKKt2BXDroBTGnaPzmasQ9XYlYdNvs3c0h5igE80lm0fqwTfk0FMRnThdDZ
         GvfuNxYKLDkNum1aQlQtDx32HeUwUMfGzRLsvtSvgT3cFaEEpelgWUrHKSeZrvvFr4vc
         NT49sJ1PapTQZjFHFQPd8sRALHYZSZ8p30yTKzKOStUaDInWW/tfhEs8xW1d930oiF/8
         Vq1AzD+paiXrzQAqdyN2nQHUHYcJQ6rTI0hVm+cfVD/NzB3f3zNSSjNYSXKQNz57Ob3M
         1f1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407001; x=1788011801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=h8eiVGNGBiRfxE8jFQtlR5oz43YH+yRvwxShK99ji4wyxvmN6OLUsIwT4U8UTUT0ZS
         xh8Ze9cK632Mh9j5GOYHjrRqT9iHesH/4py7DNpz+/oXtrHa8N452nInAUTILjHfyIW9
         9kRiLF0i8sE8EQv0sQdJXI2XKdNjekQwiy6nvFwefWfB4Uc1THGRFeANLmdCGU95gpce
         I2o6ujPfVVjJYF6m0WNxfhJenS5nLWl+yKsUnT/D/sjvK2EYrjiSAEieeg0yIXl41FOB
         QkEN3VBAhtNc8+1rkDyG0wDzw5+0VOrZYVAgdE4lMJTgcRkiSuwlc+psgpPLxnaaRISB
         htCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407001; x=1788011801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=QViaQZ3E0LJx8QBF6bfRl3vUL7n4/ufaK+KzENTJn+UZuIgCalXtjilQ0YZIQt0MYA
         c2cZJBYN2gO/+BHAl7Vsa/Dy6x2imBiYskSZeCX9/tFW2ZzZ+8835IUlo88kc6gvfCP0
         yCMk8Jgdj9SYUSPpDrsU2zi7Q/KlfSGyRvlJ3qy+snrqT2+cJGVSz6Nt93bAWptkYS/7
         fMnAcyRGLjgCw1aWJDqXm+bB4PIvQNJ1CAqF7TiYrkPBgsZ5DAb59y5yVCyHvKSkUxsn
         niUZlaBr3NX8Q7+A6cxLH336KY8O7mBW/9YgT2GGgGJ7gbWcFczs7YVuYYFX4PYAafBe
         qTPg==
X-Forwarded-Encrypted: i=1; AHgh+RqnAmDrd6D9ThS70oV5vViFXoU8sK825MSF+shoCXv8cTgA4ln8iB679K8u8A0ORx9hXPQpMYVcW8c=@vger.kernel.org
X-Gm-Message-State: AFuF++kPMKrve8ve/FhUksVEvLuK26ZnxW++/hPZybSv9pob8gMCInAv
	2aDInHjN1QeBHCLNup4CHv90O4/mOtyIWKgjNo5Tb7nExHI3akINyirqsyoGSNrFJaPy1gwc9kZ
	pZfDLmM/yiJEhj3GANozTI+S+oEO8sDE=
X-Gm-Gg: AR+sD136WaE/szX9LkoV4F2kolIv2zYWJZdDCxCdWXHkoHHd09iZdxrmXCLI2LF46e9
	184vjAiQnxbHIG5KodtjYA7GyWGfXGd5ayMMcL64YskxaT11YbnmBJymzFDrRq694RoPkQFiGZY
	E101v9UurL477JcXC+rvvUI+bHar+96n70iKkHEo3P466kxxDOH2kBMbH8firMD9Df13IcpBNn5
	R8jBQtDJMv/9k9sgTEh5v2UChH5VConRX5oZwxZBWgHuwB1DHQ7bk/gEDCjy+7/2dcLDfkJ5VxZ
	B2szcO36sdg0Xbg0Y0FhEdZ4jBsrRtBEYTp9EWfkB0LEgRIhFuZX7A1RFQUgXG93Z5zt4fai64N
	25A==
X-Received: by 2002:a17:906:eec4:b0:c20:1bc5:6ff1 with SMTP id
 a640c23a62f3a-c246a2cf049mr1459910466b.5.1787407000605; Sat, 22 Aug 2026
 06:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com> <20260819-statuesque-shrewd-sparrow-deead1@quoll>
In-Reply-To: <20260819-statuesque-shrewd-sparrow-deead1@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:26:32 +0530
X-Gm-Features: AcwNN1V8umJNfcbQppuc1ASR1pboBIkKFdS9EHV8sj10gVhB0jnzTf8DX2VpIH4
Message-ID: <CAA-+ukJTs1yb6yig2k6oHLeGYk4Y_ATman7f6tfpZWb71T+gWQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 15:20, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> > Add the ID for the Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  include/dt-bindings/arm/qcom,ids.h | 1 +
> >  1 file changed, 1 insertion(+)
>
> I will not be doing work twice. I drop all your patches from DT
> Patchwork now.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>

I sincerely apologize for the issue caused by my action.
I am new to kernel patch submission and am still learning
the workflow of the patch review process.

I have corrected this in the new version and ensured all received
Reviewed-by and Acked-by tags are properly included.

The latest patchset has been submitted here:
Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com

Thank you for your patience and for guiding me through the process.

Best regards,
Sreeshankar K
