Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08B3D45D4
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 17:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606872; cv=none; b=IxEW/9z1uNy2qHpE+VLbLESv6CsQXwZ/KHqshLisDHkQix8uwIXOFXp995burQEOjKeFMz9n1tCbcYxjrwoWlnhT7OX/jFEOZ6nG+NDohy0TxBbFoPDGN4T8WTjligqd0d/nASsFT9LkuDTbe9JlJKgVhq73wBY3Hzn7BCPldg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606872; c=relaxed/simple;
	bh=urCd3imNr9U3d0H113lqR9foS3GfiVWT0uc0mm2Epdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFWHWqC5qH2BgeAJjEj6MzGZ7rCXx21FRaba1NPRpn0jEWhVXYim5rvAMdlNA403O5TOb5EqV5Oj3L3DXVNTVtUcUuC5T5vRI8mhBmcsnmMl3aMd8iRouzlqWxYJL67kjvB0cACMCAcVTCtKdUVqFeXerCHLzNtD87CoNhWooHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHbBEHq4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWG/S5XC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHbBEHq4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWG/S5XC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778606870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFhFfaxYKQp+2MS88gk9p49P/5ACB62Km8g6Bv6AbKU=;
	b=MHbBEHq4XIUv2eFQi9Q3Bha83Sjgci592752CPVN87w+vOTpRjmAKDGadKjrDx/P4YfX3x
	fkTWLF06dGSvYsE8gt4k9GKPfYW0CkbRj4rUUQdae2wZVVOOprvZk1B4ZzxFRsDaZRHejs
	SMOqaN+Anf55PKqGeWmyOIGkiWzwPWc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-4JI85Rn9OPGG7hPikqF2IA-1; Tue, 12 May 2026 13:27:49 -0400
X-MC-Unique: 4JI85Rn9OPGG7hPikqF2IA-1
X-Mimecast-MFC-AGG-ID: 4JI85Rn9OPGG7hPikqF2IA_1778606869
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ae752c5273so124477316d6.2
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778606869; x=1779211669; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFhFfaxYKQp+2MS88gk9p49P/5ACB62Km8g6Bv6AbKU=;
        b=WWG/S5XCXvZM1Zxyko9ma47my1kzLyp8hGNhd/WjOgufU3aa9f+qtO/uRYEj8lD2BV
         jKfFzDtz+0BVBj+ie62UQjTvpdvnJKcGLwZAemuZ8SlVMnpIXrsO3QcEly2ajECoFBd4
         p343A22rdFUzvajz6UONajYgKyTHxW5rrSs8S19mFNWQxeLfy3q2/LCFHwpoY0D6OBI5
         z+yfD5cDZhtcn4BBCoFM1O2UFqvp4iEC3XS66whl5m3NUDM2MEuqYLSPY4oAhskRO9fw
         gMzmF5PWUR/MOYW9rFWf9S3hqlGHsOtXFZ2Hyrnb9ptMbjj9NP1NThID7sb/qH0dihQd
         0vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778606869; x=1779211669;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFhFfaxYKQp+2MS88gk9p49P/5ACB62Km8g6Bv6AbKU=;
        b=KxfzN7WdXmeN/CmI/3oTjwI0wscAON/gDpBCLEb4iEcFjXaJCfVDbr7Inw8HUOKGY9
         fIhtj2sFYVzLsF4vyI1hoT93b7H5NEhjIFCCqhHKO34tVjTnkimoOi41ZdTmIY7VDl8F
         GY9Tg0iyBctKlHUsntWczMt9yPZumHATClYElwVyU2IPgWJuWRJXNnSB4uqn66Zlx2AT
         JIp40m8g6JNcF7fRR0Pzb89+dT1tpm4Xot+fPgZzy8mfFDBRB7pTv2bsJp1vwZntG8vC
         gPpCORlkIwsSv4jvjlIsZESBcIgoo7pBe34G6YoNV53WyFrL5Kj3INBZaFcOlbsokvmt
         NLpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bb3Q/9ZlOikgqVP12Xp+FWBRa9MgG4nB72ZiRgvBfAbTJkCmM9aXrGMdFUVa9zxc6iEAVDNypi/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5UsBEHORPZOcQ8s8XPlyn4ZWa8mbKK9agSq4JRUjnHjo7zVQ
	KTydYKr5T7O1lwVvdypMUt0uUHHiNp8FpgAI5+1I2H5OyfRTywOgQgvOyt618FM2e3tpRi8BpYl
	YA36yH9u63Ig+aCk5KwVFOcbGDFgbQAKk8snHbdRRHVfdr2QJTicO3p+Ww0tuIb3leK9PPQ==
