Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234C17A924;
	Tue, 10 Sep 2024 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006450; cv=none; b=g1RvLtfmx1XBElJfovP2aBfRHHXBw1o1IVL5vEB2yCNf+dvofKdtgba0dZC0W3afIDxMbPT0fzI333NxvEbWzCb9g9pLp3RrI/FR2+bBssWFHLfJP7IuxZO/Ao2qO/c4s/Oce0wSICR5VeTwBYSS69qMYzTdbx2XkMZAbThe6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006450; c=relaxed/simple;
	bh=xyezT7y9nlpRVIh3UdeyEg44+ekoYFwDDBaq+ZQAm04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tISS5bcTuLDE4cLkQ8KXdb7go0rlNAK76URe4t383XDJ3KzNasjyoFzYu4T9ilGGATvl6bNA0QTFk0hfYrGu6bLR5jzJvuL9tH0sIDcethFOutfTfAqbU4XqfpgpNS9KS8SFJarO5QGVTRf2MF9ybCP5JETiuCukIUij1PcksXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKPGahNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKPGahNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04846C4AF09;
	Tue, 10 Sep 2024 22:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726006450;
	bh=xyezT7y9nlpRVIh3UdeyEg44+ekoYFwDDBaq+ZQAm04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kKPGahNgIGtIg5pl86yKS59mIlGoLqKIynmh13xXvhH4GdM4AV0WvZqIBSspD4cOm
	 RwQUwnpSBEoHKBWJZdBvbUWDQgiXv2gOFfJzBBekj9r9XszFsumQtQKmCvieLSKSc1
	 nw5fzPjRR4+eKbzPz0eCsPWV/Fq6BlqElkvoBYJF/WJnT0ByZM0LNIz4dXr8TnLxgE
	 NbPRdeaa2jGy+M9pWs1QvD4zq5LmEiZO2o9kg4NL2ICujm2LhU/o3FrYBsATauQsDS
	 I5R1IhuukAAW1G8/01R7AY/bkw6PS71UnfdvmodsnE98iqtHS7wYdSRRwYEcvb4lfo
	 BW41/DiA5Rsog==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356ab89665so7317973e87.1;
        Tue, 10 Sep 2024 15:14:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3xQ2CbC1L292nJtH95DqiHcVH2vBNyPwUeRLLIs5uuiKKYFT4x3R61twnqEZPyW9dNoI3Hu/v3q74@vger.kernel.org, AJvYcCVOQzV2wZbYPfSe74OCNZpJxReLhVuvzq3DLsT2yDukWSKXwee1E+X6Ju7qVa/gaZ8SVlN0BpOz/jmBXRnVhj05Bw==@vger.kernel.org, AJvYcCVf99oAoBJkaBE8hjs5ARVCb/q+naFeeO/FFTNbz9X93jDePeZ1W0KOvpjDjDQfM4JQe731XjR4Kmh4@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJAgRy2GTmsDf4jRNHTQfztkjLLpcLIWAJCuRt5fRlbT7umP+
	iiZjSg6MV7pbWmfs97WUwkvA8FqbyWhbNCKxXo2Fi2mqNpsQBhtQlqWVCk8zOqn7ps/fEp4KY9s
	yyAEwXZ+ffNjp7TmmHu2abCHwWQ==
X-Google-Smtp-Source: AGHT+IFvPwRo9z8FDy14Dyiyj2bqiWCSBUDLoZl0L9lIKeqEOJF2/YwFUfDJk9k3Sw4ubOOvQVmvh6ABToN9DxjE2iw=
X-Received: by 2002:a05:6512:10c3:b0:533:3223:df91 with SMTP id
 2adb3069b0e04-536587b9933mr10183673e87.24.1726006448185; Tue, 10 Sep 2024
 15:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
 <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com> <20230124091236.1bf8c6da@booty>
 <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
 <232f59aa-704b-a374-6a78-469156ccdbea@seco.com> <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
 <20230322093918.33690db3@booty>
In-Reply-To: <20230322093918.33690db3@booty>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Sep 2024 17:13:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
Message-ID: <CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Sean Anderson <sean.anderson@seco.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marek.vasut@gmail.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-reneas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 3:39=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Stephen,
>
> On Mon, 20 Mar 2023 14:27:56 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>
> > Quoting Sean Anderson (2023-01-24 08:23:45)
> > > On 1/24/23 03:28, Geert Uytterhoeven wrote:
> > > > Hi Luca,
> > > >
> > > > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
> > > >> On Thu, 19 Jan 2023 14:27:43 -0500
> > > >> Sean Anderson <sean.anderson@seco.com> wrote:
> > > >> > On 1/11/23 10:55, Geert Uytterhoeven wrote:
> > > >
> > > >> I'm wondering whether Geert has a practical example of a situation
> > > >> where it is better to have these properties optional.
> > > >
> > > > My issue was that these properties were introduced long after the
> > > > initial bindings, hence pre-existing DTS does not have them.
> > > > Yes, we can add them, but then we have to read out the OTP-programm=
ed
> > > > settings first. If that's the way to go, I can look into that, thou=
gh...
> > >
> > > FWIW I think there's no need to update existing bindings which don't
> > > have this property. The required aspect is mainly a reminder for new
> > > device trees.
> > >
> >
> > Is there any resolution on this thread? I'm dropping this patch from my
> > queue.
>
> IIRC Geert kind of accepted the idea that these properties should stay
> required. Which is a bit annoying but it's the safest option, so unless
> there are new complaints with solid use cases for making them optionalm,
> I think it's OK to drop the patch.

The warnings related to this are now at the top of the list (by number
of occurrences):

     50 clock-generator@6a: 'idt,shutdown' is a required property
     50 clock-generator@6a: 'idt,output-enable-active' is a required proper=
ty

IMO, if these properties haven't been needed for years, then they
obviously aren't really required.

Rob
