Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5744657F4
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993697; cv=pass; b=jpQVs+gARcL0S+x2ZrscHzO/jN1kTKsMjxTk7M+22XuOZwCpHEd60ipcLRoiDlDOfGStsrvmfOcjplzaf8oGbQEwejJ3/4ZvO4Sk2wGO1bxh/wy1w/RNRECTagXwMwgEA2kLiJxWf7lBrwE5f3n15mJw5DUsbB7SKVVgSfprBfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993697; c=relaxed/simple;
	bh=5kKHn6oDKxfRnTmU1n1ozSXZeWUDhO+yUravPMO9zQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pN6t+fMsHzRBAegVDrazozEH1zGpAAC5cgEVv9RoXhOt72ync9KpOUP2AyAWAuGgMYZ6foWM+872kBgujx7HYk/cqVCoW9455IXMKTkwsx/ntHGk5puoDl94txVwfTmzVq87v4X1Nfj4/VoHPr5VXLm1p866N+gb3gaGorISu3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG5KUtkk; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG5KUtkk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so5818374a12.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993695; cv=none;
        d=google.com; s=arc-20240605;
        b=Lcgi7/NG1DhXES/AZZPc04/GGY7vqxCbqAqiwRKTAjhCrBQlw3SRrx3z63hXL3cSGC
         bvDeqjoxHl29mU0h9nBCNodJvj/lv48aAIqAkShbc1PmmVhZjnMuo+f5Amk1V9DrcPHZ
         7As/Z4+v646nWCEmQDjBT5j9jkDhLf+wlFxJ5LXj17gnIfS0XeEyCT2IRRbFMNReRZZS
         6kLgKZm/sGlCaAXHJp3Py9cT2BKAnHJHl0+eQWBUiSBZCSD9ZorJPBmoA0L8fzLbVbBu
         MIg2CJd+ENBAHD2xP4wgUlVTYqpUKs3EAyvP+PItBORx9WlD+/abTHffhBnUu7kGWblP
         nAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dvYwzjZZa5sWT6G/8cHeH1HspL8H3ZpkdM7IP3TA+G4=;
        fh=lUhZ+j1/tHQ7RrM0DA96bfwHv3zq8OsGEqzucXxYjuE=;
        b=Nb3pWVbkAfECkDsPR8KoXb2b9jaLY/htijcVI7GSD3jMO6Qpynqmp8BjVy7BQx5deF
         A4lDKYY70UH3Yq4zrpB+241KEkMPoy6UPg6Uq6WHm4X6iW36N2OEwOQ4WR0ytCBwm7yd
         0NId9WcHcBR9HrxHQZZwg1Kd6t8TTCOzEYM1yWpS4mjOZHQVSOb7pir7pFUAq1mRLLXO
         PceVUmyT6wK3qTAYVegjCV7xQDsU45cXO4tMhsvJJL8B+B3PVN+o5yAD2cEpcn9bUwO1
         x/cfCdZQi8QOCTnBkxupGEl56tXqV1RRtiyc1aBRwhRgauWn36YkZ2VIZlFmuYkZz2Wu
         9+iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774993695; x=1775598495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvYwzjZZa5sWT6G/8cHeH1HspL8H3ZpkdM7IP3TA+G4=;
        b=BG5KUtkkBJHcBiWGdCKSa1W7ftnZTpsGXssSWd2zI5f8msU8JblxBbamT7/TiLN6zA
         fLRyEZOoB8LpwMMZNUGOUewebkT9YkCZdUpooMs+W2Zz2rgoJeFyMcPRfWXOhWc8Grl0
         cnt+eiJKp1iQ3wEgXjhawTYoy+plUh5Kkm9ZFCgzRtdPA82dWKoUF/qwviX/UhQ2nZsO
         zxiY6RKprEzHMZhIl2hQ8+wDpD8md5lsmubBTmZmuhmlmjD0V50nk5zpnqI63YirsnCC
         bRVyEwCCIDCLhqBIGbnPh/Jayt5DTDgWLKFaylIndyKvjkB4ziuBj8KztsquE5PgNiWp
         htLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993695; x=1775598495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvYwzjZZa5sWT6G/8cHeH1HspL8H3ZpkdM7IP3TA+G4=;
        b=B9DMO5CJmJ+PAvd2eCJo4JgLUTNd7/Dj6/sq36PUW4OPGqiuNEolaSMNi4YSRKY4IP
         egK7QI0GgUu+TPB8T6bOE1x4xm53/EKSJzH7hTYEl1PXB4k+1GrhKqnMZb7tP5ZdAMos
         VBRkZSBCdsXo6qKAFhWpA7bHCq93yxyM16iUnRlhWslySiS49plMhFmoizu4jXuSPXSl
         byd0UNQth3Y8n8aWAMMB7oEF5teKaBCSMfGQtyw8kIYIVRtFH47KZ6jkjxDZlz5eKiAJ
         A/CpXyRahkE2omUGi4WEk125cbeeA6JBUmd/OuJOQrO+z5QEKMZ1unPzrNlNCx7cRMot
         s0NA==