X-Gm-Gg: Acq92OFou6jUN0pc3sgBmGDCpm3Rz3dPwpSGyJ1aJMFvirIrqrQ52RdDHNKeNocY02l
	jlSXJ7P205djRo32SyTNiXugiO8Ny6M7kYX6TVwEuEG/Ps8vKinKi3M6sVwHWf5zITVeiUxNzhy
	SkLm5DdlceF4MzAkboRtBHhaYzG7A8hJh3RldKwQwlNm3NpCle1eMGlsK04/4ZU6axuogevARmZ
	aZfuRM5aysttKyfwY0YTBJqwNY0xBTB/wVG7LoP6k3VeI627/x7+Awi4DCbjeyuL19P/WEBNpwd
	7yGOb+LXFxbmqGTvSn/+cTmSPsrvMp2rXjL8liKuqOeDjjrFLb0QxO8XXuu/xKQZRQ46TP3xvhs
	C3xnJBjDbk3j47ivGB52oaJKMdpQrhiSQNNFeJs+hX1n+VuyGTP5bPwMl
X-Received: by 2002:a05:6214:5d8a:b0:8ac:8cbb:49bd with SMTP id 6a1803df08f44-8c663f6e991mr57494496d6.38.1778606868895;
        Tue, 12 May 2026 10:27:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5d8a:b0:8ac:8cbb:49bd with SMTP id 6a1803df08f44-8c663f6e991mr57493836d6.38.1778606868187;
        Tue, 12 May 2026 10:27:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a43636fsm131095666d6.21.2026.05.12.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:27:47 -0700 (PDT)
Date: Tue, 12 May 2026 13:27:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock
 and reset generator
Message-ID: <agNjEcnlUdkpexqJ@redhat.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020511.726-1-dongxuyang@eswincomputing.com>
 <agNLuSCDlukeVGcS@redhat.com>
 <20260512-captivity-chatroom-0c46aa7ab0a3@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-captivity-chatroom-0c46aa7ab0a3@spud>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 12, 2026 at 05:40:16PM +0100, Conor Dooley wrote:
> On Tue, May 12, 2026 at 11:48:09AM -0400, Brian Masney wrote:
> > Hi Xuyang,
> > 
> > On Tue, May 12, 2026 at 10:05:11AM +0800, dongxuyang@eswincomputing.com wrote:
> > > From: Xuyang Dong <dongxuyang@eswincomputing.com>
> > > 
> > > Add bindings for the high-speed peripherals clock and reset generator
> > > on the ESWIN EIC7700 HSP.
> > > 
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> > > ---
> > >  .../bindings/clock/eswin,eic7700-hspcrg.yaml  | 63 +++++++++++++++++++
> > >  MAINTAINERS                                   |  5 +-
> > >  .../dt-bindings/clock/eswin,eic7700-hspcrg.h  | 33 ++++++++++
> > >  .../dt-bindings/reset/eswin,eic7700-hspcrg.h  | 21 +++++++
> > >  4 files changed, 120 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
> > >  create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
> > >  create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h
> > 
> > Does the MAINTAINERS file need to be updated for these paths? The entry
> > in linux-next currently looks like this:
> > 
> > ESWIN EIC7700 CLOCK DRIVER
> > M:      Yifeng Huang <huangyifeng@eswincomputing.com>
> > M:      Xuyang Dong <dongxuyang@eswincomputing.com>
> > S:      Maintained
> > F:      Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> > F:      drivers/clk/eswin/
> > F:      include/dt-bindings/clock/eswin,eic7700-clock.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..b7180863310c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9548,9 +9548,10 @@ ESWIN EIC7700 CLOCK DRIVER
>  M:     Yifeng Huang <huangyifeng@eswincomputing.com>
>  M:     Xuyang Dong <dongxuyang@eswincomputing.com>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> +F:     Documentation/devicetree/bindings/clock/eswin,eic7700*
>  F:     drivers/clk/eswin/
> -F:     include/dt-bindings/clock/eswin,eic7700-clock.h
> +F:     include/dt-bindings/clock/eswin,eic7700*
> +F:     include/dt-bindings/reset/eswin,eic7700-hspcrg.h
> 
> 
> Is this not sufficient for what you're looking for?

I completely missed that. Sorry

Brian

