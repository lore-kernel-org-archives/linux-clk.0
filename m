Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF64376BE4
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932841; cv=pass; b=AAVo5k3qa5DapCAEMQkd5jaQ9YnQEHSvWMBdQSL28ox0YsK454rfSs3uieo5BvW1WKMNfdb2TiACGYhlLvxH5cCZ/8jCh67OiJXzoxxcs5QOHYbXAjS24queqx5NMLlr9TXyURV+Ntt4Sx8HgwKvtEkjVp1vDbVgJvtt3zr1RGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932841; c=relaxed/simple;
	bh=e3fFdUkJcs62tdGmt94fUffFddFQh3eOqTXtq9Bfi2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DweFaDqO7PUvFfpjLZGqbQmKyM5xvF4AijMBjySxG/sPM58knojCOStgNQoQKpGXon6Yn5UuTj5gAKCgSe4W8KwFHwaKufv82k+KY8AzHmq1eEZXE3xHc7InseCflqBYh7HZyQoucmGy5SnbTauE4km861lIem4l5Q5tvADo7mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcLW7F4A; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=shDzO+Hh; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcLW7F4A";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="shDzO+Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771932838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1XbW7/Mchf18o4deZ5UyLtW8vMbGMc1nfkosLZ6hzk=;
	b=RcLW7F4AlsSJX7tb/qqUyxzEdaRBauweEIsgOPuVE2jnXx5wQSvm7LmdFZowWhJPdEA8Fp
	n2c7rotPs7RHse/GNng5lXnoRRVo9WqE5CDkgCy/di0PmEiJV87qKzg6UItaYvCwHc3QGj
	98TFfmBz6SraE5c8cA5rZMTwfV8QZek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Di6yjyWvPjugEAI525KMVg-1; Tue, 24 Feb 2026 06:33:56 -0500
X-MC-Unique: Di6yjyWvPjugEAI525KMVg-1
X-Mimecast-MFC-AGG-ID: Di6yjyWvPjugEAI525KMVg_1771932836
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b88622fbe54so92503966b.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 03:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771932835; cv=none;
        d=google.com; s=arc-20240605;
        b=QOzhw/W9vBVg+9SnPQ1syYJQ0v7haJjTDTEzXmQlws5AzsS3vlu0kdp/E8AwpwO+ju
         DtPl6zF0aSD+whNDMPOutdB/mJyrl7XQNpR9wykVRQXTcfY6b4jNAvVr7hdO55ChP+Ij
         AntC+ww/9pelxk83bHt8G48OeqCOpXjidgLlaenl1Mxmvj9R4mEh4UB4nyOECYaWjvCT
         Bfr3GmtKLEBCITV6YYuB2GU1nS7LO2tolSjM/xQ+jwvU2PlSfCS2VvtCvv1kLIL02lGv
         stlBZ4jVnAq5YVHwNjxrXYXu1J+zFYtmhkxUTdlGJ1m9/DjFbm8+aDHP712/4mX0djkh
         J1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1XbW7/Mchf18o4deZ5UyLtW8vMbGMc1nfkosLZ6hzk=;
        fh=nnrYK6k+TAYaDLdRcsNq3cvvE/HOw3u1KDGWuMmG84o=;
        b=hRmEdKI5o4MsPI3iNg5QI5HavqODPm67GA25zk09I51t27YLIl2juGNFTWZENkVy7A
         m8azdGbfdC4HvbFkxDCecBu85BgML7KniV49z0F3B+LKSWsXaYDxdMAIpuZMNce6+O/V
         V6OTXAMOGuFfBy7UmmUQN8rgrNzlYThKikk/ayJUK3oOI+xjgfe5Wp081XQ9oawi0syw
         4qpft56RW/8CohPO/WQS5FZsP4BMePuBz6i7oiIuTy157076STEnMq7zYNi/uP2j6cjk
         tayLq0zJefpE38hu9Ui8dphb/gHJnCUlYqnUijIBkw0X6aYhScSlIxwDf7Kb4nisqDtW
         TfIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771932835; x=1772537635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1XbW7/Mchf18o4deZ5UyLtW8vMbGMc1nfkosLZ6hzk=;
        b=shDzO+Hh1iVCwQxYXnI5fC7UXPt2piLTHEcj7ESIO/8gLgPbtAQEGyeBgqXUcdiNWh
         /Ialb/4vV/AasvuEDpFMN2nS16KJtLSjhAQL2ooO2FOqwtQ7zi/gKkoHJEkOzvotNv5O
         tihRFkrEYKQcgWsJvo8sjI7st9YSjS/imktSbvnkMYNz7yEQ2H5wrvO6aK3z2qbTWCLF
         iBCFVmcng3Nk0GdMV9l9StTAhqVWerTJRPZ4ej1omSehySGSnG+Om/OBr30RduPcyRH7
         Q/R9r/7hkWca0zgnZOYHfHWtpSBNbN6xr/CqdprmLFsNefeBlLb38zBZn4PTvAMvxXUx
         nGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932835; x=1772537635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1XbW7/Mchf18o4deZ5UyLtW8vMbGMc1nfkosLZ6hzk=;
        b=Vnu/WEdExq1EHfufSwGFSsdagIr7XaVzEixDwqHJTQKyNy5NbwnZ5XYmRlHe2BzqNN
         v3TCNQ7GmFYTq6Lr7ilxj3YJHVWt9QCEch+BovkAX+sftUTMSA1INZ7CPnz7JBJKBkm8
         UL5hqnyPCv41pEujE65kazwSGX+tbC85as90g8M7PqAvuPXEI4u0KvliXVkYXW8OJUfV
         Bdbn6LDTefKx0m4piGXVk8tS8+xdQTIBgN1ojWjUzGQqL/ZQO3pI9rRGUTrH7MFRO+W8
         myqvgvQiSO/Y0b3eLbwQgtwWG8hm6HQ8tRTbqY4pg7MHyia8WXOby2kFt5TSSA4NTe1H
         VLGw==
