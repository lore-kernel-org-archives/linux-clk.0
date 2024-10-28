Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873F1885A1;
	Mon, 28 Oct 2024 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124110; cv=none; b=KUwodJUWYVe61hpQwejrDrRgR2uEJXNEySK0cY0hWwy1+vDjqS/66iKFIL8/ctCkaMPP5iXZj6+KF89c1SOwkY1xuXsKQUWQWwlJgHFYpScGih+KRn3rt0Xh5kfHzzWrf4+wKq53xRVAddx4ILBT0EdrC7z8dYcvB7oGCeX/gTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124110; c=relaxed/simple;
	bh=1jSCsu2weQBgfTv3fn5ZHcqI4pF3bAJl/W4HqSM9Ntg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Msf8OP1DRl9MbGlg0hbk3pTplNSlVc+u1PBvB1bCv5c328qDfG6vtgyGeD1wJhrBXGhI+7eZteC6KEj9apMHsKifc3NK0te3Cz+oRYm2v1LvLJBD7xuFDAkfXWHzFzns5l3mN/ITfSIZ43ytbALIJU8XJiDt7j4xouEfyl34Ngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htHkiTm8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htHkiTm8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314b316495so40558605e9.2;
        Mon, 28 Oct 2024 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730124106; x=1730728906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jSCsu2weQBgfTv3fn5ZHcqI4pF3bAJl/W4HqSM9Ntg=;
        b=htHkiTm8BpEidzThw/6HoBD37Mf4zLR/tJH5QJ1Ge1MuuXh6VNZ0pcC1duNHXkJPHA
         7kBakacJZTOuipy0bREF7+ePQTwGKdAaTcWSFNnoZI9jHvF6HnbpY7ulUM1ZdpUsxBN6
         QPRXpylpcdVRbFQUpjjXYjAZ+6xh3BeU8GtaJIXVhJWgW5IUHqGtOSwVOkJlEKxHo6pe
         iLnuVDHpJYDQBtgKpBOzRIkUYyx5o6LcPCcsZbeTFulVbXHt931DooQI8s5TunsLVTvh
         nc65DONcRl+CnExwVL8rIt2AsWQTG4nUQzrzBAzEjRZfawOcF/A/7wFGwwZuItuXu5xc
         m0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124106; x=1730728906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jSCsu2weQBgfTv3fn5ZHcqI4pF3bAJl/W4HqSM9Ntg=;
        b=A6tSkbkkqIp9n0P4u8uYSUcQK5W73xDN+DwV6y6JogqNbFd5AosVgNrXVllu/tuUEU
         qzPQ/S3LOI3Nq3DPm8ddfxGnY5EBgg9vMkIq1hNpCQNZCNoZCKy3S9ThhNEKeIMrcf2j
         oLeOxBJv+jfs63wDRIT8NEQWdkOQMYmRXcCNbSySmxRqusOlqx2h3a+e0w/h5WDNFN4o
         sZnqvAkVcwO8lVrpdkxFmrz17SuTNkJKtdEilJae4pyFRY08GR05nH+Cxg+lYyZsAUC3
         jvmR3DpJLu40zR88uDeowwTi+PC/oVKCssFffYPs0KL7iIIcFRwGy/qJirbsnlH32sR6
         EeNw==
X-Forwarded-Encrypted: i=1; AJvYcCUii3xcQLG6P5b9huv8oTyJiXYhEFENkSEfKJYNmfjwDUNaDtFrWm8imF/rYyNQj7I+kfrVrJB91/X+@vger.kernel.org, AJvYcCVMG6RYxEWlkXnxZnYqjlN0+H7d6XGJs6IMNfaZgLavCsoccyhwhez1/MJIf7dW6YQWXOzMaiY6MaJc@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWVPRN/SHmJ96OUsfUKt4YjKjjIm/n66gqnv1w8XL3lMg1atD
	uFGrBdmemK1J/dy8hhSVU7g3PtSylN5V/mtVCLODTGH5k/5EwTjR
X-Google-Smtp-Source: AGHT+IG98H6XQsSi6UCbPESJyNYHeDDdte5llmMFEdTxYMFJQGzhao80sSTgetBySqJGdCZDl4ugtA==
X-Received: by 2002:a05:600c:1e8f:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-4319ad0fbcemr71472455e9.25.1730124105632;
        Mon, 28 Oct 2024 07:01:45 -0700 (PDT)