X-Gm-Message-State: AOJu0YxcKz6/5x/WFpyXDD8Bzpfp/mjaS5JKdCm7YJM9AZmODR9DWiWi
	5gvlH09yxyPKefR6sm6cc3ii1Ud4153o0jvPHuosRETzz6my3JSur3pZK8L4kA2PyC0rqMKo9d3
	YHBrWQaBeu+sNgUCR+vIkbuDOPyt3r5s=
X-Gm-Gg: ATEYQzwoIcMYVyRlvuOY1d4yjO7cm4YVPy7zmTeDLe1GOEOx/42RH1doqsl+oECIlXN
	vzMZkRy8IEexYuPJjlYm2tRsM1I+pgoPZE/MfD+ZP4XD2mwF8H7Uh8+BrMkVa8SD3WRG10XW5dU
	SLDiSoXCIU44mJxZnZzYeHytW1DwE8pobQ6M3xjhtifWkrGZsYTz6iGT4YvURVU3mmaqltSnjtp
	SO9XILpJJUEIxFu8p1rGikkmptJb35AC6h/zzxqXhwwxuJGW8cEvU1HSfoPpERAh83wyfSCucuj
	Oa9ygpq87uMlXBQcGDlWzqxxbDhIKLEDCyR3x1Ol4oCa7iSBpUNYvfYc4cKgtAQRACMCYc0hYNn
	UTgD+EA==
X-Received: by 2002:a05:6402:20da:b0:66c:4cf1:efe7 with SMTP id
 4fb4d7f45d1cf-66db539db4dmr453788a12.26.1774993694716; Tue, 31 Mar 2026
 14:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330210217.11168-1-rosenp@gmail.com> <acvWNElQXPH4YaDk@redhat.com>
In-Reply-To: <acvWNElQXPH4YaDk@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 31 Mar 2026 14:48:03 -0700
X-Gm-Features: AQROBzBadnKKgx9xE6HNLAS_VR7w62NP_6xsgyRXcrAuFHnWIoT02c37xxZNqc8
Message-ID: <CAKxU2N9-AAdWOxPrnFt4Lz1vfpjET_D3U8T57KOTLa8aBdWjiA@mail.gmail.com>
Subject: Re: [PATCHv2] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:12=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Mon, Mar 30, 2026 at 02:02:17PM -0700, Rosen Penev wrote:
> > Combine allocations using kzalloc_flex and a flexible array member.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: add missing transformation.
> >  drivers/clk/hisilicon/clkdivider-hi6220.c | 26 ++++++++---------------
> >  1 file changed, 9 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hi=
silicon/clkdivider-hi6220.c
> > index 1787ecefe601..b35c02d3bc05 100644
> > --- a/drivers/clk/hisilicon/clkdivider-hi6220.c
> > +++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
> > @@ -26,8 +26,8 @@
> >   * @shift:   shift to the divider bit field
> >   * @width:   width of the divider bit field
> >   * @mask:    mask for setting divider rate
> > - * @table:   the div table that the divider supports
> >   * @lock:    register lock
> > + * @->table: the div table that the divider supports
>
> Why this change?
Guess I monkey fingered this in vim... I just wanted ddjp
>
> Brian
>