X-Forwarded-Encrypted: i=1; AJvYcCXIr4gsQiiuAaO6qQCapKZklYzXGg+33ybsAJaFCYGyFCueNPtgE4nYdvkZyuQ6xm4yjAKImJwkZmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpvr1btdVCl8jv2YIEfJwoPtSSdoA8pylZMxS034SQ3QGcG8lD
	q/5WcF+ushfE80Cilp9SXekyxw/3bmtPRtJR2/vEkD1OXu0EEVYB4KDhwxiyafyEoZGVk/ULzE3
	TuTOwZx+c3W2JBByo3E7FNCB35Zx54aaAIPmtBN2t8xUy9E9qAZS7NZPMLwtmBr8nzAQ7aNROHo
	xRAp2L3Vlt85wTLjVVNOISJj4yRpzbBUWe+lHM
X-Gm-Gg: ATEYQzwkZ/xt7NOHUwuIgtvWsTx/mBcjRp+NvltIpbeK6mWWI7xrN4rfmBlnnt0RgSJ
	8tVesyFAww6pETQ7bDPzRuXnbSwF5V9Lwq0PPtevEgkO5ivgFVPGGqBMwuuHBIJ6DCp6qCNBVX/
	/H8a+wHM0a94UobNoN2KK+UZHhlgf+ThRA6vI28dgfMllPIYnBwdTV+O3iTAfXIEfDTWBJ8C3mO
	ujriw==
X-Received: by 2002:a17:907:789:b0:b90:6a9a:e36 with SMTP id a640c23a62f3a-b9081b4d10dmr738933166b.48.1771932835484;
        Tue, 24 Feb 2026 03:33:55 -0800 (PST)
X-Received: by 2002:a17:907:789:b0:b90:6a9a:e36 with SMTP id
 a640c23a62f3a-b9081b4d10dmr738931066b.48.1771932834979; Tue, 24 Feb 2026
 03:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
 <ae2358d7-7e82-49fe-8a03-195487a7b010@gmail.com> <41d3bf12.387f.19c8ee9570e.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <41d3bf12.387f.19c8ee9570e.Coremail.dongxuyang@eswincomputing.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 24 Feb 2026 06:33:43 -0500
X-Gm-Features: AaiRm50KgDObk3pYyYmDTAq10i3GCVF2jr0QwhnBU1r08XDcRGlr4pw_FkRlFAM
Message-ID: <CABx5tqKDQX+AK0yRUsHc2_dvuegWgWfJ+WCnphZX4NYJyHceww@mail.gmail.com>
Subject: Re: Re: [PATCH v13 0/3] Add driver support for ESWIN eic700 SoC clock controller
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: Bo Gan <ganboing@gmail.com>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, troy.mitchell@linux.dev, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	marcel@ziswiler.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xuyang,

On Tue, Feb 24, 2026 at 4:09=E2=80=AFAM Xuyang Dong
<dongxuyang@eswincomputing.com> wrote:
> > I'm testing your patchset on
> > https://github.com/ganboing/linux-eic77/tree/eic77-integration-test-clk=
-v13
> >
> > It's applied on top of Samuel's PMA v3 patshset, plus device-tree patch=
es
> > from your integration test branch. It's pretty similar to what Marcel d=
id,
> > but I just want to have a separate verification. What I found is that t=
he
> > kernel can successfully boot with clk_ignore_unused (eMMC/eth working),
> > but hangs without. It stuck at
> >
> > [    3.257141] clk: Disabling unused clocks
> >
> > I'm pretty sure that some clocks that weren't supposed to get disabled =
got
> > turned off. Can you validate if that's a bug in the clock driver, or my
> > device-tree just didn't link all clocks. One thing I noticed is that th=
ere
> > is no CLK_IS_CRITICAL in your code, so it's highly likely that DDR PLL =
or
> > others were turned off unintentionally. Not a clock driver expert, but =
I'd
> > expect the kernel should work fine without clk_ignore_unused.
> >
>
> Hi Bo,
>
> Thanks for your reply. I also got the same result without clk_ignore_unus=
ed.
> This is a bug, and I will address it in v14.

In Documentation/driver-api/clk.rst, there is a section titled
"Disabling clock gating of unused clocks", along with trace kernel
parameters you can add to log which clks are disabled.

Brian

