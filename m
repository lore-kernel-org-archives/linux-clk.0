Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5E23A98D;
	Thu, 13 Feb 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453400; cv=none; b=s6Aq5G0xuvi5poRjETcGcMZHmv1WTxcalgFbYnIVQGVkV7lTmxlQaqC70esdOA0Ukdpb/2wLWWl49OnruGdfv84LKBDO5XwsopwX9dzjdocDNBKKgHxwZx8C7vAZN7xMqvj9oiqTZhI3DbHp+fOMgN1jFQMP81TMYISYJsIE6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453400; c=relaxed/simple;
	bh=NMQPNDCcm8JGx9RYby7i9GevlsbEO++oBZ/hdEV5koI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2Mv7YKRQHxdFRrEf18gwiYzmQcK+O4jg49J49wB+H2t7MFfruAmpneV3k9YJkwg26Xw18BqnwRtjQHo9BKNI93ZZQ4EFqhXqog99pAvdt3mKAEGbwcBTvC4UfzBLVfg+44h5syw8fvkaPSoRYqkkeCcO2tGOp1/jYPgThO8B0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so348321a12.1;
        Thu, 13 Feb 2025 05:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453396; x=1740058196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+Osd+o4oeF7UOkAzBL7Y6gvuaR3T2ZzMDs5XXXCLJo=;
        b=bpBBGIpwzvfowGrqczILW5M6c2ldWLBZJhpFs/Dd/2srBUCeYviHvY/OKkq8PjHpuP
         ZozyUMZlgEqrc2YELSqKgCIMsElVVpDID6IngZrWVWQvKAItHK35B0eZ2JxesHn9veMG
         YmtXVPdxrB9mkW3E+N34xZG4QqFKKDeXBmgo4dKfkOchWqhUaMKsQQDGslBBgbbLL9FD
         LtXIegmJqvkeouav4fhgAnWtBGJ2jKhWLk5mpqSqMJDEaK9trmTJFF4KL1LumClqJ6c4
         6vGmaOC0Umsn7J0RdGkdQz27rki5V+zjq0Jc0rz7BlS46fBGZDknTaJguKKq3tYpwFJU
         76ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqcfr/2ZmC5xOnYvwWhXV00zuhu9plW+UaglI/io3//y2fUM3F7xJP6Qp8YQ0oH7wlgJpkRRgiWPlg@vger.kernel.org, AJvYcCW5z5NWjZ+xFNbzYCK57xSOA/mmf9PliWnxdBgZPrJKNwQUzfybraEA9etQV+eitn3Ac656+KjVncyW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv6X63MKJVekSS4KM22yIIneePl5zS2x9wx3GmiR3zB+FYj9eZ
	e4INJ+uMWnH6vdhEpCSy1KskqeiBS68e5v8byNQO/FBOyvsvOYE6Jy+i4+jrDnI=
X-Gm-Gg: ASbGncsZWdxvhCNmSTpgAzJSeyvTBkM9JvI2O6/ne4NUuSvrNfTM4/kRgj+582RGZ9m
	7J1cRnIjPk3InECeHCMsUPypk2j65f1SRz/xtMTwnddFAed2htnYmTaPJn6dag/zXnp2D9zfSiL
	fQxLC7OavC30zMSnw69Ci933Jjk16R26PooJndt32KEHsYAKlKypG6ByDR58+lJ8A+zSV52EhtJ
	IgJ1APAVzxr9Ngxl6UPXa/leMWoo8C1X+fE6QoKWvmylYmTZhnFt9Qf/o2hsDG9Zjfex3GbF2KP
	9TLcCs2rpLiU/Ad78oEOOUQap9cmEv6tcQXpgALT1abSJkZydPpX1A==
