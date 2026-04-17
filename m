Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4834E754
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442546; cv=pass; b=SK15hzFNW+y5H7tnNOiVb1LR8oyIKL0pA2fricG+139FriyViHE7krISEPAWWiOLPPF3tN6Y1YEd0PFWRgYond/dE/xoj4m08YKyDVW8dWC48hTDHauFW4lyMNvnPKWjSBQvdjGkxlkESYnqj2H+qS+9iR6Iz1u0sGq//vwgYAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442546; c=relaxed/simple;
	bh=0nPRdwPTcNMbdV4UkZI9wQ6uU22Kb9AQnSw3udYXGGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhzbScsFJ5OihnQTGmtvZky/640tTig2GzklPaSlJ3wEypxQflsgKM7Gm/yBgzuIcX0FXiBXpM9x+bEixGF0V6xrB7xWxEi3TQHteZ051pK/ewV8BaLdlXGRMwEcp6fAqa/lzoEfqS8PU7SE2rUy22/901weWB1OitrWqKqDzgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljznqHY1; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljznqHY1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d734223e4so610750f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776442543; cv=none;
        d=google.com; s=arc-20240605;
        b=f80R9Mxav6q4GH3qcaH0xHic4gDmalEec9c7YdiO0o2zVy9z2LDSY79Nx7pHriA5Cx
         nhgpMwe88VexvoE9rKJhadNFkmiRT8nvKsAsxVKEJg+sIHR1QT3yhpkq0jMli8fOwY/7
         TnmqbHgsHrhZ+/05BQLIkTthpx6HMyY8sY498psSAvg0zNDL1t35/ratQuCvwgL0mucA
         EAzXjk63XRgFxNouUEfl9A2ZymGK7olkT1fsxb+ok7XJ1+N9dhjMzImq4oAoNUAOvMtq
         ps/03Fbasb8fCR+8dBW43GkakIZ/oME9BCUB+9/1HVPdi07hJ3g4AZMMpS5Gu54Y2tKg
         sh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        fh=JQQVN5lp3oARc3RAk9fMV9GiI+zbCVbn9Bo/bOtD5Uc=;
        b=BwZ1mb3qlNA+l08m4R/+AzZZmJUWNwJ5Sz+tPC89xyN8iGv+n97fIKtzijUcDe8Btn
         NkC3YtbChcqIK2E2XnKWnx+XBCxAZaZB9B3YLoowzbE9s7aeZFQIRzyRyycvm6yDbg4e
         fmm9YHqN0tveWeCP2kBV+TCff+xqwcaOf2Usu5N+EsuAlQU8roZOqtXV1NBQVGC5mxHf
         9H/TP7y72gvqeyMOcr3pq7tbrh7W3tMc+lY4IUHwl+OpFfT4qo8ZraSg5lOWv/Xbjw3z
         4Ue1yTJ9BnXR8wk8NIbHLn4+cvmyCuSqS99569PTpbL9Z+p0Iwj/N9YyhGozbyH4HInd
         oLtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776442543; x=1777047343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        b=ljznqHY1YLhkMU7pA4d7KXQuhG8GN1qHsqdt/7XrJE3+4r8erIH8RvrRc8QBZpe8XU
         K1sA/PefL53uAI5qFDIAIIUItRBk7Dgcqcm7Hwf958ISBpsNDBXJCvSCPmVfK6R2lsvl
         r8UQMH4n6/rdHNivUJ5u5HnMVLsJJltr3rzG/s3KdpZ57t0g4m72HB/TfczcudFZ9ygb
         DLt8xldo9VBZa+gJVWRlZDcJ9KM0sdekatjb3mfq9ojyPYyR8WcyzDDe3mABPntKMrnc
         luh5BbJi5iouA8k51r7PxTOpb+blr3wny6o+uA2/5tkCUvFNUSlsH8tZiGS73nAAVl+T
         QJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442543; x=1777047343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dP+o2w+X2iFdwwVuW12Ivj7Rxb0Cneiw0h0ovvf8Re8=;
        b=lYoBOygnPnJYwBBtkyqtHPxX79t2TdEEQM8OPo1TCBqeNk0jFOczEq65fXs6vfyke8
         NooE4dYOT+LajBghaK3zswlg1hVUZ2DXw+ZxSF9tlFpCqecdmDrhpCM/Sg2xpj7MlxiW
         NQ2Sfsn6m3kqNqQEkXqbvS9/YCXt4TEiDCs71vl4cTILMTwpDbYBg/mC+1e3B+gsmw/M
         vAPUxzwOrMA7v2q9IDf8y6sTJhhwCVLVLzcJWBLGpAq+q4QXKZAf3FAEiyhmLb1KGh4Y
         4JaYjSmDFoKWGJ5lWiKmUG2aR05K2r9JvfkoBjdeDWrwPAHo/FH60+ZuFSpwYq643I1t
         U04g==
