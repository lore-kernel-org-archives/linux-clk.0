Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695925C6E3
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188226; cv=none; b=ULYbuA/hsB4iJAT/LurZ6Y+7cVzZO/rmCKLvDF2ufnFotMN3PdcEAN30ZhKcdxR8uFwmvwELp+IQiSoCJdjwaMXKh6qz+DNiRbF61xdp3Kh0KRiDhRqeAnVsgd4iTtieeM6Ty5vntPAjhNGHHhTdjdQNXQ97Ckbh633dc8wBCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188226; c=relaxed/simple;
	bh=NQnrWxqFEYqyf2ImZyom1w6HZbF5aoK8E0yfrdJWcic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv9EP7Hvs82+Nf3KMGdujYtc2WOypP1uMYiJ98vah+4wz0yRWr1qwgcZZ6bvKqGond5z7PJvUDAxzpVe/rP1lMYJuK4kVaDfNaFMPNk1xQQvjIW2UkJlg+mm3O8C04CpTPLEb8WqrJbff4ZhhMUUkOyMa772JybOTJuVFqTpFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bDhHhRjU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bDhHhRjU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227c7e57da2so56022695ad.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744188222; x=1744793022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APlPY4uZJpZya0nV6nrk4xTTTYVm9sn3CRO5bhFqGdw=;
        b=bDhHhRjUxxNhsKR7PLZUVEpSG7df7lFXo8C2oja6Yljc/15LvR+BgrNMVTZabyKE4v
         J5Tvx64P0Y1fbAHksGV91mp1E68/w7ajH1pizgxyJkaySE2Br2CoNQjPpHNPCqtzvZnb
         Vq/PWX8oH0oJgmrEpyZe8JUjIcydgrMzu+ha+A/GuYm5XefW2oCVZ0uuRAG/aJ6UVVP7
         xM5zDWiIMpIv4e93B2wY/RcCIg8HM82uWrWy3ouIqv+OzyEKVNXm5vFU2hDY/lKXtZ0f
         EEpP8U60H+9PwG/aQUfFLLRLCTpJYVaSNx6bA1ip7Ogd2EFn3hvm0kteEir9VZfHwxWr
         Ok1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188222; x=1744793022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APlPY4uZJpZya0nV6nrk4xTTTYVm9sn3CRO5bhFqGdw=;
        b=EEN243CXHwoa4NBRG4VdzxIQJ3CUA0+7y7DAM8NVUq9r+cMR4CAOS7EBlIxbo3vt3m
         HCBxgxZ2hES68DGJuHdJQcHs4KOiHNLJ+PbyP+7KSfwcMQioBw7mZW1m6iN2VX/CiDuM
         Cx3Y7G30/gP/dbxYbK/AqkZ6Rv/B/YKHq2uVgvCbW4xOtImoRNBeb5VJ99HIykXLqe5g
         5a4V5P1JOnfTjV3AWQmUf653Z+wyAdAWKkJW1V7BXuwEOYv7cvFQNk2rDgIQA7gu0qHQ
         lMncOCY3aoIqvipTey7Zwm3cmFDUPlFzhaKC4Dn0ONuxV17r1dHydqK+CO3CMfdEfgq+
         Kq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgmfElUme7t0G6SxgUqF7Nu6sbQ5Wvz/2VOoztPNqfzlu7u/kQPW8FY18UtjD900JgppKtNWUB8Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzvyrhfSM+8c2QlOY9cREuiBRrlPJU5mhwb82c7EOoGaKeOk4
	NyH+0sQVw4NlBpazbdAeoxySh3wa8/IAt9156VRqEc8kKAU4RPTZiOsS+TmQPqk=
X-Gm-Gg: ASbGnctkg7U/BvJthZWs472uK0Zz++p3Zj35PFwZ/YgypWadho/6QUadVDIsKuw2OT7
	oCn0DrTNPR3lCVGZVZ8fdhoYevUXNH9J+annyL0vHrqOTpP9QHSPcAMRpmEqpRvaE4VA+iZAFkb
	qKzLN2m7h4VypP/9hUv8xhUy3LQ9DWPhnaBu6l+76j6oJ+E2AVXXj6XOmXsXgG/nNmhriE71w2X
	97IgU8QNbIAZ8yT9++R1P9cKNGlFGiGYuVqnTSySLBbfxCKDIFITWEOjhlkARlV+/5Z8t6QWgGw
	1KU7O6Uq1jk9+SSsARbc81+qrjDPzawafbgKe2IB3ngJdk/t97LlwzU/oqxAJV4XKN9pEXY89C9
	Q
X-Google-Smtp-Source: AGHT+IHi1LGSSSpMeFzIdX5goYy1eceYxuwOGowfNQqBnGHVqOjiuDdrIg19B2sb+9bme7Rpg5PDWA==
X-Received: by 2002:a17:902:8548:b0:220:fe51:1aab with SMTP id d9443c01a7336-22ac3fefd47mr23583495ad.38.1744188222535;
        Wed, 09 Apr 2025 01:43:42 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb548fsm6337125ad.188.2025.04.09.01.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:43:41 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:43:39 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml
 reference
Message-ID: <Z/YzO2MfhK3HeIXA@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-5-sbellary@baylibre.com>
 <20250405214904.0b07b26f@akair>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405214904.0b07b26f@akair>

On Sat, Apr 05, 2025 at 09:49:04PM +0200, Andreas Kemnade wrote:
> Am Thu,  3 Apr 2025 18:45:00 -0700
> schrieb Sukrut Bellary <sbellary@baylibre.com>:
> 
> > ti,divider-clock uses properties from ti,autoidle.
> > 
> > As we are converting autoidle binding to ti,autoidle.yaml,
> > fix the reference here.
> > 
> > Add dual license.
> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > index 3fbe236eb565..aba879ae302d 100644
> > --- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > @@ -1,4 +1,4 @@
> > -# SPDX-License-Identifier: GPL-2.0-only
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >  %YAML 1.2
> >  ---
> >  $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> > @@ -55,9 +55,10 @@ description: |
> >    is missing it is the same as supplying a zero shift.
> >  
> >    This binding can also optionally provide support to the hardware autoidle
> > -  feature, see [1].
> > +  feature.
> >  
> > -  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> > +allOf:
> > +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
> >  
> >  properties:
> >    compatible:
> > @@ -97,7 +98,6 @@ properties:
> >      minimum: 1
> >      default: 1
> >  
> > -
> >    ti,max-div:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > @@ -116,20 +116,6 @@ properties:
> >        valid divisor programming must be a power of two,
> >        only valid if ti,dividers is not defined.
> >  
> > -  ti,autoidle-shift:
> > -    $ref: /schemas/types.yaml#/definitions/uint32
> > -    description:
> > -      bit shift of the autoidle enable bit for the clock,
> > -      see [1].
> > -    maximum: 31
> > -    default: 0
> > -
> now you make ti,autoidle-shift required. That makes so sense. A clock
> does not necessarily support autoidle.

Thanks for the review.
No, we are removing the required from yaml bindings and keeping it as
one of the properties. As all clock don't support autoidle, required is
not applicable here.

> Regards,
> Andreas
