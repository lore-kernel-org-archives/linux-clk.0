Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83628246A03;
	Wed, 15 Jan 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931647; cv=none; b=UJpq0pxIoNhuEnfhE0Q6VsRno49XwJx0JwwRyChKnk7FMqiEuKWoNtbCxHK7nniDyKa8xAYyj5E0TKBFW59HcdRp7xX6eQDMvL5Ot/07fHIccGGTqmDQdp/gewYDa09+ZRl0vWnOib9kOb4s7nPaQn08emWf2+6VDaY4WmR5uAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931647; c=relaxed/simple;
	bh=PnUKQ3iA6mB2VAwUH8bOEGC5zfnQ7dSDpYstb//87+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MED5f4V7Sdu6oFPbmv2ze0YYDq7YaCZr5JCrkDLve7hFi7WErHMPybx1i5LSW+aGYgBZH/uhjI+NsdVcckUOc7hz5Dmt8XkgTq4EAbclBLGRk3JuCU0BycAL3vzoRrQgHsBfKZHvYAoiJZOJjmpfoN/MThIeNGwUoOpmsz+bS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpj7BtFh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpj7BtFh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso965067a91.1;
        Wed, 15 Jan 2025 01:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736931646; x=1737536446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIyMadRmUOzqS4PnMcTWJ7TwZ6bUWYSz4q38fWS+xug=;
        b=bpj7BtFhoBHkjFXKnePCX+dS/f3vMPajuOs+O2sqOxscXY3aTlU5iBEZeFf+yUzAoU
         mBbzvwUD+JqZfZcnNLGkmrSc/NKMk1emqC51u9skwmh1w1vNZ4TX+igAML4ZzQj+qc9y
         y1zfYJ66KimEKWp5WwopTlYFTPqwB8JMpw/1kTUtjARkEOOr9o4/KZrwnIaSWn5HI69e
         Bsa6VAhCjC43xlwFyBN1gqj48TUV/RCujemxKXyjVsgdzfd1Ie3JBOtS+1cySCk+Le7V
         j114DJmxLEvULMv7Dg6V7NdhIoNS/vZtySlZXx8YEZgQmsS3f815at11dtXYWVnKVym+
         P5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931646; x=1737536446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIyMadRmUOzqS4PnMcTWJ7TwZ6bUWYSz4q38fWS+xug=;
        b=BXcBuoFq1/2XktOxReqdAJitw2FITaGN9NTSVJCCtckqs3EkDkj61Y7iq7IslUiDzt
         GoMCvRoXRGlwKhIUh2Qnbf0D/kYOlpTnlqdGEXcYjNoC7+A/r1CPErloKrHmuzybT1gL
         au+A+WDHGRfPb1UduUlrsLYj1NuTcdzqrFrFDUMdBajAMYnemmqhoeqmQoG8v+l+QIB5
         dMdW/ORgpk+lYZg/j/aLKr6bwfoEUCtH7XEcIJ+JiTNmdmf8pnTwStr1qcCNve+yd4yG
         4aWD2FqzaQk2l9GFlbeoO/K4uVbhFJJot2sUfQ6GFEu8QxffCuCccX9pK0HZ/vXiovbG
         Umpg==
X-Forwarded-Encrypted: i=1; AJvYcCXsVU8lHRyG389VA/AGAkfIoPlf99rQ0eqfQD1IQ7k2WwgYiFRjxdqAUuYhPVuUQ+F4ADptku6kfBSxFkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw522JzZ7rUVoJafRAGZkqbpLm/uhqX3isi3GUNtohUiyju5Hq2
	NOuOjHfiOJvYaUx3n6bH7wkOVvY7fudv3RrrQi7Pac2LcVp+MP+og/8m/gb1W4QmyCFvB6WwJ9W
	5ooYwMWQxaJMZtW7JJwnhC7c5Y44=
X-Gm-Gg: ASbGncthFE75l7DdnCuIM4SPBKm+NgsKhSbwEmvopZ+PRgM6UVWD2oB7Z/qPUs3Iz51
	78ASk5aF9JERtOiOsQ/bvmp94H1uPU6KBwUep
X-Google-Smtp-Source: AGHT+IENueaRrpzDTAMkqaBGUgXqdE+3nyTR2IVcMJ+he/svY9M2wMRHEMzQohpy8iws3frPwrl7iselBk3LthWhxPs=
X-Received: by 2002:a17:90b:134e:b0:2f2:a974:1e45 with SMTP id
 98e67ed59e1d1-2f728e36688mr3307577a91.16.1736931645764; Wed, 15 Jan 2025
 01:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org> <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org> <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
 <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org> <CAMhs-H_6QTptfFsSEh7PKy8Fnoem1ph4j=mwT_23=J=adDDT8w@mail.gmail.com>
 <a4796db2-e354-48e0-bd5f-da774f154473@kernel.org> <CAMhs-H9+hHnQQ3PSs2fCNvwdoJhrteARXQutFiziGN9+TFAgrw@mail.gmail.com>
 <10e21109-f4fa-42f5-a3fa-c6fa67fba783@kernel.org>
In-Reply-To: <10e21109-f4fa-42f5-a3fa-c6fa67fba783@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 15 Jan 2025 10:00:34 +0100
X-Gm-Features: AbW1kvYBYgYrW3T_QHVe8E5vGhPtExI9NydxT5VRrY6mZSITELXXfwJpyGCHbnI
Message-ID: <CAMhs-H9yoZ-m1Mf147F9V1OVxNO3kvQTt_nP-YLD970f-Y-UOA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 14/01/2025 08:43, Sergio Paracuellos wrote:
> >>
> >>> consumer nodes. So if adding this header is not a possibility with th=
e
> >>> changes in the yaml file I will forget about this addition and this
> >>> patch.
> >>
> >> Header without user is pointless. Driver and the DTS are the expected =
users.
> >
> > Understood. So having only DTSs as users is not a possible way to go.
> > It is clear now. Forget about this patch then.
>
> Only DTS user, with a justification, would go. Then just resend this
> patch when you have at least DTS user.

Awesome, thanks for letting me know. I will update current
arch/mips/boot/dts/ralink DTS files on-tree to reflect at least all of
these clock changes before merging and properly update them with
openwrt. I will resend with this patch then.

>
> Best regards,
> Krzysztof

Thanks,
    Sergio Paracuellos
