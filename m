Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5C436359
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204983; cv=none; b=lPHGRXe2s+yH8H45Blr5oazDQ4KjytJs12NVcJ5gHv0EHc49Dg5RwEVu2lBqEqFseQjZsQIEL2FuY1VWwNx4n+MR8/iIBfGfaNttNfGbyXC4YEIR1Uu5Pwr9ZV9o1nw1MSZPLdeH/2Iujx2unQ99gw+h/rGM+mongSpR3N3NKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204983; c=relaxed/simple;
	bh=nbzKvIFlEB+rHxUj/DRoI+TEGMemWsYqDcWls87yhkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/Q6jqS/PI/Pr8MtqAwmnjhnnrmHPD6IdFnzszE44gAS5rojNbU5StuIYpi9upk7Tsp1+TGhLYIKTJIDQQF6Jsemym1otEfCpS19pBTVqz/9Uz7ReHmOfksEqJz6Z6OwgYwxn9oHC6r4zBkYQaMGRmIsVEReT9CiCMOw3q7vU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5673804da95so950122e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 07:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204980; x=1772809780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNoU4njpXNM4J4sLdpH/jCioYswW5gHauk8KtcDWPNk=;
        b=po8ToJg299+hv28diFH96Jc65kRuKgo5bSywgvRc9rZFQTXmuc4IIeEnZpeuSchnul
         UqhPeoEQPuIvFVCGKy5Zc4Kt3r13kOou8BUxpJXx5JtNvTi6vK1lmavSQ7vlS9Lj3Hdr
         qPm2ME9CgP62/mTmW5TbaebRO9KTzmtUN3fxP04tae4H/C1lCSsiEdw0jOcF4MUVBb+8
         /FANSDO+ylY6MbZ9D48T2OaaWOy8Wwn1yQbPX/NZLV7oNE5itBNsI9JRumfMzTlWOgwR
         G7K+KrgQv2RadDkEQ23vpBPKHsbS15zhHs14PxO4BME551NKj1TXr9weyt0QAoHXk+wM
         Eylw==
X-Forwarded-Encrypted: i=1; AJvYcCWnHQsHEcgq8xQ1Wwe7K8HX5qXItnRVBqmfy56r+8bJ5vB0DSZw0ENgKsB2zxcnmIPSsywzeDHXsnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKibSS+RUJPKdI8AVAMs2bOz6JBs3c+II7hZM4JRQtPIS950Ze
	11GSy5zE/Gzl0PI8LgCMDxOIMoXrGfpOhpqNYnr+aGj5ct7rCjMZkRsEnOavRvQPvGE=
X-Gm-Gg: ATEYQzw2Aidvu0FhJJ07Cl5qVgMIHsboejn93zIQZPatY2IYbNcz+Rz/DKaef2sq5iN
	aGC7UnLAL/JhaztkRIh6caLcb4z3ih32mqTrzAsE9QEbAAUaI0RLhuYxy0f3FR0hgJ1uSucJr19
	DVghPratWPT45QzqsL9r18Zwo3ylmr+KE7CIPlRIB1uarRRSFhWuqcjLoHxb/6t5fkpLbgNTnvh
	LMueLDIf1HxiAqGvWcrsFRMTthMdyS1pOymhGGgjsTfMzm3tWizEvgOzs1xzzEp8uJKiu7gcCR7
	LGT8QYXWSyQU6e0Y81GehDbg9zCDQJ7kS81EXV4rTbvrfIPFScjiUE25+XvDnIqnqMYafFOJHeB
	nfU/gLHY3dVfqkcdzcJZR0GmN1y6IKtQA7SipmFmPlwixJkK9b3tMpWyLj6VdJ9v2ufBJ7VDy85
	/EqmrcMe0oxUbGp9nnYRcVkfE3S55uwxn5VDLqBLF/M70BFEq+gJGK5u8sFYl2CbnM
X-Received: by 2002:a05:6122:1b03:b0:567:44ba:bd88 with SMTP id 71dfb90a1353d-56aa0a87cebmr1669118e0c.14.1772204980456;
        Fri, 27 Feb 2026 07:09:40 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7a8sm6991638e0c.4.2026.02.27.07.09.39
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:09:39 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5688c221fd3so916385e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFX/rBYs6XQkFZ6TovtG5z8CM68iesp8FpqVoeFl3R2HeRYuqXR32dp+EnW0oNPa52eLG7gVOBmGg=@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:5ef:a8cb:857b with SMTP id
 ada2fe7eead31-5ff324dbe3bmr1277792137.23.1772204979305; Fri, 27 Feb 2026
 07:09:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com> <aaGxrm0SqwaJWCph@redhat.com>
In-Reply-To: <aaGxrm0SqwaJWCph@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 16:09:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
X-Gm-Features: AaiRm52Jqo7UxSZlX-KgdyAXxubXhZyYwkTdtt3Z4LSPc0PHILPSj40Nn3W2qSc
Message-ID: <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > This clk driver has a noop determine_rate clk op. Drop this empty
> > > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c

> > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > >         init.name = core->name;
> > >         parent_name = __clk_get_name(parent);
> > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > -       init.flags = 0;
> > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> >
> > Iff this is the Right Thing To Do (TM), it needs a comment, as this
> > clock is not managed by firmware.
>
> Before I start a larger discussion on patch 1 with more people about a
> name for this flag, help me understand why this provider has a noop
> determine rate. Is the hardware eventually programmed with a rate
> that's close enough to what was passed in? Or it doesn't really matter
> what the clock rate is, just as long as it is running? Or should the
> determine_rate function be filled out in this particular case?

I'd like to defer to Biju, who added the empty round^Wdetermine rate
function.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