Received: from ?IPv6:2001:a61:34c9:ea01:14b4:7ed9:5135:9381? ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f689sm140833345e9.16.2024.10.28.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:01:45 -0700 (PDT)
Message-ID: <113e98edbff4501556e35698431080364e134233.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>
Date: Mon, 28 Oct 2024 15:01:44 +0100
In-Reply-To: <20241025-numerate-quirk-b622c5acdacc@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
	 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
	 <20241023-tucking-pacific-7360480bcb61@spud>
	 <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
	 <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
	 <8b853ad3964cd2b7dafc225d4037ddbf11ebb2d3.camel@gmail.com>
	 <20241025-numerate-quirk-b622c5acdacc@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-10-25 at 17:47 +0100, Conor Dooley wrote:
> On Fri, Oct 25, 2024 at 08:56:34AM +0200, Nuno S=C3=A1 wrote:
> > On Thu, 2024-10-24 at 17:13 +0100, Conor Dooley wrote:
> > > On Thu, Oct 24, 2024 at 02:35:37PM +0200, Nuno S=C3=A1 wrote:
> > > > On Wed, 2024-10-23 at 17:30 +0100, Conor Dooley wrote:
> > > > > On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> > > > > > In order to access the registers of the HW, we need to make sur=
e that
> > > > > > the AXI bus clock is enabled. Hence let's increase the number o=
f clocks
> > > > > > by one.
> > > > > >=20
> > > > > > In order to keep backward compatibility, the new axi clock must=
 be the
> > > > > > last phandle in the array. To make the intent clear, a non mand=
atory
> > > > > > clock-names property is also being added.
> > > > >=20
> > > > > Hmm, I'm not sure. I think clock-names actually may need to be ma=
ndatory
> > > > > here, as otherwise you'll not what the second clock is. The drive=
r would
> > > > > have to interpret no clock-names meaning clock 2 was clkin2.
> > > > >=20
> > > > >=20
> > > >=20
> > > > So the way things are now is that we just get the parents count wit=
h
> > > > of_clk_get_parent_count() and then get the names with
> > > > of_clk_get_parent_name()
> > > > and
> > > > this is given into 'struct clk_init_data'. So they are effectively
> > > > clk_parents of
> > > > the
> > > > clock we're registering and as you can see clock-names does not rea=
lly
> > > > matter.
> > > > What
> > > > I'm trying to do is to keep this and still allow to get the AXI bus=
 clock
> > > > which
> > > > is
> > > > something we should get and enable and not rely on others to do it.=
 The idea
> > > > is
> > > > then
> > > > to add the axi bus clock as the last one in the clocks property and=
 I will
> > > > get it
> > > > by
> > > > index with of_clk_get(). The rest pretty much remains the same and =
we just
> > > > need
> > > > to
> > > > decrement by one the number of parent clocks as the axi clock is no=
t really a
> > > > parent
> > > > of our output clock.
> > >=20
> > > I mean, if it works, and you can always disambiguate between whether =
or
> > > not someone has two clkins or one clkin and the axi clock, then
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The assumption is that the axi clock is the last one in the phandle arr=
ay. But
> > your
> > comment made me think a bit more about this and I do see a possible pro=
blem if we
> > run
> > old DTs against a kernel with this patch. We have two possibilities:
> >=20
> > 1) DT only with one parent clock;
> > 2) DT with two parent clocks;
> >=20
> > 1) is "fine" as it would now fail to probe. 2) is more problematic as w=
e would
> > assume
> > the second parent to be the axi_bus clock so effectively not fixing any=
thing and
> > silently probing with a broken setup.
> >=20
> > So yeah, I think I overthinked the backward compatibility thing. I mean=
, in
> > theory,
> > all old DTs are not correct and should be fixed by including the axi_cl=
k. And if
> > we
> > now enforce clock-names we at least get probe errors right away making =
it clear
> > (which is far better from silently breaking after probe).
> >=20
> > Given the above, it should be fine to just enforce clock-names now, rig=
ht?
>=20
> I think you need to enforce clock-names in the binding and take
> !clock-names and 2 clocks to mean that the second one is a clkin. I
> think that's a better solution than failing to probe for all extant
> devicestrees.

Ok, so IIUC, you mean leaving old DTs as of today and relying on someone el=
se to
enable the axi clock (if it was not enabled they would have noticed by now)=
. And only
take care of the bus clock when clock-names is provided?

- Nuno S=C3=A1