X-Google-Smtp-Source: AGHT+IEiv/yzS8DfAB4izud73af1Vjg/Ybj9hCzvC7helmQxRGPyCEdEvmZB6EqtRxuj/yAQIrMT1g==
X-Received: by 2002:a05:6402:13c9:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5dec9d4a4ccmr7112162a12.16.1739453395646;
        Thu, 13 Feb 2025 05:29:55 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53258215sm132963266b.53.2025.02.13.05.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 05:29:55 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so1314576a12.0;
        Thu, 13 Feb 2025 05:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXXnj7xmazbKK5njoLjV+F7aDAhypx5nF/AdLXFO7evbzbHnFDJ9XHi212m1M6IGYR6SooVJhhIkwl@vger.kernel.org, AJvYcCWXKWrtYy+mTeH4ruX22PfYsMiyV7T2uXY2/3D2FXRfZiMuvwPmL6OvfEBjf8fZ4+aJLGHQLHTgCuDp@vger.kernel.org
X-Received: by 2002:a05:6402:3606:b0:5dc:a44e:7644 with SMTP id
 4fb4d7f45d1cf-5dec9d2c125mr8162950a12.2.1739453395177; Thu, 13 Feb 2025
 05:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <devicetree-org/dt-schema/pull/154@github.com> <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
 <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com> <20250213134247.GB1208@localhost.localdomain>
In-Reply-To: <20250213134247.GB1208@localhost.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 14:29:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX78GBk3Fm-USGgGyCo+Fy028qccLrDuE1Vrkw=OAz1Vw@mail.gmail.com>
X-Gm-Features: AWEUYZmQlQcufE1xuHcnAspRmTS4_fhlUKRp9i2xKersWeA-cgKKFe9Y3mXqLoA
Message-ID: <CAMuHMdX78GBk3Fm-USGgGyCo+Fy028qccLrDuE1Vrkw=OAz1Vw@mail.gmail.com>
Subject: Re: [devicetree-org/dt-schema] schemas: introduce assigned-clock-sscs
 (PR #154)
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

On Thu, 13 Feb 2025 at 13:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
> On Thu, Feb 13, 2025 at 11:16:31AM +0100, Geert Uytterhoeven wrote:
> >On Fri, 24 Jan 2025 at 15:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> Just FYI, below is a foward of pull request for dtschema for bindings
> >> adding spread spectrum to clocks. As Clock framework maintainers this
> >> might be relevant to you.
> >>
> >> -------- Forwarded Message --------
> >> Subject: [devicetree-org/dt-schema] schemas: introduce
> >> assigned-clock-sscs (PR #154)
> >> Date: Fri, 24 Jan 2025 04:31:30 -0800
> >> From: Peng Fan <notifications@github.com>
> >> Reply-To: devicetree-org/dt-schema
> >> <reply+ACPRLI5YLXX27TFZX2P7NVOFT5USFEVBNHHKO4ZXHM@reply.github.com>
> >> To: devicetree-org/dt-schema <dt-schema@noreply.github.com>
> >> CC: Subscribed <subscribed@noreply.github.com>
> >>
> >> To support spread spectrum clock, introduce assigned-clock-sscs, it is
> >> an uint32-matrix with format multiple elements of below
> >> &lt;modfreq spreadpercentage modmethod&gt;, &lt;...&gt;
> >> You can view, comment on, or merge this pull request online at:
> >>
> >>   https://github.com/devicetree-org/dt-schema/pull/154
> >>
> >> -- Commit Summary --
> >>
> >>   * schemas: introduce assigned-clock-sscs
> >
> >>   assigned-clock-sscs:
> >>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >>     items:
> >>       items:
> >>         - description: The modulation frequency
> >>         - description: The modulation depth in permyriad
> >>         - description: The modulation method, down(2), up(1), center(0)
> >
> >Is there a way to explicitly disable it, if it was enabled by the
> >firmware? See also my comment in "Re: [PATCH v2 1/4] clk: Introduce
>
> The binding here is just to describe the parameter to configure
> spread spectrum of a clk.
>
> To disable spread spectrum, the clk_hw_set_spread_spectrum could be
> used with enable as false or as you suggested using CLK_SSC_NONE_SPREAD?

But the bindings don't have an enable flag...

> >clk_hw_set_spread_spectrum".
> >
> >>           minimum: 0
> >>           maximum: 2
> >
> >What's the meaning of these limits?
>
> Modulation has three methods:
> Down-spread modulation
> Up-spread modulation
> Center-spread modulation.
>
> I use 2 for down, 1 for up, 0 for center here. So the limits:
> min: 0, max: 2.

Silly me, they apply to the last description...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