X-Forwarded-Encrypted: i=1; AFNElJ8Hev0UYImTnLOcPdQtDVzbVDMyoXglkUMCwimTOzXNukReZBrUwnUJbj7gdHwQWvRmC4rIX8G5OSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0s4zb4SzCtddomL3IyWbwGvJxTlJ6pN1veAy+z62gtQGdZko
	XN4wKrgbmIxDfiAOtrgpoCGAS8HlXt2R+dRtzavxVzLf2W1fRt5i/TZ7NJ3CofE00dMr48gevHx
	jW+sv3/i83aHzfQwj1/LQnsxsyZX3Rlw=
X-Gm-Gg: AeBDiet2BFrdFnG9saUnEuLRMOm4NqYNj7mqKuEh3bwFpXHz6ivjYjZMvwlGky9FfT+
	jMpZZUmKHj3loCol/yg0IPFzfQ6ll/hRsnwu5jc1ylf7WmE2jVqHIjZ5gdQhsM0Bc91xCv0igk8
	MhrVgB23OdaM2Ad1o8Q2+py7pdIZmh71KbVR7kaa9Hr21IRpnbtzfoBqFm1YH8BSO6nTagYnu6h
	R5bB4IJO9l6yaFJi82WR2VsluSfhGuo8p/g9BI+yIEkmy+thnvmyBGRhaw7UvD/0mDjAUTRsXQp
	2tMB/monRd9w3X1F68/4Vmi37Nw7r1dNvY9JO/pBCnQltTxFUjeH1ghdBA/F/3u41ZGANmdQEr6
	9EHw=
X-Received: by 2002:a05:6000:2712:b0:43e:b020:f8a4 with SMTP id
 ffacd0b85a97d-43fe40915ddmr3408182f8f.23.1776442542974; Fri, 17 Apr 2026
 09:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aeFWGYaRownx1jdp@redhat.com> <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
In-Reply-To: <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Apr 2026 17:15:16 +0100
X-Gm-Features: AQROBzCTKzLKYBJqBG9MNY7O1TXJFoWrxLdeGxJT4_gq71TRls1IhZhFz0KHqA8
Message-ID: <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Fri, Apr 17, 2026 at 2:21=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lad,
>
> On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +     /*
> > > +      * ULONG_MAX is the canonical way to probe the maximum rate a c=
lock
> > > +      * can produce. With a parent at 1 GHz and the smallest table d=
ivider
> > > +      * being 2, the expected maximum is 500 MHz.
> > > +      *
> > > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> > > +      * minimum rate, because the search loop was bypassed entirely.
> >
> > The "Before the fix" comment should go in the commit log. The comment i=
n
> > the code should describe how the code is right now.
>
> To demonstrate the existing issue, you could structure your series by:
>
> - Introduce the test as the first patch and have it show the issue and
> the current behavior.
> - Put the divider fix in, and update the test for the new behavior.
>
Sure to confirm,

patch #1,  have KUNIT_EXPECT_EQ() with a false positive.
Patch #2: Clock divider fix + updated KUNIT_EXPECT_EQ() with correct
expected values.

Cheers,
Prabhakar
