Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D025A625
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186310; cv=none; b=RwkPsIYyXIY4ZDxiMxZkyYKhJkD25aP5HXGBoCvf/zUBmvjv7mkP19N2yok19R6EEcIYeQxa2OSRC7kmKhOQzaVCmEV36sQmwaF7Hsrr5DH1a+ocK1G4LN3ihZUcjWMWOggh34PjXUPDq0l6JvEY5yvp/0w20wjJnSJHGE/XGfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186310; c=relaxed/simple;
	bh=fUS7480s69EPVcIl+pKPnH24D+DvvnLbqwuI4xR2APk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPHDhFSE0ZHJlJugGyQwXdhCoWOJ/3cIpMDqI9sqRLaYRZ4zV6WmLIDZciTDJPb2BN7349lvV2cP5JRAoYY/y2BkoOE0gH7IdBPudRYgNUGknr1Vrm9j7lJAB3dFsaRROFo7V+94XJekvsAiIW4zHD5eDJ8CrJzXckff2Ojnis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iNFiYcnp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iNFiYcnp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22423adf751so64111295ad.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744186307; x=1744791107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7gG2gKXIJaBQW6zdK34ZxP1VJwapYZYPTASpKezb3U=;
        b=iNFiYcnp7wWTJkqwvczbXxAklutemC8gpOXuO6j58Z32Pn+Zfley2D5ZQDyysRwH7F
         8L/wKnYRltJlLVcNGNWpY0fcMzyRdyt1fzwypcBVPO4hcQs9GUE8FHDpHAYf66zIAw9G
         1av9OndRQwrnuz9BCj1sfkbcj58gGHFG+SQqprWF2En5G6y9nKlp2c3SBit2ErtFuUWO
         hJdzBwYj96vjQ2DUwRnQZgCrRKNr5p8tUl+W4rUqR0lk4XTD6fDclpamZ+wUTmGgA7Sw
         cCDEv2dA/A7IaYRitpBFgihWhoQrj2qo4GCWT2MZYyPHLwZxwpp4M3LNptGEyuFl89Tx
         TIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186307; x=1744791107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7gG2gKXIJaBQW6zdK34ZxP1VJwapYZYPTASpKezb3U=;
        b=nX/n+xQqTmOKRpru+zphgk/IXAxvCbO5n0LgmR/hW2qjiAUBW/S21+K19BgwkN6Y4x
         +OXBnqvOfR/rmNydiZFB8ifaAJUxvIOM9yeS1E/QNn2hfef/gjduyF2HqqdfPK/3uTnA
         gFz4cU7rvrtXEGHJ2vXOBVE5ApPp/6iqP20rAKY2Y2yVvLA9wQl9Ct0d7Hu0KZm3H23B
         P44qTOduvvZMPoCNguahdKgmWIlxzm+a2o9r57t4NmFygy5R+0vqQVWbh3s/ez7Frrgf
         p5kvP+URjpLUKBUAquZrx1rI46L0nv/d/SjaDr20BwivpTXE6DtswDOSaJ3GlJMKk8jb
         8ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW0MrWj2lDnFyTra+PHKLtmUbc5a4xe4Rw/JSJseJ/hZvMrxP4sKnWi1bFSM0bAqS7QpwpJ+3xHNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMaEQNQI2gwhxBuYJMSd1CSEDECwrX+T1IORUXouup7qx+yFA
	Ay6m3WekORJ482L1NtLlr1FqLBkhvC0kM57SyBiIPqMADyDEyTjKQa3PO6jtrw4=
X-Gm-Gg: ASbGncu+m64Hu/umzGz0/PKwlsYLBB8HKLrPGFASUYfcGdBgC9GTQycZyyVrFPq1qni
	2KWJrQuPKYTADiW6d8qT0DAQxsznpPtz06kSIJRTxruMLcBG7Jl1WTEWkWQvuylmQ+A7pvI6YFE
	CdMwmV68Ir1YEhx3OQ0vD2Px22PK4OVosCZFILN9lhClw14YCX5mkYf8Hqkq4/BeaMeDIEaTaNF
	OZwUQtAc92X6It3HhtUcbB4DOva2tZiebNR8pgmdO1SSw+DorcC4t1pJl92IT+TQV5p8b/9kP0S
	F/46Cha6qM8C2BZq9DCdHP5IFBI4ilq/NqemvwwZvT9CnSflmMsNlzOOOWb5UCTizy6l090gNSf
	A
X-Google-Smtp-Source: AGHT+IGIKp3RiQ0UvzCkEMnECLBz2B84TOPhJtDjt2186HLjhxIE4MbZHiJzFFLanhXCwmSnOr0N7Q==
X-Received: by 2002:a17:903:1107:b0:223:501c:7576 with SMTP id d9443c01a7336-22ac2991b01mr29875025ad.12.1744186307346;
        Wed, 09 Apr 2025 01:11:47 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51f7dsm702693b3a.144.2025.04.09.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:11:46 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:11:43 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/Yrv+dOtbqRDW5S@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-2-sbellary@baylibre.com>
 <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
 <20250405215529.7f3f3253@akair>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405215529.7f3f3253@akair>

On Sat, Apr 05, 2025 at 09:55:29PM +0200, Andreas Kemnade wrote:
> Am Fri, 4 Apr 2025 12:44:39 +0200
> schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> 
> > On Thu, Apr 03, 2025 at 06:44:57PM GMT, Sukrut Bellary wrote:
> > > +properties:
> > > +  reg:
> > > +    maxItems: 1  
> > 
> > How reg is part of this? Every clock has reg, doesn't it? Otherwise how
> > do you control it? Drop.
> > 
> > > +
> > > +  ti,autoidle-shift:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      bit shift of the autoidle enable bit for the clock
> > > +    maximum: 31
> > > +    default: 0
> > > +
> > > +  ti,invert-autoidle-bit:
> > > +    type: boolean
> > > +    description:
> > > +      autoidle is enabled by setting the bit to 0  
> > 
> > required:
> >   - ti,autoidle-shift
> >   - ti,invert-autoidle-bit - although this makes no sense, so probably
> > old binding was not correct here
> > 
> 
> well, the more informal definition in the txt file can be read as: if
> the clock supports autoidle, then ti,autoidle-shift is required. But
> that does not
> translate to the formal definition in the yaml file.
> So we have nothing required here.
> 
> I am a bit wondering whether we should just drop the autoidle.txt. The
> only thing worth there is the description.

Thanks for the review.
IMO, it would be good to keep this as other clocks refer to these
properties.
But yes, I will add details in the description about if the clock supports
autoidle, then these properties are applicable.

> Regards,
> Andreas
